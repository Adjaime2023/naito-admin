<script setup>
defineProps({
    type: {
        type: String,
        default: 'Submit',
    },
});
</script>

<template>
    <button :type="type" class="items-center text-center underline-offset-2 mx-3 py-2  space-x-2
    group  bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500   hover:dark:from-cyan-600 hover:dark:to-blue-600
    bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100 rounded-full">
        <slot />
    </button>
</template>

