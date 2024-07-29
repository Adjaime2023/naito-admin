<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormImageAboutRight" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="imageAboutRightInput" type="file" class="hidden" @change="updateImageAboutRightPreview">

                <InputLabel for="image">ImageAboutRight</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="imageAboutRightPreview" :alt="form.name" class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImageAboutRight">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image_about_right" type="button" class="mt-2" @click.prevent="removeImageAboutRight">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image_about_right" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="w-2/3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar ImageAboutRight
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
    image_about_right: props.company.image_about_right, // Inicializa com a imagem existente da ImageAboutRight
});

// Variável reativa para a pré-visualização da imagem
const imageAboutRightImageDefault = '/storage/images/image_about_right_naito.png';
const imageAboutRightPreview = ref(props.company.image_about_right ? `/storage/${props.company.image_about_right}` : imageAboutRightImageDefault);
const imageAboutRightInput = ref(null);

// Selecionar nova imagem
function selectNewImageAboutRight() {
    imageAboutRightInput.value.click();
}

// Atualizar visualização da imagem
function updateImageAboutRightPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image_about_right = file;
        imageAboutRightPreview.value = URL.createObjectURL(file);
    } else {
        form.image_about_right = null;
        imageAboutRightPreview.value = imageAboutRightImageDefault;
    }
}

// Remover imagem
function removeImageAboutRight() {
    form.image_about_right = null;
    imageAboutRightPreview.value = imageAboutRightImageDefault;
    imageAboutRightInput.value.value = null;
}

// Submeter formulário
function submitFormImageAboutRight() {
    // Armazena a imagem atual selecionada para persistir após a submissão
    const currentImage = form.image_about_right;

    form.post(route('company.updateImageAboutRight', { id: props.company.id }), {
        onSuccess: () => {
            // Após a submissão bem-sucedida, reatribui a imagem atual para form.image_about_right
            form.image_about_right = currentImage;
            // Lógica adicional se necessário após o sucesso da submissão
            // form.reset(); // Remova ou ajuste conforme necessário
        },
    });
}
</script>
