<template>
    <div class="mx-2 px-4 pt-4 pb-6 my-2 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="submitFormFavicon" method="post" enctype="multipart/form-data">
            <div class="grid justify-items-stretch items-center col-span-1 sm:col-span-1 md:col-span-1">
                <input id="image" ref="faviconInput" type="file" class="hidden" @change="updateFaviconPreview">

                <InputLabel for="image">Favicon</InputLabel>

                <div class="flex justify-center mt-2 relative w-full" style="padding-bottom: 56.25%; height: 0;">
                    <img :src="faviconPreview" :alt="form.name" class="rounded absolute top-0 left-0 w-8 h-8 object-contain">
                </div>

                <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewFavicon">
                    Selecionar Nova Imagem
                </SecondaryButton>

                <SecondaryButton v-if="form.favicon" type="button" class="mt-2" @click.prevent="removeFavicon">
                    Remover Imagem
                </SecondaryButton>

                <InputError :message="form.errors.favicon" class="mt-2" />
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-4">
                <PrimaryButton class="w-2/3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar Favicon
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
    favicon: null, // Inicializa como nulo para permitir seleção de nova imagem
});

// Variável reativa para a pré-visualização da imagem
const faviconImageDefault = '/storage/images/favicon_naito.png';
const faviconPreview = ref(props.company.favicon ? `/storage/${props.company.favicon}` : faviconImageDefault);
const faviconInput = ref(null);

// Selecionar nova imagem
function selectNewFavicon() {
    faviconInput.value.click();
}

// Atualizar visualização da imagem
function updateFaviconPreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.favicon = file;
        faviconPreview.value = URL.createObjectURL(file);
    } else {
        form.favicon = null;
        faviconPreview.value = faviconImageDefault;
    }
}

// Remover imagem
function removeFavicon() {
    form.favicon = null;
    faviconPreview.value = faviconImageDefault;
    faviconInput.value.value = null;
}

// Submeter formulário
function submitFormFavicon() {
    form.post(route('company.updateImageFavicon', { id: props.company.id }), {
        onSuccess: () => {
            if (form.favicon) {
                faviconPreview.value = URL.createObjectURL(form.favicon);
            }
        },
    });
}
</script>
