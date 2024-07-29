<template>
    <div class="flex justify-between px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
        <span class="flex items-center col-span-3">
            Exibindo {{ (currentPage - 1) * itemsPerPage + 1 }} - {{ Math.min(currentPage * itemsPerPage, totalItems) }} de {{ totalItems }}
        </span>
        <div class="flex justify-end flex-1 col-span-4 sm:col-span-2">
            <button @click="previousPage"
                    :disabled="currentPage === 1"
                    class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-l-md text-gray-900 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50">
                Anterior
            </button>
            <div class="hidden sm:block">
                <span class="relative z-0 inline-flex shadow-sm rounded-md">
                    <!-- Lógica para exibir páginas limitadas -->
                    <template v-if="totalPages > 0">
                        <button v-for="page in visiblePages"
                                :key="page"
                                @click="gotoPage(page)"
                                :class="[
                                    'relative text-gray-900 dark:text-gray-200 inline-flex items-center px-4 py-2 border text-sm font-medium',
                                    currentPage === page ? 'bg-gray-300 dark:bg-gray-700' : 'bg-white dark:bg-gray-900'
                                ]">
                            {{ page }}
                        </button>
                    </template>
                </span>
            </div>
            <button @click="nextPage"
                    :disabled="currentPage === totalPages"
                    class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-r-md text-gray-900 dark:text-gray-200 bg-white dark:bg-gray-900 hover:bg-gray-50 dark:hover:bg-gray-800 disabled:opacity-50">
                Próxima
            </button>
        </div>
    </div>
</template>
