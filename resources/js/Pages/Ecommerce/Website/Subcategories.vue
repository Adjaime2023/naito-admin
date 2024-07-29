<script setup>
import { ref, onMounted } from 'vue';
import { Head } from '@inertiajs/vue3';
import Navbar from './Global/Navbar.vue';
import FooterEcommerce from './Global/FooterEcommerce.vue';
import { usePage } from '@inertiajs/vue3';

const { props } = usePage();
const subcategories = ref(props.subcategories || []);
const title = ref('Subcategorias');
const currentSubcategoryIndex = ref(0);

onMounted(() => {
    console.log('Subcategories:', subcategories.value);
});


const nextCategory = () => {
    currentSubcategoryIndex.value = (currentSubcategoryIndex.value + 1) % subcategories.value.length;
};

const prevCategory = () => {
    currentSubcategoryIndex.value = (currentSubcategoryIndex.value - 1 + subcategories.value.length) % subcategories.value.length;
};

const goToCategory = (index) => {
    currentSubcategoryIndex.value = index;
};
</script>

<template>
    <div class="bg-gray-50 pt-20 text-black/50 dark:bg-black dark:text-white/50">

        <Head :title="title" />
        <Navbar />

        <main>


             <!-- ====== Features Section Start ====== -->
    <section id="subcategory"
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
                    class="absolute bottom-0 left-0 top-0 z-[1] flex items-center justify-center w-[15%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                    <span class="sr-only">Anterior</span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-8 w-8">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15.75 19.5L8.25 12l7.5-7.5" />
                    </svg>
                </button>
                <button @click="nextCategory"
                    class="absolute bottom-0 right-0 top-0 z-[1] flex items-center justify-center w-[15%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                    <span class="sr-only">Próximo</span>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                        class="h-8 w-8">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                    </svg>
                </button>

                <!-- Lista de Imagens das Categorias -->
                <div class="flex overflow-x-auto pb-6 space-x-4 py-4 pl-[70px] pr-[70px]" >
                    <div v-for="subcategory in subcategories" :key="subcategory.id" class="flex-none w-36 relative">
                        <div class="flex justify-center items-center ">
                            <a :href="route('grupos', { subcategory_id: subcategory.id })"
                                class="block relative w-36 h-36  overflow-hidden shadow-md hover:-translate-y-1 hover:scale-110 rounded-full border-blue-400 border-8  hover:border-blue-600 active:border-blue-700 focus:outline-none focus:ring focus:border-ring-blue-300">
                                <img :src="subcategory.image ? '/storage/' + subcategory.image : '/storage/images/default.png'"
                                    :alt="subcategory.id" class="w-full h-full object-cover object-center" />
                            </a>
                        </div>
                        <p class="mt-2 text-center text-sm text-gray-900 dark:text-gray-200 active:text-blue-700 hover:text-blue-600 font-semibold">{{ subcategory.name }}</p>
                    </div>
                </div>

               
            </div>
        </div>
    </section>
    <!-- ======
            <section id="grupo"
                class="overflow-hidden pb-6 px-2 lg:pb-[5px] lg:pt-[5px] bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
                <h2 class="text-3xl font-semibold text-center my-2 mx-12 text-blue-900 dark:text-blue-400">
                    Subcategorias
                </h2>
                <ul v-if="subcategories.length">
                    <li v-for="subcategory in subcategories" :key="subcategory.id">
                        <a :href="route('grupos', { subcategory_id: subcategory.id })">
                            {{ subcategory.name }}
                        </a>
                    </li>
                </ul>
                <p v-else>Nenhuma subcategoria encontrada.</p>
            </section>
             ====== -->
        </main>

        <footer class="w-screen py-8 text-sm text-black dark:text-white/70">
            <FooterEcommerce />
        </footer>
    </div>
</template>
