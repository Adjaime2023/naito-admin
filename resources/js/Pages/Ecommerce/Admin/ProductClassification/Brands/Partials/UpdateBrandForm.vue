<template>
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
        <div class="lg:col-span-3">
            <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
                <form @submit.prevent="submitForm" method="post" enctype="multipart/form-data">
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="name">Nome da Marca</InputLabel>
                            <TextInput v-model="form.name" id="name" name="name" class="block mt-1 w-full" type="text" required />
                            <InputError class="mt-2" :message="form.errors.name" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="description">Descrição</InputLabel>
                            <TextInput id="description" name="description" v-model="form.description" class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.description" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="action_user">Ação:</InputLabel>
                            <textarea v-model="form.action_user" id="action_user" readonly
                                class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"></textarea>
                            <InputError class="mt-2" :message="form.errors.action_user" />
                        </div>
                        <div class="flex items-center col-span-1 sm:col-span-1 md:col-span-1">
                            <div class="w-full pr-2">
                                <InputLabel for="discontinued">Descontinuado:</InputLabel>
                                <input class="form-control mt-2" type="checkbox" v-model="form.discontinued" id="discontinued" />
                                <InputError class="mt-2" :message="form.errors.discontinued" />
                            </div>
                            <div class="w-full pl-2">
                                <InputLabel for="deleted">Deletado:</InputLabel>
                                <input class="form-control mt-2" type="checkbox" v-model="form.deleted" id="deleted" />
                                <InputError class="mt-2" :message="form.errors.deleted" />
                            </div>
                        </div>
                    </div>
                    <div class="flex items-center justify-center w-full mt-4">
                        <ButtonLink :href="route('brand.create')" class="w-1/6">Novo</ButtonLink>
                        <ButtonSubmit class="w-1/6" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                            Atualizar
                        </ButtonSubmit>
                        <ButtonLink :href="route('brands.show', form.id)" class="w-1/6">Listar</ButtonLink>
                    </div>
                </form>
                <div v-if="message" class="alert alert-success">
                    {{ message }}
                </div>
            </div>
        </div>
        <div class="lg:col-span-1">
            <ImageBrandForm />
        </div>
    </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ImageBrandForm from './ImageBrandForm.vue';

// Lógica para exibir mensagem flash
const message = ref('');
const { props } = usePage();
const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Atualizado por: ${userName} em ${new Date().toLocaleString()}`;
});

onMounted(() => {
    message.value = props.jetstream?.flash?.banner || '';
    props.jetstream.flash = null});

// Inicialização do formulário
const form = useForm({
    _method: 'PUT',
    id: props.brand.id || '',
    name: props.brand.name || '',
    description: props.brand.description || '',
    discontinued: props.brand.discontinued || false,
    deleted: props.brand.deleted || false,
    action_user: actionUser.value + '|' + (props.brand.action_user || ''),
});

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
    form.put(route('brand.update', { id: form.id }), {
        onSuccess: () => form.reset(),
    });
}
</script>
