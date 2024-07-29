<script setup>
import { ref, onMounted, computed } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';

// Obtendo propriedades da página
const { props } = usePage();

// Lógica para exibir mensagem flash
const message = ref('');
onMounted(() => {
    message.value = props.jetstream?.flash?.message || '';
    props.jetstream.flash = null;
});

const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Criado por: ${userName} em ${new Date().toLocaleString()}`;
});


const resetFormFields = () => {
    form.reset();
};

const cancelForm = () => {
    resetFormFields();
    const cancelMessage = 'Cadastro cancelado, os campos foram limpos';
    console.log(cancelMessage, message.value);


    // Exibindo a mensagem de cancelamento como uma mensagem de sucesso
    props.jetstream.flash = { bannerStyle: 'success', banner: cancelMessage };
};

const form = useForm({
    name: '',
    description: '',
    image: null,
    discontinued: 0,
    deleted: 0,
    action_user: actionUser.value,
});

// Caminho padrão para a imagem
const defaultImage = '/storage/images/default.png';

// Verifica se há uma imagem existente na categoria, caso contrário usa a imagem padrão
const imagePreview = ref(form.image ? `/storage/${form.image}` : defaultImage);
const imageInput = ref(null);


function selectNewImage() {
    imageInput.value.click();
}

function updateImagePreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image = file;
        imagePreview.value = URL.createObjectURL(file);
    } else {
        form.image = null;
        imagePreview.value = defaultImage;
    }
}

function removeImage() {
    form.image = null;
    imagePreview.value = defaultImage;
    imageInput.value.value = null;
}

function submit() {
    form.post(route('collection.store'), {
        onSuccess: () => form.reset(),
    });
}
</script>

<template>
    <div class="mx-4 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <!-- Seu formulário Vue.js aqui -->
        <form @submit.prevent="submit" method="post">
            <!-- Campos do formulário -->
            <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">
                <div class="col-span-1 sm:col-span-2 md:col-span-3">
                    <div class="col-span-1 sm:col-span-2 md:col-span-3">
                        <InputLabel for="name">Nome do Coleção</InputLabel>
                        <TextInput v-model="form.name" id="name" name="name" class="block mt-1 w-full" type="text"
                            required />
                        <InputError class="mt-2" :message="form.errors.name" />
                    </div>
                    <div class="col-span-1 sm:col-span-2 md:col-span-3">
                        <InputLabel for="description">Descrição</InputLabel>
                        <TextInput id="description" name="description" v-model="form.description"
                            class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.description" />
                    </div>
                    <div class="col-span-1 sm:col-span-2 md:col-span-2">

                        <InputLabel for="action_user">Ação:</InputLabel>
                        <textarea
                            class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                            v-model="form.action_user" id="action_user" readonly></textarea>
                        <InputError class="mt-2" :message="form.errors.action_user" />
                    </div>


                    <div class="flex items-center col-span-1">
                        <!-- Campo Discontinued -->
                        <div class="flex items-center mr-4">
                            <InputLabel class="mr-2" for="discontinued">Descontinuado:</InputLabel>
                            <input type="checkbox" v-model="form.discontinued" id="discontinued"
                                class="form-control border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm" />
                        </div>
                        <InputError class="mt-2" :message="form.errors.discontinued" />

                        <!-- Campo Deleted -->
                        <div class="flex items-center ml-4">
                            <InputLabel class="mr-2" for="deleted">Deletado:</InputLabel>
                            <input type="checkbox" v-model="form.deleted" id="deleted"
                                class="form-control border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm" />
                        </div>
                        <InputError class="mt-2" :message="form.errors.deleted" />
                    </div>

                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <div>
                        <input id="image" ref="imageInput" type="file" class="hidden" @change="updateImagePreview">

                        <InputLabel for="image" value="Imagem" />

                        <div class="mt-2">
                            <img :src="imagePreview" :alt="form.name" class="rounded w-60 object-cover">
                        </div>

                        <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImage">
                            Selecionar Nova Imagem
                        </SecondaryButton>

                        <SecondaryButton v-if="form.image" type="button" class="mt-2" @click.prevent="removeImage">
                            Remover Imagem
                        </SecondaryButton>

                        <InputError :message="form.errors.image" class="mt-2" />
                    </div>
                </div>
            </div>

            <div class="flex items-center justify-center w-full mt-4">
                <PrimaryButton @click="cancelForm" class="w-1/6">
                    Cancelar
                </PrimaryButton>
                <ButtonSubmit class="w-1/6" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Cadastrar
                </ButtonSubmit>
                <ButtonLink :href="route('collections.show')" class="w-1/6">
                    Listar
                </ButtonLink>
            </div>
        </form>
        <div v-if="message" class="alert alert-success">
            {{ message }}
        </div>
    </div>
</template>
