<template>
    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">

        <!-- Tab buttons -->
        <button @click="activeTab = 'info'"
            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'info', 'bg-gray-200 dark:bg-gray-500/70 text-gray-400 dark:text-700': activeTab !== 'info' }"
            class="px-4 py-2 mr-2 rounded-t focus:outline-none" title="Informações do Banner">Informações do
            Banner</button>
        <button @click="activeTab = 'logo'"
            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'logo', 'bg-gray-200 dark:bg-gray-500/70 text-gray-400 dark:text-700': activeTab !== 'logo' }"
            class="px-4 py-2 mr-2 rounded-t focus:outline-none" title="Logomarca">Logomarca</button>
        <button @click="activeTab = 'images'"
            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images', 'bg-gray-200 dark:bg-gray-500/70 text-gray-400 dark:text-700': activeTab !== 'images' }"
            class="px-4 py-2 mr-2 rounded-t focus:outline-none" title="Imagens Mobile/Tablet">Imagens
            Mobile/Tablet</button>
        <button @click="activeTab = 'images2'"
            :class="{ 'bg-gray-300 dark:bg-gray-900/80 text-gray-800 dark:text-white': activeTab === 'images2', 'bg-gray-200 dark:bg-gray-500/70 text-gray-400 dark:text-700': activeTab !== 'images2' }"
            class="px-4 py-2 mr-2 rounded-t focus:outline-none" title="Imagens Laptop/Desktop">Imagens
            Laptop/Desktop</button>

        <!-- Tab content -->
        <div v-show="activeTab === 'info'">

            <form @submit.prevent="updateBanner" enctype="multipart/form-data">

                <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">
                    <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                        <!-- Campos do formulário -->
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="alt">Alt</InputLabel>
                            <TextInput v-model="form.alt" id="alt" name="alt" class="block mt-1 w-full" type="text"
                                required />
                            <InputError class="mt-2" :message="form.errors.alt" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="title">Titulo</InputLabel>
                            <TextInput v-model="form.title" id="title" name="title" class="block mt-1 w-full"
                                type="text" required />
                            <InputError class="mt-2" :message="form.errors.title" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="description">Descrição</InputLabel>
                            <TextInput v-model="form.description" id="description" name="description"
                                class="block mt-1 w-full" type="text" required />
                            <InputError class="mt-2" :message="form.errors.description" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="description2">Descrição 2</InputLabel>
                            <TextInput v-model="form.description2" id="description2" name="description2"
                                class="block mt-1 w-full" type="text" required />
                            <InputError class="mt-2" :message="form.errors.description2" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="url">Endereço Site/Produto </InputLabel>
                            <TextInput v-model="form.url" id="url" name="url" class="block mt-1 w-full" type="text"
                                required />
                            <InputError class="mt-2" :message="form.errors.url" />
                        </div>

                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="horizontal_alignment">Alinhamento Horizontal</InputLabel>
                            <select id="horizontal_alignment" v-model="form.horizontal_alignment"
                                class="form-select mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                                <option value="left">Left</option>
                                <option value="center">Center</option>
                                <option value="right">Right</option>
                            </select>
                            <InputError class="mt-2" :message="form.errors.horizontal_alignment" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="vertical_alignment">Alinhamento Vertical</InputLabel>
                            <select id="vertical_alignment" v-model="form.vertical_alignment"
                                class="form-select mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
                                <option value="top">Top</option>
                                <option value="center">Center</option>
                                <option value="bottom">Bottom</option>
                            </select>
                            <InputError class="mt-2" :message="form.errors.vertical_alignment" />
                        </div>

                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="date">Data</InputLabel>
                            <input v-model="form.date" id="date" name="date"
                                class=" mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                type="date" required />
                            <InputError class="mt-2" :message="form.errors.date" />
                        </div>
                    </div>
                </div>
                <!-- Checkboxes -->
                <div class="flex  items-center  justify-center w-full space-x-3  my-4">
                    <div class="flex items-center space-x-2 mx-4 ">
                        <TextInput id="banner" name="banner" v-model="form.banner" type="checkbox" />
                        <InputLabel for="banner">Banner</InputLabel>
                    </div>
                    <div class="flex items-center space-x-2 mx-4">
                        <TextInput id="slide" name="slide" v-model="form.slide" type="checkbox" />
                        <InputLabel for="slide">Slide</InputLabel>
                    </div>
                    <div class="flex items-center space-x-2 mx-4">
                        <TextInput id="discontinued" name="discontinued" v-model="form.discontinued" type="checkbox" />
                        <InputLabel for="discontinued">Descontinuado</InputLabel>
                    </div>
                </div>
                <div class="flex items-center justify-center w-full mt-4">
                    <ButtonLink :href="route('banner.create')" :active="route().current('banner.create')"
                        class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                        Novo
                    </ButtonLink>
                    <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }"
                        :disabled="form.processing">
                        Atualizar
                    </ButtonSubmit>
                    <ButtonLink :href="route('banners.show')" :active="route().current('banners.show')"
                        class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                        Listar
                    </ButtonLink>


                </div>
            </form>
        </div>

        <div v-show="activeTab === 'logo'">
            <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">

                    <div class="col-span-1 sm:col-span-2 md:col-span-2">
                        <ImageLogoLightBannerForm alt="Logo light banner" />
                    </div>
                    <div class="col-span-1 sm:col-span-2 md:col-span-2">
                        <ImageLogoDarkBannerForm alt="Logo dark banner" />
                    </div>
                </div>

            </div>
        </div>

        <div v-show="activeTab === 'images'">
            <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">

                    <div class="col-span-1 sm:col-span-2 md:col-span-2">
                        <ImageMobileBannerForm alt="Imagem mobile banner" />
                    </div>

                    <div class="col-span-1 sm:col-span-2 md:col-span-2">
                        <ImageTabletBannerForm alt="Imagem tablet banner" />
                    </div>
                </div>
            </div>
        </div>
        <div v-show="activeTab === 'images2'">
            <div class="px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-b-lg rounded-r-lg">

                <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">

                    <div class="col-span-1 sm:col-span-2 md:col-span-2">
                        <ImageLaptopBannerForm alt="Imagem laptop banner" />
                    </div>
                    <div class="col-span-1 sm:col-span-2 md:col-span-2">
                        <ImageDesktopBannerForm alt="Imagem desktop banner" />

                    </div>

                </div>

            </div>
        </div>






    </div>


</template>


<script setup>
import { ref, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ImageMobileBannerForm from './ImageMobileBannerForm.vue';
import ImageDesktopBannerForm from './ImageDesktopBannerForm.vue';
import ImageLaptopBannerForm from './ImageLaptopBannerForm.vue';
import ImageTabletBannerForm from './ImageTabletBannerForm.vue';
import ImageLogoLightBannerForm from './ImageLogoLightBannerForm.vue';
import ImageLogoDarkBannerForm from './ImageLogoDarkBannerForm.vue';



const { props } = usePage();

const message = ref('');
onMounted(() => {
    message.value = props.jetstream?.flash?.message || '';
    if (props.jetstream && props.jetstream.flash) {
        props.jetstream.flash = null;
    }
});

const formatDateToInput = (date) => {
    if (!date) return ''; // Tratamento para data vazia
    date = new Date(date); // Garante que 'date' seja um objeto Date
    const isoDate = date.toISOString().slice(0, 10); // Formato ISO YYYY-MM-DD
    return isoDate;
};

const formatDateToSave = (date) => {
    if (!date) return ''; // Tratamento para data vazia
    return date; // Já está no formato YYYY-MM-DD
};

const form = useForm({
    _method: 'PUT',
    id: props.banner?.id || '',
    alt: props.banner?.alt || '',
    title: props.banner?.title || '',
    description: props.banner?.description || '',
    description2: props.banner?.description2 || '',
    url: props.banner?.url || '',
    horizontal_alignment: props.banner?.horizontal_alignment || '',
    vertical_alignment: props.banner?.vertical_alignment || '',
    discontinued: props.banner?.discontinued == 1, // Atribuir diretamente o valor booleano
    date: props.banner?.date ? formatDateToInput(props.banner.date) : '', // Formatar a data para exibição no formulário
    slide: props.banner?.slide == 1, // Atribuir diretamente o valor booleano
    banner: props.banner?.banner == 1, // Atribuir diretamente o valor booleano
});

const updateBanner = () => {
    form.date = formatDateToSave(form.date); // Formatar a data para salvar no formato YYYY-MM-DD
    form.put(route('banner.update', { id: form.id }), {
        onSuccess: () => {
            if (props.jetstream) {
                props.jetstream.flash = { message: 'Banner atualizado com sucesso!' };
            }
        },
        onError: () => {
            if (props.jetstream) {
                props.jetstream.flash = { error: 'Erro ao atualizar o Banner.' };
            }
        },
    });
};

// Ajustar a data para o formato de entrada do campo tipo 'date'
const formattedDate = ref(form.date);

// Atualizar form.date quando formattedDate mudar
onMounted(() => {
    formattedDate.value = formatDateToInput(form.date);
});
</script>
