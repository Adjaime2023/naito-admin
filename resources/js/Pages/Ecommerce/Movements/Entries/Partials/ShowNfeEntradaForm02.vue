<script setup>
import { ref, onMounted, computed } from 'vue';
import axios from 'axios';

const FILTER_FIELDS = {
    name: 'Nome',
    chave_acesso: 'Chave de Acesso',
    numero: 'Numero',
    serie: 'Serie',
    data_emissao: 'Data Emissão',
    data_recebimento: 'Data Recebimento',
    nome_emitente: 'Nome do Emitente',
    nome_destinatario: 'Nome do Destinatário',
};

const currentPage = ref(1);
const itemsPerPage = ref(10);
const sortField = ref('name');
const sortDirection = ref('asc');
const selectedField = ref('');
const searchTerm = ref('');
const discontinued = ref(false);
const deleted = ref(false);

const nfeEntradas = ref([]);
const totalItems = ref(0);

const fetchNfeEntradas = async () => {
    try {
        const response = await axios.get('/api/nfe_entradas', {
            params: {
                page: currentPage.value,
                itemsPerPage: itemsPerPage.value,
                sortField: sortField.value,
                sortDirection: sortDirection.value,
                searchTerm: searchTerm.value,
                selectedField: selectedField.value,
                discontinued: discontinued.value,
                deleted: deleted.value,
            }
        });

        nfeEntradas.value = response.data.data;
        totalItems.value = response.data.total;
    } catch (error) {
        console.error('Error fetching NfeEntradas:', error.response ? error.response.data : error.message);
    }
};


onMounted(() => {
    fetchNfeEntradas();
});

const search = () => {
    currentPage.value = 1;
    fetchNfeEntradas();
};

const updateSelectedField = () => {
    currentPage.value = 1;
    fetchNfeEntradas();
};

const sortBy = (field) => {
    sortDirection.value = sortField.value === field ? (sortDirection.value === 'asc' ? 'desc' : 'asc') : 'asc';
    sortField.value = field;
    fetchNfeEntradas();
};

const totalPages = computed(() => Math.ceil(totalItems.value / itemsPerPage.value));

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
    fetchNfeEntradas();
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) {
        currentPage.value++;
        fetchNfeEntradas();
    }
};

const previousPage = () => {
    if (currentPage.value > 1) {
        currentPage.value--;
        fetchNfeEntradas();
    }
};

const toggleDiscontinued = async (nfeEntrada) => {
    try {
        const updateDiscontinued = !nfeEntrada.discontinued;
        const response = await axios.patch(`/api/nfe_entradas/${nfeEntrada.id}/discontinued`, {
            discontinued: updateDiscontinued
        });

        if (response.status === 200) {
            nfeEntrada.discontinued = updateDiscontinued;
        } else {
            console.error('Error updating NfeEntrada discontinued status');
        }
    } catch (error) {
        console.error('Error updating NfeEntrada discontinued status', error);
    }
};

const toggleDeleted = async (nfeEntrada) => {
    try {
        const updatedDeleted = !nfeEntrada.deleted_at;
        const response = await axios.patch(`/api/nfe_entradas/${nfeEntrada.id}/deleted`, {
            deleted: updatedDeleted
        });

        if (response.status === 200) {
            nfeEntrada.deleted_at = updatedDeleted ? new Date().toISOString() : null;
        } else {
            console.error('Error updating NfeEntrada deleted status');
        }
    } catch (error) {
        console.error('Error updating NfeEntrada deleted status', error);
    }
};
</script>

<template>
    <div class="mx-0 px-0 pt-2 pb-4 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <div class="bg-gray-200 dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg">
            <div class="flex flex-col md:flex-row items-center my-2 w-full text-gray-800 dark:text-gray-200">
                <form @submit.prevent="search"
                    class="flex flex-col md:flex-row items-center w-full space-y-2 md:space-y-0 md:space-x-4">
                    <div class="flex flex-col md:flex-row items-center w-full md:w-1/4">
                        <label for="selectedField" class="ml-4 md:mr-2 w-full md:w-auto text-right">Buscar:</label>
                        <select v-model="selectedField" @change="updateSelectedField" name="selectedField"
                            id="selectedField"
                            class="w-full text-sm border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                            <option value="">Todos os Campos</option>
                            <option v-for="(label, value) in FILTER_FIELDS" :key="value" :value="value">{{ label }}</option>
                        </select>
                    </div>
                    <div class="flex flex-col md:flex-row items-center w-full md:w-2/6">
                        <input
                            class="w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                            v-model="searchTerm" @input="search" id="searchTerm" name="searchTerm" type="text"
                            placeholder="Search..." />
                    </div>
                    <div
                        class="flex flex-col md:flex-row items-center w-full md:w-auto space-y-2 md:space-y-0 md:space-x-4">
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="discontinued">Descontinuado:</label>
                            <input
                                class="border-x-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="discontinued" id="discontinued" @change="search" />
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="deleted">Deletado:</label>
                            <input
                                class="border-x-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="deleted" id="deleted" @change="search" />
                        </div>
                    </div>
                    <button type="submit"
                        class="items-center text-center underline-offset-2 mx-3 py-2 space-x-1 text-white bg-blue-500 hover:bg-blue-700 rounded-md shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-600">
                        Buscar
                    </button>
                </form>
            </div>
            <table class="w-full divide-y divide-gray-200 dark:divide-gray-700">
                <thead class="bg-gray-50 dark:bg-gray-900">
                    <tr>
                        <th @click="sortBy('name')" class="cursor-pointer px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            Nome
                            <span v-if="sortField === 'name'">{{ sortDirection === 'asc' ? '↑' : '↓' }}</span>
                        </th>
                        <th @click="sortBy('chave_acesso')" class="cursor-pointer px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            Chave de Acesso
                            <span v-if="sortField === 'chave_acesso'">{{ sortDirection === 'asc' ? '↑' : '↓' }}</span>
                        </th>
                        <!-- Add other sortable columns as needed -->
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">
                            Ações
                        </th>
                    </tr>
                </thead>
                <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                    <tr v-for="nfeEntrada in nfeEntradas" :key="nfeEntrada.id">
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900 dark:text-gray-100">
                            {{ nfeEntrada.name }}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-400">
                            {{ nfeEntrada.chave_acesso }}
                        </td>
                        <!-- Add other columns as needed -->
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 dark:text-gray-400">
                            <button @click="toggleDiscontinued(nfeEntrada)"
                                class="text-indigo-600 hover:text-indigo-900">
                                {{ nfeEntrada.discontinued ? 'Reativar' : 'Descontinuar' }}
                            </button>
                            <button @click="toggleDeleted(nfeEntrada)"
                                class="text-red-600 hover:text-red-900 ml-4">
                                {{ nfeEntrada.deleted_at ? 'Restaurar' : 'Deletar' }}
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="py-3 px-4 flex items-center justify-between bg-gray-50 dark:bg-gray-900">
                <div class="flex-1 flex items-center justify-between">
                    <button @click="previousPage" :disabled="currentPage === 1"
                        class="bg-gray-500 text-white px-4 py-2 rounded-md shadow-md">
                        Anterior
                    </button>
                    <div class="text-sm text-gray-500 dark:text-gray-400">
                        Página {{ currentPage }} de {{ totalPages }}
                    </div>
                    <button @click="nextPage" :disabled="currentPage === totalPages"
                        class="bg-gray-500 text-white px-4 py-2 rounded-md shadow-md">
                        Próxima
                    </button>
                </div>
                <div class="flex items-center space-x-2">
                    <select v-model="itemsPerPage" @change="fetchNfeEntradas"
                        class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                        <option v-for="option in [10, 25, 50, 100]" :key="option" :value="option">
                            {{ option }} itens por página
                        </option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</template>
