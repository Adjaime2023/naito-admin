<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="updateCompany" enctype="multipart/form-data">
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="name">Nome do Empresa</InputLabel>
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
            </div>
            <!-- Tab buttons -->
            <div class="flex mt-4">
                <button @click.prevent="activeTab = 'info'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'info',
                    'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'info'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Informações da Empresa</button>
                <button @click.prevent="activeTab = 'about'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'about',
                    'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'about'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Sobre Nós</button>
                <button @click.prevent="activeTab = 'images'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images',
                    'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'images'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Imagens</button>
                <button @click.prevent="activeTab = 'images_about'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images_about',
                    'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'images_about'
                }" class="px-4 py-2 mr-2 rounded-t focus:outline-none">Imagens Sobre nós</button>
                <button @click.prevent="activeTab = 'images_footer'" :class="{
                    'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images_footer',
                    'bg-gray-300/50 dark:bg-gray-600/50 text-gray-400 dark:text-700': activeTab !== 'images_footer'
                }" class="px-4 py-2 rounded-t focus:outline-none">Imagens Rodapé</button>
            </div>


            <!-- Tab content -->
            <div v-show="activeTab === 'info'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                    <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
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
                            <TextInput id="tiktok" name="tiktok" v-model="form.tiktok" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.tiktok" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="instagram">Instagram</InputLabel>
                            <TextInput id="instagram" name="instagram" v-model="form.instagram"
                                class="block mt-1 w-full" type="text" />
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
                                <TextInput id="cep" name="cep" v-mask="'#####-###'" v-model="form.cep"
                                    class="block w-full" type="text" />
                                <button type="button" @click="buscarEnderecoPorCEP"
                                    class="absolute top-0 right-0 underline-offset-2 py-3  px-2 space-x-2 text-sm  company_type  bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500   hover:dark:from-cyan-600 hover:dark:to-blue-600  bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100 rounded-r">Buscar</button>
                            </div>
                            <InputError class="mt-2" :message="form.errors.cep" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="city">Cidade</InputLabel>
                            <TextInput id="city" name="city" v-model="form.city" class="block mt-1 w-full"
                                type="text" />
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
                        <div>
                            <InputLabel for="latitude">Bairro</InputLabel>
                            <TextInput id="latitude" name="latitude" v-model="form.latitude" class="form-control w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.latitude" />
                        </div>
                        <div>
                            <InputLabel for="longitude">Bairro</InputLabel>
                            <TextInput id="longitude" name="longitude" v-model="form.longitude"
                                class="form-control w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.longitude" />
                        </div>
                        <div>
                            <InputLabel for="nivel_zoon">Bairro</InputLabel>
                            <TextInput id="nivel_zoon" name="nivel_zoon" v-model="form.nivel_zoon"
                                class="form-control w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.nivel_zoon" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tab content -->
            <div v-show="activeTab === 'about'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                    <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">

                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="mission">Missão</InputLabel>
                            <TextInput id="mission" name="mission" v-model="form.mission" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.mission" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="vision">Visão</InputLabel>
                            <TextInput id="vision" name="vision" v-model="form.vision" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.vision" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="values">Valores</InputLabel>
                            <TextInput id="values" name="values" v-model="form.values" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.values" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="experience1">Experiencia 1</InputLabel>
                            <TextInput id="experience1" name="experience1" v-model="form.experience1"
                                class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.experience1" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="experience2">Experiencia 2</InputLabel>
                            <TextInput id="experience2" name="experience2" v-model="form.experience2"
                                class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.experience2" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="experience3">Experiencia 3</InputLabel>
                            <TextInput id="experience3" name="experience3" v-model="form.experience3"
                                class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.experience3" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tab content -->
            <div v-show="activeTab === 'images'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-3">
                        <div class="row-span-1 col-span-1">
                            <ImageFaviconCompanyForm />
                        </div>
                        <div class="row-span-1 col-span-1">
                            <ImageLogoLightCompanyForm />
                        </div>
                        <div class="row-span-1 col-span-1">
                            <ImageLogoDarkCompanyForm />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tab content -->
            <div v-show="activeTab === 'images_about'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-3">
                        <div class="row-span-1 col-span-1">
                            <Image1CompanyForm />
                        </div>
                        <div class="row-span-1 col-span-1">
                            <Image2CompanyForm />
                        </div>
                    </div>
                </div>
            </div>
            <!-- Tab content -->
            <div v-show="activeTab === 'images_footer'">
                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                    <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                        <!-- Campos do formulário -->
                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="link1">Link 1</InputLabel>
                            <TextInput id="link1" link1="link1" v-model="form.link1" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.link1" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="link2">Link 2</InputLabel>
                            <TextInput id="link2" link2="link2" v-model="form.link2" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.link2" />
                        </div>
                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="description1">Decrição 1</InputLabel>
                            <TextInput id="description1" descripton1="description1" v-model="form.description1"
                                class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.description1" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="description2">Descrição 2</InputLabel>
                            <TextInput id="description2" description2="description2" v-model="form.description2"
                                class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.description2" />
                        </div>
                    </div>

                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-3">
                        <div class="row-span-1 col-span-1">
                            <Image3CompanyForm />
                        </div>
                        <div class="row-span-1 col-span-1">
                            <Image4CompanyForm />
                        </div>
                    </div>
                </div>
            </div>


            <div class="flex items-center justify-center w-full mt-4 mb-4">
                <ButtonSubmit class="w-2/3 sm:w-1/2 md:1/2 lg:w-1/3" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    Atualizar Dados
                </ButtonSubmit>
            </div>
        </form>
    </div>


</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ImageFaviconCompanyForm from './ImageFaviconCompanyForm.vue';
import ImageLogoLightCompanyForm from './ImageLogoLightCompanyForm.vue';
import ImageLogoDarkCompanyForm from './ImageLogoDarkCompanyForm.vue';
import Image1CompanyForm from './Image1CompanyForm.vue';
import Image2CompanyForm from './Image2CompanyForm.vue';
import Image3CompanyForm from './Image3CompanyForm.vue';
import Image4CompanyForm from './Image4CompanyForm.vue';
import { mask } from 'vue-the-mask';

const { props } = usePage();

const activeTab = ref('info'); // Aba inicial ativa

const message = ref('');
onMounted(() => {
    message.value = props.jetstream?.flash?.message || '';
    if (props.jetstream && props.jetstream.flash) {
        props.jetstream.flash = null;
    }
});

const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Atualizado por: ${userName} em ${new Date().toLocaleString()}`;
});

const form = useForm({
    _method: 'PUT',
    id: props.company?.id || '',
    name: props.company?.name || '',
    contact: props.company?.contact || '',
    email: props.company?.email || '',
    whatsapp: props.company?.whatsapp || '',
    phone: props.company?.phone || '',
    website: props.company?.website || '',
    facebook: props.company?.facebook || '',
    x: props.company?.x || '',
    tiktok: props.company?.tiktok || '',
    cep: props.company?.cep || '',
    city: props.company?.city || '',
    uf: props.company?.uf || '',
    mission: props.company?.mission || '',
    vision: props.company?.vision || '',
    values: props.company?.values || '',
    experience1: props.company?.experience1 || '',
    experience2: props.company?.experience2 || '',
    experience3: props.company?.experience3 || '',
    address: props.company?.address || '',
    number: props.company?.number || '',
    complement: props.company?.complement || '',
    neighborhood: props.company?.neighborhood || '',
    latitude: props.company?.latitude || '',
    longitude: props.company?.longitude || '',
    nivel_zoon: props.company?.nivel_zoon || '',
    link1: props.company?.link1 || '',
    link2: props.company?.link2 || '',
    description1: props.company?.description1 || '',
    description2: props.company?.description2 || '',
});

const updateCompany = () => {
    form.put(route('company.update', { id: form.id }), {
        onSuccess: () => {
            if (props.jetstream) {
                props.jetstream.flash = { message: 'Empresa atualizado com sucesso!' };
            }
        },
        onError: () => {
            if (props.jetstream) {
                props.jetstream.flash = { error: 'Erro ao atualizar o Empresa.' };
            }
        },
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

        form.address = endereco.logradouro || '';
        form.complement = endereco.complemento || '';
        form.neighborhood = endereco.bairro || '';
        form.city = endereco.localidade || '';
        form.uf = endereco.uf || '';

        console.log('Endereço encontrado:', endereco);

        if (props.jetstream) {
            props.jetstream.flash = { message: 'Endereço encontrado com sucesso!' };
        }
    } catch (error) {
        console.error('Erro ao buscar o CEP:', error.message);
        if (props.jetstream) {
            props.jetstream.flash = { error: error.message };
        }
    }
};
</script>

<script>
export default {
    directives: { mask },
};
</script>
