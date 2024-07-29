<script setup>
import { defineProps, defineEmits } from 'vue';

const props = defineProps({
    item: Object,
    index: Number
});

const emit = defineEmits(['remove-item']);

const removeItem = () => {
    emit('remove-item');
};
</script>

<template>
    
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.codigo_produto" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.descricao" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.ncm" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.cst" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.cfop" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.unidade" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.quantidade" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.valor_unitario" />
    </td>
     <td class="px-1 py-1 text-xs">
        <input type="text" v-model="item.valor_total" />
    </td>
     <td class="px-1 py-1 text-xs">
        <button @click.prevent="removeItem">Remover</button>
    </td>
</template>

<style scoped>
/* Adicione aqui seus estilos personalizados */
</style>
