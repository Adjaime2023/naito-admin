<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ModalCategory from '../../ProductClassification/Modals/ModalCategory.vue';
import ModalSubcategory from '../../ProductClassification/Modals/ModalSubcategory.vue';
import ModalGroup from '../../ProductClassification/Modals/ModalGroup.vue';
import ModalSubgroup from '../../ProductClassification/Modals/ModalSubgroup.vue';
import ModalCollection from '../../ProductClassification/Modals/ModalCollection.vue';
import ModalBrand from '../../ProductClassification/Modals/ModalBrand.vue';
import ModalColor from '../../ProductClassification/Modals/ModalColor.vue';
import axios from 'axios';

// Lógica para exibir mensagem flash
const message = ref('');
onMounted(() => {
    // Obter a mensagem flash da propriedade 'jetstream.flash.message'
    message.value = props.jetstream.flash?.message || '';
    // Limpar a mensagem flash para evitar que seja exibida novamente
    props.jetstream.flash = null;
});

// Obtendo propriedades da página
const { props } = usePage();

const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Criado por: ${userName} em ${new Date().toLocaleString()}`;
});


const subgroups = ref([]);
const collections = ref([]);
const brands = ref([]);
const colors = ref([]);

// Função para buscar as listas de opções
const fetchData = async () => {
  const response = await axios.get('/api/product-options');
  subgroups.value = response.data.subgroups;
  collections.value = response.data.collections;
  brands.value = response.data.brands;
  colors.value = response.data.colors;
};

// Chama a função ao montar o componente
fetchData();

// Função para atualizar a descrição
const updateDescription = async () => {
  const { data } = await axios.post('/products/generate-description', {
    name: form.name,
    subgroup_id: form.subgroup_id,
    collection_id: form.collection_id,
    brand_id: form.brand_id,
    color_id: form.color_id,
  });

  form.description = data.description;
};
// Variáveis para controlar a exibição dos modais
const isModalCategoryOpen = ref(false);
const isModalSubcategoryOpen = ref(false);
const isModalGroupOpen = ref(false);
const isModalSubgroupOpen = ref(false);
const isModalCollectionOpen = ref(false);
const isModalBrandOpen = ref(false);
const isModalColorOpen = ref(false);

// Função para abrir o modal
const openModal = (modal) => {
    closeModal(); // Fechar todos os modais antes de abrir o novo
    switch (modal) {
        case 'category':
            isModalCategoryOpen.value = true;
            break;
        case 'subcategory':
            isModalSubcategoryOpen.value = true;
            break;
        case 'group':
            isModalGroupOpen.value = true;
            break;
        case 'subgroup':
            isModalSubgroupOpen.value = true;
            break;
        case 'collection':
            isModalCollectionOpen.value = true;
            break;
        case 'brand':
            isModalBrandOpen.value = true;
            break;
        case 'color':
            isModalColorOpen.value = true;
            break;
        default:
            break;
    }
};

// Função para fechar todos os modais
const closeModal = () => {
    isModalCategoryOpen.value = false;
    isModalSubcategoryOpen.value = false;
    isModalGroupOpen.value = false;
    isModalSubgroupOpen.value = false;
    isModalCollectionOpen.value = false;
    isModalBrandOpen.value = false;
    isModalColorOpen.value = false;
};

// Inicializando o formulário com useForm
const form = useForm({
    name: '',
    description: '',
    price: 0,
    stock: 0,
    image: null,
    category_id: null,
    subcategory_id: null,
    group_id: null,
    subgroup_id: null,
    collection_id: null,
    brand_id: null,
    color_id: null,
    action_user: actionUser.value,
    discontinued: false,
    deleted: false,
});

// Função para resetar o formulário
const cancelForm = () => {
    form.reset();
};

// Função para enviar o formulário
const submit = () => {
    form.post(route('product.store'));
};


</script>

<template>

    <div class="px-4 py-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">

        <form @submit.prevent="submit" enctype="multipart/form-data">
            <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">

                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="name">Nome:</InputLabel>
                    <TextInput class="mt-1 block w-full" v-model="form.name" @input="updateDescription" id="name" type="text"
                        autocomplete="name" />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-2">
                    <InputLabel for="description">Descrição:</InputLabel>
                    <TextInput class="mt-1 block w-full" v-model="form.description" id="description" type="text" />
                    <InputError class="mt-2" :message="form.errors.description" />
                </div>

                <div class="flex items-center col-span-1 sm:col-span-1 md:col-span-1">
                    <div class="pr-2">
                        <InputLabel for="price">Preço:</InputLabel>
                        <TextInput class="mt-2 block w-full text-end" v-model="form.price" id="price" type="number"
                            step="0.01" />
                        <InputError class="mt-2" :message="form.errors.price" />

                    </div>
                    <div class="pl-2">
                        <InputLabel for="stock">Estoque:</InputLabel>
                        <TextInput class="mt-2 block w-full text-center" v-model="form.stock" id="stock" type="number"
                            />
                        <InputError class="mt-2" :message="form.errors.stock" />
                    </div>
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="main_category_id">Categoria:</InputLabel>
                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.category_id" id="main_category_id">
                            <option v-for="category in props.categories" :key="category.id" :value="category.id">
                                {{ category.name }}
                            </option>
                        </select>
                        <button @click="openModal('category')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.category_id" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="subcategory_id">Subcategoria:</InputLabel>
                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.subcategory_id" id="subcategory_id">
                            <option v-for="subcategory in props.subcategories" :key="subcategory.id"
                                :value="subcategory.id">
                                {{ subcategory.name }}
                            </option>
                        </select>
                        <button @click="openModal('subcategory')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.subcategory_id" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="group_id">Grupo:</InputLabel>
                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.group_id" id="group_id">
                            <option v-for="group in props.groups" :key="group.id" :value="group.id">
                                {{ group.name }}
                            </option>
                        </select>
                        <button @click="openModal('group')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.group_id" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="subgroup_id">Subgrupo:</InputLabel>
                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.subgroup_id"  @change="updateDescription" id="subgroup_id">
                            <option v-for="subgroup in props.subgroups" :key="subgroup.id"
                                :value="subgroup.id">
                                {{ subgroup.name }}
                            </option>
                        </select>
                        <button @click="openModal('subgroup')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.subgroup_id" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">

                    <InputLabel for="collection_id">Coleção:</InputLabel>

                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.collection_id"   @change="updateDescription"  id="collection_id">
                            <option v-for="collection in props.collections" :key="collection.id" :value="collection.id">
                                {{ collection.name }}
                            </option>
                        </select>
                        <button @click="openModal('collection')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.collection_id" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">

                    <InputLabel for="brand_id">Marca:</InputLabel>

                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.brand_id"  @change="updateDescription" id="brand_id">
                            <option v-for="brand in props.brands" :key="brand.id" :value="brand.id">
                                {{ brand.name }}
                            </option>
                        </select>
                        <button @click="openModal('brand')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.brand_id" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">

                    <InputLabel for="color_id">Cor:</InputLabel>

                    <div class="flex items-center mt-2">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-l-md shadow-sm"
                            v-model="form.color_id"  @change="updateDescription" id="color_id">
                            <option v-for="color in props.colors" :key="color.id" :value="color.id">
                                {{ color.name }}
                            </option>
                        </select>
                        <button @click="openModal('color')"
                            class="px-3 py-2  text-white bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 dark:hover:bg-blue-500 rounded-r-md">
                            +
                        </button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.color_id" />
                </div>
                <div class="col-span-1 sm:col-span-3 md:col-span-3">
                    <InputLabel for="action_user">Ação:</InputLabel>


                    <textarea
                        class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                        v-model="form.action_user" id="action_user" readonly></textarea>
                    <InputError class="mt-2" :message="form.errors.action_user" />
                </div>
                <div class="flex items-center col-span-1 sm:col-span-1 md:col-span-1">
                    <div class="w-full pr-2">

                        <InputLabel for="discontinued">Descontinuado:</InputLabel>
                        <TextInput class="form-control mt-2" type="checkbox" v-model="form.discontinued"
                            id="discontinued" />
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
                <PrimaryButton @click.prevent="cancelForm" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Cancelar
                </PrimaryButton>
                <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    Cadastrar
                </ButtonSubmit>
                <ButtonLink href="" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Listar
                </ButtonLink>
            </div>
        </form>

    </div>

    <div>

        <!-- Modal Category  -->
        <div v-if="isModalCategoryOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalCategory @close="closeModal" />
        </div>

        <!-- Modal Subcategory -->
        <div v-if="isModalSubcategoryOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalSubcategory @close="closeModal" />
        </div>

        <!-- Modal grupo -->
        <div v-if="isModalGroupOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalGroup @close="closeModal" />
        </div>
        <!-- Modal Subgrupo  -->

        <div v-if="isModalSubgroupOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalSubgroup @close="closeModal" />
        </div>
        <!-- Modal Coleção  -->
        <div v-if="isModalCollectionOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalCollection @close="closeModal" />
        </div>
        <!-- Modal Marca  -->
        <div v-if="isModalBrandOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalBrand @close="closeModal" />
        </div>
        <!-- Modal Cor -->
        <div v-if="isModalColorOpen"
            class="fixed z-10 inset-0 overflow-y-auto flex justify-center items-center bg-gray-500 bg-opacity-50">
            <ModalColor @close="closeModal" />
        </div>



    </div>



</template>
