<template>
    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitForm" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="imageInput" type="file" class="hidden" @change="updateImagePreview">

                <InputLabel for="image">Imagem</InputLabel>

                <div class="flex justify-center mt-2">
                    <img :src="imagePreview" :alt="form.name" class="rounded w-full object-cover">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImage">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.image" type="button" class="mt-2" @click.prevent="removeImage">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.image" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <ButtonSubmit class="w-1/2" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar
                </ButtonSubmit>
            </div>
        </form>
    </div>
</template>


<script setup>
import { ref, computed, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';

const { props } = usePage();

// Inicialização do formulário
const form = useForm({
    _method: 'PUT',
    image: null,
});

// Funções auxiliares para manipulação de imagens
const imagePreview = ref(props.color.image ? `/storage/${props.color.image}` : '/storage/images/default.png');
const imageInput = ref(null);

// Selecionar nova imagem
function selectNewImage() {
    imageInput.value.click();
}

// Atualizar visualização da imagem
function updateImagePreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image = file;
        imagePreview.value = URL.createObjectURL(file);
    } else {
        form.image = null;
        imagePreview.value = '/storage/images/default.png';
    }
}

// Remover imagem
function removeImage() {
    form.image = null;
    imagePreview.value = '/storage/images/default.png';
    imageInput.value.value = null;
}

// Submeter formulário
function submitForm() {
    form.post(route('color.updateImage', { id: props.color.id }), {
        onSuccess: () => form.reset(),
    });
}
</script>
