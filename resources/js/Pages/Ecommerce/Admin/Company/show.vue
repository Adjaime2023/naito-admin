<template>
    <div>
      <!-- Exemplo de renderização dos dados da empresa -->
      <h2>{{ company.name }}</h2>
      <p>{{ company.contact }}</p>
      <!-- Outros campos da empresa -->
    </div>
  </template>

  <script setup>
  import { usePage } from '@inertiajs/vue3';

  const { props } = usePage();

  // A propriedade company agora está disponível globalmente em todos os componentes Vue
  console.log('Dados da empresa:', props.company);
  </script>
