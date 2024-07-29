<script setup>
import { ref, onMounted, computed } from 'vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import axios from 'axios';
import ButtonSearch from '@/Components/Partials/ButtonSearch.vue';

const FILTER_FIELDS = {
    name: 'Nome',
    description: 'Descrição',
    category_name: 'Categoria',
    subcategory_name: 'Subcategoria',
    group_name: 'Grupo',
    subgroup_name: 'Subgrupo',
    collection_name: 'Coleção',
    brand_name: 'Produtos',
    color_name: 'Cor'
};

const itemsPerPage = ref(10);
const productsPerPage = ref(10);
const sortField = ref('name');
const sortDirection = ref('asc');
const searchTerm = ref('');
const selectedField = ref('');
const totalItems = ref(0);
const currentPage = ref(1);
const products = ref([]);
const discontinued = ref(false); // Filter for discontinued
const deleted = ref(false); // Filter for deleted

const fetchProducts = async () => {
    try {
        let url = `/api/products?page=${currentPage.value}&sortField=${sortField.value}&sortDirection=${sortDirection.value}&itemsPerPage=${itemsPerPage.value}`;

        if (selectedField.value) {
            url += `&searchField=${selectedField.value}`;
        }

        if (searchTerm.value) {
            url += `&searchTerm=${searchTerm.value}`;
        }

        const response = await axios.get(url);
        products.value = response.data.data; // Atualiza os produtos com os dados retornados
        totalItems.value = response.data.total; // Atualiza o número total de itens
        updateFilteredProducts();
    } catch (error) {
        console.error('Erro ao buscar Produtos', error);
    }
};
onMounted(() => {
    fetchProducts();
});

const search = () => {
    fetchProducts();
};

const updateSelectedField = () => {
    fetchProducts();
};

const getProductsInCurrentPage = () => {
    const startIndex = (currentPage.value - 1) * productsPerPage.value;
    const endIndex = startIndex + productsPerPage.value;
    return filteredProducts.value.slice(startIndex, endIndex);
};

const sortBy = (field) => {
    sortDirection.value = sortField.value === field ? (sortDirection.value === 'asc' ? 'desc' : 'asc') : 'asc';
    sortField.value = field;
    fetchProducts();
};


const totalPages = computed(() => Math.ceil(totalItems.value / itemsPerPage.value));

const startPage = computed(() => Math.max(1, currentPage.value - 5));
const endPage = computed(() => Math.min(totalPages.value, startPage.value + 9));






const gotoPage = (pageNumber) => {
    currentPage.value = pageNumber;
    fetchProducts();
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
        fetchProducts();
    }
};

const previousPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
        fetchProducts();
    }
};



// Aplicar os filtros de discontinued e deleted diretamente ao mudar os checkboxes
const updateFilteredProducts = () => {
    let filtered = products.value;

    if (discontinued.value) {
        filtered = filtered.filter(product => product.discontinued);
    }

    if (deleted.value) {
        filtered = filtered.filter(product => product.deleted_at !== null); // Verifica se o produto foi deletado
    }

    return filtered;
};


const filteredProducts = computed(updateFilteredProducts);


const toggleDiscontinued = async (product) => {
    try {
        const updatedDiscontinued = !product.discontinued;
        const response = await axios.patch(`/api/products/${product.id}/discontinued`, {
            discontinued: updatedDiscontinued
        });

        if (response.status === 200) {
            product.discontinued = updatedDiscontinued;
            fetchProducts(); // Recarrega os Produtoss após a atualização
        } else {
            console.error('Erro ao atualizar o Produtos:', response.statusText);
        }
    } catch (error) {
        console.error('Erro ao atualizar o Produtos:', error);
    }
};

const toggleDeleted = async (product) => {
    try {
        const updatedDeleted = !product.deleted;
        const response = await axios.patch(`/api/products/${product.id}/deleted`, {
            deleted: updatedDeleted
        });

        if (response.status === 200) {
            product.deleted = updatedDeleted;
            fetchProducts(); // Recarrega os Produtoss após a atualização
        } else {
            console.error('Erro ao atualizar o Produtos:', response.statusText);
        }
    } catch (error) {
        console.error('Erro ao atualizar o Produtos:', error);
    }
};




</script>


<template>
    <div class="mx-0 px-0 pt-2 pb-4 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <div class="bg-gray-200 dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg">

            <div class="flex flex-col md:flex-row items-center my-2 w-full text-gray-800 dark:text-gray-200">
                <form @submit.prevent="search"
                    class="flex flex-col md:flex-row items-center w-full space-y-2 md:space-y-0 md:space-x-4">
                    <!-- Select Field -->
                    <div class="flex flex-col md:flex-row items-center w-full md:w-1/4">
                        <label for="selectedField" class="ml-4 md:mr-2 w-full md:w-auto text-right">Buscar:</label>
                        <select v-model="selectedField" @change="updateSelectedField" name="selectedField"
                            id="selectedField"
                            class="w-full  text-sm border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                            <option value="">Todos os Campos</option>
                            <option v-for="(label, value) in FILTER_FIELDS" :key="value" :value="value">{{ label }}
                            </option>
                        </select>
                    </div>

                    <!-- Search Input -->
                    <div class="flex flex-col md:flex-row items-center w-full md:w-2/6">
                        <input
                            class="w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                            v-model="searchTerm" @input="search" id="searchTerm" name="searchTerm" type="text"
                            placeholder="Search..." />
                    </div>

                    <!-- Checkboxes -->
                    <div
                        class="flex flex-col md:flex-row items-center w-full md:w-auto space-y-2 md:space-y-0 md:space-x-4">
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="discontinued">Descontinuado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="discontinued" id="discontinued"
                                @change="updateFilteredProducts" />
                            <span class="ml-1 text-red-500"
                                v-if="form && form.errors ? form.errors.discontinued : ''"></span>
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="deleted">Deletado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="deleted" id="deleted" @change="updateFilteredProducts" />
                            <span class="ml-1 text-red-500"
                                v-if="form && form.errors ? form.errors.deleted : ''"></span>
                        </div>
                    </div>

                    <!-- Search Button -->
                    <button type="submit" class="items-center text-center underline-offset-2 mx-3 py-2  space-x-2 px-4 rounded-md     group  bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500   hover:dark:from-cyan-600 hover:dark:to-blue-600
    bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100 ">Pesquisar</button>
                </form>
            </div>



            <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <thead>
                            <tr
                                class="text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('name')" :class="{ 'text-sm': true, 'cursor-pointer': true }">
                                            Nome
                                            <span v-if="sortField === 'name'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('description')"
                                            :class="{ 'text-sm': true, 'cursor-pointer': true }">
                                            Descrição
                                            <span v-if="sortField === 'description'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('category_name')"
                                            :class="{ 'text-sm': true, 'cursor-pointer': true }">
                                            Categoria
                                            <span v-if="sortField === 'category_name'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('subcategory_name')"
                                            :class="{ 'text-sm': true, 'cursor-pointer': true }">
                                            Subcategoria
                                            <span v-if="sortField === 'subcategory_name'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('group_name')"
                                            :class="{ 'text-sm': true, 'cursor-pointer': true }">
                                            Grupo
                                            <span v-if="sortField === 'group_name'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center">
                                        <a class="text-sm">
                                            Ações
                                        </a>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr v-for="product in getProductsInCurrentPage()" :key="product.id"
                                class="text-gray-700 dark:text-gray-400">
                                <td class="px-2 py-2 text-sm">{{ product.name }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.description }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.category.name }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.subcategory.name }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.group.name }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.brand.name }}</td>

                                <td class="px-2 py-2 flex items-center justify-between">
                                    <a :href="`/product/${product.id}/edit`"
                                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Edit" title="Editar Produto">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button @click="toggleDiscontinued(product)"
                                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Descontinuar">
                                        <i v-if="!product.discontinued" class="fa-solid fa-file-import"
                                            title="Descontinuar Produto"></i>
                                        <i v-else class="fa-solid fa-file-export" title="Permanecer Produto"></i>
                                    </button>
                                    <button @click="toggleDeleted(product)"
                                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Deleted">
                                        <i v-if="!product.deleted" class="fa-solid fa-trash"
                                            title="Deletar Produto"></i>
                                        <i v-else class="fa-solid fa-trash-arrow-up" title="Restaurar Produto"></i>
                                    </button>
                                </td>


                            </tr>
                        </tbody>
                    </table>
                </div>

                <div
                    class="grid px-2 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800 sm:grid-cols-9">
                    <span class="flex items-center col-span-3"> Mostrando {{ (currentPage - 1) * itemsPerPage + 1 }} a
                        {{
                            Math.min(currentPage * itemsPerPage, totalItems) }} de {{ totalItems }} </span>
                    <span class="col-span-2"></span>
                    <!-- Pagination -->
                    <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                        <nav aria-label="Table navigation">
                            <ul class="inline-flex items-center">
                                <li>
                                    <button @click="previousPage" :disabled="currentPage === 1"
                                        class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                                        aria-label="Previous">
                                        <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                                            <path
                                                d="M7.05 10l4.95 4.95-1.414 1.414L4.222 10l6.364-6.364L12 5.05 7.05 10z"
                                                clip-rule="evenodd" fill-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </li>
                                <li>
                                    <button
                                        v-for="page in Array.from({ length: endPage - startPage + 1 }, (_, i) => startPage + i)"
                                        :key="page" @click="gotoPage(page)" :disabled="currentPage === page"
                                        :class="['px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple', currentPage === page ? 'bg-blue-500 text-white' : 'bg-white text-gray-900']">
                                        {{ page }}
                                    </button>
                                </li>
                                <li>
                                    <button @click="nextPage" :disabled="currentPage === totalPages || totalPages === 0"
                                        class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                                        aria-label="Next">
                                        <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                                            <path
                                                d="M12.95 10l-4.95-4.95 1.414-1.414L15.778 10l-6.364 6.364L8 14.95 12.95 10z"
                                                clip-rule="evenodd" fill-rule="evenodd"></path>
                                        </svg>
                                    </button>
                                </li>
                            </ul>
                        </nav>
                    </span>
                </div>
            </div>
        </div>
    </div>
</template>
