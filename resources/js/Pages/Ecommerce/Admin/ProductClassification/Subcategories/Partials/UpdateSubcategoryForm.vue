<template>
    <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
        <div class="lg:col-span-3">
            <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
                <form @submit.prevent="updateSubcategory" enctype="multipart/form-data">
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">
                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="category_id">Categoria:</InputLabel>
                            <select v-if="props.categories && props.categories.length" v-model="form.category_id"
                                id="category_id"
                                class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                                <option v-for="category in props.categories" :key="category.id" :value="category.id">
                                    {{ category.name }}
                                </option>
                            </select>
                            <InputError class="mt-2" :message="form.errors.category_id" />
                        </div>
                        <!-- Outros campos do formulário -->
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="name">Nome:</InputLabel>
                            <TextInput class="mt-2 block w-full" v-model="form.name" id="name" type="text" />
                            <InputError class="mt-2" :message="form.errors.name" />
                        </div>

                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="description">Descrição:</InputLabel>
                            <TextInput class="mt-1 block w-full" v-model="form.description" id="description"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.description" />
                        </div>
                    </div>
                    <div
                        class="col-span-1 sm:col-span-2 md:col-span-3 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
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
                                       </div>



                        <div class="col-span-1 sm:col-span-3 md:col-span-3">
                            <InputLabel for="action_user">Ação:</InputLabel>
                            <textarea v-model="form.action_user"
                                class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                id="action_user"></textarea>
                            <InputError class="mt-2" :message="form.errors.action_user" />
                        </div>

                    </div>
                    <div class="flex items-center justify-center w-full mt-4">
                        <ButtonLink :href="route('subcategory.create')"
                            class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                            Novo
                        </ButtonLink>
                        <ButtonSubmit :disabled="form.processing" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                            Atualizar
                        </ButtonSubmit>
                        <ButtonLink :href="route('subcategories.show')"
                            class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                            Listar
                        </ButtonLink>

                    </div>
                </form>
            </div>
        </div>
             <div class="lg:col-span-1">
            <ImageSubcategoryForm />
        </div>
    </div>
</template>



<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ImageSubcategoryForm from './ImageSubcategoryForm.vue';

// Lógica para exibir mensagem flash
const message = ref('');
const { props } = usePage();
const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Atualizado por: ${userName} em ${new Date().toLocaleString()}`;
});


// Inicializando o formulário com useForm
const form = useForm({
    _method: 'PUT',
    category_id: props.subcategory.category_id,
    id: props.subcategory.id,
    name: props.subcategory.name,
    description: props.subcategory.description,
    action_user: actionUser.value + '|' + (props.subcategory.action_user || ''),
    discontinued: props.subcategory.discontinued == 1 ? true : false,
    deleted: props.subcategory.deleted == 1 ? true : false,
});

// Função para resetar o formulário
const cancelForm = () => {
    form.reset();
};

// Função para atualizar o produto
const updateSubcategory = () => {
    form.put(route('subcategory.update', { id: form.id }), {
        onSuccess: () => {
            // Opcional: Ações após a atualização bem-sucedida
        },
        onError: (errors) => {
            console.log(errors); // Verifique os erros no console
        },
    });
};

onMounted(() => {
    // Obter a mensagem flash da propriedade 'jetstream.flash.message'
    message.value = props.jetstream.flash?.message || '';
    // Limpar a mensagem flash para evitar que seja exibida novamente
    props.jetstream.flash = null;
});
</script>

<style scoped>
.form-control {
    margin-top: 0.5rem;
    /* Ajuste o espaçamento conforme necessário */
    margin-bottom: 0.5rem;
}
</style>
