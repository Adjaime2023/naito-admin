<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormImageFooterBotton" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="imageFooterBottonInput" type="file" class="hidden" @change="updateImageFooterBottonPreview">

                <InputLabel for="image">ImageFooterBotton</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="imageFooterBottonPreview" :alt="form.name" class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImageFooterBotton">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image_footer_botton" type="button" class="mt-2" @click.prevent="removeImageFooterBotton">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image_footer_botton" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="w-2/3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar ImageFooterBotton
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
    image_footer_botton: props.company.image_footer_botton, // Inicializa com a imagem existente da ImageFooterBotton
});

// Variável reativa para a pré-visualização da imagem
const imageFooterBottonImageDefault = '/storage/images/default.png';
const imageFooterBottonPreview = ref(props.company.image_footer_botton ? `/storage/${props.company.image_footer_botton}` : imageFooterBottonImageDefault);
const imageFooterBottonInput = ref(null);

// Selecionar nova imagem
function selectNewImageFooterBotton() {
    imageFooterBottonInput.value.click();
}

// Atualizar visualização da imagem
function updateImageFooterBottonPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image_footer_botton = file;
        imageFooterBottonPreview.value = URL.createObjectURL(file);
    } else {
        form.image_footer_botton = null;
        imageFooterBottonPreview.value = imageFooterBottonImageDefault;
    }
}

// Remover imagem
function removeImageFooterBotton() {
    form.image_footer_botton = null;
    imageFooterBottonPreview.value = imageFooterBottonImageDefault;
    imageFooterBottonInput.value.value = null;
}

// Submeter formulário
function submitFormImageFooterBotton() {
    // Armazena a imagem atual selecionada para persistir após a submissão
    const currentImage = form.image_footer_botton;

    form.post(route('company.updateImageFooterBotton', { id: props.company.id }), {
        onSuccess: () => {
            // Após a submissão bem-sucedida, reatribui a imagem atual para form.image_footer_botton
            form.image_footer_botton = currentImage;
            // Lógica adicional se necessário após o sucesso da submissão
            // form.reset(); // Remova ou ajuste conforme necessário
        },
    });
}
</script>
