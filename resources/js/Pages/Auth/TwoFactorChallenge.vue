<script setup>
import { nextTick, ref } from 'vue';
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

const recovery = ref(false);

const form = useForm({
    code: '',
    recovery_code: '',
});

const recoveryCodeInput = ref(null);
const codeInput = ref(null);

const toggleRecovery = async () => {
    recovery.value ^= true;

    await nextTick();

    if (recovery.value) {
        recoveryCodeInput.value.focus();
        form.code = '';
    } else {
        codeInput.value.focus();
        form.recovery_code = '';
    }
};

const submit = () => {
    form.post(route('two-factor.login'));
};
</script>

<template>

    <Head title="Two-factor Confirmation" />


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
                    <template v-if="!recovery">
                        Please confirm access to your account by entering the authentication code provided by your
                        authenticator application.
                    </template>

                    <template v-else>
                        Please confirm access to your account by entering one of your emergency recovery codes.
                    </template>
                </div>

                <form @submit.prevent="submit">
                    <div v-if="!recovery">
                        <InputLabel for="code" value="Code" />
                        <TextInput id="code" ref="codeInput" v-model="form.code" type="text" inputmode="numeric"
                            class="mt-1 block w-full" autofocus autocomplete="one-time-code" />
                        <InputError class="mt-2" :message="form.errors.code" />
                    </div>

                    <div v-else>
                        <InputLabel for="recovery_code" value="Recovery Code" />
                        <TextInput id="recovery_code" ref="recoveryCodeInput" v-model="form.recovery_code" type="text"
                            class="mt-1 block w-full" autocomplete="one-time-code" />
                        <InputError class="mt-2" :message="form.errors.recovery_code" />
                    </div>

                    <div class="flex items-center justify-end mt-4">
                        <button type="button"
                            class="text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 underline cursor-pointer"
                            @click.prevent="toggleRecovery">
                            <template v-if="!recovery">
                                Use a recovery code
                            </template>

                            <template v-else>
                                Use an authentication code
                            </template>
                        </button>

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
