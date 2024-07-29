<template>
    <!-- Carousel items -->
    <div class="relative w-full overflow-hidden">
      <div v-if="banners && banners.length" class="carousel-inner">
        <div class="flex w-full transition-transform duration-500"
          :style="{ transform: `translateX(-${currentSlideIndex * 100}%)` }">
  
          <div v-for="(banner, index) in banners" :key="banner.id" class="w-full flex-none relative">
            <!-- Overlay -->
            <div class="absolute inset-0 dark:bg-black/30 bg-blue-400/20"></div>
  
            <!-- Ajuste dinâmico da imagem com base no tamanho da tela -->
            <img :src="'/storage/' +getResponsiveImageUrl(banner)" :alt="banner.title"
              class="block w-full h-auto object-cover object-center md:object-top" />
  
  
            <div class="absolute inset-0 grid grid-cols-1 md:grid-cols-4 lg:grid-cols-4 items-center">
              <div :class="[
                banner.horizontal_alignment === 'left' ? 'md:col-start-1 md:col-end-3 lg:col-start-1 lg:col-end-3 ' : '',
                banner.horizontal_alignment === 'center' ? 'lg:col-start-2 lg:col-end-4 md:col-start-2 md:col-end-4' : '',
                banner.horizontal_alignment === 'right' ? 'lg:col-start-3 lg:col-end-5 md:col-start-3 md:col-end-5' : '',
                banner.vertical_alignment === 'top' ? 'items-start self-start' : '',
                banner.vertical_alignment === 'center' ? 'items-center self-center' : '',
                banner.vertical_alignment === 'bottom' ? 'items-end self-end ' : '',
              ]" class="p-2 text-black dark:text-white px-28">
                <!-- Logo -->
                <div class="flex justify-center pb-4">
                  <img :src="'/storage/' + banner.logo_light" alt="Logo" class="dark:hidden" />
                  <img :src="'/storage/' + banner.logo_dark" alt="Logo" class="hidden dark:block" />
                </div>
                <h2 class="text-lg md:text-2xl lg:text-3xl font-bold mb-2">{{ banner.title }}</h2>
                <p class="text-sm md:text-xl font-bold leading-snug mb-2">{{ banner.description }}</p>
                <p class="text-xs md:text-base leading-snug">{{ banner.description2 }}</p>
                <!-- Botão de Contato -->
                <div class="flex justify-center pb-8">
                  <a :href="whatsappLink" target="_blank"
                    class="mt-4 bg-green-500 hover:bg-green-700 text-white font-bold w-52 py-2 px-2 rounded-sm transition duration-300 flex items-center justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 880 880" fill="none"
                      class="fill-current mr-2">
                      <path
                        d="M630.056 107.658C560.727 38.271 468.525.039 370.294 0 167.891 0 3.16 164.668 3.079 367.072c-.027 64.699 16.883 127.855 49.016 183.523L0 740.824l194.666-51.047c53.634 29.244 114.022 44.656 175.481 44.682h.151c202.382 0 367.128-164.689 367.21-367.094.039-98.088-38.121-190.32-107.452-259.707m-259.758 564.8h-.125c-54.766-.021-108.483-14.729-155.343-42.529l-11.146-6.613-115.516 30.293 30.834-112.592-7.258-11.543c-30.552-48.58-46.689-104.729-46.665-162.379C65.146 198.865 202.065 62 370.419 62c81.521.031 158.154 31.81 215.779 89.482s89.342 134.332 89.311 215.859c-.07 168.242-136.987 305.117-305.211 305.117m167.415-228.514c-9.176-4.591-54.286-26.782-62.697-29.843-8.41-3.061-14.526-4.591-20.644 4.592-6.116 9.182-23.7 29.843-29.054 35.964-5.351 6.122-10.703 6.888-19.879 2.296-9.175-4.591-38.739-14.276-73.786-45.526-27.275-24.32-45.691-54.36-51.043-63.542-5.352-9.183-.569-14.148 4.024-18.72 4.127-4.11 9.175-10.713 13.763-16.07 4.587-5.356 6.116-9.182 9.174-15.303 3.059-6.122 1.53-11.479-.764-16.07-2.294-4.591-20.643-49.739-28.29-68.104-7.447-17.886-15.012-15.466-20.644-15.746-5.346-.266-11.469-.323-17.585-.323-6.117 0-16.057 2.296-24.468 11.478-8.41 9.183-32.112 31.374-32.112 76.521s32.877 88.763 37.465 94.885c4.587 6.122 64.699 98.771 156.741 138.502 21.891 9.45 38.982 15.093 52.307 19.323 21.981 6.979 41.983 5.994 57.793 3.633 17.628-2.633 54.285-22.19 61.932-43.616 7.646-21.426 7.646-39.791 5.352-43.617-2.293-3.826-8.41-6.122-17.585-10.714" />
                    </svg>
                    Contato
                  </a>
                </div>
              </div>
            </div>
  
  
  
          </div>
        </div>
      </div>
  
   
  
    </div>
  </template>


<script setup>
import { ref, computed, onMounted, onBeforeUnmount } from 'vue';
import axios from 'axios';

// Variáveis reativas para os banners e controle do slide atual
const banners = ref([]);
const currentSlideIndex = ref(0);
let autoScrollTimer;

// Variáveis reativas para controle de tamanho de tela
const isMobile = ref(window.innerWidth <= 640);
const isTablet = ref(window.innerWidth > 640 && window.innerWidth <= 1024);
const isDesktop = ref(window.innerWidth > 1024);

// Função para atualizar o tamanho da tela
const updateScreenSize = () => {
  const width = window.innerWidth;
  isMobile.value = width <= 640;
  isTablet.value = width > 640 && width <= 1024;
  isDesktop.value = width > 1024;
};

// Função para obter URL de imagem responsiva com base no tamanho da tela
const getResponsiveImageUrl = (banner) => {
  if (isDesktop.value) {
    return banner.image_url_desktop;
  } else if (isTablet.value) {
    return banner.image_url_tablet; // Usando a imagem tablet
  } else {
    return banner.image_url_mobile; // Usar a imagem mobile como fallback para telas menores
  }
};

// Configuração dos event listeners de redimensionamento
onMounted(() => {
  window.addEventListener('resize', updateScreenSize);
  updateScreenSize(); // Garante que o tamanho da tela correto seja configurado ao montar o componente
});

// Remove os event listeners quando o componente é desmontado
onBeforeUnmount(() => {
  window.removeEventListener('resize', updateScreenSize);
});

// Funções para controle do carrossel
const nextSlide = () => {
  currentSlideIndex.value = (currentSlideIndex.value + 1) % banners.value.length;
};

const prevSlide = () => {
  currentSlideIndex.value = (currentSlideIndex.value - 1 + banners.value.length) % banners.value.length;
};

const startAutoScroll = () => {
  stopAutoScroll(); // Garante que apenas um timer esteja ativo
  autoScrollTimer = setInterval(nextSlide, 5000); // Chama nextSlide() a cada 5 segundos
};

const stopAutoScroll = () => {
  clearInterval(autoScrollTimer); // Limpa o timer
};

// Inicia o autoscroll quando o componente é montado
onMounted(() => {
  startAutoScroll();
});

onBeforeUnmount(() => {
  stopAutoScroll();
});

// Função para buscar banners da API
onMounted(async () => {
  try {
    const response = await axios.get('/api/website/siteBanner');
    banners.value = response.data.data;
  } catch (error) {
    console.error('Erro ao buscar banners:', error);
  }
});

// Inicializa a empresa com null
const company = ref(null);

// Função para buscar dados da empresa da API
onMounted(async () => {
  try {
    const response = await axios.get('/api/company/showCompany');
    company.value = response.data.data;
    console.log('Dados da empresa:', company.value);
  } catch (error) {
    console.error('Erro ao buscar os dados da empresa:', error);
  }
});

// Função para limpar o número de telefone
const cleanPhoneNumber = (phone) => {
  return phone.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
};

// Computed property para o link do WhatsApp
const whatsappLink = computed(() => {
  if (!company.value || !company.value.phone) {
    return '#'; // Retorna um link vazio ou um placeholder enquanto os dados não estão disponíveis
  }
  const cleanedPhone = cleanPhoneNumber(company.value.phone);
  const message = encodeURIComponent(`Olá, estou interessado no produto ${banners.value[currentSlideIndex.value]?.title || 'seu produto'}.`);
  return `https://api.whatsapp.com/send?phone=55${cleanedPhone}&text=${message}`;
});
</script>
