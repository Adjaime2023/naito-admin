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
};

const itemsPerPage = ref(10);
const colorsPerPage = ref(10);
const sortField = ref('name');
const sortDirection = ref('asc');
const searchTerm = ref('');
const selectedField = ref('');
const currentPage = ref(1);
const colors = ref([]);
const discontinued = ref(false); // Filter for discontinued
const deleted = ref(false); // Filter for deleted

const fetchColors = async () => {
    try {
        let url = `/api/colors?page=${currentPage.value}&sortField=${sortField.value}&sortDirection=${sortDirection.value}`;

        if (selectedField.value) {
            url += `&searchField=${selectedField.value}`;
        }

        if (searchTerm.value) {
            url += `&searchTerm=${searchTerm.value}`;
        }

        const response = await axios.get(url);
        colors.value = response.data.data; // Assuming your API returns data inside 'data'
        updateFilteredColors(); // Atualiza os Cores filtrados após receber a resposta da API
    } catch (error) {
        console.error('Erro ao buscar Cores', error);
    }
};

onMounted(() => {
    fetchColors();
});

const search = () => {
    fetchColors();
};

const updateSelectedField = () => {
    fetchColors();
};

const getColorsInCurrentPage = () => {
    const startIndex = (currentPage.value - 1) * colorsPerPage.value;
    const endIndex = startIndex + colorsPerPage.value;
    return filteredColors.value.slice(startIndex, endIndex); // Ajustado para usar Cores filtrados
};

const sortBy = (field) => {
    sortDirection.value = sortField.value === field ? (sortDirection.value === 'asc' ? 'desc' : 'asc') : 'asc';
    sortField.value = field;
    fetchColors();
};

const totalPages = computed(() => Math.ceil(filteredColors.value.length / itemsPerPage.value));

const startPage = computed(() => Math.max(1, currentPage.value - 5));
const endPage = computed(() => Math.min(totalPages.value, startPage.value + 9));

const gotoPage = (pageNumber) => {
    currentPage.value = pageNumber;
    fetchColors();
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
        fetchColors();
    }
};

const previousPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
        fetchColors();
    }
};

// Aplicar os filtros de discontinued e deleted diretamente ao mudar os checkboxes
const updateFilteredColors = () => {
    let filtered = colors.value;

    if (discontinued.value) {
        filtered = filtered.filter(color => color.discontinued); // Ajuste conforme a estrutura de dados
    }

    if (deleted.value) {
        filtered = filtered.filter(color => color.deleted); // Ajuste conforme a estrutura de dados
    }

    return filtered;
};

// Computado Cores filtrados com base em discontinued e deleted
const filteredColors = computed(() => {
    return updateFilteredColors();
});

const toggleDiscontinued = async (color) => {
    try {
        const updatedDiscontinued = !color.discontinued;
        const response = await axios.patch(`/api/colors/${color.id}/discontinued`, {
            discontinued: updatedDiscontinued
        });

        if (response.status === 200) {
            color.discontinued = updatedDiscontinued;
            fetchColors(); // Recarrega os Cores após a atualização
        } else {
            console.error('Erro ao atualizar o Cor:', response.statusText);
        }
    } catch (error) {
        console.error('Erro ao atualizar o Cor:', error);
    }
};

const toggleDeleted = async (color) => {
    try {
        const updatedDeleted = !color.deleted;
        const response = await axios.patch(`/api/colors/${color.id}/deleted`, {
            deleted: updatedDeleted
        });

        if (response.status === 200) {
            color.deleted = updatedDeleted;
            fetchColors(); // Recarrega os Cores após a atualização
        } else {
            console.error('Erro ao atualizar o Cor:', response.statusText);
        }
    } catch (error) {
        console.error('Erro ao atualizar o Cor:', error);
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
                                @change="updateFilteredColors" />
                            <span class="ml-1 text-red-500"
                                v-if="form && form.errors ? form.errors.discontinued : ''"></span>
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="deleted">Deletado:</label>
                            <input
                                class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="deleted" id="deleted" @change="updateFilteredColors" />
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
                                <th class="px-4 py-3 text-xs">
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
                                <th class="px-4 py-3 text-xs">
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
                                <th class="px-4 py-3 text-xs">
                                    <div class="flex items-center">
                                        <a @click="sortBy('color_id')"
                                            :class="{ 'text-sm': true, 'cursor-pointer': true }">
                                            Ações
                                            <span v-if="sortField === 'color_id'">
                                                <span v-if="sortDirection === 'asc'">&#x25B2;</span>
                                                <span v-else-if="sortDirection === 'desc'">&#x25BC;</span>
                                            </span>
                                        </a>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                            <tr v-for="color in getColorsInCurrentPage()" :key="color.id"
                                class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">{{ color.name }}</td>
                                <td class="px-4 py-3 text-sm">{{ color.description }}</td>

                                <td class="px-2 py-3 flex items-center justify-between">
                                    <a :href="`/color/${color.id}/edit`"
                                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Edit" title="Editar Cor">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button @click="toggleDiscontinued(color)"
                                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Descontinuar">
                                        <i v-if="!color.discontinued" class="fa-solid fa-file-import"
                                            title="Descontinuar Cor"></i>
                                        <i v-else class="fa-solid fa-file-export" title="Permanecer Cor"></i>
                                    </button>
                                    <button @click="toggleDeleted(color)"
                                        class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                                        aria-label="Deleted">
                                        <i v-if="!color.deleted" class="fa-solid fa-trash" title="Deletar Cor"></i>
                                        <i v-else class="fa-solid fa-trash-arrow-up" title="Restaurar Cor"></i>
                                    </button>
                                </td>


                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="mt-4 p-4 flex items-center justify-between border-t border-gray-200 dark:border-gray-700">
                    <nav class="flex items-center justify-between" aria-label="Pagination">
                        <button @click="previousPage" :disabled="currentPage === 1"
                            class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-l-md text-gray-900 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50">
                            Anterior
                        </button>
                        <div class="hidden sm:block">
                            <span class="relative z-0 inline-flex shadow-sm rounded-md">
                                <button
                                    v-for="page in Array.from({ length: endPage - startPage + 1 }, (_, i) => startPage + i)"
                                    :key="page" @click="gotoPage(page)" :disabled="currentPage === page"
                                    :class="['relative text-gray-900 dark:text-gray-200 inline-flex items-center px-4 py-2 border text-sm font-medium', currentPage === page ? 'bg-gray-300 dark:bg-gray-700' : 'bg-white dark:bg-gray-900']">
                                    {{ page }}
                                </button>
                            </span>
                        </div>
                        <button @click="nextPage" :disabled="currentPage === totalPages"
                            class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-md text-gray-900 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50">
                            Próxima
                        </button>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</template>
