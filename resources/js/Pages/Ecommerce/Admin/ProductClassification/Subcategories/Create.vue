<script setup>
import { ref } from 'vue';
import { Head} from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import CreateSubcategoryForm from './Partials/CreateSubcategoryForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Cadastrar Subcategoria');

</script>

<template>
    <Head  :title="title"/>
    <AppLayout >
            <Header>
                {{ title }}
            </Header>

        <div>
            <Main>
                <CreateSubcategoryForm />
            </Main>
        </div>
    </AppLayout>
</template>
