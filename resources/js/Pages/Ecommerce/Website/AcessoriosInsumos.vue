<script setup>
import { ref } from 'vue'; // Adicione esta linha
import { Head, Link } from '@inertiajs/vue3';
import Navbar from './Global/Navbar.vue';
import FooterEcommerce from './Global/FooterEcommerce.vue';
import ShowAssesoriosInsumos from './Products/ShowAssesoriosInsumos.vue';

const title = ref('Home');

</script>

<template>

        <Head :title="title" />

        <Navbar />

        <div class="bg-gray-50 pt-20 text-black/50 dark:bg-black dark:text-white/50">

            <main>
                <section id="impressoras" class="overflow-hidden pb-6 px-6 lg:pb-[5px] lg:pt-[5px]  bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
                    <h2 class="text-3xl font-semibold text-center my-2 mx-12 text-blue-900 dark:text-blue-400">
                        ACESSÓRIOS E INSUMOS
                    </h2>


                    <ShowAssesoriosInsumos />
                </section>
            </main>
        </div>


    <footer class="w-screen py-8 text-sm text-black dark:text-white/70">
        <FooterEcommerce />
    </footer>

    <!-- ====== Back To Top Start -->
    <ScrollToTopButton />
    <!-- ====== Back To Top End -->

</template>
