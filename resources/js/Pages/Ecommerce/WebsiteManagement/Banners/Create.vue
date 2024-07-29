<script setup>
import { ref } from 'vue';
import { Head} from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import CreateBannerForm from './Partials/CreateBannerForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Cadastrar Banner');

</script>

<template>
    <Head  :title="title"/>
    <AppLayout >
            <Header>
                {{ title }}
            </Header>

        <div>
            <Main>
                <CreateBannerForm />
            </Main>
        </div>
    </AppLayout>
</template>
