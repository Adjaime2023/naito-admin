<template>
  <div>
    <h2>Lista de Produtos</h2>
    <!-- Filtro de lançamento -->
    <label> <input type="checkbox" v-model="promotionFilter" /> Lançamento </label>

    <!-- Lista de produtos -->
    <ul>
      <li v-for="product in filteredProducts" :key="product.id">
        <h3>{{ product.name }}</h3>
        <p>{{ product.description }}</p>
      </li>
    </ul>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";
import { usePage } from "@inertiajs/vue3";

const { data } = usePage().props;

// Estado do filtro de lançamento
const promotionFilter = ref(false);

// Produtos filtrados com base no estado do filtro
const filteredProducts = computed(() => {
  if (promotionFilter.value) {
    return data.products.filter((product) => product.promotion);
  } else {
    return data.products;
  }
});
</script>
