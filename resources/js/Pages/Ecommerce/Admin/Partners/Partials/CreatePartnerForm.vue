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


const form = useForm({
    name: '',
    contact: '',
    email: '',
    whatsapp: '',
    phone: '',
    website: '',
    facebook: '',
    x: '',
    tiktok: '',
    instagram: '',
    cep: '',
    city: '',
    uf: '',
    address: '',
    number: '',
    complement: '',
    neighborhood:'',
    latitude: '',
    longitude: '',
    nivel_zoon: '',
});


// Função para enviar o formulário
const submit = () => {
    form.post(route('partner.store'), {
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
                    <InputLabel for="name">Nome do Parceiro</InputLabel>
                    <TextInput v-model="form.name" id="name" name="name" class="block mt-1 w-full" type="text"
                        required />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="contact">Nome</InputLabel>
                    <TextInput id="contact" name="contact" v-model="form.contact" class="block mt-1 w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.contact" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="email">Email</InputLabel>
                    <TextInput id="email" name="email" v-model="form.email" class="block mt-1 w-full" type="email" />
                    <InputError class="mt-2" :message="form.errors.email" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="phone">Telefone</InputLabel>
                    <TextInput id="phone" name="phone" v-mask="['(##) ####-####', '(##) #####-####']"
                        v-model="form.phone" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.phone" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="whatsapp">WhatsApp</InputLabel>
                    <TextInput id="whatsapp" name="whatsapp" v-model="form.whatsapp" class="block mt-1 w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.whatsapp" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="facebook">Facebook</InputLabel>
                    <TextInput id="facebook" name="facebook" v-model="form.facebook" class="block mt-1 w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.facebook" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="x">X</InputLabel>
                    <TextInput id="x" name="x" v-model="form.x" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.x" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="tiktok">TicToc</InputLabel>
                    <TextInput id="tiktok" name="tiktok" v-model="form.tiktok" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.tiktok" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="instagram">Instagram</InputLabel>
                    <TextInput id="instagram" name="instagram" v-model="form.instagram" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.instagram" />
                </div>


                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="website">Site</InputLabel>
                    <TextInput id="website" name="website" v-model="form.website" class="block mt-1 w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.website" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="cep">CEP</InputLabel>
                    <div class="relative flex">
                        <TextInput id="cep" name="cep" v-mask="'#####-###'" v-model="form.cep" class="block w-full py-2"
                            type="text" />
                        <button type="button" @click="buscarEnderecoPorCEP"
                            class="absolute top-0 right-0 underline-offset-2 pt-2 pb-3  px-2 space-x-2 text-sm  partner_type  bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500   hover:dark:from-cyan-600 hover:dark:to-blue-600  bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100 rounded-r">Buscar</button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.cep" />
                </div>

                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="city">Cidade</InputLabel>
                    <TextInput id="city" name="city" v-model="form.city" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.city" />
                </div>

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
                    <TextInput id="complement" name="complement" v-model="form.complement" class="form-control w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.complement" />
                </div>

                <div>
                    <InputLabel for="neighborhood">Bairro</InputLabel>
                    <TextInput id="neighborhood" name="neighborhood" v-model="form.neighborhood"
                        class="form-control w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.neighborhood" />
                </div>
                <div>
                    <InputLabel for="latitude">Latitude</InputLabel>
                    <TextInput id="latitude" name="latitude" v-model="form.latitude" class="form-control w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.latitude" />
                </div>
                <div>
                    <InputLabel for="longitude">Longitude</InputLabel>
                    <TextInput id="longitude" name="longitude" v-model="form.longitude" class="form-control w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.longitude" />
                </div>
                <div>
                    <InputLabel for="nivel_zoon">Nivel de Zoom</InputLabel>
                    <TextInput id="nivel_zoon" name="nivel_zoon" v-model="form.nivel_zoon" class="form-control w-full"
                        type="text" />
                    <InputError class="mt-2" :message="form.errors.nivel_zoon" />
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
                <ButtonLink :href="route('partners.show')" :active="route().current('partners.show')"
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
