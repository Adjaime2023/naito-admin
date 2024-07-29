<template>
       <div class="animate__animated animate__fadeInUp container px-4" style="animation-delay: 0.1s;">
    <div class="-mx-4 flex flex-wrap">

            <div v-for="product in products" :key="product.id" class="w-full p-4 sm:w-1/2 md:w-1/3 lg:w-1/5">
                <div class="bg-gray-300 dark:bg-gray-800 rounded-[14px] h-full flex flex-col items-center">
                    <div class="group mb-12 flex flex-col items-center justify-center">
                        <div class="w-full bg-white dark:bg-gray-800 dark:text-gray-200 text-gray-700 shadow-lg rounded-lg overflow-hidden flex justify-center items-center">
                            <img :src="product.image" :alt="product.name" class="w-full" />
                        </div>
                        <div class="p-4 text-center">
                            <h3 class="text-lg font-semibold">{{ product.name }}</h3>
                            <p class="text-sm min-h-12 text-gray-700 dark:text-gray-200">{{ product.description }}</p>
                            <p class="line-through">
                                R$ {{ (product.price * 1.5).toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) }}
                            </p>
                            <p class="text-lg font-bold mt-2 text-green-500">
                                R$ {{ product.price.toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) }}
                                <span class="text-gray-700 dark:text-gray-200 text-sm"> no PIX</span>
                            </p>
                            <p class="text-sm">
                                <span>
                                    5x de R$ {{ ((product.price * 1.2) / 5).toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) }} no cartão
                                    total <span class="text-sm text-gray-600 dark:text-gray-300">R$ {{ (product.price * 1.2).toLocaleString('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) }}</span>
                                </span>
                            </p>
                            <a :href="`https://api.whatsapp.com/send?phone=553899473993&text=${encodeURIComponent('Olá, estou interessado no produto ' + product.name + '.')}`"
                               target="_blank"
                               class="z-50 mt-4 bg-green-500 hover:bg-green-600 text-white py-1 px-2 rounded-md transition duration-300 ease-in-out">
                               Comprar pelo WhatsApp
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const products = ref([
    { id: 1, name: 'Mecanismo Bematech Mp4200 Th', description: 'Mecanismo para Impressora Bematech Mp4200 Th USB.', price: 179.99, image: '/storage/products/insumos/insumos01.png' },
    { id: 2, name: 'Placa Fonte Interna Rc 8400/ 8300/ 8100 Bematech', description: 'Placa Fonte Interna Rc 8400/ 8300/ 8100 Bematech', price: 299.14, image: '/storage/products/insumos/insumos02.png' },
    { id: 3, name: 'Mecanismo Impressora Mp4200 Th Usb Bematech', description: 'Dp150 150kg/50g + Bateria Bivolt Ramuza', price:179.99, image: '/storage/products/insumos/insumos03.png' },
    { id: 4, name: 'Placa Logica Para Impressora Bematech Mp 2500 Th - A13', description: 'Placa Logica Para Impressora Bematech Mp 2500 Th - A13', price: 199.99, image: '/storage/products/insumos/insumos04.png' },
    { id: 5, name: 'Fonte Para Impressoras Hp Conector Roxo', description: 'Fonte Para Impressoras Hp Conector Roxo', price: 129.99, image: '/storage/products/insumos/insumos05.png' },
    { id: 6, name: 'Bobina Térmica 57x15 Cx C/ 50 Bematech, Daruma, Sweda, Elgin', description: 'Bobina Térmica 57x15 Cx C/ 50 Bematech, Daruma, Sweda, Elgin', price: 135.99, image: '/storage/products/insumos/insumos06.png' },
    { id: 7, name: 'Bobina Térmica Sensível para Relógio de Ponto/ Comprovantes Fiscais Caixa com 30 Unidades 80mm x 30m Plavitec - Branca', description: 'Bobina Térmica Sensível para Relógio de Ponto/ Comprovantes Fiscais Caixa com 30 Unidades 80mm x 30m Plavitec - BrancaBobina Térmica 80X30 Pdv Caixa Com 30 Rolos - Norris Gazon', price: 160.99, image: '/storage/products/insumos/insumos07.png' },
    { id: 8, name: 'Bobina Térmica 80X30 Pdv Caixa Com 30 Rolos - Norris Gazon', description: 'Bobina Térmica 80X30 Pdv Caixa Com 30 Rolos - Norris Gazon', price: 135.99, image: '/storage/products/insumos/insumos08.png' },
    { id: 9, name: 'Bobina Térmica (bematech, Epson, Daruma, Elgin)', description: 'Bobina Térmica (bematech, Epson, Daruma, Elgin)', price: 135.14, image: '/storage/products/insumos/insumos09.png' },
]);
</script>
