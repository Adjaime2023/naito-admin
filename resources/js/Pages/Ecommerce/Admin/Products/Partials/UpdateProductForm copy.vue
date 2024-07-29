<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ImageProductForm from './ImageProductForm.vue';
import ImageHoverProductForm from './ImageHoverProductForm.vue';
import ImagesProductForm from './ImagesProductForm.vue';
import axios from 'axios';

const activeTab = ref('info'); // Aba inicial ativa
// Lógica para exibir mensagem flash
const message = ref('');
onMounted(() => {
    // Obter a mensagem flash da propriedade 'jetstream.flash.message'
    message.value = props.jetstream.flash?.message || '';
    // Limpar a mensagem flash para evitar que seja exibida novamente
    props.jetstream.flash = null;
});

// Obtendo propriedades da página
const { props } = usePage();

const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Atualizado por: ${userName} em ${new Date().toLocaleString()}`;
});

const subgroups = ref([]);
const collections = ref([]);
const brands = ref([]);
const colors = ref([]);

// Função para buscar as listas de opções
const fetchData = async () => {
    const response = await axios.get('/api/product-options');
    subgroups.value = response.data.subgroups;
    collections.value = response.data.collections;
    brands.value = response.data.brands;
    colors.value = response.data.colors;
};

// Chama a função ao montar o componente
fetchData();

// Função para atualizar a descrição
const updateDescription = async () => {
    const { data } = await axios.post('/products/generate-description', {
        name: form.name,
        subgroup_id: form.subgroup_id,
        collection_id: form.collection_id,
        brand_id: form.brand_id,
        color_id: form.color_id,
    });

    form.description = data.description;
};



// Inicializando o formulário com useForm
const form = useForm({
    _method: 'PUT',
    id: props.product.id,
    name: props.product.name,
    description: props.product.description,
    sku: props.product.sku,
    size: props.product.size,
    qr_code: props.product.qr_code, // QR Code
    barcode: props.product.barcode, // Código de barras
    purchase_price: props.product.purchase_price,
    shipping_value: props.product.shipping_value,
    taxes_gov: props.product.taxes_gov, // Inclua se houver uma taxa governamental fixa combinada
    cost_price: props.product.cost_price,
    tax_gateway: props.product.tax_gateway, // Taxas de gateways de pagamento
    tax_platform: props.product.tax_platform, // Taxas de plataformas de e-commerce
    tax_marketplace: props.product.tax_marketplace, // Taxas de marketplaces
    tax_intermediation: props.product.tax_intermediation, // Taxas de intermediação
    tax_commission: props.product.tax_commission, // Comissões de vendas
    tax_additional_services: props.product.tax_additional_services, // Taxas por serviços adicionais
    profit_margin: props.product.profit_margin, // Margem de lucro pretendida
    freight_sale: props.product.freight_sale, // Custo de frete na venda
    icms: props.product.icms, // ICMS
    ipi: props.product.ipi, // IPI
    pis_pasep: props.product.pis_pasep, // PIS/PASEP
    cofins: props.product.cofins, // Cofins
    irpj: props.product.irpj, // IRPJ
    csll: props.product.csll, // CSLL
    sale_price: props.product.sale_price, // Preço de venda
    stock: props.product.stock, // Quantidade em estoque
    launch: props.product.launch == 1 ? true : false, // Produto em lançamento
    promotion: props.product.promotion == 1 ? true : false, // Produto em promoção
    promotion_price: props.product.promotion_price,
    category_id: props.product.category_id,
    subcategory_id: props.product.subcategory_id,
    group_id: props.product.group_id,
    subgroup_id: props.product.subgroup_id,
    collection_id: props.product.collection_id,
    brand_id: props.product.brand_id,
    color_id: props.product.color_id,
    action_user: actionUser.value + '|' + (props.product.action_user || ''),
    discontinued: props.product.discontinued == 1 ? true : false,
});


const updateProduct = () => {
    form.put(route('product.update', { id: form.id }), {
        onSuccess: () => {
            if (props.jetstream) {
                props.jetstream.flash = { message: 'Produto atualizado com sucesso!' };
            }
        },
        onError: () => {
            if (props.jetstream) {
                props.jetstream.flash = { error: 'Erro ao atualizar o Produto.' };
            }
        },
    });
};


// Função para resetar o formulário
const cancelForm = () => {
    form.reset();
};


</script>


<template>
    <div class="grid grid-rows-3 grid-flow-col gap-4">
        <div class="row-span-3 col-span-3">

            <div class="px-4 py-4 pb-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
                <form @submit.prevent="updateProduct" enctype="multipart/form-data">


                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3">

                        <!-- Campos do formulário -->
                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="name">Nome:</InputLabel>
                            <TextInput class="mt-1 block w-full" v-model="form.name" @input="updateDescription"
                                id="name" type="text" autocomplete="name" />
                            <InputError class="mt-2" :message="form.errors.name" />
                        </div>

                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="description">Descrição:</InputLabel>
                            <TextInput class="mt-1 block w-full" v-model="form.description" id="description" type="text"
                                readonly />
                            <InputError class="mt-2" :message="form.errors.description" />
                        </div>
                    </div>

                    <!-- Tab buttons -->
                    <div class="flex  mt-4">
                        <button @click.prevent="activeTab = 'info'" :class="{
                            'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'info',
                            'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'info'
                        }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Informações do Produto</button>
                        <button @click.prevent="activeTab = 'rates'" :class="{
                            'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'rates',
                            'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'rates'
                        }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Taxas e Preços</button>
                        <button @click.prevent="activeTab = 'images'" :class="{
                            'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images',
                            'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'images'
                        }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Imagens do Produto</button>
                        <button @click.prevent="activeTab = 'history'" :class="{
                            'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'history',
                            'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'history'
                        }" class="px-4 py-2 rounded-t  focus:outline-none">Histórico de Vendas</button>
                    </div>

                    <!-- Tab content -->
                    <div v-show="activeTab === 'info'">
                        <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                            <!-- Coloque aqui o conteúdo relacionado às informações do produto -->
                            <div
                                class="col-span-1 sm:col-span-3 md:col-span-4 grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">

                                <div class="col-span-1">
                                    <InputLabel for="category_id">Categoria:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.category_id" id="category_id">
                                            <option v-for="category in props.categories" :key="category.id"
                                                :value="category.id">
                                                {{ category.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.category_id" />
                                </div>

                                <div class="col-span-1">
                                    <InputLabel for="subcategory_id">Subcategoria:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.subcategory_id" id="subcategory_id">
                                            <option v-for="subcategory in props.subcategories" :key="subcategory.id"
                                                :value="subcategory.id">
                                                {{ subcategory.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.subcategory_id" />
                                </div>

                                <div class="col-span-1">
                                    <InputLabel for="group_id">Grupo:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.group_id" id="group_id">
                                            <option v-for="group in props.groups" :key="group.id" :value="group.id">
                                                {{ group.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.group_id" />
                                </div>


                                <div class="col-span-1">
                                    <InputLabel for="brand_id">Marca:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.brand_id" @change="updateDescription" id="brand_id">
                                            <option v-for="brand in props.brands" :key="brand.id" :value="brand.id">
                                                {{ brand.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.brand_id" />
                                </div>

                                <div class="col-span-1">
                                    <InputLabel for="color_id">Cor:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.color_id" @change="updateDescription" id="color_id">
                                            <option v-for="color in props.colors" :key="color.id" :value="color.id">
                                                {{ color.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.color_id" />
                                </div>
                                <div class="col-span-1">
                                    <InputLabel for="collection_id">Coleção:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.collection_id" @change="updateDescription" id="collection_id">
                                            <option v-for="collection in props.collections" :key="collection.id"
                                                :value="collection.id">
                                                {{ collection.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.collection_id" />
                                </div>
                                <div class="col-span-1 sm:col-span-2">
                                    <InputLabel for="subgroup_id">Subgrupo:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.subgroup_id" @change="updateDescription" id="subgroup_id">
                                            <option v-for="subgroup in props.subgroups" :key="subgroup.id"
                                                :value="subgroup.id">
                                                {{ subgroup.name }}
                                            </option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.subgroup_id" />
                                </div>


                            </div>
                        </div>
                    </div>

                    <div v-show="activeTab === 'rates'">
                        <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                            <!-- Coloque aqui o conteúdo relacionado às taxas e preços do produto -->
                            <div
                                class="col-span-1 sm:col-span-3 md:col-span-4 grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">

                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="purchase_price">Valor de Compra:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.purchase_price"
                                            id="purchase_price" type="text" />
                                        <InputError class="mt-2" :message="form.errors.purchase_price" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="shipping_value">Frete de Compra:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.shipping_value"
                                            id="shipping_value" type="text" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.shipping_value" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="taxes_gov">taxas Impostos:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.taxes_gov"
                                            id="taxes_gov" type="text" />
                                        <InputError class="mt-2" :message="form.errors.taxes_gov" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="cost_price">Valor de Custo:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.cost_price"
                                            id="cost_price" type="text" />
                                        <InputError class="mt-2" :message="form.errors.cost_price" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="tax_gateway">Gateways Pagamento:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.tax_gateway"
                                            id="tax_gateway" type="text" />
                                        <InputError class="mt-2" :message="form.errors.tax_gateway" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="tax_platform">Platafoma:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.tax_platform"
                                            id="tax_platform" type="text" />
                                        <InputError class="mt-2" :message="form.errors.tax_platform" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="tax_marketplace">Marketplace:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.tax_marketplace"
                                            id="tax_marketplace" type="text" />
                                        <InputError class="mt-2" :message="form.errors.tax_marketplace" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="tax_intermediation">Intermediação:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2"
                                            v-model="form.tax_intermediation" id="tax_intermediation" type="text" />
                                        <InputError class="mt-2" :message="form.errors.tax_intermediation" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="tax_commission">Comissões:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.tax_commission"
                                            id="tax_commission" type="text" />
                                        <InputError class="mt-2" :message="form.errors.tax_commission" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="tax_additional_services">Serviços Adicional:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2"
                                            v-model="form.tax_additional_services" id="tax_additional_services"
                                            type="text" />
                                        <InputError class="mt-2" :message="form.errors.tax_additional_services" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="profit_margin">Margem de lucro:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.profit_margin"
                                            id="profit_margin" type="text" />
                                        <InputError class="mt-2" :message="form.errors.profit_margin" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="freight_sale">Frete Venda:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.freight_sale"
                                            id="freight_sale" type="text" />
                                        <InputError class="mt-2" :message="form.errors.freight_sale" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="icms">ICMS:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.icms" id="icms"
                                            type="text" />
                                        <InputError class="mt-2" :message="form.errors.icms" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="ipi">IPI:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.ipi" id="ipi"
                                            type="text" />
                                        <InputError class="mt-2" :message="form.errors.ipi" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="pis_pasep">Pis Pasep:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.pis_pasep"
                                            id="pis_pasep" type="text" />
                                        <InputError class="mt-2" :message="form.errors.pis_pasep" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="cofins">Confins:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.cofins"
                                            id="cofins" type="text" />
                                        <InputError class="mt-2" :message="form.errors.cofins" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="irpj">IRPJ</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.irpj" id="irpj"
                                            type="text" />
                                        <InputError class="mt-2" :message="form.errors.irpj" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="csll">CSLL:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.csll" id="csll"
                                            type="text" />
                                        <InputError class="mt-2" :message="form.errors.csll" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="sale_price">Valor de Venda:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.sale_price"
                                            id="sale_price" type="text" />
                                        <InputError class="mt-2" :message="form.errors.sale_price" />
                                    </div>
                                </div>
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="stock">Estoque:</InputLabel>
                                        <TextInput class="block w-full text-center mt-2" v-model="form.stock" id="stock"
                                            type="text" />
                                        <InputError class="mt-2" :message="form.errors.stock" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div v-show="activeTab === 'images'">

                        <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                                <!-- Campos do formulário -->
                                <div class="pb-6 col-span-1 sm:col-span-2 md:col-span-2">

                                    <div class="pl-2">
                                        <InputLabel for="launch">Lançamento</InputLabel>
                                        <input id="launch" name="launch" type="checkbox" v-model="form.launch"
                                            class="marker:border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm" />
                                        <InputError class="mt-2" :message="form.errors.stock" />
                                    </div>
                                </div>
                                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                                    <div class="pl-2">
                                        <InputLabel for="promotion">Promoção</InputLabel>
                                        <input id="promotion" name="promotion" type="checkbox" v-model="form.promotion"
                                            class="marker:border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm" />
                                    </div>
                                </div>
                            </div>

                            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                                <!-- Campos do formulário -->
                                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                                    <ImageProductForm />
                                </div>
                                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                                    <ImageHoverProductForm />
                                </div>

                                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                                    <div>
                                        <ImagesProductForm />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div v-show="activeTab === 'history'">
                        <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                            <!-- Coloque aqui o conteúdo relacionado ao histórico de vendas do produto -->
                            <div class="col-span-1 sm:col-span-3 md:col-span-3">
                                <InputLabel for="action_user">Ação:</InputLabel>


                                <textarea
                                    class="form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                    v-model="form.action_user" id="action_user" readonly></textarea>
                                <InputError class="mt-2" :message="form.errors.action_user" />
                            </div>
                        </div>

                    </div>

                    <div class="flex items-center justify-center w-full mt-4">
                        <PrimaryButton @click="cancelForm" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                            Cancelar
                        </PrimaryButton>
                        <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing">
                            Atualizar
                        </ButtonSubmit>
                        <ButtonLink :href="route('products.show')" :active="route().current('products.show')"
                            class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                            Listar
                        </ButtonLink>
                    </div>
                </form>
            </div>
        </div>

    </div>



</template>
