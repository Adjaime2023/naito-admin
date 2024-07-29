<template>
    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <div class="col-span-1 sm:col-span-2 md:col-span-2">
            <!-- Seção para visualizar as imagens existentes -->
            <div class="mt-4">
                <InputLabel>Imagens Existentes</InputLabel>
                <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mt-2">
                    <div v-for="image in savedImages" :key="image.id" class="relative">
                        <img :src="`/storage/${image.path}`" :alt="`Image ${image.id}`" class="w-full h-32 object-cover rounded">
                        <button @click="removeImage(image.id)" class="absolute top-1 right-1 bg-red-500 text-white rounded-full p-1">
                            &times;
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <form @submit.prevent="submitForm" enctype="multipart/form-data">
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                <!-- Outros campos do formulário -->
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <div>
                        <InputLabel for="product-images">Imagens do Produto</InputLabel>
                        <input class="block w-full text-center mt-2" type="file" id="product-images" @change="handleFiles" multiple>
                    </div>
                </div>
            </div>

            <!-- Botão Atualizar -->
            <div class="flex items-center justify-center mt-8">
                <PrimaryButton class="text-center w-1/2" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    Atualizar Imagens
                </PrimaryButton>
            </div>
        </form>
    </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import axios from 'axios';

const { props } = usePage();
const activeTab = ref('images'); // Aba inicial ativa

const form = useForm({
    _method: 'PUT',
    product_images: [],
});

// Variável reativa para armazenar as imagens existentes
const savedImages = ref([]);

// Carrega as imagens existentes quando o componente é montado
onMounted(() => {
    savedImages.value = props.productImages;
});

// Função para remover imagem existente
function removeImage(imageId) {
    // Lógica para remover imagem do servidor e atualizar a lista de imagens
    axios.delete(route('product.deleteImage', { id: imageId }))
        .then(response => {
            savedImages.value = savedImages.value.filter(image => image.id !== imageId);
        })
        .catch(error => {
            console.error('Erro ao remover a imagem:', error);
        });
}

// Função para lidar com os arquivos selecionados
const handleFiles = (event) => {
    form.product_images = Array.from(event.target.files);
};

// Função para submeter o formulário
const submitForm = () => {
    const formData = new FormData();
    formData.append('_method', 'PUT');
    form.product_images.forEach((file, index) => {
        formData.append(`product_images[${index}]`, file);
    });

    form.post(route('product.updateImages', { id: props.product.id }), {
        onSuccess: () => {
            activeTab.value = 'images';
            // Atualiza a lista de imagens salvas sem recarregar a página
            axios.get(route('product.images', { id: props.product.id }))
                .then(response => {
                    savedImages.value = response.data;
                });
        },
        preserveScroll: true,
        data: formData,
    });
};
</script>
