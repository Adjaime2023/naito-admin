<script setup>

import { ref, onMounted, computed } from 'vue';
import axios from 'axios';

const FILTER_FIELDS = {
    alt: 'Alt',
    title: 'Titulo',
    descrition: 'Descrição',
    descrition2: 'Descrição 2',
};

const currentPage = ref(1);
const itemsPerPage = ref(10);
const sortField = ref('alt');
const sortDirection = ref('asc');
const selectedField = ref('');
const searchTerm = ref('');
const discontinued = ref(false);
const deleted = ref(false);

const banners = ref([]);
const totalItems = ref(0);

const fetchBanners = async () => {
    try {
        let url = `/api/banners?page=${currentPage.value}&per_page=${itemsPerPage.value}&sortField=${sortField.value}&sortDirection=${sortDirection.value}`;

        if (selectedField.value) {
            url += `&searchField=${selectedField.value}`;
        }

        if (searchTerm.value) {
            url += `&searchTerm=${searchTerm.value}`;
            
        }

        
        if (banner.value) {
            url += `&banner=${banner.value}`;
        }

        
        if (slide.value) {
            url += `&slide=${slide.value}`;
        }

        // Only add the 'discontinued' filter if it's true. By default, we are showing only continued banners.
        if (discontinued.value) {
            url += `&discontinued=true`;
        } else {
            url += `&discontinued=false`;
        }

        if (deleted.value) {
            url += `&deleted=${deleted.value}`;
        }

        console.log('Fetching banners with URL:', url); // Log the URL

        const response = await axios.get(url);
        console.log('Response data:', response.data); // Log the response data

        banners.value = response.data.data; // Assuming your API returns data inside 'data'
        totalItems.value = response.data.total;
        console.log("Total de Itens:", totalItems.value);
    } catch (error) {
        console.error('Erro ao buscar Banneres', error);
    }
};

onMounted(() => {
    fetchBanners();
})

const search = () => {
    currentPage.value = 1;
    fetchBanners();
};

const updateSelectedField = () => {
    currentPage.value = 1;
    fetchBanners();
};

const sortBy = (field) => {
    sortDirection.value = sortField.value === field ? (sortDirection.value === 'asc' ? 'desc' : 'asc') : 'asc';
    sortField.value = field;
    fetchBanners();
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
    fetchBanners(); // Chame a função para buscar os parceiros da página selecionada
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
        fetchBanners(); // Chame a função para buscar os parceiros da próxima página
    }
};

const previousPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
        fetchBanners(); // Chame a função para buscar os parceiros da página anterior
    }
};



const toggleDiscontinued = async (banner) => {
    try {
        const updateDiscontinued = !banner.discontinued;
        const response = await axios.patch(`/api/banners/${banner.id}/discontinued`, {
            discontinued: updateDiscontinued
        });

        if (response.status === 200) {
            banner.discontinued = updateDiscontinued;
        } else {
            console.error('Erro ao atualizar Banner');
        }
    } catch (error) {
        console.error('Erro ao atualizar Banner', error);
    }
};



const toggleSlide = async (banner) => {
    try {
        const updateBanner = !banner.slide;
        const response = await axios.patch(`/api/banners/${banner.id}/slide`, {
            slide: updateBanner
        });

        if (response.status === 200) {
            banner.slide = updateBanner;
        } else {
            console.error('Erro ao atualizar Banner');
        }
    } catch (error) {
        console.error('Erro ao atualizar Banner', error);
    }
};



const toggleBanner = async (banner) => {
    try {
        const updateSlide = !banner.banner;
        const response = await axios.patch(`/api/banners/${banner.id}/banner`, {
            banner: updateSlide
        });

        if (response.status === 200) {
            banner.banner = updateSlide;
        } else {
            console.error('Erro ao atualizar Banner');
        }
    } catch (error) {
        console.error('Erro ao atualizar Banner', error);
    }
};




// Função para alternar o estado de deletado do Banner
const toggleDeleted = async (banner) => {
    try {
        const updatedDeleted = !banner.deleted_at; // Inverte o estado atual

        // Requisição PATCH para atualizar o estado de deletado no servidor
        const response = await axios.patch(`/api/banners/${banner.id}/deleted`, {
            deleted: updatedDeleted
        });

        if (response.status === 200) {
            banner.deleted_at = updatedDeleted ? new Date().toISOString() : null; // Atualiza localmente
        } else {
            console.error('Erro ao atualizar Banner');
        }
    } catch (error) {
        console.error('Erro ao atualizar Banner', error);
    }
};



</script>

<template>
    <div class="mx-0 px-0 pt-2 pb-4 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <div class="bg-gray-200 dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg">
            <div class="flex flex-col md:flex-row items-center my-2 w-full text-gray-800 dark:text-gray-200">
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
                                placeholder="Search..." @input="fetchBanners" />
                        </div>
                    </div>

                    <!-- Checkboxes -->
                    <div class="flex flex-col md:flex-row justify-center w-full space-y-2 md:space-y-0 md:space-x-4">
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="banner">Banner</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="banner" id="banner" @change="fetchBanners" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="slide">Slide:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="slide" id="slide" @change="fetchBanners" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="discontinued">Descontinuado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="discontinued" id="discontinued" @change="fetchBanners" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="deleted">Deletado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="deleted" id="deleted" @change="fetchBanners" />
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
                                <th class="px-1 py-1 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('alt')" :class="{ 'text-xs': true, 'cursor-pointer': true }">
                                            Alt
                                            <span v-if="sortField === 'alt'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-1 py-1 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('title')"
                                            :class="{ 'text-xs': true, 'cursor-pointer': true }">
                                            título
                                            <span v-if="sortField === 'title'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-1 py-1 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('descrition')"
                                            :class="{ 'text-xs': true, 'cursor-pointer': true }">
                                            Descrição
                                            <span v-if="sortField === 'descrition'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-1 py-1 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('descrition2')"
                                            :class="{ 'text-xs': true, 'cursor-pointer': true }">
                                            Descrição 2
                                            <span v-if="sortField === 'descrition2'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                                <th class="px-1 py-1 text-xs">Data</th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Mobile</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Desktop</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Edit</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Ban</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Sli</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Desc</a></div>
                                </th>
                                <th class="px-2 py-2 text-xs">
                                    <div class="flex items-center"><a class="text-sm">Del</a></div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-900">
                            <tr v-for="banner in banners" :key="banner.id" class="text-gray-700 dark:text-gray-400">
                                <td class="px-1 py-1 text-xs">{{ banner.alt }}</td>
                                <td class="px-1 py-1 text-xs">{{ banner.title }}</td>
                                <td class="px-1 py-1 text-xs">{{ banner.descrition }}</td>
                                <td class="px-1 py-1 text-xs">{{ banner.descrition2 }}</td>
                                <td class="px-1 py-1 text-xs">{{ banner.date }}</td>
                                <td class="px-1 py-1 text-xs">
                                    <img :src="'/storage/'+ banner.image_url_mobile ?  '/storage/'+ banner.image_url_mobile : '/storage/images/default.png'"
                                        alt="image_url_mobile" class="w-7 h-7 rounded-md">
                                </td>
                                <td class="px-1 py-1 text-xs">
                                    <img :src="'/storage/'+ banner.image_url_desktop ?  '/storage/'+ banner.image_url_desktop : '/storage/images/default.png'"
                                        alt="image_url_desktop" class="w-10 h-7 rounded-md">
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <a :href="`/banner/${banner.id}/edit`"
                                        :class="{ 'opacity-50 cursor-not-allowed': banner.deleted_at }"
                                        :disabled="banner.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Edit" title="Editar Banner">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <button @click="toggleBanner(banner)"
                                        :class="{ 'opacity-50 cursor-not-allowed': banner.deleted_at }"
                                        :disabled="banner.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Banner">
                                        <i v-if="!banner.banner" class="fa-solid fa-file-import"
                                            title="Banner Banner"></i>
                                        <i v-else class="fa-solid fa-images text-green-500"
                                            title="Permanecer Banner"></i>
                                    </button>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <button @click="toggleSlide(banner)"
                                        :class="{ 'opacity-50 cursor-not-allowed': banner.deleted_at }"
                                        :disabled="banner.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Slide">
                                        <i v-if="!banner.slide" class="fa-solid fa-file-import"
                                            title="Slide Banner"></i>
                                        <i v-else class="fa-solid fa-photo-film text-green-500"
                                            title="Permanecer Slide"></i>
                                    </button>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <button @click="toggleDiscontinued(banner)"
                                        :class="{ 'opacity-50 cursor-not-allowed': banner.deleted_at }"
                                        :disabled="banner.deleted_at"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Descontinuar">
                                        <i v-if="!banner.discontinued" class="fa-solid fa-file-import"
                                            title="Descontinuar Banner"></i>
                                        <i v-else class="fa-solid fa-file-export " title="Permanecer Banner"></i>
                                    </button>
                                </td>

                                <td class="px-2 py-2 text-sm">
                                    <!-- Botão de deletar/restaurar -->
                                    <button @click="toggleDeleted(banner)"
                                        class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Deleted">
                                        <i v-if="!banner.deleted_at" class="fa-solid fa-trash"
                                            title="Deletar Banner"></i>
                                        <i v-else class="fa-solid fa-trash-arrow-up" title="Restaurar Banner"></i>
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
                        Exibindo {{ (currentPage - 1) * itemsPerPage + 1 }} - {{ Math.min(currentPage * itemsPerPage,
                            totalItems) }} de {{ totalItems }}
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
                                        currentPage === page ? 'bg-gray-300 dark:bg-gray-700' : 'bg-white dark:bg-gray-900'
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
