<template>
    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormImageDesktop" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="imageInput" type="file" class="hidden" @change="updateImageDesktopPreview">
                
                <InputLabel for="image">ImageDesktop</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="imagePreview" :alt="props.banner.title"
                    class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 text-center me-2" type="button" @click.prevent="selectNewImageDesktop">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image_url_desktop" type="button" class="mt-2 text-center"
                    @click.prevent="removeImageDesktop">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image_url_desktop" class="mt-2" />
            </div>
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="ms-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar ImageDesktop
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
    image_url_desktop: props.banner.image_url_desktop || null, // Inicializa com a imagem existente da ImageDesktop
});

// Variável reativa para a pré-visualização da imagem
const imageImageDefault = 'images/default.png';
const imagePreview = ref(props.banner.image_url_desktop ? `/storage/${props.banner.image_url_desktop}` : imageImageDefault);
const imageInput = ref(null);

// Selecionar nova imagem
function selectNewImageDesktop() {
    imageInput.value.click();
}

// Atualizar visualização da imagem
function updateImageDesktopPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image_url_desktop = file;
        imagePreview.value = URL.createObjectURL(file);
    } else {
        form.image_url_desktop = null;
        imagePreview.value = imageImageDefault;
    }
}

// Remover imagem
function removeImageDesktop() {
    form.image_url_desktop = null;
    imagePreview.value = imageImageDefault;
    imageInput.value.value = null;
}

// Submeter formulário
function submitFormImageDesktop() {
    form.post(route('banner.updateImageDesktop', { id: props.banner.id }), {
        onSuccess: () => {
            // Lógica adicional se necessário após o sucesso da submissão
            form.reset();
        },
    });
}
</script>
