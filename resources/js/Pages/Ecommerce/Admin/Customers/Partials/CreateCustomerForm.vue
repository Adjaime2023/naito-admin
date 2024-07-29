<script setup>
import { ref, onMounted, computed } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/Partials/PrimaryButton.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import { mask } from 'vue-the-mask';

const { props } = usePage();

const customerTypes = ref(props.customerTypes);
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

const resetFormFields = () => {
    form.reset();
};

const cancelForm = () => {
    resetFormFields();
    const cancelMessage = 'Cadastro cancelado, os campos foram limpos';
    console.log(cancelMessage, message.value);

    props.jetstream.flash = { bannerStyle: 'success', banner: cancelMessage };
};

const person_type = ref('Fisica');
const options = [
    { label: 'Física', value: 'Fisica' },
    { label: 'Jurídica', value: 'Juridica' }
];

const toggleLabel = () => {
    if (person_type.value === 'Fisica') {
        console.log('Pessoa Física selecionada');
    } else if (person_type.value === 'Juridica') {
        console.log('Pessoa Jurídica selecionada');
    }
};

const form = useForm({
    name: '',
    person_type: 'Fisica',
    document_number: '',
    identification_number: '',
    contact_name: '',
    email: '',
    whatsapp: '',
    phone: '',
    cep: '',
    city: '',
    uf: '',
    address: '',
    number: '',
    complement: '',
    neighborhood: '',
    customer_type_id: '',
    image: null,
    action_user: actionUser.value,
});


// Caminho padrão para a imagem
const defaultImage = '/storage/images/default.png';

// Verifica se há uma imagem existente na categoria, caso contrário usa a imagem padrão
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


// Função para enviar o formulário
const submit = () => {
    form.post(route('customer.store'), {
        onSuccess: () => {
            form.reset();
            console.log('Formulário enviado com sucesso!');
        },
        onError: (errors) => {
            console.error('Erro ao enviar formulário:', errors);
        }
    });
};


const buscarEnderecoPorCEP = async () => {
    try {
        if (!form.cep || form.cep.replace(/\D/g, '').length < 8) {
            throw new Error('Erro na digitação do CEP. Por favor, verifique e tente novamente.');
        }

        const cep = form.cep.replace(/\D/g, '');
        const response = await fetch(`https://viacep.com.br/ws/${cep}/json/`);

        if (!response.ok) {
            throw new Error('Erro ao buscar o CEP. Por favor, tente novamente.');
        }

        const endereco = await response.json();

        if (endereco.erro) {
            throw new Error('CEP não encontrado ou inexistente.');
        }

        if (endereco && !endereco.erro) {
            form.address = endereco.logradouro || '';
            form.complement = endereco.complemento || '';
            form.neighborhood = endereco.bairro || '';
            form.city = endereco.localidade || '';
            form.uf = endereco.uf || '';

            console.log('Endereço encontrado:', endereco);

            props.jetstream.flash = { message: 'Endereço encontrado com sucesso!' };
        } else {
            props.jetstream.flash = { error: 'CEP não encontrado ou inexistente.' };
        }
    } catch (error) {
        console.error('Erro ao buscar o CEP:', error.message);
        props.jetstream.flash = { error: error.message };
    }
};
</script>


<template>
    <div class="px-4 py-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">

        <form @submit.prevent="submit" enctype="multipart/form-data">

            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="name">Nome do Cliente</InputLabel>
                    <TextInput v-model="form.name" id="name" name="name" class="block mt-1 w-full" type="text"
                        required />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="customer_type_id">Tipo de Cliente:</InputLabel>
                    <div class="flex items-center mt-1">
                        <select
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                            v-model="form.customer_type_id" id="customer_type_id">
                            <option v-for="customer_type in customerTypes" :key="customer_type.id"
                                :value="customer_type.id">
                                {{ customer_type.name }}
                            </option>
                        </select>
                    </div>
                    <InputError class="mt-2" :message="form.errors.customer_type_id" />
                </div>
                <div class=" col-span-1">
                    <InputLabel for="name">Pessoa</InputLabel>
                    <div class="flex items-center mt-3">
                        <label :for="'person_type_' + index" v-for="(item, index) in options" :key="index"
                            class="inline-flex items-center mx-5 text-gray-600 dark:text-gray-400">
                            <input type="radio" :id="'person_type_' + index" name="person_type"
                                class="form-control border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                :value="item.value" v-model="form.person_type" @change="toggleLabel" />
                            <span class="ml-1">{{ item.label }}</span>
                        </label>
                    </div>
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="document_number">{{ form.person_type === 'Fisica' ? 'CPF' : 'CNPJ' }}
                    </InputLabel>
                    <TextInput id="document_number" name="document_number" v-model="form.document_number"
                        v-mask="['###.###.###-##', '##.###.###/####-##']" class="form-control w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.document_number" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="identification_number">{{ form.person_type === 'Fisica' ? 'Documento Identidade' :
                        'Inscrição Estadual' }}</InputLabel>
                    <TextInput id="identification_number" name="identification_number"
                        v-model="form.identification_number" class="form-control w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.identification_number" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="contact_name">Nome de Contato</InputLabel>
                    <TextInput id="contact_name" name="contact_name" v-model="form.contact_name"
                        class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.contact_name" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="email">Email de Contato</InputLabel>
                    <TextInput id="email" name="email" v-model="form.email" class="block mt-1 w-full" type="email" />
                    <InputError class="mt-2" :message="form.errors.email" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="whatsapp">WhatsApp de Contato</InputLabel>
                    <TextInput id="whatsapp" name="whatsapp" v-mask="['(##) ####-####', '(##) #####-####']"
                        v-model="form.whatsapp" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.whatsapp" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="phone">Telefone de Contato</InputLabel>
                    <TextInput id="phone" name="phone" v-mask="['(##) ####-####', '(##) #####-####']"
                        v-model="form.phone" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.phone" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="cep">CEP</InputLabel>
                    <div class="relative flex">
                        <TextInput id="cep" name="cep" v-mask="'#####-###'" v-model="form.cep" class="block w-full"
                            type="text" />
                        <button type="button" @click="buscarEnderecoPorCEP"
                            class="absolute top-0 right-0 underline-offset-2 pt-2 pb-3  px-2 space-x-2 text-sm  customer_type  bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500   hover:dark:from-cyan-600 hover:dark:to-blue-600  bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100 rounded-r">
                            Buscar</button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.cep" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="city">Cidade</InputLabel>
                    <TextInput id="city" name="city" v-model="form.city" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.city" />
                </div>
            </div>
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">

                <!-- Seção dos Campos do Formulário -->
                <div class="lg:col-span-3">
                    <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-3 gap-3">

                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="uf">UF</InputLabel>
                            <TextInput id="uf" name="uf" v-model="form.uf" class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.uf" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="address">Endereço</InputLabel>
                            <TextInput id="address" name="address" v-model="form.address" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.address" />
                        </div>
                        <div>
                            <InputLabel for="number">Número</InputLabel>
                            <TextInput id="number" name="number" v-model="form.number" class="form-control w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.number" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-2">
                            <InputLabel for="complement">Complemento</InputLabel>
                            <TextInput id="complement" name="complement" v-model="form.complement"
                                class="form-control w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.complement" />
                        </div>

                        <div>
                            <InputLabel for="neighborhood">Bairro</InputLabel>
                            <TextInput id="neighborhood" name="neighborhood" v-model="form.neighborhood"
                                class="form-control w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.neighborhood" />
                        </div>


                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="action_user">Ação:</InputLabel>


                            <textarea
                                class="form-control mt-1 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                v-model="form.action_user" id="action_user" readonly></textarea>
                            <InputError class="mt-2" :message="form.errors.action_user" />
                        </div>


                    </div>
                </div>

                <!-- Seção da Imagem -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <div>

                        <input id="image" ref="imageInput" type="file" class="hidden" @change="updateImagePreview">

                        <InputLabel for="image" value="Imagem" />


                        <div class="flex justify-center mt-2 relative w-full"
                            style="padding-bottom: 56.25%; height: 0;">
                            <img :src="imagePreview" :alt="form.name"
                                class="rounded absolute top-0 left-0 w-full h-full object-contain">
                        </div>

                        <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImage">
                            Selecionar Nova Imagem
                        </SecondaryButton>

                        <SecondaryButton v-if="form.image" type="button" class="mt-2" @click.prevent="removeImage">
                            Remover Imagem
                        </SecondaryButton>

                        <InputError :message="form.errors.image" class="mt-2" />
                    </div>
                </div>

            </div>

            <!-- Botões de Ação -->
            <div class="flex items-center justify-center w-full mt-4">
                <PrimaryButton @click.prevent="cancelForm" class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Cancelar
                </PrimaryButton>
                <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    Cadastrar
                </ButtonSubmit>
                <ButtonLink :href="route('customers.show')" :active="route().current('customers.show')"
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Listar
                </ButtonLink>
            </div>

        </form>

    </div>
</template>

<script>
export default {
    directives: { mask },
};
</script>
