<script setup>
import { ref, onMounted, defineProps } from 'vue';
import { useForm, Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ItemNfeForm from './Partials/ItemNfeForm.vue';

const title = ref('Editar Nota de Entrada');

const xmlForm = useForm({
    xml_file: null,
});
const props = defineProps({
    data: Object,
});

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
    valor_total: 0,
    valor_icms: 0,
    itens: []
});

onMounted(() => {
    if (props.data) {
        form.chave_acesso = props.data.chave_acesso;
        form.numero = props.data.numero;
        form.serie = props.data.serie;
        form.data_emissao = props.data.data_emissao;
        form.data_recebimento = props.data.data_recebimento;
        form.nome_emitente = props.data.nome_emitente;
        form.cnpj_emitente = props.data.cnpj_emitente;
        form.nome_destinatario = props.data.nome_destinatario;
        form.cnpj_destinatario = props.data.cnpj_destinatario;
        form.valor_total = props.data.valor_total;
        form.valor_icms = props.data.valor_icms;
        form.itens = props.data.itens;
    }
});

const submitForm = () => {
    form.put(route('nfe-entrada.update', props.data.id));
};

// Function to add an item to the NF-e items list
const addItem = () => {
    form.itens.push({
        codigo_produto: '',
        descricao: '',
        ncm: '',
        cst: '',
        cfop: '',
        unidade: '',
        quantidade: '',
        valor_unitario: '',
        valor_total: '',
    });
};

// Function to remove an item from the NF-e items list
const removeItem = (index) => {
    form.itens.splice(index, 1);
};

const submitXmlForm = () => {
    xmlForm.post(route('nfe.import'), {
        onSuccess: (response) => {
            if (response.data) {
                Object.assign(form, response.data);
            }
        },
        onError: (errors) => {
            console.error('XML Import Error:', errors);
            // Display user-friendly error message
        }
    });
};

</script>

<template>
    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
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
                    <form @submit.prevent="submitForm">
                        <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-4 gap-4">
                            <div class="col-span-1 md:col-span-2">
                                <InputLabel for="chave_acesso">Chave de Acesso</InputLabel>
                                <TextInput id="chave_acesso" v-model="form.chave_acesso" type="text" required />
                                <InputError class="mt-2" :message="form.errors.chave_acesso" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="numero">Número</InputLabel>
                                <TextInput id="numero" v-model="form.numero" type="text" />
                                <InputError class="mt-2" :message="form.errors.numero" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="serie">Série</InputLabel>
                                <TextInput id="serie" v-model="form.serie" type="text" />
                                <InputError class="mt-2" :message="form.errors.serie" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="data_emissao">Data de Emissão</InputLabel>
                                <TextInput id="data_emissao" v-model="form.data_emissao" type="text" />
                                <InputError class="mt-2" :message="form.errors.data_emissao" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="data_recebimento">Data de Recebimento</InputLabel>
                                <TextInput id="data_recebimento" v-model="form.data_recebimento" type="text" />
                                <InputError class="mt-2" :message="form.errors.data_recebimento" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="nome_emitente">Nome do Emitente</InputLabel>
                                <TextInput id="nome_emitente" v-model="form.nome_emitente" type="text" />
                                <InputError class="mt-2" :message="form.errors.nome_emitente" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="cnpj_emitente">CNPJ do Emitente</InputLabel>
                                <TextInput id="cnpj_emitente" v-model="form.cnpj_emitente" type="text" />
                                <InputError class="mt-2" :message="form.errors.cnpj_emitente" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="nome_destinatario">Nome do Destinatário</InputLabel>
                                <TextInput id="nome_destinatario" v-model="form.nome_destinatario" type="text" />
                                <InputError class="mt-2" :message="form.errors.nome_destinatario" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="cnpj_destinatario">CNPJ do Destinatário</InputLabel>
                                <TextInput id="cnpj_destinatario" v-model="form.cnpj_destinatario" type="text" />
                                <InputError class="mt-2" :message="form.errors.cnpj_destinatario" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="valor_total">Valor Total</InputLabel>
                                <TextInput id="valor_total" v-model="form.valor_total" type="text" />
                                <InputError class="mt-2" :message="form.errors.valor_total" />
                            </div>
                            <div class="col-span-1">
                                <InputLabel for="valor_icms">Valor ICMS</InputLabel>
                                <TextInput id="valor_icms" v-model="form.valor_icms" type="text" />
                                <InputError class="mt-2" :message="form.errors.valor_icms" />
                            </div>
                        </div>

                        <div class="my-6">
                            <h2 class="text-lg font-semibold">Itens da NF-e</h2>
                            <div v-for="(item, index) in form.itens" :key="index"
                                class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mt-4">
                                <ItemNfeForm :item="item" :index="index" @remove-item="removeItem" />
                            </div>
                            <div class="flex justify-end mt-4">
                                <PrimaryButton type="button" @click="addItem">Adicionar Item</PrimaryButton>
                            </div>
                        </div>

                        <div class="flex justify-end mt-6">
                            <ButtonSubmit type="submit">Salvar NF-e</ButtonSubmit>
                        </div>
                    </form>
                </div>
            </Main>
        </div>
    </AppLayout>
</template>
