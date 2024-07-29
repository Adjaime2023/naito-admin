<script setup>
import { ref } from 'vue';
import { Head} from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import CreateProductForm from './Partials/CreateProductForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Cadastrar Produto');

</script>

<template>
    <Head  :title="title"/>
    <AppLayout >
            <Header>
                {{ title }}
            </Header>

        <div>
            <Main>
                <CreateProductForm />
            </Main>
        </div>
    </AppLayout>
</template>
