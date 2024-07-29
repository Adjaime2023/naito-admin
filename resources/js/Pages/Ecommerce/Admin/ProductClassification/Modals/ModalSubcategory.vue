<template>
    <div class="bg-white dark:bg-gray-800 p-6 rounded-lg">
        <h2 class="text-lg font-bold mb-4">Cadastrar Nova Subcategoria de Produto</h2>
        <form @submit.prevent="submitNew">
            <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="main_category_id">Categoria:</InputLabel>
                    <select
                        class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                        v-model="form.category_id" id="category_id">
                        <option v-for="category in props.categories" :key="category.id" :value="category.id">
                            {{ category.name }}
                        </option>
                    </select>
                    <InputError class="mt-2" :message="form.errors.category_id" />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="name">Nome:</InputLabel>
                    <TextInput class="mt-1 block w-full" v-model="form.name" id="name" type="text" autocomplete="name" />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>
                <div class="col-span-1 sm:col-span-3 md:col-span-3">
                    <InputLabel for="description">Descrição:</InputLabel>
                    <textarea
                        class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                        v-model="form.description" id="description"></textarea>
                    <InputError class="mt-2" :message="form.errors.description" />
                </div>
                <div class="flex items-center col-span-1 sm:col-span-1 md:col-span-1">
                    <div class="w-full pr-2">
                        <InputLabel for="discontinued">Descontinuado:</InputLabel>
                        <TextInput class="form-control mt-2" type="checkbox" v-model="form.discontinued" id="discontinued" />
                        <InputError class="mt-2" :message="form.errors.discontinued" />
                    </div>
                    <div class="w-full pl-2">
                        <InputLabel for="deleted">Deletado:</InputLabel>
                        <TextInput class="form-control mt-2" type="checkbox" v-model="form.deleted" id="deleted" />
                        <InputError class="mt-2" :message="form.errors.deleted" />
                    </div>
                </div>
            </div>
            <div class="flex items-center justify-center w-full mt-4">
                <PrimaryButton @click.prevent="cancelForm" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">Limpar</PrimaryButton>
                <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">Cadastrar</ButtonSubmit>
                <ButtonLink href="" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">Listar</ButtonLink>
            </div>
            <button @click="closeModalSubcategory"
                class="bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded mt-4">Fechar Modal</button>
        </form>
    </div>
</template>

<script setup>
  import { ref, computed, defineEmits , onMounted} from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';

const emit = defineEmits(['close']);
const { props } = usePage();

const actionUser = computed(() => {
    const userName = props.auth.user ? props.auth.user.name : 'Desconhecido';
    return `Criado por: ${userName} em ${new Date().toLocaleString()}`;
});

const form = useForm({
    category_id: '',
    name: '',
    description: '',
    discontinued: false,
    deleted: false,
    action_user: actionUser.value,
});

const cancelForm = () => {
    form.reset('category_id', 'name', 'description', 'discontinued', 'deleted');
};

const closeModalSubcategory = () => {
    emit('close'); // Emite o evento para o componente pai
};

const submitNew = async () => {
    form.processing = true; // Ativa o estado de processamento
    try {
        await form.post(route('subcategory.store'));
        form.processing = false;
        closeModalSubcategory(); // Fecha o modal após o sucesso
    } catch (error) {
        form.processing = false; // Desativa o estado de processamento após falha
        if (error.response && error.response.data.errors) {
            form.setErrors(error.response.data.errors);
        }
    }
};


// Lógica para exibir mensagem flash
const message = ref('');
onMounted(() => {
    // Obter a mensagem flash da propriedade 'jetstream.flash.message'
    message.value = props.jetstream.flash?.message || '';
    // Limpar a mensagem flash para evitar que seja exibida novamente
    props.jetstream.flash = null;
});
</script>
