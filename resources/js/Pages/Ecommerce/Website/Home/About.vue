<template>

    <!-- ====== About Section Start -->
    <section id="about"
        class="pb-12 mt-10 bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
        <div class="text-center mx-auto mb-[10px] max-w-[510px]">
            <h2 class="text-3xl font-semibold text-blue-900 dark:text-blue-400 mb-4">SOBRE NÓS</h2>
        </div>

        <div class="w-full">
            <div class="w-full animate__animated animate__fadeInUp px-4" style="animation-delay: 0.2s;">
                <div v-if="company">


                    <div class="-mx-4 flex flex-wrap items-center">

                        <div class="w-full px-4 lg:w-1/2">
                            <div class="mb-12 max-w-[540px] lg:mb-0">
                                <h4 class="mb-9 text-2xl font-semibold text-gray-900 dark:text-gray-200">
                                    Missão
                                </h4>
                                <p class="mb-10 text-gray-800 leading-relaxed text-body-color dark:text-gray-300">
                                    {{ company.mission }}</p>
                                <br />
                                <h4 class="mb-9 text-2xl font-semibold text-gray-900 dark:text-gray-200">Visão </h4>
                                <p class="mb-10 text-gray-800 leading-relaxed text-body-color dark:text-gray-300">
                                    {{ company.vision }}
                                </p>
                                <br />
                                <h4 class="mb-9 text-2xl font-semibold text-gray-900 dark:text-gray-200">Valores</h4>
                                <p class="mb-10 text-gray-800 leading-relaxed text-body-color dark:text-gray-300">
                                    {{ company.values }}
                                </p>


                            </div>
                        </div>

                        <div class="w-full px-4 lg:w-1/2">
                            <div class="-mx-2 flex flex-wrap sm:-mx-4 lg:-mx-2 xl:-mx-4">
                                <div class="w-full px-2 sm:w-1/2 sm:px-4 lg:px-2 xl:px-4">
                                    <div class="mb-4 sm:mb-8 sm:h-[400px] md:h-[540px] lg:h-[400px] xl:h-[500px]">
                                        <img :src="'/storage/' + company.image_about" alt="aboutimage"
                                            class="h-full w-full top-0 object-cover object-center transform hover:scale-105 " />
                                    </div>
                                </div>

                                <div class="w-full px-2 sm:w-1/2 sm:px-4 lg:px-2 xl:px-4">
                                    <div
                                        class="mb-4 sm:mb-8 sm:h-[220px] md:h-[346px] lg:mb-4 lg:h-[225px] xl:mb-8 xl:h-[310px]">
                                        <img :src="'/storage/' + company.image_about_right" alt="aboutrightimage"
                                            class="h-full w-full top-0 object-cover object-center transform hover:scale-105" />
                                    </div>

                                    <div
                                        class="relative z-10 mb-4 flex items-center justify-center overflow-hidden bg-gray-400 dark:bg-blue-700 px-6 py-12 sm:mb-8 sm:h-[160px] sm:p-5 lg:mb-4 xl:mb-8  transform  hover:scale-105">
                                        <div>
                                            <span class="block text-gray-800 font-semibold dark:text-gray-200 ">
                                                {{ company.experience1 }}
                                            </span>
                                            <span
                                                class="block text-5xl font-extrabold text-gray-900 dark:text-gray-200 ">
                                                {{ company.experience2 }}
                                            </span>
                                            <span
                                                class="block text-gray-800 font-medium dark:text-gray-200  text-opacity-70">
                                                {{ company.experience3 }}
                                            </span>

                                        </div>
                                        <div>
                                            <span class="absolute left-0 top-0 -z-10">
                                                <svg width="106" height="144" viewBox="0 0 106 144" fill="none"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <rect opacity="0.1" x="-67" y="47.127" width="113.378"
                                                        height="131.304" transform="rotate(-42.8643 -67 47.127)"
                                                        fill="url(#paint0_linear_1416_214)" />
                                                    <defs>
                                                        <linearGradient id="paint0_linear_1416_214" x1="-10.3111"
                                                            y1="47.127" x2="-10.3111" y2="178.431"
                                                            gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="white" />
                                                            <stop offset="1" stop-color="white" stop-opacity="0" />
                                                        </linearGradient>
                                                    </defs>
                                                </svg>
                                            </span>
                                            <span class="absolute right-0 top-0 -z-10">
                                                <svg width="130" height="97" viewBox="0 0 130 97" fill="none"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <rect opacity="0.1" x="0.86792" y="-6.67725" width="155.563"
                                                        height="140.614" transform="rotate(-42.8643 0.86792 -6.67725)"
                                                        fill="url(#paint0_linear_1416_215)" />
                                                    <defs>
                                                        <linearGradient id="paint0_linear_1416_215" x1="78.6495"
                                                            y1="-6.67725" x2="78.6495" y2="133.937"
                                                            gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="white" />
                                                            <stop offset="1" stop-color="white" stop-opacity="0" />
                                                        </linearGradient>
                                                    </defs>
                                                </svg>
                                            </span>
                                            <span class="absolute bottom-0 right-0 -z-10">
                                                <svg width="175" height="104" viewBox="0 0 175 104" fill="none"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <rect opacity="0.1" x="175.011" y="108.611" width="101.246"
                                                        height="148.179" transform="rotate(137.136 175.011 108.611)"
                                                        fill="url(#paint0_linear_1416_216)" />
                                                    <defs>
                                                        <linearGradient id="paint0_linear_1416_216" x1="225.634"
                                                            y1="108.611" x2="225.634" y2="256.79"
                                                            gradientUnits="userSpaceOnUse">
                                                            <stop stop-color="white" />
                                                            <stop offset="1" stop-color="white" stop-opacity="0" />
                                                        </linearGradient>
                                                    </defs>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ====== About Section End -->
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const company = ref(null);

onMounted(async () => {
    try {
        const response = await axios.get('/api/company/showCompany');
        company.value = response.data.data;
        console.log('Dados da empresa:', company.value);

    } catch (error) {
        console.error('Erro ao buscar Empresa:', error);
        // Você pode adicionar um feedback para o usuário aqui, como um alerta ou uma mensagem na UI
    }
});
</script>
