<script setup>
import { ref, onMounted, computed } from 'vue';
import { Head, usePage } from '@inertiajs/vue3';
import Navbar from './Global/Navbar.vue';
import FooterEcommerce from './Global/FooterEcommerce.vue';
import axios from 'axios';

const { props } = usePage();
const products = ref(props.products || []);
const title = ref('Produtos');
const productImages = ref({}); // Store current images

onMounted(() => {
    // Initialize productImages with default images
    products.value.forEach(product => {
        productImages.value[product.id] = `/storage/${product.image ? product.image : 'images/default.png'}`;
    });
    console.log('Produtos:', products.value);
});

const hoverImage = (product) => {
    productImages.value[product.id] = product.image_hover ? `/storage/${product.image_hover}` : productImages.value[product.id];
};

const defaultImage = (product) => {
    productImages.value[product.id] = `/storage/${product.image ? product.image : 'images/default.png'}`;
};

const getImageSrc = (product) => {
    return productImages.value[product.id];
};

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

// Função para limpar o número de telefone
const cleanPhoneNumber = (phone) => {
    return phone.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
};

// Computed property para o link do WhatsApp
const whatsappLink = (product) => {
    if (!company.value || !company.value.phone) {
        return '#'; // Retorna um link vazio ou um placeholder enquanto os dados não estão disponíveis
    }
    const cleanedPhone = cleanPhoneNumber(company.value.phone);
    const message = encodeURIComponent(`Olá, estou interessado no produto ${product.name}.`);
    return `https://api.whatsapp.com/send?phone=55${cleanedPhone}&text=${message}`;
};
</script>

<style scoped>
/* Add any additional styles here if needed */
</style>

<template>
    <div class="bg-gray-50 pt-20 text-black/50 dark:bg-black dark:text-white/50">

        <Head :title="title" />
        <Navbar />
        <section id="subcategory"
            class="bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
            <div class="w-full">
                <div class="flex pt-4 flex-wrap">
                    <div class="w-full px-4">
                        <div class="text-center mx-auto mb-[10px] w-full">
                            <!-- Título e Descrição Adicionados -->
                            <h1 class="text-3xl font-semibold text-blue-900 dark:text-blue-400 mb-4">
                                Produtos
                            </h1>
                        </div>
                    </div>
                </div>
                <main>
                    <div class="animate__animated animate__fadeInUp px-4" style="animation-delay: 0.1s;">
                        <div class="-mx-4 flex flex-wrap">
                            <div v-for="product in products" :key="product.id"
                                class="w-full p-2 sm:w-1/2 md:w-1/3 lg:w-1/6">
                                <div class="bg-gray-300 dark:bg-gray-900 rounded-[14px] h-full flex flex-col">
                                    <div class="px-2 group flex flex-col items-center justify-center flex-grow">
                                        <div
                                            class="w-full bg-white mt-2 dark:text-gray-100 text-black shadow-lg rounded-lg overflow-hidden flex justify-center items-center">
                                            <img :src="getImageSrc(product)" :alt="product.id"
                                                @mouseover="hoverImage(product)" @mouseleave="defaultImage(product)"
                                                class="w-full" />
                                        </div>
                                        <div class="text-center flex-grow flex flex-col justify-between">
                                            <div>
                                                <h3 class="text-sm font-semibold text-gray-900 dark:text-gray-200">{{
                                                    product.description }}</h3>
                                                <p class="text-sm text-gray-700 dark:text-gray-200"></p>
                                                <p class="line-through"></p>
                                                <p class="text-lg font-bold text-green-500">
                                                    <span class="text-gray-700 dark:text-gray-200 text-sm"></span>
                                                </p>
                                                <p class="text-sm">
                                                    <span></span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-auto mb-2">
                                        <a :href="whatsappLink(product)" target="_blank"
                                            class="flex items-center justify-center z-50 bg-green-500 hover:bg-green-600 text-white mx-10 py-1 px-2 rounded-md transition duration-300 ease-in-out">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                viewBox="0 0 880 880" fill="none" class="fill-current mr-2">
                                                <path
                                                    d="M630.056 107.658C560.727 38.271 468.525.039 370.294 0 167.891 0 3.16 164.668 3.079 367.072c-.027 64.699 16.883 127.855 49.016 183.523L0 740.824l194.666-51.047c53.634 29.244 114.022 44.656 175.481 44.682h.151c202.382 0 367.128-164.689 367.21-367.094.039-98.088-38.121-190.32-107.452-259.707m-259.758 564.8h-.125c-54.766-.021-108.483-14.729-155.343-42.529l-11.146-6.613-115.516 30.293 30.834-112.592-7.258-11.543c-30.552-48.58-46.689-104.729-46.665-162.379C65.146 198.865 202.065 62 370.419 62c81.521.031 158.154 31.81 215.779 89.482s89.342 134.332 89.311 215.859c-.07 168.242-136.987 305.117-305.211 305.117m167.415-228.514c-9.176-4.591-54.286-26.782-62.697-29.843-8.41-3.061-14.526-4.591-20.644 4.592-6.116 9.182-23.7 29.843-29.054 35.964-5.351 6.122-10.703 6.888-19.879 2.296-9.175-4.591-38.739-14.276-73.786-45.526-27.275-24.32-45.691-54.36-51.043-63.542-5.352-9.183-.569-14.148 4.024-18.72 4.127-4.11 9.175-10.713 13.763-16.07 4.587-5.356 6.116-9.182 9.174-15.303 3.059-6.122 1.53-11.479-.764-16.07-2.294-4.591-20.643-49.739-28.29-68.104-7.447-17.886-15.012-15.466-20.644-15.746-5.346-.266-11.469-.323-17.585-.323-6.117 0-16.057 2.296-24.468 11.478-8.41 9.183-32.112 31.374-32.112 76.521s32.877 88.763 37.465 94.885c4.587 6.122 64.699 98.771 156.741 138.502 21.891 9.45 38.982 15.093 52.307 19.323 21.981 6.979 41.983 5.994 57.793 3.633 17.628-2.633 54.285-22.19 61.932-43.616 7.646-21.426 7.646-39.791 5.352-43.617-2.293-3.826-8.41-6.122-17.585-10.714" />
                                            </svg>
                                            Comprar
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </section>

        <FooterEcommerce />
    </div>
</template>
