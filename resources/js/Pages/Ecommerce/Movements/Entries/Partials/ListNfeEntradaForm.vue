<template>
  <div>
    <h1>Lista de Notas Fiscais de Entrada</h1>
    <table>
      <thead>
        <tr>
          <th>Chave de Acesso</th>
          <th>Número</th>
          <th>Série</th>
          <th>Data de Emissão</th>
          <th>Data de Recebimento</th>
          <th>Emitente</th>
          <th>Destinatário</th>
          <th>Ações</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="nfe in nfeEntradas" :key="nfe.id">
          <td>{{ nfe.chave_acesso }}</td>
          <td>{{ nfe.numero }}</td>
          <td>{{ nfe.serie }}</td>
          <td>{{ nfe.data_emissao }}</td>
          <td>{{ nfe.data_recebimento }}</td>
          <td>{{ nfe.nome_emitente }}</td>
          <td>{{ nfe.nome_destinatario }}</td>
          <td>
            <a :href="`/nfe-entradas/${nfe.id}`">Ver Detalhes</a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

const props = defineProps({
  nfeEntradas: Array,
});
</script>
