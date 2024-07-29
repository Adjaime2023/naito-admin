<template>
    <!-- ====== Features Section Start ====== -->
    <section id="category"
        class="bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
        <div class="w-full">
            <div class="flex pt-4 flex-wrap">
                <div class="w-full px-4">
                    <div class="text-center mx-auto mb-[10px] w-full">
                        <!-- Título e Descrição Adicionados -->
                        <h1 class="text-3xl font-semibold text-blue-900 dark:text-blue-400 mb-4">
                            Departamentos
                        </h1>
                    </div>
                </div>
            </div>
            <div class="relative">
                <!-- Setas de Navegação -->
                <button @click="prevCategory"
                    class="absolute bottom-0 left-0 top-0 z-[1] flex items-center justify-center w-[5%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                    <span class="sr-only">Anterior</span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-8 w-8">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15.75 19.5L8.25 12l7.5-7.5" />
                    </svg>
                </button>
                <button @click="nextCategory"
                    class="absolute bottom-0 right-0 top-0 z-[1] flex items-center justify-center w-[5%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                    <span class="sr-only">Próximo</span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-8 w-8">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                    </svg>
                </button>

                <!-- Lista de Imagens das Categorias -->
                <div class="flex overflow-x-auto pb-6 space-x-4 py-4 pl-[70px] pr-[70px]" >
                    <div v-for="category in categories" :key="category.id" class="flex-none w-36 relative">
                        <div class="flex justify-center items-center ">
                            <a :href="`website/subcategory/${category.id}`"
                                class="block relative w-36 h-36  overflow-hidden shadow-md hover:-translate-y-1 hover:scale-110 rounded-[24px]  border-blue-400 border-8">
                                <img :src="category.image ? '/storage/' + category.image : '/storage/images/default.png'"
                                    :alt="category.id" class="w-full h-full object-cover object-center" />
                            </a>
                        </div>
                        <p class="mt-2 text-center text-sm text-gray-900 dark:text-gray-200 font-semibold">{{ category.name }}</p>
                    </div>
                </div>

                <!-- Paginação -->
                <div class="absolute bottom-2 left-1/2 transform -translate-x-1/2 flex space-x-2">
                    <button v-for="(category, index) in categories" :key="category.id" @click="goToCategory(index)"
                        :class="{ 'bg-white dark:bg-black': currentCategoryIndex === index, 'bg-black dark:bg-white': currentCategoryIndex !== index }"
                        class="mx-[4px] box-content h-[4px] w-[30px] flex-initial cursor-pointer border-0 border-y-[10px] border-solid border-transparent bg-black bg-clip-padding p-0 -indent-[999px] opacity-90 transition-opacity duration-[600ms] ease-[cubic-bezier(0.25,0.1,0.25,1.0)] motion-reduce:transition-none"></button>
                </div>
            </div>
        </div>
    </section>
    <!-- ====== Features Section End ====== -->
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const categories = ref([]);
const currentCategoryIndex = ref(0);

onMounted(async () => {
    try {
        const response = await axios.get('/api/website/siteCategory');
        categories.value = response.data; // Certifique-se de que o endpoint retorna os dados diretamente
    } catch (error) {
        console.error('Erro ao buscar categorias:', error);
        // Você pode adicionar um feedback para o usuário aqui, como um alerta ou uma mensagem na UI
    }
});

const nextCategory = () => {
    currentCategoryIndex.value = (currentCategoryIndex.value + 1) % categories.value.length;
};

const prevCategory = () => {
    currentCategoryIndex.value = (currentCategoryIndex.value - 1 + categories.value.length) % categories.value.length;
};

const goToCategory = (index) => {
    currentCategoryIndex.value = index;
};
</script>
