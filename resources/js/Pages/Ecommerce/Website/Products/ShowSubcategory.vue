<script setup>
import { useRoute } from 'vue-router';

const route = useRoute();
const subcategories = route.params.subcategories; // Assuming subcategories are passed as an array
</script>

<template>
  <div>
    <h1>Subcategorias</h1>

    <ul v-if="subcategories.length">
      <li v-for="subcategory in subcategories" :key="subcategory.id">
        {{ subcategory.name }}
      </li>
    </ul>

    <p v-else>Nenhuma subcategoria encontrada.</p>
  </div>
</template>
