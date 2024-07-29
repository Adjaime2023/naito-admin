<script setup>
import { ref } from 'vue';
import { Head } from '@inertiajs/vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import UpdateBannerForm from './Partials/UpdateBannerForm.vue';
import Header from '@/Components/Partials/Header.vue';
import Main from '@/Components/Partials/Main.vue';

const title = ref('Alterar Banner');

</script>

<template>

    <Head :title="title" />
    <AppLayout>
        <Header>
            {{ title }}
        </Header>
        <div>
            <Main>
                <UpdateBannerForm :banner="$page.props.banner" />
            </main>
        </div>
    </AppLayout>
</template>
