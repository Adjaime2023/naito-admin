<template>
    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormImageTablet" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="imageInput" type="file" class="hidden" @change="updateImageTabletPreview">
                
                <InputLabel for="image">ImageTablet</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="imagePreview" :alt="props.banner.title"
                    class="rounded absolute top-0 left-0 w-full h-full object-contain">
                </div>

                <SecondaryButton class="mt-2 text-center me-2" type="button" @click.prevent="selectNewImageTablet">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image_url_tablet" type="button" class="mt-2 text-center"
                    @click.prevent="removeImageTablet">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image_url_tablet" class="mt-2" />
            </div>
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="ms-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar ImageTablet
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
    image_url_tablet: props.banner.image_url_tablet || null, // Inicializa com a image existente da ImageTablet
});

// Variável reativa para a pré-visualização da image
const imageImageDefault = 'images/default.png';
const imagePreview = ref(props.banner.image_url_tablet ? `/storage/${props.banner.image_url_tablet}` : imageImageDefault);
const imageInput = ref(null);

// Selecionar nova image
function selectNewImageTablet() {
    imageInput.value.click();
}

// Atualizar visualização da image
function updateImageTabletPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image_url_tablet = file;
        imagePreview.value = URL.createObjectURL(file);
    } else {
        form.image_url_tablet = null;
        imagePreview.value = imageImageDefault;
    }
}

// Remover image
function removeImageTablet() {
    form.image_url_tablet = null;
    imagePreview.value = imageImageDefault;
    imageInput.value.value = null;
}

// Submeter formulário
function submitFormImageTablet() {
    form.post(route('banner.updateImageTablet', { id: props.banner.id }), {
        onSuccess: () => {
            // Lógica adicional se necessário após o sucesso da submissão
            form.reset();
        },
    });
}
</script>
