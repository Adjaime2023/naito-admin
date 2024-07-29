<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';
import CreateNfeForm from './Partials/CreateNfeForm.vue';

// Define the title for the page
const title = ref('Cadastrar Nota de Entrada');
</script>

<template>
    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
                <CreateNfeForm :data="$page.props.data" />
            </Main>
        </div>
    </AppLayout>
</template>
