<script setup>
import { ref } from 'vue';
import { Head, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { useDark, useToggle } from "@vueuse/core";

const isDarkMode = useDark();
const toggleDark = useToggle(isDarkMode);

const form = useForm({
    password: '',
});

const passwordInput = ref(null);

const submit = () => {
    form.post(route('password.confirm'), {
        onFinish: () => {
            form.reset();

            passwordInput.value.focus();
        },
    });
};
</script>

<template>

    <Head title="Secure Area" />


    <!-- Dark Mode button Start -->
    <div class="absolute z-50 top-0 right-0 mt-6 mr-6">
        <a href="#" @click="toggleDark()" class="dark:text-white text-black block">
            <img src="/storage/images/dark_mode.svg" alt="Dark Mode" class="dark:hidden h-6" />
            <img src="/storage/images/light_mode.svg" alt="Light Mode" class="hidden dark:block h-6" />
        </a>
    </div>
    <!-- Dark Mode Button End -->
    <div
        class="relative min-h-screen flex items-center justify-center bg-transparent dark:text-white/50 overflow-hidden">
        <!-- Background Images -->
        <div class="absolute -top-45 inset-0 bg-cover bg-center bg-no-repeat dark:hidden"
            style="background-image: url('/storage/images/banner_light.jpg'); z-index: -1;"></div>
        <div class="absolute -top-60 inset-0 bg-cover bg-center bg-no-repeat hidden dark:block"
            style="background-image: url('/storage/images/banner_dark.jpg'); z-index: -1;"></div>






        <!-- Form Container -->
        <div class="relative z-10 w-full max-w-md">

            <AuthenticationCard>
                <template #logo>
                    <AuthenticationCardLogo />
                </template>

                <div class="mb-4 text-sm text-gray-600 dark:text-gray-400">
                    This is a secure area of the application. Please confirm your password before continuing.
                </div>

                <form @submit.prevent="submit">
                    <div>
                        <InputLabel for="password" value="Password" />
                        <TextInput id="password" ref="passwordInput" v-model="form.password" type="password"
                            class="mt-1 block w-full" required autocomplete="current-password" autofocus />
                        <InputError class="mt-2" :message="form.errors.password" />
                    </div>

                    <div class="flex justify-end mt-4">
                        <PrimaryButton class="ms-4" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing">
                            Confirm
                        </PrimaryButton>
                    </div>
                </form>
            </AuthenticationCard>

        </div>
    </div>
</template>
