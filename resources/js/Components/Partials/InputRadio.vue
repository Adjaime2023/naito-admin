<template>
  <label :for="inputId" class="block font-medium text-sm text-gray-700 dark:text-gray-300">
    <span v-if="value">{{ value }}</span>
    <span v-else><slot /></span>
  </label>
</template>

<script setup>
import { defineProps } from 'vue';

const props = defineProps({
  value: String,
  inputId: {
    type: String,
    required: true,
  },
});
</script>

<style scoped>
/* Adicione estilos personalizados aqui, se necessário */
</style>
