<script setup>
import { ref } from 'vue';
import { Head} from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import CreateSupplierForm from './Partials/CreateSupplierForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Cadastrar Fornecedor');

</script>

<template>
    <Head  :title="title"/>
    <AppLayout >
            <Header>
                {{ title }}
            </Header>

        <div>
            <Main>
                <CreateSupplierForm />
            </Main>
        </div>
    </AppLayout>
</template>
