<template>
    <div v-if="isVisible" class="fixed inset-0 z-50 flex items-center justify-center bg-gray-200/50 dark:bg-gray-900/50">
      <div class="bg-white dark:bg-gray-800 dark:text-gray-100 text-gray-900 p-6 rounded-lg shadow-lg">
        <h2 :class="['text-lg font-semibold mb-4', type === 'success' ? 'text-green-500' : 'text-red-500']">
          {{ title }}
        </h2>
        <p class="mb-4">{{ message }}</p>
        <button @click="closeModal" class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600">Fechar</button>
      </div>
    </div>
  </template>

  <script setup>
  import { defineProps, defineEmits } from 'vue';

  const props = defineProps({
    title: String,
    message: String,
    isVisible: Boolean,
    type: {
      type: String,
      default: 'success',
    },
  });

  const emit = defineEmits(['close']);

  const closeModal = () => {
    emit('close');
  };
  </script>
