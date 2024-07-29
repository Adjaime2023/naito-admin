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
    let url = `/api/nfe-entrada?page=${currentPage.value}&itemsPerPage=${itemsPerPage.value}&sortField=${sortField.value}&sortDirection=${sortDirection.value}`;

    if (selectedField.value) {
      url += `&searchField=${selectedField.value}`;
    }

    if (searchTerm.value) {
      url += `&searchTerm=${searchTerm.value}`;
    }

    // Only add the 'discontinued' filter if it's true. By default, we are showing only continued products.
    if (discontinued.value) {
      url += `&discontinued=true`;
    } else {
      url += `&discontinued=false`;
    }

    if (deleted.value) {
      url += `&deleted=${deleted.value}`;
    }

    const response = await axios.get(url);
    nfeEntradas.value = response.data.data;
    totalItems.value = response.data.total;
  } catch (error) {
    console.error('Erro ao buscar Nfe Entrada:', error);
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
    const response = await axios.patch(`/api/nfe-entrada/${nfeEntrada.id}/discontinued`, {
      discontinued: updateDiscontinued
    });

    if (response.status === 200) {
      nfeEntrada.discontinued = updateDiscontinued;
    } else {
      console.error('Erro ao atualizar Nfe Entrada');
    }
  } catch (error) {
    console.error('Erro ao atualizar Nfe Entrada', error);
  }
};

const toggleDeleted = async (nfeEntrada) => {
  try {
    const updatedDeleted = !nfeEntrada.deleted_at; // Inverte o estado atual

    const response = await axios.patch(`/api/nfe-entrada/${nfeEntrada.id}/deleted`, {
      deleted: updatedDeleted
    });

    if (response.status === 200) {
      nfeEntrada.deleted_at = updatedDeleted ? new Date().toISOString() : null; // Atualiza localmente
    } else {
      console.error('Erro ao atualizar Nfe Entrada');
    }
  } catch (error) {
    console.error('Erro ao atualizar Nfe Entrada', error);
  }
};

const scrollContainerClasses = computed(() => ({
  'flex': true,
  'overflow-x-scroll': true,
  'space-x-4': true,
}));
</script>


<template>
  <div class="mx-0 px-0 pt-2 pb-4 bg-gray-200 dark:bg-gray-800 rounded-lg scrollContainerClasses ">
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
                            <option v-for="(label, value) in FILTER_FIELDS" :key="value" :value="value">{{ label }}
                            </option>
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
                                type="checkbox" v-model="discontinued" id="discontinued" @change="fetchNfeEntradas" />
                            <span class="ml-1 text-red-500"
                                v-if="form && form.errors ? form.errors.discontinued : ''"></span>
                        </div>
                        <div class="flex items-center">
                            <label class="flex items-center mx-1" for="deleted">Deletado:</label>
                            <input
                                class="border-x-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="checkbox" v-model="deleted" id="deleted" @change="fetchNfeEntradas" />
                            <span class="ml-1 text-red-500"
                                v-if="form && form.errors ? form.errors.deleted : ''"></span>
                        </div>
                    </div>
                    <button type="submit"
                        class="items-center text-center underline-offset-2 mx-3 py-2 space-x-2 px-4 rounded-md group bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700 via-purple-700 to-purple-500 hover:dark:from-cyan-600 hover:dark:to-blue-600 bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100">Pesquisar</button>
                </form>
      </div>
      <table class="w-full divide-y divide-gray-200 dark:divide-gray-700">
        <thead class="bg-gray-200 dark:bg-gray-900">
          <tr>
            <th @click="sortBy('nome_emitente')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Emitente</a>
            </th>
            <th @click="sortBy('chave_acesso')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Chave de Acesso</a>
            </th>
            <th @click="sortBy('numero')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Número</a>
            </th>
            <th @click="sortBy('serie')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Série</a>
            </th>
            <th @click="sortBy('data_emissao')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Data Emissão</a>
            </th>
            <th @click="sortBy('data_recebimento')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Data Recebimento</a>
            </th>
            <th @click="sortBy('nome_destinatario')"
              class="cursor-pointer px-2 py-2 text-left text-xs  text-gray-700 dark:text-gray-300 uppercase tracking-wider">
              <a class="text-sm">Destinatário</a>
            </th>
            <th class="px-2 py-2 text-xs">
              <div class="flex items-center text-gray-700 dark:text-gray-300 "> <a class="text-sm">Edit</a></div>
            </th>
            <th class="px-2 py-2 text-xs">
              <div class="flex items-center text-gray-700 dark:text-gray-300 "><a class="text-sm">Desc</a></div>
            </th>
            <th class="px-2 py-2 text-xs">
              <div class="flex items-center text-gray-700 dark:text-gray-300 "><a class="text-sm">Del</a></div>
            </th>

          </tr>
        </thead>
        <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
          <tr v-for="nfeEntrada in nfeEntradas" :key="nfeEntrada.id">
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{ nfeEntrada.nome_emitente
              }}</td>
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{ nfeEntrada.chave_acesso
              }}</td>
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{ nfeEntrada.numero }}
            </td>
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{ nfeEntrada.serie }}</td>
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{ nfeEntrada.data_emissao
              }}</td>
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{
              nfeEntrada.data_recebimento }}</td>
            <td class="px-2 py-2 whitespace-nowrap text-sm text-gray-700 dark:text-gray-300">{{
              nfeEntrada.nome_destinatario }}</td>
            <td class="px-2 py-2 text-sm">
              <a :href="`/nfe-entrada/${nfeEntrada.id}/edit`"
                :class="{ 'opacity-50 cursor-not-allowed': nfeEntrada.deleted_at }" :disabled="nfeEntrada.deleted_at"
                class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                aria-label="Edit" title="Editar Nfe Entradas">
                <i class="fas fa-edit"></i>
              </a>
            </td>

            <td class="px-2 py-2 text-sm">
              <button @click="toggleDiscontinued(nfeEntrada)"
                :class="{ 'opacity-50 cursor-not-allowed': nfeEntrada.deleted_at }" :disabled="nfeEntrada.deleted_at"
                class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                aria-label="Descontinuar">
                <i v-if="!nfeEntrada.discontinued" class="fa-solid fa-file-import"
                  title="Descontinuar Nfe Entradas"></i>
                <i v-else class="fa-solid fa-file-export  text-yellow-500" title="Permanecer Nfe Entradas"></i>
              </button>
            </td>

            <td class="px-2 py-2 text-sm">

              <!-- Botão de deletar/restaurar -->
              <button @click="toggleDeleted(nfeEntrada)"
                class="flex items-center justify-between px-1 py-1 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-blue-400 focus:outline-none focus:shadow-outline-gray"
                aria-label="Deleted">
                <i v-if="!nfeEntrada.deleted_at" class="fa-solid fa-trash" title="Deletar Nfe Entradas"></i>
                <i v-else class="fa-solid fa-trash-arrow-up text-red-500" title="Restaurar Nfe Entradas"></i>
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
                'relative text-gray-900 dark:text-gray-200 inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium',
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

        <div class="flex items-center pl-4 space-x-2">
          <select v-model="itemsPerPage" @change="fetchNfeEntradas"
            class="px-4 py-2 text-sm font-medium border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
            <option v-for="option in [10, 25, 50, 100]" :key="option" :value="option">
              {{ option }} itens por página
            </option>
          </select>
        </div>
      </div>
    </div>
    <!-- Pagination end -->
  </div>
</template>
