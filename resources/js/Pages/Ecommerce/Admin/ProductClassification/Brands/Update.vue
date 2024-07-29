<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import UpdateBrandForm from './Partials/UpdateBrandForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Alterar Marca');

</script>

<template>

    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>
        <div>
            <Main>
                <UpdateBrandForm :brand="$page.props.brand" />
            </main>
        </div>
    </AppLayout>
</template>
