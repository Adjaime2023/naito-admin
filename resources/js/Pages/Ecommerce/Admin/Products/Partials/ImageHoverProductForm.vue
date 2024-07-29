<template>
    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitForm" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image_hover" ref="imageHoverInput" type="file" class="hidden" @change="updateImageHoverPreview">

                <InputLabel for="image_hover">Imagem Hover</InputLabel>

                <div class="flex justify-center mt-2">
                    <img :src="imageHoverPreview" :alt="form.name" class="rounded max-sm:h-40 w-full object-cover">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImageHover">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image_hover" type="button" class="mt-2" @click.prevent="removeImageHover">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image_hover" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="text-center w-1/2" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar Imagem
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
    image_hover: null, // Inicializa como null, a imagem será atualizada pelo usuário
});

// Variável reativa para a pré-visualização da imagem
const imageHoverPreview = ref(props.product.image_hover ? `/storage/${props.product.image_hover}` : '/storage/images/default.png');
const imageHoverInput = ref(null);

// Selecionar nova imagem
function selectNewImageHover() {
    imageHoverInput.value.click();
}

// Atualizar visualização da imagem
function updateImageHoverPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image_hover = file;
        imageHoverPreview.value = URL.createObjectURL(file);
    } else {
        form.image_hover = null;
        imageHoverPreview.value = '/storage/images/default.png';
    }
}

// Remover imagem
function removeImageHover() {
    form.image_hover = null;
    imageHoverPreview.value = '/storage/images/default.png';
    imageHoverInput.value.value = null;
}

// Submeter formulário
function submitForm() {
    // Armazena a imagem atual selecionada para persistir após a submissão
    const currentImageHover = form.image_hover;

    form.post(route('product.updateImageHover', { id: props.product.id }), {
        onSuccess: () => {
            // Após a submissão bem-sucedida, reatribui a imagem atual para form.image_hover
            form.image_hover = currentImageHover;
            // Lógica adicional se necessário após o sucesso da submissão
            // form.reset(); // Remova ou ajuste conforme necessário
        },
    });
}
</script>
