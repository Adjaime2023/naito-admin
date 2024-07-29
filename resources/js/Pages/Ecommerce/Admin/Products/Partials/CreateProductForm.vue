<script setup>
import { ref, watch, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import axios from 'axios';

// Importação dos componentes
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';

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


// Formulário e estado dos campos
const form = useForm({
    name: '',
    description: '',
    sku: '',
    qr_code: '',
    barcode: '',
    purchase_price: null,
    shipping_value: null,
    cost_price: null,
    profit_margin: null,
    freight_sale: null,
    sale_price: null,
    stock: 0,
    image: null,
    image_hover: null,
    launch: false,
    promotion: false,
    promotion_price: null,
    category_id: null,
    subcategory_id: null,
    group_id: null,
    subgroup_id: null,
    collection_id: null,
    brand_id: null,
    color_id: null,
    action_user: actionUser.value,
    discontinued: false,
});


const profit = ref(0);

// Função para calcular o valor do custo
const calculateCostPrice = () => {
    form.cost_price = formatDecimal((parseFloat(form.purchase_price) || 0) + (parseFloat(form.shipping_value) || 0));
};

// Função para calcular o valor de venda
const calculateSalePrice = () => {
    if (form.cost_price && form.profit_margin) {
        form.sale_price = formatDecimal(parseFloat(form.cost_price) * (1 + parseFloat(form.profit_margin) / 100));
    }
};

// Função para calcular a margem de lucro
const calculateProfitMargin = () => {
    if (form.cost_price && form.sale_price) {
        form.profit_margin = formatDecimal(((parseFloat(form.sale_price) - parseFloat(form.cost_price)) / parseFloat(form.cost_price)) * 100);
    }
};

// Função para calcular o lucro
const calculateProfit = () => {
    if (form.sale_price && form.cost_price) {
        profit.value = formatDecimal(parseFloat(form.sale_price) - parseFloat(form.cost_price));
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

// Função para resetar o formulário
const cancelForm = () => {
    form.reset();
};

const defaultImage = '/storage/images/default.png';
const imagePreview = ref(form.image ? `/storage/${form.image}` : defaultImage);
const imageInput = ref(null);

function selectNewImage() {
    imageInput.value.click();
}

function updateImagePreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image = file;
        imagePreview.value = URL.createObjectURL(file);
    } else {
        form.image = null;
        imagePreview.value = defaultImage;
    }
}

function removeImage() {
    form.image = null;
    imagePreview.value = defaultImage;
    imageInput.value.value = null;
}

const submit = () => {
    form.post(route('product.store'), {
        onSuccess: () => {
            form.reset();
            console.log('Formulário enviado com sucesso!');
        },
        onError: (errors) => {
            console.error('Erro ao enviar formulário:', errors);
        }
    });
};

function formatDecimal(value) {
    // Converte para float
    let floatValue = parseFloat(value);
    // Verifica se é um número válido
    if (isNaN(floatValue)) {
        return null;
    }
    // Formata para 2 casas decimais e retorna como string
    return floatValue.toFixed(2);
}

</script>

<template>
    <div class="px-4 py-4 pb-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submit" enctype="multipart/form-data">
            <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">
                <!-- Campos do formulário -->
                <div class="col-span-1">
                    <InputLabel for="name">Nome:</InputLabel>
                    <TextInput class="mt-1 block w-full" v-model="form.name" @input="updateDescription" id="name"
                        type="text" autocomplete="name" />
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
            <div class="flex mt-4">
                <button @click.prevent="activeTab = 'info'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'info',
                    'bg-gray-200 dark:bg-gray-500/50 text-gray-300 dark:text-700': activeTab !== 'info'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Informações do Produto</button>
                <button @click.prevent="activeTab = 'rates'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'rates',
                    'bg-gray-200 dark:bg-gray-500/50 text-gray-300 dark:text-700': activeTab !== 'rates'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Taxas e Preços</button>
                <button @click.prevent="activeTab = 'images'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images',
                    'bg-gray-200 dark:bg-gray-500/50 text-gray-300 dark:text-700': activeTab !== 'images'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Imagens do Produto</button>
                <button @click.prevent="activeTab = 'history'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'history',
                    'bg-gray-200 dark:bg-gray-500/50 text-gray-300 dark:text-700': activeTab !== 'history'
                }" class="px-4 py-2 rounded-t focus:outline-none">Histórico de Vendas</button>
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
                            <InputLabel for="subgroup_id">Subgrupo:</InputLabel>
                            <div class="flex items-center mt-2">
                                <select
                                    class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                    v-model="form.subgroup_id" id="subgroup_id">
                                    <option v-for="subgroup in subgroups" :key="subgroup.id" :value="subgroup.id">
                                        {{ subgroup.name }}
                                    </option>
                                </select>
                            </div>
                            <InputError class="mt-2" :message="form.errors.subgroup_id" />
                        </div>
                        <div class="col-span-1">
                            <InputLabel for="collection_id">Coleção:</InputLabel>
                            <div class="flex items-center mt-2">
                                <select
                                    class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                    v-model="form.collection_id" id="collection_id">
                                    <option v-for="collection in collections" :key="collection.id"
                                        :value="collection.id">
                                        {{ collection.name }}
                                    </option>
                                </select>
                            </div>
                            <InputError class="mt-2" :message="form.errors.collection_id" />
                        </div>
                        <div class="col-span-1">
                            <InputLabel for="brand_id">Marca:</InputLabel>
                            <div class="flex items-center mt-2">
                                <select
                                    class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                    v-model="form.brand_id" id="brand_id">
                                    <option v-for="brand in brands" :key="brand.id" :value="brand.id">
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
                                    v-model="form.color_id" id="color_id">
                                    <option v-for="color in colors" :key="color.id" :value="color.id">
                                        {{ color.name }}
                                    </option>
                                </select>
                            </div>
                            <InputError class="mt-2" :message="form.errors.color_id" />
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
                                <TextInput class="block w-full text-center mt-2" v-model="form.purchase_price"
                                    @blur="formatField('purchase_price')" id="purchase_price" type="number"
                                    step="0.01" />
                                <InputError class="mt-2" :message="form.errors.purchase_price" />
                            </div>
                        </div>

                        <!-- Campo numérico shipping_value -->
                        <div class="col-span-1">
                            <div class="pl-2">
                                <InputLabel for="shipping_value">Valor do Frete:</InputLabel>
                                <TextInput class="block w-full text-center mt-2" v-model="form.shipping_value"
                                    @blur="formatField('shipping_value')" id="shipping_value" type="number"
                                    step="0.01" />
                                <InputError class="mt-2" :message="form.errors.shipping_value" />
                            </div>
                        </div>

                        <!-- Campo numérico cost_price (preenchido automaticamente) -->
                        <div class="col-span-1">
                            <div class="pl-2">
                                <InputLabel for="cost_price">Preço de Custo:</InputLabel>
                                <TextInput class="block w-full text-center mt-2" v-model="form.cost_price"
                                    id="cost_price" type="number" step="0.01" disabled />
                                <InputError class="mt-2" :message="form.errors.cost_price" />
                            </div>
                        </div>

                        <!-- Campo numérico profit_margin -->
                        <div class="col-span-1">
                            <div class="pl-2">
                                <InputLabel for="profit_margin">Margem de Lucro (%):</InputLabel>
                                <TextInput class="block w-full text-center mt-2" v-model="form.profit_margin"
                                    @blur="formatField('profit_margin')" id="profit_margin" type="number" step="0.01" />
                                <InputError class="mt-2" :message="form.errors.profit_margin" />
                            </div>
                        </div>

                        <!-- Campo numérico sale_price -->
                        <div class="col-span-1">
                            <div class="pl-2">
                                <InputLabel for="sale_price">Preço de Venda:</InputLabel>
                                <TextInput class="block w-full text-center mt-2" v-model="form.sale_price"
                                    @blur="formatField('sale_price')" id="sale_price" type="number" step="0.01" />
                                <InputError class="mt-2" :message="form.errors.sale_price" />
                            </div>
                        </div>                     
                        <div class="col-span-1">
                            <div class="pl-2">
                                <InputLabel for="freight_sale">Frete Entrega:</InputLabel>
                                <TextInput class="block w-full text-right mt-2" v-model="form.freight_sale"
                                    id="freight_sale" type="number" step="0.01" />
                                <InputError class="mt-2" :message="form.errors.freight_sale" />
                            </div>
                        </div>
                        <div class="col-span-1">
                            <div class="pl-2">
                                <InputLabel for="stock">Estoque:</InputLabel>
                                <TextInput class="block w-full text-right mt-2" v-model="form.stock" id="stock"
                                    type="number" step="1" />
                                <InputError class="mt-2" :message="form.errors.stock" />
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div v-show="activeTab === 'images'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                    <!-- Coloque aqui o conteúdo relacionado às imagens do produto -->
                    <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-4 gap-4">
                        <div class="col-span-1">
                            <InputLabel for="image">Imagem:</InputLabel>
                            <div class="mt-2">
                                <img :src="imagePreview" alt="Product Image" class="w-32 h-32 object-cover" />
                                <input type="file" ref="imageInput" @change="updateImagePreview" class="hidden" />
                                <button type="button"
                                    class="mt-2 px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700 focus:outline-none"
                                    @click="selectNewImage">Selecionar Imagem</button>
                                <button type="button"
                                    class="mt-2 px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 focus:outline-none"
                                    @click="removeImage">Remover Imagem</button>
                            </div>
                            <InputError class="mt-2" :message="form.errors.image" />
                        </div>
                        <!-- Adicione outros campos de imagem se necessário -->
                    </div>
                </div>
            </div>

            <div v-show="activeTab === 'history'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                    <!-- Coloque aqui o conteúdo relacionado ao histórico de vendas do produto -->
                    <div>
                        <h2 class="text-lg font-medium text-gray-800 dark:text-gray-200 mb-4">Histórico de
                            Vendas</h2>
                        <!-- Conteúdo do histórico -->
                    </div>
                </div>
            </div>

            <div class="flex items-center justify-center w-full mt-4">
                <PrimaryButton @click.prevent="cancelForm" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Cancelar
                </PrimaryButton>
                <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    Cadastrar
                </ButtonSubmit>
                <ButtonLink :href="route('products.show')" :active="route().current('products.show')"
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">

                    Listar
                </ButtonLink>
            </div>
        </form>

    </div>








</template>
