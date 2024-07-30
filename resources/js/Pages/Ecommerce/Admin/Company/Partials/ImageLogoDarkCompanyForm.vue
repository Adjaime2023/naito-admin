<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormLogoDark" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="logoDarkInput" type="file" class="hidden" @change="updateLogoDarkPreview">

                <InputLabel for="image">Logo Dark</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="logoDarkPreview" :alt="form.name" class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewLogoDark">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.logo_dark" type="button" class="mt-2" @click.prevent="removeLogoDark">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.logo_dark" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="w-2/3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar Logo Dark
                </PrimaryButton>
            </div>
        </form>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import InputError from '@/Components/InputError.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';

const { props } = usePage();

// Inicialização do formulário
const form = useForm({
    _method: 'PUT',
    logo_dark: null, // Inicializa como nulo para permitir seleção de nova imagem
});

// Variável reativa para a pré-visualização da imagem
const logoDarkDefault = '/storage/images/logo-black.svg';
const logoDarkPreview = ref(props.company.logo_dark ? `/storage/${props.company.logo_dark}` : logoDarkDefault);
const logoDarkInput = ref(null);

// Selecionar nova imagem
function selectNewLogoDark() {
    logoDarkInput.value.click();
}

// Atualizar visualização da imagem
function updateLogoDarkPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.logo_dark = file;
        logoDarkPreview.value = URL.createObjectURL(file);
    } else {
        form.logo_dark = null;
        logoDarkPreview.value = logoDarkDefault;
    }
}

// Remover imagem
function removeLogoDark() {
    form.logo_dark = null;
    logoDarkPreview.value = logoDarkDefault;
    logoDarkInput.value.value = null;
}

// Submeter formulário
function submitFormLogoDark() {
    form.post(route('company.updateImageLogoDark', { id: props.company.id }), {
        onSuccess: () => {
            if (form.logo_dark) {
                logoDarkPreview.value = URL.createObjectURL(form.logo_dark);
            }
        },
    });
}
</script>
