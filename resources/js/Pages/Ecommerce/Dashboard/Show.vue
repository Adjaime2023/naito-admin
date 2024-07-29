<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from './Partials/Welcome.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Dashboard');

</script>

<template>

    <Head :title="title" />
    <AppLayout>

        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
             <Welcome />
            </Main>
        </div>
    </AppLayout>
</template>
