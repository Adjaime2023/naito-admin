<script setup>
defineProps({
    type: {
        type: String,
        default: 'Submit',
    },
});
</script>

<template>
    <button :type="type" class="items-center text-center underline-offset-2 mx-1 px-2 py-3 mt-2 space-x-2 justify-between text-sm font-semibold text-purple-100  bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500  dark:hover:bg-blue-500 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple">
        <slot />
    </button>
</template>

