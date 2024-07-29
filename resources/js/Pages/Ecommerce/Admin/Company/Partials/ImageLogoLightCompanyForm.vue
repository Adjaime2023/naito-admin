<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormLogoLight" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="logoLightInput" type="file" class="hidden" @change="updateLogoLightPreview">

                <InputLabel for="image">LogoLight</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="logoLightPreview" :alt="form.name" class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewLogoLight">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.logo_light" type="button" class="mt-2" @click.prevent="removeLogoLight">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.logo_light" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="w-2/3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar Logo Light
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
    logo_light: props.company.logo_light, // Inicializa com a imagem existente da LogoLight
});

// Variável reativa para a pré-visualização da imagem
const logoLightDefault = '/storage/images/default.png';
const logoLightPreview = ref(props.company.logo_light ? `/storage/${props.company.logo_light}` : logoLightDefault);
const logoLightInput = ref(null);

// Selecionar nova imagem
function selectNewLogoLight() {
    logoLightInput.value.click();
}

// Atualizar visualização da imagem
function updateLogoLightPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.logo_light = file;
        logoLightPreview.value = URL.createObjectURL(file);
    } else {
        form.logo_light = null;
        logoLightPreview.value = logoLightDefault;
    }
}

// Remover imagem
function removeLogoLight() {
    form.logo_light = null;
    logoLightPreview.value = logoLightDefault;
    logoLightInput.value.value = null;
}

// Submeter formulário
function submitFormLogoLight() {
    // Armazena a imagem atual selecionada para persistir após a submissão
    const currentImage = form.logo_light;

    form.post(route('company.updateImageLogoLight', { id: props.company.id }), {
        onSuccess: () => {
            // Após a submissão bem-sucedida, reatribui a imagem atual para form.logo_light
            form.logo_light = currentImage;
            // Lógica adicional se necessário após o sucesso da submissão
            // form.reset(); // Remova ou ajuste conforme necessário
        },
    });
}
</script>
