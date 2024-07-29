<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import UpdateCustomerForm from './Partials/UpdateCustomerForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Alterar Clientes');

</script>

<template>

    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>
        <div>
            <Main>
                <UpdateCustomerForm :customer="$page.props.customer" />
            </main>
        </div>
    </AppLayout>
</template>
