<script setup>
import { ref, onMounted, defineProps, computed } from 'vue';
import { useForm } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';

const props = defineProps({
    data: Object,
});
const users = ref(props.users);

const message = ref('');
onMounted(() => {
    message.value = props.jetstream?.flash?.message || '';
    props.jetstream.flash = null;
});

const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Criado por: ${userName} em ${new Date().toLocaleString()}`;
});
const title = ref('Cadastrar Nota de Entrada');

// Form for XML upload
const xmlForm = useForm({
    xml_file: null,
});

// Form for NF-e data
const form = useForm({
    chave_acesso: '',
    numero: '',
    serie: '',
    data_emissao: '',
    data_recebimento: '',
    nome_emitente: '',
    cnpj_emitente: '',
    nome_destinatario: '',
    cnpj_destinatario: '',
    valor_total: '',
    valor_icms: '',
    items: [  ],
});


// On component mount, populate the form with data if provided
onMounted(() => {
    if (props.data) {
        form.chave_acesso = props.data.chave_acesso || '';
        form.numero = props.data.numero || '';
        form.serie = props.data.serie || '';
        form.data_emissao = formatDate(props.data.data_emissao);
        form.data_recebimento = formatDate(props.data.data_recebimento);
        form.nome_emitente = props.data.nome_emitente || '';
        form.cnpj_emitente = props.data.cnpj_emitente || '';
        form.nome_destinatario = props.data.nome_destinatario || '';
        form.cnpj_destinatario = props.data.cnpj_destinatario || '';
        form.valor_total = props.data.valor_total || 0;
        form.valor_icms = props.data.valor_icms || 0;
        form.items = props.data.items || [];
    }
});

const formatDate = (dateTimeString) => {
    if (!dateTimeString) return '';
    const date = new Date(dateTimeString);
    return date.toISOString().split('T')[0]; // Returns the date in yyyy-MM-dd format
};

// Submit XML form
const submitXmlForm = () => {
    xmlForm.post(route('nfe-entrada.import'), {
        onSuccess: (response) => {
            if (response.props.data) {
                form.chave_acesso = response.props.data.chave_acesso || '';
                form.numero = response.props.data.numero || '';
                form.serie = response.props.data.serie || '';
                form.data_emissao = formatDate(response.props.data.data_emissao);
                form.data_recebimento = formatDate(response.props.data.data_recebimento);
                form.nome_emitente = response.props.data.nome_emitente || '';
                form.cnpj_emitente = response.props.data.cnpj_emitente || '';
                form.nome_destinatario = response.props.data.nome_destinatario || '';
                form.cnpj_destinatario = response.props.data.cnpj_destinatario || '';
                form.valor_total = response.props.data.valor_total || 0;
                form.valor_icms = response.props.data.valor_icms || 0;
                form.items = response.props.data.items || [];
            }
        },
        onError: (errors) => {
            console.log('XML upload failed', errors);
        }
    });
};

// Submit NF-e data form
const submitForm = () => {
    // Implement a validation function if needed
    if (validateForm()) {
        form.post(route('nfe-entrada.store'), {
            onSuccess: (response) => {
                console.log('Form submitted successfully', response);
            },
            onError: (errors) => {
                console.log('Form submission failed', errors);
            }
        });
    } else {
        console.log('Form validation failed');
    }
};

// Add a new item to the form
const addItem = () => {
    form.items.push({
        product_id: null,
        codigo_produto: '',
        descricao: '',
        ncm: '',
        cst: '',
        cfop: '',
        unidade: '',
        quantidade: '',
        valor_unitario: '',
        valor_total: '',
        action_user: actionUser.value,
        discontinued: false,
    });
};

// Remove an item from the form
const removeItem = (index) => {
    form.items.splice(index, 1);
};

// Validation function example
const validateForm = () => {
    // Example validation logic
    return form.chave_acesso && form.numero && form.data_emissao && form.data_recebimento;
};
</script>


<template>
    <div class="px-4 py-4 pb-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <!-- XML upload form -->
        <div>
            <form @submit.prevent="submitXmlForm" enctype="multipart/form-data">
                <div class="grid grid-cols-1">
                    <InputLabel for="xml_file">Upload XML da NF-e:</InputLabel>
                    <TextInput id="xml_file" type="file" @change="e => xmlForm.xml_file = e.target.files[0]" accept=".xml" required />
                    <InputError class="mt-2" :message="xmlForm.errors.xml_file" />
                </div>
                <div class="flex items-center justify-center w-full mt-4">
                    <ButtonSubmit class="px-4" type="submit">Importar Produtos</ButtonSubmit>
                </div>
            </form>
        </div>
        
        <!-- Form to fill out the fields -->
        <form @submit.prevent="submitForm" enctype="multipart/form-data">
            
            <div class="my-2 px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-lg">
                <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="chave_acesso">Chave de Acesso</InputLabel>
                        <TextInput id="chave_acesso" v-model="form.chave_acesso" class="block mt-1 w-full" type="text" required />
                        <InputError class="mt-2" :message="form.errors.chave_acesso" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="numero">Número</InputLabel>
                        <TextInput id="numero" v-model="form.numero" class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.numero" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="serie">Série</InputLabel>
                        <TextInput id="serie" v-model="form.serie" class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.serie" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="data_emissao">Data de Emissão</InputLabel>
                        <TextInput id="data_emissao" v-model="form.data_emissao" class="block mt-1 w-full" type="date" />
                        <InputError class="mt-2" :message="form.errors.data_emissao" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="data_recebimento">Data de Recebimento</InputLabel>
                        <TextInput id="data_recebimento" v-model="form.data_recebimento" class="block mt-1 w-full" type="date" />
                        <InputError class="mt-2" :message="form.errors.data_recebimento" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="nome_emitente">Nome do Emitente</InputLabel>
                        <TextInput id="nome_emitente" v-model="form.nome_emitente" class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.nome_emitente" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="cnpj_emitente">CNPJ do Emitente</InputLabel>
                        <TextInput id="cnpj_emitente" v-model="form.cnpj_emitente" class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.cnpj_emitente" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="nome_destinatario">Nome do Destinatário</InputLabel>
                        <TextInput id="nome_destinatario" v-model="form.nome_destinatario" class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.nome_destinatario" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="cnpj_destinatario">CNPJ do Destinatário</InputLabel>
                        <TextInput id="cnpj_destinatario" v-model="form.cnpj_destinatario" class="block mt-1 w-full" type="text" />
                        <InputError class="mt-2" :message="form.errors.cnpj_destinatario" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="valor_total">Valor Total</InputLabel>
                        <TextInput id="valor_total" v-model="form.valor_total" class="block mt-1 w-full" type="number" />
                        <InputError class="mt-2" :message="form.errors.valor_total" />
                    </div>
                    <!-- Campos do formulário -->
                    <div class="col-span-1 sm:col-span-1 md:col-span-1">
                        <InputLabel for="valor_icms">Valor ICMS</InputLabel>
                        <TextInput id="valor_icms" v-model="form.valor_icms" class="block mt-1 w-full" type="number" />
                        <InputError class="mt-2" :message="form.errors.valor_icms" />
                    </div>
                </div>

                <!-- Botão para adicionar item -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1 mt-4">
                    <PrimaryButton @click.prevent="addItem">Adicionar Item</PrimaryButton>
                </div>
            </div>
            
                <!-- Table of items -->
            <div class="flex flex-col px-4 py-4 pb-6 bg-gray-100 dark:bg-gray-900 rounded-lg">
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                        <thead class="bg-gray-50 dark:bg-gray-700">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Código Produto</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Descrição</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">NCM</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">CST</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">CFOP</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Unidade</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantidade</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Valor Unitário</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Valor Total</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Ações</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                            <tr v-for="(item, index) in form.items" :key="index">
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.codigo_produto" type="text" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.codigo_produto`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.descricao" type="text" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.descricao`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.ncm" type="text" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.ncm`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.cst" type="text" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.cst`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.cfop" type="text" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.cfop`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.unidade" type="text" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.unidade`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.quantidade" type="number" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.quantidade`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.valor_unitario" type="number" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.valor_unitario`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 dark:text-gray-200">
                                    <TextInput v-model="item.valor_total" type="number" class="mt-1 w-full" />
                                    <InputError class="mt-2" :message="form.errors[`items.${index}.valor_total`]" />
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                    <button type="button" @click="removeItem(index)" class="text-red-600 hover:text-red-900">Remover</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Add Item button -->
            <div class="flex items-center justify-center w-full">
                <PrimaryButton class="mt-4" type="button" @click="addItem">Adicionar Item</PrimaryButton>
            </div>


            <!-- Submit form -->
            <div class="flex items-center justify-center w-full mt-4">
                <ButtonSubmit class="px-4" type="submit">Salvar NF-e</ButtonSubmit>
            </div>
        </form>
    </div>
</template>
