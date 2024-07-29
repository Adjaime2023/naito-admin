<script setup>
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

const props = defineProps({
    email: String,
    token: String,
});

const form = useForm({
    token: props.token,
    email: props.email,
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('password.update'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>

    <Head title="Reset Password" />

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

                <form @submit.prevent="submit">
                    <div>
                        <InputLabel for="email" value="Email" />
                        <TextInput id="email" v-model="form.email" type="email" class="mt-1 block w-full" required
                            autofocus autocomplete="username" />
                        <InputError class="mt-2" :message="form.errors.email" />
                    </div>

                    <div class="mt-4">
                        <InputLabel for="password" value="Password" />
                        <TextInput id="password" v-model="form.password" type="password" class="mt-1 block w-full"
                            required autocomplete="new-password" />
                        <InputError class="mt-2" :message="form.errors.password" />
                    </div>

                    <div class="mt-4">
                        <InputLabel for="password_confirmation" value="Confirm Password" />
                        <TextInput id="password_confirmation" v-model="form.password_confirmation" type="password"
                            class="mt-1 block w-full" required autocomplete="new-password" />
                        <InputError class="mt-2" :message="form.errors.password_confirmation" />
                    </div>

                    <div class="flex items-center justify-end mt-4">
                        <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                            Reset Password
                        </PrimaryButton>
                    </div>
                </form>
            </AuthenticationCard>
        </div>
    </div>
</template>
