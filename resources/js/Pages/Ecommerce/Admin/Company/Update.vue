<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import UpdateCompanyForm from './Partials/UpdateCompanyForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Alterar Empresa');

</script>

<template>

    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>
        <div>
            <Main>
                <UpdateCompanyForm :company="$page.props.company" />
            </main>
        </div>
    </AppLayout>
</template>
