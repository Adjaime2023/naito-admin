<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import UpdateNfeForm from './Partials/UpdateNfeForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Alterar Nota de Entrada ');

</script>

<template>

    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>
        <div>
            <Main>
               <UpdateNfeForm :nfeEntrada="$page.props.nfeEntrada" />
            </Main>
        </div>
    </AppLayout>
</template>
