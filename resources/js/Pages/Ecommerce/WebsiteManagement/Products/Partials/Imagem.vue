<template>

    <div>
        <input id="image" ref="imageInput" type="file" class="hidden" @change="updateImagePreview">

        <InputLabel for="image" value="Imagem" />

        <div class="mt-2">
            <img :src="imagePreview" :alt="form.name" class="rounded h-60 w-60 object-cover">
        </div>

        <SecondaryButton class="mt-2 me-2" type="button" @click.prevent="selectNewImage">
            Selecionar Nova Imagem
        </SecondaryButton>

        <SecondaryButton v-if="form.image" type="button" class="mt-2" @click.prevent="removeImage">
            Remover Imagem
        </SecondaryButton>

        <InputError :message="form.errors.image" class="mt-2" />
    </div>

</template>


<script setup>
import { ref } from 'vue'
import { useForm } from '@inertiajs/vue3'
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';

const { props } = usePage();



const form = useForm({

    image: null,
})

const imagePreview = ref(props.product.image || defaultImage);
const imageInput = ref(null);

function selectNewImage() {
    imageInput.value.click();
}

function updateImagePreview(event) {
    const file = event.target.files[0];
    if (file) {
        form.image = file;
        imagePreview.value = URL.createObjectURL(file);
    } else {
        form.image = null;
        imagePreview.value = defaultImage;
    }
}

function removeImage() {
    form.image = null;
    imagePreview.value = defaultImage;
    imageInput.value.value = null;
}
</script>
