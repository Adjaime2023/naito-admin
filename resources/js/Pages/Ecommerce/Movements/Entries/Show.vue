<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import ShowNfeEntradaFormNfeEntrada from './Partials/ShowNfeEntradaForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Listar Notas Fiscal de Entrada');

</script>

<template>

    <Head :title="title" />
    <AppLayout>

        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
                <ShowNfeEntradaFormNfeEntrada />
            </Main>
        </div>
    </AppLayout>
</template>
