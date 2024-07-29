<template>
    <!-- ====== Footer Section Start -->
    <footer class="animate__animated animate__fadeInUp relative z-10  pt-20 lg:pt-[100px]
    bg-gradient-to-b dark:from-[#090E34] dark:via-[#171f51] dark:to-[#283482] from-gray-100 via-gray-200 to-gray-300
    " style="animation-delay: 0.15s;">

        <div v-if="company">
            <div class="w-full">
                <div class="-mx-4 px-4 flex flex-wrap">
                    <div class="w-full px-2 sm:w-1/2 md:w-1/2 lg:w-1/5 xl:w-1/5">
                        <div class=" mb-10 w-full">



                            <a href="#home" class="mb-6 inline-block max-w-[260px]">
                                <img :src="'/storage/' + company.logo_light" alt="Logo" class="dark:hidden h-10" />
                                <img :src="'/storage/' + company.logo_dark" alt="Logo" class="hidden dark:block h-10" />
                            </a>


                            <p class="mb-8 max-w-[270px]   text-gray-900 dark:text-white">
                                Assistencias em impressora, balanças digitais para marcas e empresas usando tecnologia.
                            </p>
                            <div class="mx-3 flex items-center">

                                <div class="group mr-2">
                                    <a :href="company.facebook" target="_blank"
                                        class="px-3  text-gray-900 dark:text-white group-hover:text-gray-500">
                                        <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                            xmlns="http://www.w3.org/2000/svg" class="fill-current">
                                            <path
                                                d="M16.294 8.86875H14.369H13.6815V8.18125V6.05V5.3625H14.369H15.8128C16.1909 5.3625 16.5003 5.0875 16.5003 4.675V1.03125C16.5003 0.653125 16.2253 0.34375 15.8128 0.34375H13.3034C10.5878 0.34375 8.69714 2.26875 8.69714 5.12187V8.1125V8.8H8.00964H5.67214C5.19089 8.8 4.74402 9.17812 4.74402 9.72812V12.2031C4.74402 12.6844 5.12214 13.1313 5.67214 13.1313H7.94089H8.62839V13.8188V20.7281C8.62839 21.2094 9.00652 21.6562 9.55652 21.6562H12.7878C12.994 21.6562 13.1659 21.5531 13.3034 21.4156C13.4409 21.2781 13.544 21.0375 13.544 20.8312V13.8531V13.1656H14.2659H15.8128C16.2596 13.1656 16.6034 12.8906 16.6721 12.4781V12.4438V12.4094L17.1534 10.0375C17.1878 9.79688 17.1534 9.52187 16.9471 9.24687C16.8784 9.075 16.569 8.90312 16.294 8.86875Z" />
                                        </svg>
                                    </a>
                                </div>
                                <div class="group mx-2">
                                    <a :href="company.instagran" target="_blank"
                                        class="px-3  text-gray-900 dark:text-white group-hover:text-gray-500">
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
                                <div class="group mx-2">
                                    <a :href="company.x" target="_blank"
                                        class="px-3  text-gray-900 dark:text-white group-hover:text-gray-500">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            viewBox="0 0 440 440" fill="none" class="fill-current">
                                            <path
                                                d="M394.033.25h76.67L303.202 191.693l197.052 260.511h-154.29L225.118 294.205 86.844 452.204H10.127l179.16-204.77L.254.25H158.46l109.234 144.417zm-26.908 406.063h42.483L135.377 43.73h-45.59z" />
                                        </svg>
                                    </a>
                                </div>

                                <div class="group ml-2">
                                    <a :href="whatsappLink" target="_blank"
                                        class="px-3  text-gray-900 dark:text-white group-hover:text-gray-500">

                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                            viewBox="0 0 880 880" fill="none" class="fill-current">

                                            <path
                                                d="M630.056 107.658C560.727 38.271 468.525.039 370.294 0 167.891 0 3.16 164.668 3.079 367.072c-.027 64.699 16.883 127.855 49.016 183.523L0 740.824l194.666-51.047c53.634 29.244 114.022 44.656 175.481 44.682h.151c202.382 0 367.128-164.689 367.21-367.094.039-98.088-38.121-190.32-107.452-259.707m-259.758 564.8h-.125c-54.766-.021-108.483-14.729-155.343-42.529l-11.146-6.613-115.516 30.293 30.834-112.592-7.258-11.543c-30.552-48.58-46.689-104.729-46.665-162.379C65.146 198.865 202.065 62 370.419 62c81.521.031 158.154 31.81 215.779 89.482s89.342 134.332 89.311 215.859c-.07 168.242-136.987 305.117-305.211 305.117m167.415-228.514c-9.176-4.591-54.286-26.782-62.697-29.843-8.41-3.061-14.526-4.591-20.644 4.592-6.116 9.182-23.7 29.843-29.054 35.964-5.351 6.122-10.703 6.888-19.879 2.296-9.175-4.591-38.739-14.276-73.786-45.526-27.275-24.32-45.691-54.36-51.043-63.542-5.352-9.183-.569-14.148 4.024-18.72 4.127-4.11 9.175-10.713 13.763-16.07 4.587-5.356 6.116-9.182 9.174-15.303 3.059-6.122 1.53-11.479-.764-16.07-2.294-4.591-20.643-49.739-28.29-68.104-7.447-17.886-15.012-15.466-20.644-15.746-5.346-.266-11.469-.323-17.585-.323-6.117 0-16.057 2.296-24.468 11.478-8.41 9.183-32.112 31.374-32.112 76.521s32.877 88.763 37.465 94.885c4.587 6.122 64.699 98.771 156.741 138.502 21.891 9.45 38.982 15.093 52.307 19.323 21.981 6.979 41.983 5.994 57.793 3.633 17.628-2.633 54.285-22.19 61.932-43.616 7.646-21.426 7.646-39.791 5.352-43.617-2.293-3.826-8.41-6.122-17.585-10.714" />
                                        </svg>

                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="w-full px-2 sm:w-1/2 md:w-1/2 lg:w-1/5 xl:w-1/5">
                        <div class="mb-10 w-full">
                            <h4 class="mb-9 text-lg font-semibold text-gray-900 dark:text-white">About Us</h4>
                            <ul>
                                <li class="group">
                                    <a :href="route('home') + '#home'"
                                        class="mb-3 inline-block  text-gray-900 dark:text-white group-hover:text-gray-500 ">
                                        Home
                                    </a>
                                </li>
                                <li class="group">
                                    <a :href="route('home') + '#about'"
                                        class="mb-3 inline-block  text-gray-900 dark:text-white group-hover:text-gray-500 ">
                                        Sobre
                                    </a>
                                </li>
                                <li class="group">
                                    <a :href="route('home') + '#partners'"
                                        class="mb-3 inline-block  text-gray-900 dark:text-white group-hover:text-gray-500 ">
                                        Parceiros
                                    </a>
                                </li>
                                <li class="group">
                                    <a :href="route('home') + '#contact'"
                                        class="mb-3 inline-block  text-gray-900 dark:text-white group-hover:text-gray-500 ">
                                        Contato
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="w-full px-2 sm:w-1/2 md:w-1/2 lg:w-1/5 xl:w-1/5">
                        <div class="mb-10 w-full">
                            <h4 class="mb-9 text-lg font-semibold text-gray-900 dark:text-white">Features</h4>
                            <ul>
                                <li class="group">
                                    <a href="javascript:void(0)"
                                        class="mb-3 inline-block text-gray-900 dark:text-white group-hover:text-gray-500">
                                        Política de Privacidade
                                    </a>
                                </li>
                                <li class="group">
                                    <a href="javascript:void(0)"
                                        class="mb-3 inline-block text-gray-900 dark:text-white group-hover:text-gray-500">
                                        Termos de serviço
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="w-full px-2 sm:w-1/2 md:w-1/2 lg:w-1/5 xl:w-1/5">
                        <div class="mb-10 w-full">
                            <h4 class="mb-9 text-lg font-semibold text-gray-900 dark:text-white">
                                Nossos Produtos
                            </h4>
                            <ul v-if="groups.length > 0">
                                <li v-for="group in groups" :key="group.id" class="group">
                                    <a :href="route('websiteProducts', { group_id: group.id })"
                                        class="mb-3 inline-block text-gray-900 dark:text-white group-hover:text-gray-500">
                                        {{ group.name }}
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </div>
                    <div class="w-full px-2 sm:w-1/2 md:w-1/2 lg:w-1/5 xl:w-1/5">
                        <div class="mb-10 w-full">
                            <h4 class="mb-9 text-lg font-semibold text-gray-900 dark:text-white">Informações Recentes
                            </h4>
                            <div class="flex flex-col gap-8">
                                <a :href="company.link1" target="_blank" class="group flex items-center gap-[22px]">
                                    <div class="overflow-hidden rounded">
                                        <img :src="'/storage/' + company.image_footer" alt="blog" class="w-20 h-10" />
                                    </div>
                                    <span
                                        class="max-w-[180px] text-gray-900 dark:text-gray-200 group-hover:text-gray-500">
                                        {{ company.description1 }}
                                    </span>
                                </a>
                                <a :href="company.link2" target="_blank" class="group flex items-center gap-[22px]">
                                    <div class="overflow-hidden rounded">
                                        <img :src="'/storage/' + company.image_footer_botton" alt="blog"
                                            class="w-20 h-10" />
                                    </div>
                                    <span
                                        class="max-w-[180px] text-gray-900 dark:text-gray-200 group-hover:text-gray-500">
                                        {{ company.description2 }}
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="mt-12 border-t border-[#8890A4] border-opacity-40 py-8 px-4 lg:mt-[60px]">
                <div class="container">
                    <div class="-mx-4 flex flex-wrap">
                        <div class="w-full px-4 md:w-2/3 lg:w-1/2">
                            <div class="my-1">
                                <div class="-mx-3 flex items-center justify-center md:justify-start">
                                    <div class="group">
                                        <a href="javascript:void(0)"
                                            class="group px-3 text-gray-900 dark:text-white group-hover:text-gray-500 hover:underline">
                                            Politica de Privacidade
                                        </a>
                                    </div>
                                    <div class="group">
                                        <a href="javascript:void(0)"
                                            class="group px-3 text-gray-900 dark:text-white group-hover:text-gray-500 hover:underline">
                                            Notícia legal
                                        </a>
                                    </div>
                                    <div class="group">
                                        <a href="javascript:void(0)"
                                            class="group px-3 text-gray-900 dark:text-white group-hover:text-gray-500 hover:underline">
                                            Termo de Serviço
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="w-full px-4 md:w-1/3 lg:w-1/2">
                            <div class="my-1 flex justify-center md:justify-end">
                                <div class="my-1 flex justify-center md:justify-end">
                                    <p class="text-gray-900 dark:text-white flex items-center">
                                        Projetado e desenvolvido por
                                        <a href="" rel="nofollow noopener" target="_blank"
                                            class="text-gray-900 dark:text-white hover:underline flex items-center ml-1">
                                            <img src="/storage/images/favicon_naito.png" alt="Ícone de link externo"
                                                class="w-4 h-4 mx-1" />
                                            Marketing Digital Naito
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <FooterSvg />

        </div>
    </footer>

    <!-- ====== Footer Section End -->
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { usePage } from '@inertiajs/vue3';
import axios from 'axios';
import FooterSvg from '../Partials/FooterSvg.vue';


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
const whatsappLink = computed(() => {
    if (!company.value || !company.value.phone) {
        return '#'; // Retorna um link vazio ou um placeholder enquanto os dados não estão disponíveis
    }
    const cleanedPhone = cleanPhoneNumber(company.value.phone);
    const message = encodeURIComponent(`Olá, estou interessado no produto.`);
    return `https://api.whatsapp.com/send?phone=55${cleanedPhone}&text=${message}`;
});
</script>