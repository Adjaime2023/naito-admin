<template>
    <!-- ====== Features Section Start -->
    <section id="portfolio" class="overflow-hidden pb-12 pt-20 lg:pb-[90px] lg:pt-[60px]">
        <h2 class="text-3xl font-semibold text-center my-8 mx-12 dark:text-gray-200 text-gray-700">BALANÇAS</h2>
        <div class="absolute top-0 left-0 -z-[1] w-full dark:bg-dark-700 h-full"></div>
        <div class="absolute top-0 left-0 -z-[1] h-1/2 w-full bg-[#8dd9f5] dark:bg-dark-700 lg:h-[45%] xl:h-1/2"></div>
        <div class="container px-4">
            <div class="-mx-4 flex flex-wrap">
                <div class="w-full p-4 md:w-1/2 lg:w-1/4">
                    <div class="bg-gray-300 dark:bg-gray-800 p-4 rounded-[14px] h-full flex flex-col">
                        <div class="group mb-12 items-center justify-center flex-grow animate__animated animate__fadeInUp"
                            style="animation-delay: 0.1s;">

                            data-wow-delay=".1s">
                            <div class="flex justify-center items-center">
                                <div ref="productContainer" class="flex overflow-x-auto space-x-4"
                                    @transitionend="handleTransitionEnd">
                                    <div v-for="product in loopedProducts" :key="product.id"
                                        class="w-56 flex-none grid justify-items-stretch">
                                        <div
                                            class=" bg-white dark:bg-gray-800  dark:text-gray-200 text-gray-700 shadow-lg rounded-lg overflow-hidden">
                                            <img :src="product.image" :alt="product.name"
                                                class="w-56 justify-self-center ">
                                            <div class="p-4">
                                                <h3 class="text-lg font-semibold">{{ product.name }}</h3>
                                                <p class="text-sm min-h-12 text-gray-700 dark:text-gray-200">{{
                                                    product.description
                                                    }}</p>
                                                <p class="line-through">R$ {{ (product.price *
                                                    1.5).toLocaleString('pt-BR', {
                                                        MINIMUMFRACTIONDIGITS: 2,
                                                        MAXIMUMFRACTIONDIGITS: 2
                                                    }).split(',')[0] + ',' + (product.price / 5).toLocaleString('pt-BR',
                                                        {
                                                            minimumFractionDigits: 2, maximumFractionDigits: 2
                                                        }).split(',')[1].slice(0, 2)
                                                    }}</p>
                                                <p class="text-lg font-bold mt-2 text-green-500">R$ {{
                                                    product.price.toLocaleString('pt-BR', {
                                                        MINIMUMFRACTIONDIGITS: 2, MAXIMUMFRACTIONDIGITS: 2
                                                    }).split(',')[0] + ',' + (product.price /
                                                        5).toLocaleString('pt-BR', {
                                                            minimumFractionDigits: 2, maximumFractionDigits: 2
                                                        }).split(',')[1].slice(0, 2) }}<span
                                                        class="text-gray-700 dark:text-gray-200 text-sm"> no PIX</span>
                                                </p>
                                                <p class="text-sm"><span>5x de R$ {{ ((product.price * 1.2) /
                                                    5).toLocaleString('pt-BR', {
                                                        MINIMUMFRACTIONDIGITS: 2, MAXIMUMFRACTIONDIGITS: 2
                                                    }).split(',')[0] + ',' + (product.price /
                                                        5).toLocaleString('pt-BR', {
                                                            minimumFractionDigits: 2, maximumFractionDigits: 2
                                                        }).split(',')[1].slice(0, 2) }} no cartão total <span
                                                            class="text-sm text-gray-600 dark:text-gray-300">R$ {{
                                                                ((product.price *
                                                                    1.2)).toLocaleString('pt-BR', {
                                                                        MINIMUMFRACTIONDIGITS: 2, MAXIMUMFRACTIONDIGITS: 2
                                                                    }).split(',')[0] + ',' + (product.price /
                                                                        5).toLocaleString('pt-BR',
                                                                            {
                                                                                minimumFractionDigits: 2,
                                                                                maximumFractionDigits: 2
                                                                            }).split(',')[1].slice(0, 2) }}</span></span>
                                                </p>
                                                <a :href="`https://api.whatsapp.com/send?phone=553899473993&text=${encodeURIComponent(`Olá, estou interessado no produto ${product.name}.`)}`"
                                                    target="_blank"
                                                    class="z-50 mt-4 bg-green-500 hover:bg-green-600 text-white py-1 px-2 rounded-md transition duration-300 ease-in-out">
                                                    Comprar
                                                </a>
                                            </div>
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
    <!-- ====== Features Section End -->
</template>

<script setup>
import { createApp, h } from 'vue'
import { createInertiaApp } from '@inertiajs/vue3'
import { Head, Link } from '@inertiajs/vue3'
import { ref, computed, onMounted, onBeforeUnmount } from 'vue';



createInertiaApp({
    resolve: name => require(`./Pages/${name}`),
    setup({ el, App, props, plugin }) {
        const app = createApp({ render: () => h(App, props) })

        app.use(plugin)
        app.component('InertiaHead', Head)
        app.component('InertiaLink', Link)
        app.mount(el)
    },
})
const productContainer = ref(null);
const products = ref([
    { id: 1, name: 'Balança eletrônica Hummer', description: 'até 40 kg com sistema de precificação', price: 1940.99, image: '/storage/products/balança01.png', url: '#contact' },
    { id: 2, name: 'Balança eletrônica Digital', description: 'de 30 kg, 40 kg, display LCD, mercado, balança de computação de preços digitais', price: 1786.14, image: '/storage/products/balança02.png', url: '#contact' },
    { id: 3, name: 'Balança Plataforma', description: 'Dp150 150kg/50g + Bateria Bivolt Ramuza', price: 1855.63, image: '/storage/products/balança03.png', url: '#contact' },
    { id: 4, name: 'Impressora Bematech MP-2800', description: 'Térmica Não Fiscal TH com guilhotina e rede', price: 860.99, image: '/storage/products/impressora01.png', url: '#contact' },
    { id: 5, name: 'Impressora Bematech Mp4200th', description: 'Não Fiscal - Ethernet', price: 790.99, image: '/storage/products/impressora02.png', url: '#contact' },
    { id: 6, name: 'Impressora Bematech e Leitor Elgin', description: 'Kit Impressora Termica Bematech Mp4200 Mais Leitor Código de Barras com Suporte El250 2d Usb Elgin', price: 1135.99, image: '/storage/products/impressora03.png', url: '#contact' },
    { id: 7, name: 'Impressora Não Fiscal Matricial Mp-20 Mi Bematech', description: 'Ideal para lavanderias, estacionamentos, cozinhas e copas de restaurantes, check list de Locação, cartórios e demais empresas de serviços', price: 1395.99, image: '/storage/products/impressora04.png', url: '#contact' },
    { id: 8, name: 'Balança eletrônica Hummer', description: 'até 40 kg com sistema de precificação', price: 1940.99, image: '/storage/products/balança01.png', url: '#contact' },
    { id: 9, name: 'Balança eletrônica Digital', description: 'de 30 kg, 40 kg, display LCD, mercado, balança de computação de preços digitais', price: 1786.14, image: '/storage/products/balança02.png', url: '#contact' },
    { id: 10, name: 'Balança Plataforma', description: 'Dp150 150kg/50g + Bateria Bivolt Ramuza', price: 1855.63, image: '/storage/products/balança03.png', url: '#contact' },
    { id: 11, name: 'Impressora Bematech MP-2800', description: 'Térmica Não Fiscal TH com guilhotina e rede', price: 860.99, image: '/storage/products/impressora01.png', url: '#contact' },
    { id: 12, name: 'Impressora Bematech Mp4200th', description: 'Não Fiscal - Ethernet', price: 790.99, image: '/storage/products/impressora02.png', url: '#contact' },
    { id: 13, name: 'Impressora Bematech e Leitor Elgin', description: 'Kit Impressora Termica Bematech Mp4200 Mais Leitor Código de Barras com Suporte El250 2d Usb Elgin', price: 1135.99, image: '/storage/products/impressora03.png', url: '#contact' },
    { id: 14, name: 'Impressora Não Fiscal Matricial Mp-20 Mi Bematech', description: 'Ideal para lavanderias, estacionamentos, cozinhas e copas de restaurantes, check list de Locação, cartórios e demais empresas de serviços', price: 1395.99, image: '/storage/products/impressora04.png', url: '#contact' },
]);

</script>
