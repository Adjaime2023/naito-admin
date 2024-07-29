<template>
     <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
        <div class="lg:col-span-3">
            <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
                <form @submit.prevent="submitForm" method="post" enctype="multipart/form-data">
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="product_id">Grupo:</InputLabel>
                        <div class="flex items-center mt-2">
                            <select
                                class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                v-model="form.product_id" id="product_id">
                                <option v-for="product in props.products" :key="product.id" :value="product.id">
                                    {{ product.name }}
                                </option>
                            </select>
                        </div>
                        <InputError class="mt-2" :message="form.errors.product_id" />
                        </div>

                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="name">Nome do Subgrupo</InputLabel>
                            <TextInput v-model="form.name" id="name" name="name" class="block mt-2 w-full" type="text"
                                required />
                            <InputError class="mt-2" :message="form.errors.name" />
                        </div>
                        <div class="col-span-1 sm:col-span2 md:col-span-3">
                            <InputLabel for="description">Descrição</InputLabel>
                            <TextInput id="description" name="description" v-model="form.description"
                                class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.description" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="action_user">Ação:</InputLabel>
                            <textarea v-model="form.action_user" id="action_user" readonly
                                class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"></textarea>
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

                    <div class="flex items-center justify-center w-full mt-4">
                        <ButtonLink :href="route('size.create')" class="w-1/6">
                            Novo
                        </ButtonLink>
                        <ButtonSubmit class="w-1/6" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing">
                            Atualizar
                        </ButtonSubmit>
                        <ButtonLink :href="route('sizes.show', form.id)" class="w-1/6">
                            Listar
                        </ButtonLink>
                    </div>


                </form>
                <div v-if="message" class="alert alert-success">
                    {{ message }}
                </div>
            </div>
        </div>
             <div class="lg:col-span-1">
            <ImageSizeForm />
        </div>
    </div>
</template>


<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import ImageSizeForm from './ImageSizeForm.vue';

const { props } = usePage();


const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Atualizado por: ${userName} em ${new Date().toLocaleString()}`;
});


// Lógica para exibir mensagem flash
const message = ref('');
onMounted(() => {
    message.value = props.jetstream?.flash?.banner || '';
    props.jetstream.flash = null;
});

// Inicialização do formulário
const form = useForm({
    _method: 'PUT',
    product_id: props.size.product_id,
    id: props.size.id || '',
    name: props.size.name || '',
    description: props.size.description || '',
    discontinued: props.size.discontinued || false,
    deleted: props.size.deleted || false,
    action_user: actionUser.value + '|' + (props.size.action_user || ''),
    image: props.size.image,
});



// Caminho padrão para a imagem
const defaultImage = '/storage/images/default.png';
// Funções auxiliares para manipulação de imagens
const imagePreview = ref(form.image ? `/storage/${form.image}` : defaultImage);
const imageInput = ref(null);

// Selecionar nova imagem
function selectNewImage() {
    imageInput.value.click();
}

// Atualizar visualização da imagem
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


// Cancelar formulário
function cancelForm() {
    resetFormFields();
    const cancelMessage = 'Cadastro cancelado, os campos foram limpos';
    console.log(cancelMessage, message.value);
    props.jetstream.flash = { bannerStyle: 'success', banner: cancelMessage };
}

// Resetar campos do formulário
function resetFormFields() {
    form.reset();
}

// Submeter formulário
function submitForm() {
    console.log("Form data before submit:", form);
    form.put(route('size.update', { id: form.id }), {
        onSuccess: () => form.reset(),
    });
}

</script>
