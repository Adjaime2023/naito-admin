<script setup>
import { ref, computed, onMounted } from 'vue';
import axios from 'axios';

const partner = ref([]);
const currentPage = ref(0);
const pageSize = 4;

onMounted(async () => {
    try {
        const response = await axios.get('/api/website/sitePartner');
        partner.value = response.data.data;
    } catch (error) {
        console.error('Erro ao buscar parceiros:', error);
    }
});

const partnerContainer = ref(null);

const loopedPartners = computed(() => {
    const startIndex = currentPage.value * pageSize;
    return [
        ...partner.value.slice(startIndex),
        ...partner.value.slice(0, startIndex)
    ];
});

const scroll = (direction) => {
    const container = partnerContainer.value;
    if (!container) return;

    const amountToScroll = direction === -1 ? -container.clientWidth : container.clientWidth;
    container.scrollBy({
        left: amountToScroll,
        behavior: 'smooth',
    });
};

const scrollContainerClasses = computed(() => ({
    'flex': true,
    'space-x-4': true,
}));

// Função para limpar o número de telefone
const cleanPhoneNumber = (phone) => {
    return phone.replace(/\D/g, ''); // Remove todos os caracteres não numéricos
};

// Computed property para o link do WhatsApp
const phoneLink = computed(() => {
    if (!partner.value.length || !partner.value[0].phone) {
        return '#'; // Retorna um link vazio ou um placeholder enquanto os dados não estão disponíveis
    }
    return cleanPhoneNumber(partner.value[0].phone); // Assuming the first partner's phone number
});

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

const empresa = computed(() => {
    if (!company.value || !company.value.name) {
        return ''; // Retorna um texto padrão enquanto os dados não estão disponíveis
    }
    return company.value.name;
});
</script>


<template>
    <!-- ====== partners Section Start -->
    <section id="partners"
        class="overflow-hidden pb-12  mt-10 pt-20 lg:pb-[90px] lg:pt-[60px]  bg-gradient-to-b dark:from-gray-900 dark:via-gray-800 dark:to-gray-700 from-gray-100 via-gray-200 to-gray-300">

        <div class="-mx-4 flex flex-wrap">
            <div class="w-full px-4">
                <div class="text-center mx-auto mb-[10px] max-w-[900px]">
                    <h2 class="text-3xl font-semibold text-blue-900 dark:text-blue-400 mb-4">NOSSOS PARCEIROS</h2>
                </div>
                <div class="mx-auto mb-[60px] max-w-[985px] text-center">

                    <h3
                        class="mb-3 text-sm font-bold leading-[1.2] text-gray-800 dark:text-white sm:text-lg md:text-[20px]">
                        "Excelência e inovação"
                    </h3>
                    <p class="text-base text-gray-800 dark:text-gray-200">
                        Orgulhosamente colaboramos com uma rede diversificada de parceiros que compartilham nossa
                        visão e compromisso com a excelência, impulsionando juntos a inovação e o crescimento.
                    </p>
                </div>
            </div>
        </div>
        <div class="animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
            <div class="flex flex-wrap justify-center">
                <div ref="partnerContainer" :class="scrollContainerClasses">
                    <div class="flex flex-wrap justify-center">
                        <div v-for="partner in loopedPartners" :key="partner.id"
                            class="w-full px-2 sm:w-1/2 lg:w-1/4 xl:w-1/4 mb-4">
                            <div
                                class="w-full h-full rounded-xl bg-white px-5 pb-10 pt-12 shadow-testimonial dark:bg-gray-900 dark:shadow-none flex flex-col items-center">
                                <div class="flex flex-col items-center justify-center flex-grow">
                                    <div
                                        class="relative z-10 mx-auto mb-5 hover:animate-pulse h-full w-full flex justify-center items-center">
                                        <a :href="partner.site">
                                            <!-- Imagem do logo para tema claro (default) -->
                                            <img :src="partner.logo_light ? `/storage/${partner.logo_light}` : '/storage/images/default.png'"
                                                :alt="partner.id" class="dark:hidden w-60" />
                                            <!-- Imagem do logo para tema escuro -->
                                            <img :src="partner.logo_dark ? `/storage/${partner.logo_dark}` : '/storage/images/default.png'"
                                                :alt="partner.id" class="hidden dark:block w-60" />
                                        </a>
                                    </div>
                                    <div class="text-center">
                                        <h4 class="mb-1 text-lg font-semibold text-gray-800 dark:text-white">
                                            {{ partner.name }}
                                        </h4>
                                        <p class="mb-5 text-sm text-gray-800 dark:text-gray-200">
                                            {{ partner.contact }}
                                        </p>
                                        <div class="flex items-center justify-center gap-5">
                                            <div class="mr-1">
                                                <a :href="partner.facebook" target="_blank"
                                                    class="px-3 text-gray-900 dark:text-white hover:text-gray-500">
                                                    <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg" class="fill-current">
                                                        <path
                                                            d="M16.294 8.86875H14.369H13.6815V8.18125V6.05V5.3625H14.369H15.8128C16.1909 5.3625 16.5003 5.0875 16.5003 4.675V1.03125C16.5003 0.653125 16.2253 0.34375 15.8128 0.34375H13.3034C10.5878 0.34375 8.69714 2.26875 8.69714 5.12187V8.1125V8.8H8.00964H5.67214C5.19089 8.8 4.74402 9.17812 4.74402 9.72812V12.2031C4.74402 12.6844 5.12214 13.1313 5.67214 13.1313H7.94089H8.62839V13.8188V20.7281C8.62839 21.2094 9.00652 21.6562 9.55652 21.6562H12.7878C12.994 21.6562 13.1659 21.5531 13.3034 21.4156C13.4409 21.2781 13.544 21.0375 13.544 20.8312V13.8531V13.1656H14.2659H15.8128C16.2596 13.1656 16.6034 12.8906 16.6721 12.4781V12.4438V12.4094L17.1534 10.0375C17.1878 9.79688 17.1534 9.52187 16.9471 9.24687C16.8784 9.075 16.569 8.90312 16.294 8.86875Z" />
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="mx-1">
                                                <a :href="partner.instagram" target="_blank"
                                                    class="px-3 text-gray-900 dark:text-white hover:text-gray-500">
                                                    <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                                        xmlns="http://www.w3.org/2000/svg" class="fill-current">
                                                        <path
                                                            d="M11.0297 14.4305C12.9241 14.4305 14.4598 12.8948 14.4598 11.0004C14.4598 9.10602 12.9241 7.57031 11.0297 7.57031C9.13529 7.57031 7.59958 9.10602 7.59958 11.0004C7.59958 12.8948 9.13529 14.4305 11.0297 14.4305Z" />
                                                        <path
                                                            d="M14.7554 1.8335H7.24463C4.25807 1.8335 1.83334 4.25823 1.83334 7.24479V14.6964C1.83334 17.7421 4.25807 20.1668 7.24463 20.1668H14.6962C17.7419 20.1668 20.1667 17.7421 20.1667 14.7555V7.24479C20.1667 4.25823 17.7419 1.8335 14.7554 1.8335ZM11.0296 15.4948C8.51614 15.4948 6.53496 13.4545 6.53496 11.0002C6.53496 8.54586 8.54571 6.50554 11.0296 6.50554C13.4839 6.50554 15.4946 8.54586 15.4946 11.0002C15.4946 13.4545 13.5134 15.4948 11.0296 15.4948ZM17.2393 6.91952C16.9436 7.24479 16.5 7.42221 15.9973 7.42221C15.5538 7.42221 15.1102 7.24479 14.7554 6.91952C14.4301 6.59425 14.2527 6.18027 14.2527 5.67758C14.2527 5.17489 14.4301 4.79049 14.7554 4.43565C15.0807 4.08081 15.4946 3.90339 15.9973 3.90339C16.4409 3.90339 16.914 4.08081 17.2393 4.40608C17.535 4.79049 17.7419 5.23403 17.7419 5.70715C17.7124 6.18027 17.535 6.59425 17.2393 6.91952Z" />
                                                        <path
                                                            d="M16.0276 4.96777C15.6432 4.96777 15.318 5.29304 15.318 5.67745C15.318 6.06186 15.6432 6.38713 16.0276 6.38713C16.412 6.38713 16.7373 6.06186 16.7373 5.67745C16.7373 5.29304 16.4416 4.96777 16.0276 4.96777Z" />
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="mx-1">
                                                <a :href="partner.x" target="_blank"
                                                    class="px-3 text-gray-900 dark:text-white hover:text-gray-500">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                        viewBox="0 0 440 440" fill="none" class="fill-current">
                                                        <path
                                                            d="M394.033.25h76.67L303.953 220.69 500.56 545.75h-75.843L234.856 269.17l-98.843 91.893V545.75H70.393V8.607h65.62v310.11L394.032.25z" />
                                                    </svg>
                                                </a>
                                            </div>
                                            <div class="ml-1">
                                                <a :href="partner.tictok" target="_blank"
                                                    class="px-3 text-gray-900 dark:text-white hover:text-gray-500">
                                                    <svg viewBox="0 0 22 22" fill="currentColor" class="w-5 h-5">
                                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                                            d="M9.5 0.5C8.94772 0.5 8.5 0.947715 8.5 1.5V5.74829C8.5 6.30058 8.94772 6.74829 9.5 6.74829C11.2863 6.74829 12.7483 5.28634 12.7483 3.5C12.7483 2.94771 13.196 2.5 13.7483 2.5H16.9966C17.5489 2.5 17.9966 2.94772 17.9966 3.5C17.9966 7.09073 15.0907 9.9966 11.5 9.9966C9.01472 9.9966 6.95761 8.46786 5.99933 6.37314C5.67179 6.50674 5.33573 6.62153 4.99236 6.7171V12.6515C5.78226 12.2773 6.65353 12.0582 7.56102 12.0582C10.4568 12.0582 12.8208 14.2138 13.2253 17.0359C13.2982 17.5564 12.8897 18 12.3654 18H8.67565C8.18162 18 7.76589 17.6206 7.69314 17.1293C7.46078 15.5518 6.22453 14.3948 4.65595 14.3948C3.04006 14.3948 1.75147 15.6846 1.75147 17.3012C1.75147 18.9179 3.04006 20.2076 4.65595 20.2076C5.49026 20.2076 6.23679 19.8094 6.69575 19.1568C7.48191 19.875 8.50653 20.331 9.63971 20.331C10.7538 20.331 11.7475 19.8993 12.4817 19.1933C13.3654 18.3791 13.9137 17.2788 13.9954 16.0892C14.0627 15.1126 14.0548 14.1462 13.9744 13.1924C13.9161 12.5121 14.348 11.9018 15.0307 11.7439C16.2687 11.437 17.3643 10.8001 18.2397 9.89671C19.537 8.4869 20.25 6.64982 20.25 4.5V1.5C20.25 0.947715 19.8023 0.5 19.25 0.5H13.7483C12.5663 0.5 11.5918 1.27416 11.2802 2.35168C10.8404 2.5666 10.3674 2.68888 9.87783 2.70957C9.76784 2.13482 9.5 1.61419 9.5 1.5ZM4.65595 19.5C4.10968 19.5 3.67147 19.0618 3.67147 18.5155C3.67147 17.9693 4.10968 17.5311 4.65595 17.5311C5.20221 17.5311 5.64043 17.9693 5.64043 18.5155C5.64043 19.0618 5.20221 19.5 4.65595 19.5Z" />
                                                    </svg>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Add this empty div for centering on desktop only -->
                        <div class="hidden sm:block lg:w-1/4 xl:w-1/4"></div>
                    </div>
                </div>
            </div>
        </div>


    </section>
    <!-- ====== Partners Section End -->
</template>
