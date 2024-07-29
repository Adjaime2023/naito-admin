<template>
    
    <section  v-if="products.length > 0" id="releases"
        class="pb-12 mt-10 bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">
        <div class="text-center mx-auto mb-[10px] max-w-[510px]">
            <h2 class="text-3xl font-semibold text-blue-900 dark:text-blue-400 mb-4">LANÇAMENTOS</h2>
        </div>
        <div class="relative overflow-hidden mb-2">
            <div class="flex items-center justify-between">
                <div ref="productContainer" :class="scrollContainerClasses">
                    <div v-for="product in loopedProducts" :key="product.id"
                        class="w-full p-2 sm:w-1/2 md:w-1/3 lg:w-1/6">
                        <div class="bg-gray-400 dark:bg-gray-900 rounded-[14px] h-full flex flex-col">
                            <div class="px-2 group flex flex-col items-center justify-center flex-grow">
                               
                                <div 
                                        class="w-full bg-white mt-2 dark:text-gray-100 text-black shadow-lg rounded-lg overflow-hidden flex justify-center items-center">
                                        <img :src="getImageSrc(product)" :alt="product.id"  @mouseover="hoverImage(product)" @mouseleave="defaultImage(product)"
                                            class="w-full transition duration-300 ease-in-out hover:scale-110" />
                                    </div>
                                <div class="text-center flex-grow flex flex-col justify-between">
                                    <div>
                                        <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-200">{{
                                            product.description }}</h3>
                                        <!-- Aqui você pode adicionar outros detalhes do produto, se necessário -->
                                    </div>
                                </div>
                            </div>
                            <div class="mt-auto mb-2">
                                     <a :href="`https://api.whatsapp.com/send?phone=${phoneLink}&text=${encodeURIComponent(`Olá, estou interessado no produto ${product.description}.`)}`"
                                     target="_blank"
                                    class="flex items-center justify-center z-50 bg-green-500 hover:bg-green-600 text-white mx-10 py-1 px-2 rounded-md transition duration-300 ease-in-out">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 880 880"
                                        fill="none" class="fill-current mr-2">
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
            <!-- Carousel controls - prev item -->
            <button @click="scroll(-1)"
                class="absolute bottom-0 left-0 top-0 z-[1] flex items-center justify-center w-[5%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                <span class="sr-only">Anterior</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    class="h-8 w-8">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M15.75 19.5L8.25 12l7.5-7.5" />
                </svg>
            </button>
            <!-- Carousel controls - next item -->
            <button @click="scroll(1)"
                class="absolute bottom-0 right-0 top-0 z-[1] flex items-center justify-center w-[5%]  text-black dark:text-white hover:opacity-70 transition-opacity duration-150 ease-in-out focus:outline-none">
                <span class="sr-only">Próximo</span>
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"
                    class="h-8 w-8">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                </svg>
            </button>
        </div>
    </section>

</template>



<script setup>
import { ref, computed, onMounted } from 'vue';
import axios from 'axios';
import { formatter } from '@/Components/Utils/Ultils.js';


const products = ref([]);
const currentPage = ref(0);
const pageSize = 4;
const productImages = ref({}); // Store current images

onMounted(async () => {
    try {
        const response = await axios.get('/api/website/siteLaunch');
        products.value = response.data.data;
        // Initialize productImages with default images
        products.value.forEach(product => {
            productImages.value[product.id] = `/storage/${product.image ? product.image : 'images/default.png'}`;
        });
    } catch (error) {
        console.error('Erro ao buscar produtos:', error);
    }
});

const productContainer = ref(null);

const loopedProducts = computed(() => {
    const startIndex = currentPage.value * pageSize;
    return [
        ...products.value.slice(startIndex),
        ...products.value.slice(0, startIndex)
    ];
});

const scroll = (direction) => {
    const container = productContainer.value;
    if (!container) return;

    const amountToScroll = direction === -1 ? -container.clientWidth : container.clientWidth;
    container.scrollBy({
        left: amountToScroll,
        behavior: 'smooth',
    });
};

const scrollContainerClasses = computed(() => ({
    'flex': true,
    'overflow-x-scroll': true,
    'space-x-4': true,
}));

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
const phoneLink = computed(() => {
    if (!company.value || !company.value.phone) {
        return '#'; // Retorna um link vazio ou um placeholder enquanto os dados não estão disponíveis
    }
    return cleanPhoneNumber(company.value.phone);
});
</script>
