<script setup>
import { Head, Link } from '@inertiajs/vue3';
import { useDark, useToggle } from "@vueuse/core";

const isDarkMode = useDark();
const toggleDark = useToggle(isDarkMode);

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
    laravelVersion: {
        type: String,
        required: true,
    },
    phpVersion: {
        type: String,
        required: true,
    },
});


</script>

<template>

    <Head title="Welcome" />
    <div class="relative min-h-screen bg-gray-50 text-black/50 dark:bg-black dark:text-white/50 overflow-hidden">
        <div class="absolute -top-45 inset-0 bg-cover bg-center bg-no-repeat dark:hidden"
            style="background-image: url('/storage/images/banner_light.jpg');"></div>
        <div class="absolute -top-60 inset-0 bg-cover bg-center bg-no-repeat hidden dark:block"
            style="background-image: url('/storage/images/banner_dark.jpg');"></div>

        <div
            class="relative min-h-screen flex flex-col items-center justify-center selection:bg-[#FF2D20] selection:text-white">
            <div class="absolute top-0 left-0 w-full max-w-7xl px-6">
                <header class="flex items-center justify-between py-4">
                    <!-- Logo Section -->
                    <div class="flex items-center">
                        <img src="/storage/images/naito-dark.svg" alt="Logo1" class="dark:hidden h-16" />
                        <img src="/storage/images/naito-light.svg" alt="Logo1"
                            class="hidden dark:block text-white h-16" />
                    </div>

                    <!-- Navigation Section -->
                    <nav v-if="canLogin" class="flex items-center space-x-4">
                        <!-- Dark Mode Button Start -->
                        <div class="rounded-md px-3 py-2 ring-blue-700 focus:ring-2">
                            <a type="button" @click="toggleDark()" class="dark:text-white text-black">
                                <img src="/storage/images/dark_mode.svg" alt="Logo" class="dark:hidden h-6" />
                                <img src="/storage/images/light_mode.svg" alt="Logo"
                                    class="hidden dark:block text-white h-6" />
                            </a>
                        </div>
                        <!-- Dark Mode Button End -->

                        <Link v-if="$page.props.auth.user" :href="route('dashboard')"
                            class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white">
                        Dashboard
                        </Link>

                        <template v-else>
                            <Link :href="route('login')"
                                class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white">
                            Log in
                            </Link>

                            <Link v-if="canRegister" :href="route('register')"
                                class="rounded-md px-3 py-2 text-black ring-1 ring-transparent transition hover:text-black/70 focus:outline-none focus-visible:ring-[#FF2D20] dark:text-white dark:hover:text-white/80 dark:focus-visible:ring-white">
                            Register
                            </Link>
                        </template>
                    </nav>
                </header>
            </div>

            <div class="relative w-full max-w-2xl px-6 lg:max-w-7xl mt-16">
                <main class="mt-6">
                    <!-- Main content here -->
                </main>

            </div>
            <footer class="absolute -bottom-10 py-16 text-center text-sm text-black dark:text-white/70">
                Naito System © Marketing Digital 2024.
            </footer>
        </div>

    </div>
</template>
