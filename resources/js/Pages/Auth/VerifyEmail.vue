<script setup>
import { computed } from 'vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import { useDark, useToggle } from "@vueuse/core";

const isDarkMode = useDark();
const toggleDark = useToggle(isDarkMode);

const props = defineProps({
    status: String,
});

const form = useForm({});

const submit = () => {
    form.post(route('verification.send'));
};

const verificationLinkSent = computed(() => props.status === 'verification-link-sent');
</script>

<template>

    <Head title="Email Verification" />

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
                    Before continuing, could you verify your email address by clicking on the link we just emailed to
                    you?
                    If you didn't
                    receive the email, we will gladly send you another.
                </div>

                <div v-if="verificationLinkSent" class="mb-4 font-medium text-sm text-green-600 dark:text-green-400">
                    A new verification link has been sent to the email address you provided in your profile settings.
                </div>

                <form @submit.prevent="submit">
                    <div class="mt-4 flex items-center justify-between">
                        <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                            Resend Verification Email
                        </PrimaryButton>

                        <div>
                            <Link :href="route('profile.show')"
                                class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800">
                            Edit Profile</Link>

                            <Link :href="route('logout')" method="post" as="button"
                                class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800 ms-2">
                            Log Out
                            </Link>
                        </div>
                    </div>
                </form>
            </AuthenticationCard>


        </div>
    </div>
</template>
