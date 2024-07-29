<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import ShowPartnerForm from './Partials/ShowPartnerForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Listar Parceiros');

</script>

<template>

    <Head :title="title" />
    <AppLayout>

        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
                <ShowPartnerForm />
            </Main>
        </div>
    </AppLayout>
</template>
