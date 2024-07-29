<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormImageFooter" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="imageFooterInput" type="file" class="hidden" @change="updateImageFooterPreview">

                <InputLabel for="image">ImageFooter</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="imageFooterPreview" :alt="form.name" class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImageFooter">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image_footer" type="button" class="mt-2" @click.prevent="removeImageFooter">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image_footer" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="w-2/3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar ImageFooter
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
    image_footer: props.company.image_footer, // Inicializa com a imagem existente da ImageFooter
});

// Variável reativa para a pré-visualização da imagem
const imageFooterImageDefault = '/storage/images/default.png';
const imageFooterPreview = ref(props.company.image_footer ? `/storage/${props.company.image_footer}` : imageFooterImageDefault);
const imageFooterInput = ref(null);

// Selecionar nova imagem
function selectNewImageFooter() {
    imageFooterInput.value.click();
}

// Atualizar visualização da imagem
function updateImageFooterPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image_footer = file;
        imageFooterPreview.value = URL.createObjectURL(file);
    } else {
        form.image_footer = null;
        imageFooterPreview.value = imageFooterImageDefault;
    }
}

// Remover imagem
function removeImageFooter() {
    form.image_footer = null;
    imageFooterPreview.value = imageFooterImageDefault;
    imageFooterInput.value.value = null;
}

// Submeter formulário
function submitFormImageFooter() {
    // Armazena a imagem atual selecionada para persistir após a submissão
    const currentImage = form.image_footer;

    form.post(route('company.updateImageFooter', { id: props.company.id }), {
        onSuccess: () => {
            // Após a submissão bem-sucedida, reatribui a imagem atual para form.image_footer
            form.image_footer = currentImage;
            // Lógica adicional se necessário após o sucesso da submissão
            // form.reset(); // Remova ou ajuste conforme necessário
        },
    });
}
</script>
