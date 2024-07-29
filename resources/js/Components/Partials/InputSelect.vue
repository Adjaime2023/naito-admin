<template>
    <select  :class="classSelect" @change="onChange">
      <option>Selecione uma opção</option>
      <option v-for="(type, index) in options" :value="type" :key="index">{{ type }}</option>
    </select>
  </template>

  <script setup>
  import { ref, watch } from 'vue';

  const props = defineProps({
    options: {
      type: Array,
      default: () => [],
    },
    value: {
      type: String,
      default: '',
    },
    classSelect: {
      type: String,
      default:
        'form-control mt-2 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm',
    },
  });

  const selectedValue = ref(props.value);

  const onChange = (event) => {
    selectedValue.value = event.target.value;
  };

  watch(() => props.value, (newValue) => {
    selectedValue.value = newValue;
  });

  watch(selectedValue, (newValue) => {
    emit('update:value', newValue);
  });
  </script>

  <style>
  /* Adicione seu estilo aqui se necessário */
  </style>
