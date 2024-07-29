<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import UpdateColorForm from './Partials/UpdateColorForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Alterar Cor');

</script>

<template>

    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>
        <div>
            <Main>
                <UpdateColorForm :color="$page.props.color" />
            </main>
        </div>
    </AppLayout>
</template>
