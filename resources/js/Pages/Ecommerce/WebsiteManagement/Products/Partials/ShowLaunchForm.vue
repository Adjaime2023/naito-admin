<script setup>
import { ref, onMounted, computed } from "vue";
import axios from "axios";

const FILTER_FIELDS = {
    name: "Nome",
    description: "Descrição",
    category_name: "Categoria",
    subcategory_name: "Subcategoria",
    group_name: "Grupo",
    subgroup_name: "Subgrupo",
    collection_name: "Coleção",
    brand_name: "Produtos",
    color_name: "Cor",
};

const itemsPerPage = ref(10);
const sortField = ref("name");
const sortDirection = ref("asc");
const searchTerm = ref("");
const selectedField = ref("");
const totalItems = ref(0);
const currentPage = ref(1);
const products = ref([]);
const discontinued = ref(""); // Filter for discontinued
const launch = ref("");
const promotion = ref("");
const deleted = ref(false); // Filter for deleted

const fetchProducts = async () => {
    try {
        let url = `/api/products?page=${currentPage.value}&itemsPerPage=${itemsPerPage.value}&sortField=${sortField.value}&sortDirection=${sortDirection.value}`;

        if (selectedField.value) {
            url += `&searchField=${selectedField.value}`;
        }

        if (searchTerm.value) {
            url += `&searchTerm=${searchTerm.value}`;
        }

        if (launch.value) {
            url += `&launch=${launch.value}`;
        }
        if (promotion.value) {
            url += `&promotion=${promotion.value}`;
        }
        if (discontinued.value) {
            url += `&discontinued=${discontinued.value}`;
        } else if (deleted.value) {
            url += `&deleted=${deleted.value}`;
        }

        console.log("Fetching products with URL:", url); // Log the URL

        const response = await axios.get(url);
        console.log("Response data:", response.data); // Log the response data

        products.value = response.data.data; // Assuming your API returns data inside 'data'
        totalItems.value = response.data.total;
        console.log("Total de Itens:", totalItems.value);
    } catch (error) {
        console.error("Erro ao buscar Produtos", error);
    }
};

onMounted(() => {
    fetchProducts();
});

const search = () => {
    currentPage.value = 1;
    fetchProducts();
};

// Initial fetch
fetchProducts();

const sortBy = (field) => {
    sortDirection.value =
        sortField.value === field ? (sortDirection.value === "asc" ? "desc" : "asc") : "asc";
    sortField.value = field;
    fetchProducts();
};

const totalPages = computed(() => Math.ceil(totalItems.value / itemsPerPage.value));

const maxVisiblePages = 10; // Defina o número máximo de páginas visíveis

const visiblePages = computed(() => {
    const half = Math.floor(maxVisiblePages / 2);
    let startPage = Math.max(1, currentPage.value - half);
    let endPage = startPage + maxVisiblePages - 1;

    if (endPage > totalPages.value) {
        endPage = totalPages.value;
        startPage = Math.max(1, endPage - maxVisiblePages + 1);
    }

    return Array.from({ length: endPage - startPage + 1 }, (_, i) => startPage + i);
});

const gotoPage = (pageNumber) => {
    currentPage.value = pageNumber;
    fetchProducts(); // Chame a função para buscar os produtos da página selecionada
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
        fetchProducts(); // Chame a função para buscar os produtos da próxima página
    }
};

const previousPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
        fetchProducts(); // Chame a função para buscar os produtos da página anterior
    }
};

const toggleLaunch = async (product) => {
    try {
        const updateLaunch = !product.launch;
        const response = await axios.patch(`/api/products/${product.id}/launch`, {
            launch: updateLaunch,
        });

        if (response.status === 200) {
            product.launch = updateLaunch;
        } else {
            console.error("Erro ao atualizar Produto");
        }
    } catch (error) {
        console.error("Erro ao atualizar Produto", error);
    }
};

const togglePromotion = async (product) => {
    try {
        const updatePromotion = !product.promotion;
        const response = await axios.patch(`/api/products/${product.id}/promotion`, {
            promotion: updatePromotion,
        });

        if (response.status === 200) {
            product.promotion = updatePromotion;
        } else {
            console.error("Erro ao atualizar Produto");
        }
    } catch (error) {
        console.error("Erro ao atualizar Produto", error);
    }
};

const toggleDiscontinued = async (product) => {
    try {
        const updateDiscontinued = !product.discontinued;
        const response = await axios.patch(`/api/products/${product.id}/discontinued`, {
            discontinued: updateDiscontinued,
        });

        if (response.status === 200) {
            product.discontinued = updateDiscontinued;
        } else {
            console.error("Erro ao atualizar Produto");
        }
    } catch (error) {
        console.error("Erro ao atualizar Produto", error);
    }
};

const toggleDeleted = async (product) => {
    try {
        const updatedDeleted = !product.deleted_at; // Inverte o estado atual

        const response = await axios.patch(`/api/products/${product.id}/deleted`, {
            deleted: updatedDeleted,
        });

        if (response.status === 200) {
            product.deleted_at = updatedDeleted ? new Date().toISOString() : null; // Atualiza localmente
        } else {
            console.error("Erro ao atualizar Produto");
        }
    } catch (error) {
        console.error("Erro ao atualizar Produto", error);
    }
};
</script>


<template>
    <div class="mx-0 px-0 pt-2 pb-4 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <div class="bg-gray-200 dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg">
            <div class="flex flex-col md:flex-row items-center my-2 px-4 w-full text-gray-800 dark:text-gray-200">
                <form @submit.prevent="search" class="flex flex-col w-full space-y-2">
                    <div class="flex flex-col md:flex-row items-center w-full space-y-2 md:space-y-0 md:space-x-4">
                        <!-- Campo de Busca -->
                        <div class="flex flex-col md:flex-row items-center w-full md:w-1/4">
                            <label for="selectedField" class="ml-4 md:mr-2 w-full md:w-auto text-right">Buscar:</label>
                            <select v-model="selectedField" name="selectedField" id="selectedField"
                                class="w-full text-sm border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                                <option value="">Todos os Campos</option>
                                <option v-for="(label, value) in FILTER_FIELDS" :key="value" :value="value">
                                    {{ label }}
                                </option>
                            </select>
                        </div>

                        <!-- Termo de Busca -->
                        <div class="flex flex-col md:flex-row items-center pr-4 w-full md:w-3/4">
                            <input
                                class="w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                v-model="searchTerm" id="searchTerm" name="searchTerm" type="text"
                                placeholder="Search..." @input="fetchProducts" />
                        </div>
                    </div>

                    <!-- Checkboxes -->
                    <div class="flex flex-col md:flex-row justify-center w-full space-y-2 md:space-y-0 md:space-x-4">
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="launch">Lançamentos:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="launch" id="launch" @change="fetchProducts" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="promotion">Promoções:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="promotion" id="promotion" @change="fetchProducts" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="discontinued">Descontinuado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="discontinued" id="discontinued" @change="fetchProducts" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="deleted">Deletado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="deleted" id="deleted" @change="fetchProducts" />
                        </div>


                        <!-- Botão de Pesquisa -->
                        <button type="submit"
                            class="items-center text-center underline-offset-2 mx-3 py-2 space-x-2 px-4 rounded-md group bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 hover:dark:from-cyan-600 hover:dark:to-blue-600 bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100">
                            Pesquisar
                        </button>
                    </div>
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
                                    <div class="flex items-center"> <a class="text-sm">Imagem</a></div>
                                </th>

                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"> <a class="text-sm">Edit</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Lanç</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Prom</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Desc</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Del</a></div>
                                </th>

                            </tr>
                        </thead>
                        <tbody class="px-2 bg-white divide-y dark:divide-gray-700 dark:bg-gray-900">
                            <tr v-for="product in products" :key="product.id" class="text-gray-700 dark:text-gray-400">
                                <td class="px-2 py-2 text-sm">{{ product.name }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.description }}</td>
                                <td class="px-2 py-2 text-sm">{{ product.category.name }}</td>
                                <td class="px-1 py-1 text-xs">
                                    <img :src="product.image ? '/storage/' + product.image : '/storage/images/default.png'"
                                        alt="Logo" class="w-10 h-10 rounded-md">
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <a :href="`/product/${product.id}/edit`"
                                        :class="{ 'opacity-50 cursor-not-allowed': product.deleted_at }"
                                        :disabled="product.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Edit" title="Editar Produtos">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <button @click="toggleLaunch(product)"
                                        :class="{ 'opacity-50 cursor-not-allowed': product.deleted_at }"
                                        :disabled="product.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Lançamento">
                                        <i v-if="!product.launch" class="fa-solid fa-file-import"
                                            title="Lançamento Produtos"></i>
                                        <i v-else class="fa-solid fa-rocket text-green-500"
                                            title="Permanecer Produtos"></i>
                                    </button>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <button @click="togglePromotion(product)"
                                        :class="{ 'opacity-50 cursor-not-allowed': product.deleted_at }"
                                        :disabled="product.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Promoção">
                                        <i v-if="!product.promotion" class="fa-solid fa-file-import"
                                            title="Promoção Produtos"></i>
                                        <i v-else class="fa-solid fa-tags  text-green-500" title="Permanecer Produtos"></i>
                                    </button>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <button @click="toggleDiscontinued(product)"
                                        :class="{ 'opacity-50 cursor-not-allowed': product.deleted_at }"
                                        :disabled="product.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Descontinuar">
                                        <i v-if="!product.discontinued" class="fa-solid fa-file-import"
                                            title="Descontinuar Produtos"></i>
                                        <i v-else class="fa-solid fa-file-export  text-yellow-500" title="Permanecer Produtos"></i>
                                    </button>
                                </td>

                                <td class="px-2 py-2 text-sm">

                                    <!-- Botão de deletar/restaurar -->
                                    <button @click="toggleDeleted(product)"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Deleted">
                                        <i v-if="!product.deleted_at" class="fa-solid fa-trash"
                                            title="Deletar Produtos"></i>
                                        <i v-else class="fa-solid fa-trash-arrow-up text-red-500" title="Restaurar Produtos"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination start -->
                <div
                    class="flex justify-between px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                    <span class="flex items-center col-span-3">
                        Exibindo {{ (currentPage - 1) * itemsPerPage + 1 }} -
                        {{ Math.min(currentPage * itemsPerPage, totalItems) }} de {{ totalItems }}
                    </span>
                    <div class="flex justify-end flex-1 col-span-4 sm:col-span-2">
                        <button @click="previousPage" :disabled="currentPage === 1"
                            class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-l-md text-gray-900 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50">
                            Anterior
                        </button>
                        <div class="hidden sm:block">
                            <span class="relative z-0 inline-flex shadow-sm rounded-md">
                                <!-- Lógica para exibir páginas limitadas -->
                                <template v-if="totalPages > 0">
                                    <button v-for="page in visiblePages" :key="page" @click="gotoPage(page)" :class="[
                                        'relative text-gray-900 dark:text-gray-200 inline-flex items-center px-4 py-2 border text-sm font-medium',
                                        currentPage === page
                                            ? 'bg-gray-300 dark:bg-gray-700'
                                            : 'bg-white dark:bg-gray-900',
                                    ]">
                                        {{ page }}
                                    </button>
                                </template>
                            </span>
                        </div>
                        <button @click="nextPage" :disabled="currentPage === totalPages"
                            class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-md text-gray-900 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50">
                            Próxima
                        </button>
                    </div>
                </div>
                <!-- Pagination end -->
            </div>
        </div>
    </div>
</template>
