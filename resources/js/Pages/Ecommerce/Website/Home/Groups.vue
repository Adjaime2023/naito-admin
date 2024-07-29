<template>
    <section id="group"
        class="bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
        <div class="w-full">
            <div class="flex pt-4 flex-wrap">
                <div class="w-full px-4">
                    <div class="text-center mx-auto mb-[10px] w-full">
                        <h1 class="text-3xl font-semibold text-blue-900 dark:text-blue-400 mb-4">
                            Grupos
                        </h1>
                    </div>
                </div>
            </div>
            <div class="relative">
                
              <!-- Setas de Navegação -->
              <button @click="prevGroup"
                    class="absolute bottom-0 left-0 top-0 z-[1] flex items-center justify-center w-[5%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                    <span class="sr-only">Anterior</span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-8 w-8">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15.75 19.5L8.25 12l7.5-7.5" />
                    </svg>
                </button>
                <button @click="nextGroup"
                    class="absolute bottom-0 right-0 top-0 z-[1] flex items-center justify-center w-[5%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                    <span class="sr-only">Próximo</span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-8 w-8">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                    </svg>
                </button>
                <div class="flex overflow-x-auto pb-6 space-x-4 py-4 pl-[70px] pr-[70px]">
                    <div v-for="group in groups" :key="group.id"
                        class="flex-none w-36 relative">
                        <div class="flex justify-center items-center">
                            <a :href="route('websiteProducts', { group_id: group.id })"
                                class="block relative w-36 h-36 overflow-hidden shadow-md hover:-translate-y-1 hover:scale-110 rounded-full border-blue-400 border-8 hover:border-blue-600 active:border-blue-700 focus:outline-none focus:ring focus:border-ring-blue-300">
                                <img :src="group.image ? '/storage/' + group.image : '/storage/images/default.png'"
                                    :alt="group.id" class="w-full h-full object-cover object-center" />
                            </a>
                        </div>
                        <p class="mt-2 text-center text-sm text-gray-900 dark:text-gray-200 active:text-blue-700 hover:text-blue-600 font-semibold">{{ group.name }}</p>
                    </div>
                    <div v-if="groups.length === 0" class="text-center w-full mt-4">
                        <p class="text-gray-600 dark:text-gray-400">Não há grupos disponíveis.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { usePage } from '@inertiajs/vue3';
import axios from 'axios';

const { props } = usePage();
const groups = ref([]);

// Função para buscar grupos
const fetchGroups = async () => {
    try {
        const response = await axios.get('/api/website/siteGroups');
        groups.value = response.data;
    } catch (error) {
        console.error('Erro ao buscar grupos:', error);
    }
};

onMounted(fetchGroups);


const nextGroup = () => {
    currentGroupIndex.value = (currentGroupIndex.value + 1) % groups.value.length;
};

const prevGroup = () => {
    currentGroupIndex.value = (currentGroupIndex.value - 1 + groups.value.length) % groups.value.length;
};

</script>
