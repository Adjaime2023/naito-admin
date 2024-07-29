<script setup>
import { ref, computed, onMounted, watch } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ImageProductForm from './ImageProductForm.vue';
import ImagesProductForm from './ImagesProductForm.vue';
import ImageHoverProductForm from './ImageHoverProductForm.vue';



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


const formatter = (value) => {
    if (value === null || value === undefined) {
        return '';
    }
    // Formata o valor para duas casas decimais
    const formattedValue = parseFloat(value).toFixed(2);
    // Adiciona ponto como separador de milhar
    return formattedValue.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
};

// Inicialização do formulário com useForm e aplicação do formatter
const form = useForm({
    _method: 'PUT',
    id: props.product.id,
    name: props.product.name,
    description: props.product.description,
    sku: props.product.sku,
    qr_code: props.product.qr_code,
    barcode: props.product.barcode,
    purchase_price: formatter(props.product.purchase_price),
    shipping_value: formatter(props.product.shipping_value),
    cost_price: formatter(props.product.cost_price),
    profit_margin: formatter(props.product.profit_margin),
    freight_sale: formatter(props.product.freight_sale),
    sale_price: formatter(props.product.sale_price),
    stock: props.product.stock !== null ? props.product.stock : 0,
    launch: props.product.launch == 1 ? true : false,
    promotion: props.product.promotion == 1 ? true : false,
    promotion_price: formatter(props.product.promotion_price),
    category_id: props.product.category_id,
    subcategory_id: props.product.subcategory_id,
    group_id: props.product.group_id,
    subgroup_id: props.product.subgroup_id,
    collection_id: props.product.collection_id,
    brand_id: props.product.brand_id,
    color_id: props.product.color_id,
    action_user: computed(() => `Atualizado por: ${props.auth.user?.name || 'Desconhecido'} em ${new Date().toLocaleString()} | ${props.product.action_user || ''}`),
    discontinued: props.product.discontinued == 1 ? true : false,
});


const profit = ref(0);

// Função para calcular o valor do custo
const calculateCostPrice = () => {
    form.cost_price = formatter((parseFloat(form.purchase_price) || 0) + (parseFloat(form.shipping_value) || 0));
};

// Função para calcular o valor de venda
const calculateSalePrice = () => {
    if (form.cost_price && form.profit_margin) {
        form.sale_price = formatter(parseFloat(form.cost_price) * (1 + parseFloat(form.profit_margin) / 100));
    }
};

// Função para calcular a margem de lucro
const calculateProfitMargin = () => {
    if (form.cost_price && form.sale_price) {
        form.profit_margin = formatter(((parseFloat(form.sale_price) - parseFloat(form.cost_price)) / parseFloat(form.cost_price)) * 100);
    }
};

// Função para calcular o lucro
const calculateProfit = () => {
    if (form.sale_price && form.cost_price) {
        profit.value = formatter(parseFloat(form.sale_price) - parseFloat(form.cost_price));
    }
};

// Observadores para recalcular o valor do custo e do valor de venda automaticamente
watch(() => form.purchase_price, () => {
    calculateCostPrice();
    calculateSalePrice();
    calculateProfit();
});

watch(() => form.shipping_value, () => {
    calculateCostPrice();
    calculateSalePrice();
    calculateProfit();
});

watch(() => form.profit_margin, () => {
    calculateSalePrice();
    calculateProfit();
});

// Observador para recalcular a margem de lucro e o lucro automaticamente
watch(() => form.sale_price, () => {
    calculateProfitMargin();
    calculateProfit();
});


// Função para atualizar o produto
const updateProduct = async () => {
  try {
    const response = await form.put(route('product.update', form.id), {
      // Dados a serem enviados para a rota de atualização
      onSuccess: () => {
        console.log('Produto atualizado com sucesso');
      },
      onError: (errors) => {
        console.error('Erro ao atualizar o produto:', errors);
      },
    });
  } catch (error) {
    console.error('Um erro inesperado ocorreu:', error);
  }
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
                            <TextInput class="mt-1 block w-full bg-gray-200" v-model="form.description" id="description"
                                type="text" readonly />
                            <InputError class="mt-2" :message="form.errors.description" />
                        </div>
                    </div>
                    <!-- Tab buttons -->
                    <div class="flex mt-4">
                        <button @click.prevent="activeTab = 'info'"
                            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'info', 'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'info' }"
                            class="px-4 py-2 mr-2 rounded-t focus:outline-none">Informações do Produto</button>
                        <button @click.prevent="activeTab = 'rates'"
                            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'rates', 'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'rates' }"
                            class="px-4 py-2 mr-2 rounded-t focus:outline-none">Valores do Produto</button>
                        <button @click.prevent="activeTab = 'images'"
                            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images', 'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'images' }"
                            class="px-4 py-2 mr-2 rounded-t focus:outline-none">Imagens do Produto</button>
                        <button @click.prevent="activeTab = 'history'"
                            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'history', 'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'history' }"
                            class="px-4 py-2 rounded-t focus:outline-none">Histórico de Vendas</button>
                    </div>
                    <!-- Tab content -->
                    <div v-show="activeTab === 'info'">
                        <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                            <div
                                class="col-span-1 sm:col-span-3 md:col-span-4 grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">
                                <div class="col-span-1">
                                    <InputLabel for="category_id">Categoria:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.category_id" id="category_id">
                                            <option v-for="category in props.categories" :key="category.id"
                                                :value="category.id">{{ category.name }}</option>
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
                                                :value="subcategory.id">{{ subcategory.name }}</option>
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
                                            <option v-for="group in props.groups" :key="group.id" :value="group.id">{{
                                                group.name }}</option>
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
                                            <option v-for="brand in props.brands" :key="brand.id" :value="brand.id">{{
                                                brand.name }}</option>
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
                                            <option v-for="color in props.colors" :key="color.id" :value="color.id">{{
                                                color.name }}</option>
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
                                                :value="collection.id">{{ collection.name }}</option>
                                        </select>
                                    </div>
                                    <InputError class="mt-2" :message="form.errors.collection_id" />
                                </div>
                                <div class="col-span-1">
                                    <InputLabel for="subgroup_id">Subgrupo:</InputLabel>
                                    <div class="flex items-center mt-2">
                                        <select
                                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                            v-model="form.subgroup_id" @change="updateDescription" id="subgroup_id">
                                            <option v-for="subgroup in props.subgroups" :key="subgroup.id"
                                                :value="subgroup.id">{{ subgroup.name }}</option>
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

                                <!-- Campo numérico purchase_price -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="purchase_price">Preço de Compra:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.purchase_price"
                                            id="purchase_price" type="number" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.purchase_price" />
                                    </div>
                                </div>

                                <!-- Campo numérico shipping_value -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="shipping_value">Valor do Frete:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.shipping_value"
                                            id="shipping_value" type="number" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.shipping_value" />
                                    </div>
                                </div>

                                <!-- Campo numérico cost_price (preenchido automaticamente) -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="cost_price">Preço de Custo:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.cost_price"
                                            id="cost_price" type="number" step="0.01" disabled />
                                        <InputError class="mt-2" :message="form.errors.cost_price" />
                                    </div>
                                </div>

                                <!-- Campo numérico profit_margin -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="profit_margin">Margem de Lucro (%):</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.profit_margin"
                                            id="profit_margin" type="number" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.profit_margin" />
                                    </div>
                                </div>

                                <!-- Campo numérico sale_price -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="sale_price">Preço de Venda:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.sale_price"
                                            id="sale_price" type="number" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.sale_price" />
                                    </div>
                                </div>

                                <!-- Campo para exibir o lucro (preenchido automaticamente) -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="profit">Lucro:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" :value="formatter(form.sale_price - form.cost_price)" id="profit"
                                            type="number" step="0.01" disabled />
                                    </div>
                                </div>

                                <!-- Campo numérico freight_sale -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="freight_sale">Frete Entrega:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.freight_sale"
                                            id="freight_sale" type="number" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.freight_sale" />
                                    </div>
                                </div>

                                <!-- Campo numérico stock -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="stock">Estoque:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.stock" id="stock"
                                            type="number" />
                                        <InputError class="mt-2" :message="form.errors.stock" />
                                    </div>
                                </div>

                                <!-- Campo numérico promotion_price -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="promotion_price">Preço Promocional:</InputLabel>
                                        <TextInput class="block w-full text-end mt-2" v-model="form.promotion_price"
                                            id="promotion_price" type="number" step="0.01" />
                                        <InputError class="mt-2" :message="form.errors.promotion_price" />
                                    </div>
                                </div>

                                <!-- Campo booleano launch -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="launch">Lançamento:</InputLabel>
                                        <input class="block mt-2" v-model="form.launch" id="launch" type="checkbox" />
                                        <InputError class="mt-2" :message="form.errors.launch" />
                                    </div>
                                </div>

                                <!-- Campo booleano promotion -->
                                <div class="col-span-1">
                                    <div class="pl-2">
                                        <InputLabel for="promotion">Promoção:</InputLabel>
                                        <input class="block mt-2" v-model="form.promotion" id="promotion"
                                            type="checkbox" />
                                        <InputError class="mt-2" :message="form.errors.promotion" />
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <div v-show="activeTab === 'images'">

                        <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">




                            <div
                                class="col-span-1 sm:col-span-1 md:col-span-4 grid grid-cols-1 sm:grid-cols-1 md:grid-cols-4 gap-4">
                                <!-- Campos do formulário -->
                                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                                    <ImageProductForm />
                                </div>
                                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                                    <ImageHoverProductForm />
                                </div>

                                <div class="col-span-1 sm:col-span-1 md:col-span-2">
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
                        <ButtonLink :href="route('product.create')" :active="route().current('product.create')"
                            class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                            Novo
                        </ButtonLink>
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
