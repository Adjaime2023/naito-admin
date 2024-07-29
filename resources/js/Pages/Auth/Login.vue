<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import Checkbox from '@/Components/Checkbox.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { useDark, useToggle } from "@vueuse/core";

const isDarkMode = useDark();
const toggleDark = useToggle(isDarkMode);


defineProps({
    canResetPassword: Boolean,
    status: String,
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.transform(data => ({
        ...data,
        remember: form.remember ? 'on' : '',
    })).post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <Head title="Log in" />
    <!-- Dark Mode button Start -->
    <div class="absolute z-50 top-0 right-0 mt-6 mr-6">
        <a href="#" @click="toggleDark()" class="dark:text-white text-black block">
            <img src="/storage/images/dark_mode.svg" alt="Dark Mode" class="dark:hidden h-6" />
            <img src="/storage/images/light_mode.svg" alt="Light Mode" class="hidden dark:block h-6" />
        </a>
    </div>
    <!-- Dark Mode Button End -->
    <div class="relative min-h-screen flex items-center justify-center  dark:text-white/50 overflow-hidden">
        <!-- Background Images -->
        <div class="absolute -top-45 inset-0 bg-cover bg-center bg-no-repeat dark:hidden"
            style="background-image: url('/storage/images/banner_light.jpg'); z-index: -1;"></div>
        <div class="absolute -top-60 inset-0 bg-cover bg-center bg-no-repeat hidden dark:block"
            style="background-image: url('/storage/images/banner_dark.jpg'); z-index: -1;"></div>



        <!-- Form Container -->
        <div class="relative  z-10 w-full max-w-md">


            <AuthenticationCard>
                <template #logo>
                    <AuthenticationCardLogo />
                </template>

                <div v-if="status" class="mb-4 font-medium text-sm text-green-600 dark:text-green-400">
                    {{ status }}
                </div>

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
                            required autocomplete="current-password" />
                        <InputError class="mt-2" :message="form.errors.password" />
                    </div>

                    <div class="block mt-4">
                        <label class="flex items-center">
                            <Checkbox v-model:checked="form.remember" name="remember" />
                            <span class="ms-2 text-sm text-gray-600 dark:text-gray-400">Remember me</span>
                        </label>
                    </div>

                    <div class="flex items-center justify-end mt-4">
                        <Link v-if="canResetPassword" :href="route('password.request')"
                            class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800">
                        Forgot your password?
                        </Link>

                        <PrimaryButton class="ms-4" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing">
                            Log in
                        </PrimaryButton>
                    </div>
                </form>
            </AuthenticationCard>
        </div>
    </div>
</template>
