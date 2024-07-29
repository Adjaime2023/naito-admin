<script setup>
import { ref, onMounted, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";
import InputLabel from "@/Components/Partials/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import InputError from "@/Components/InputError.vue";
import PrimaryButton from "@/Components/Partials/PrimaryButton.vue";
import ButtonSubmit from "@/Components/Partials/ButtonSubmit.vue";
import ButtonLink from "@/Components/Partials/ButtonLink.vue";
import SecondaryButton from "@/Components/SecondaryButton.vue";
import { mask } from "vue-the-mask";
const directives = { mask };

const { props } = usePage();

const message = ref("");
onMounted(() => {
    message.value = props.jetstream?.flash?.message || "";
    props.jetstream.flash = null;
});

const resetFormFields = () => {
    form.reset();
};

const cancelForm = () => {
    resetFormFields();
    const cancelMessage = "Cadastro cancelado, os campos foram limpos";
    console.log(cancelMessage, message.value);

    props.jetstream.flash = { bannerStyle: "success", banner: cancelMessage };
};

const formatDateToInput = (date) => {
    const day = String(date.getDate()).padStart(2, "0");
    const month = String(date.getMonth() + 1).padStart(2, "0"); // Lembre-se que os meses são baseados em zero
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
};

const formatDateToSave = (date) => {
    const [day, month, year] = date.split("/");
    return `${year}-${month}-${day}`;
};

const now = new Date();

const form = useForm({
    alt: "",
    title: "",
    description: "",
    description2: "",
    image_url_mobile: "",
    image_url_tablet: "",
    image_url_laptop: "",
    image_url_desktop: "",
    logo_white: "",
    logo_black: "",
    url: "",
    horizontal_alignment: "",
    vertical_alignment: "",
    date: formatDateToSave(formatDateToInput(now)),
});

const displayDate = ref(formatDateToInput(now));

const submit = () => {
    form.date = formatDateToSave(displayDate.value);
    form.post(route("banner.store"), {
        onSuccess: () => {
            form.reset();
            console.log("Formulário enviado com sucesso!");
        },
        onError: (errors) => {
            console.error("Erro ao enviar formulário:", errors);
        },
    });
};
</script>

<template>
    <div class="px-4 py-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submit" enctype="multipart/form-data">
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="alt">Alt</InputLabel>
                    <TextInput
                        v-model="form.alt"
                        id="alt"
                        name="alt"
                        class="block mt-1 w-full"
                        type="text"
                        required
                    />
                    <InputError class="mt-2" :message="form.errors.alt" />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="title">Titulo</InputLabel>
                    <TextInput
                        v-model="form.title"
                        id="title"
                        name="title"
                        class="block mt-1 w-full"
                        type="text"
                        required
                    />
                    <InputError class="mt-2" :message="form.errors.title" />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="description">Descrição</InputLabel>
                    <TextInput
                        v-model="form.description"
                        id="description"
                        name="description"
                        class="block mt-1 w-full"
                        type="text"
                        required
                    />
                    <InputError
                        class="mt-2"
                        :message="form.errors.description"
                    />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="description2">Descrição 2</InputLabel>
                    <TextInput
                        v-model="form.description2"
                        id="description2"
                        name="description2"
                        class="block mt-1 w-full"
                        type="text"
                        required
                    />
                    <InputError
                        class="mt-2"
                        :message="form.errors.description2"
                    />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="url">Endereço Site/Produto </InputLabel>
                    <TextInput
                        v-model="form.url"
                        id="url"
                        name="url"
                        class="block mt-1 w-full"
                        type="text"
                        required
                    />
                    <InputError class="mt-2" :message="form.errors.url" />
                </div>

                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="horizontal_alignment"
                        >Alinhamento Horizontal</InputLabel
                    >
                    <select
                        id="horizontal_alignment"
                        v-model="form.horizontal_alignment"
                        class="form-select mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                    >
                        <option value="left">Left</option>
                        <option value="center">Center</option>
                        <option value="right">Right</option>
                    </select>
                    <InputError
                        class="mt-2"
                        :message="form.errors.horizontal_alignment"
                    />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="vertical_alignment"
                        >Alinhamento Vertical</InputLabel
                    >
                    <select
                        id="vertical_alignment"
                        v-model="form.vertical_alignment"
                        class="form-select mt-1 block w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                    >
                        <option value="top">Top</option>
                        <option value="center">Center</option>
                        <option value="bottom">Bottom</option>
                    </select>
                    <InputError
                        class="mt-2"
                        :message="form.errors.vertical_alignment"
                    />
                </div>

                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="date">Data</InputLabel>
                    <TextInput
                        type="date"
                        v-model="formattedDate"
                        v-mask="'##/##/####'"
                        placeholder="dd/mm/yyyy"
                        id="date"
                        name="date"
                        class="block mt-1 w-full"
                        required
                    />
                    <InputError class="mt-2" :message="form.errors.date" />
                </div>
            </div>

            <div class="flex items-center justify-center w-full mt-4">
                <PrimaryButton
                    @click.prevent="cancelForm"
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6"
                >
                    Cancelar
                </PrimaryButton>
                <ButtonSubmit
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6"
                    :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing"
                >
                    Cadastrar
                </ButtonSubmit>
                <ButtonLink
                    :href="route('banners.show')"
                    :active="route().current('banners.show')"
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6"
                >
                    Listar
                </ButtonLink>
            </div>
        </form>
    </div>
</template>
