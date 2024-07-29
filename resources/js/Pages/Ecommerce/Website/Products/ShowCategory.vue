<script setup>
import { ref, onMounted } from 'vue';

import axios from 'axios';

// Variáveis reativas
const category = ref(null);
const subcategories = ref([]);


// Função para buscar os dados do backend
onMounted(async () => {
  try {
    const categoryId = route.params.categoryId; // Obter o parâmetro da rota
    const response = await axios.get(`/api/website/category/${categoryId}`);
    category.value = response.data.category;
    subcategories.value = response.data.subcategories;
  } catch (error) {
    console.error('Erro ao buscar subcategorias:', error);
  }
});
</script>

<template>
  <p class="mt-2 text-center text-sm text-gray-900 dark:text-gray-200 font-semibold">{{ category?.name }}</p>

  <!-- Lista de Imagens das Categorias -->
  <div class="flex overflow-x-auto pb-6 space-x-4 py-4 pl-[70px] pr-[70px]" >
    <div v-for="subcategory in subcategories" :key="subcategory.id" class="flex-none w-36 relative">
      <div class="flex justify-center items-center ">
        <a :href="`/website/subcategories/${subcategory.id}`"
            class="block relative w-36 h-36  overflow-hidden shadow-md hover:-translate-y-1 hover:scale-110 rounded-[24px]  border-blue-400 border-8">
          <img :src="subcategory.image ? '/storage/' + subcategory.image : '/storage/images/default.png'"
              :alt="subcategory.id" class="w-full h-full object-cover object-center" />
        </a>
      </div>
      <p class="mt-2 text-center text-sm text-gray-900 dark:text-gray-200 font-semibold">{{ subcategory.name }}</p>
    </div>
  </div>
</template>
