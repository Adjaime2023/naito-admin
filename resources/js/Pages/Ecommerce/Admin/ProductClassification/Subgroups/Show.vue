<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import ShowSubgroupForm from './Partials/ShowSubgroupForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Listar Subgrupos');

</script>

<template>

    <Head :title="title" />
    <AppLayout>

        <Header>
            {{ title }}
        </Header>

        <div>
            <Main>
                <ShowSubgroupForm />
            </Main>
        </div>
    </AppLayout>
</template>
