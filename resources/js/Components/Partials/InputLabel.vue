<template>
  <label :for="inputId" class="block font-medium text-sm text-gray-700 dark:text-gray-300">
    <span v-if="labelText">{{ labelText }}</span>
    <span v-else><slot /></span>
  </label>
</template>

<script setup>
import { defineProps } from 'vue';

const props = defineProps(['labelText', 'inputId']);
</script>

  