<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import ShowEmployeeForm from './Partials/ShowEmployeeForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Listar Funcionários');

</script>

<template>

    <Head :title="title" />
    <AppLayout>

        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
                <ShowEmployeeForm />
            </Main>
        </div>
    </AppLayout>
</template>
