<!-- ResponsiveSidebarLinkMax.vue -->
<template>
  <a :href="href" :class="computedClasses" @click="$emit('click')">
    <slot />
  </a>
</template>

<script>
export default {
  props: {
    active: {
      type: Boolean,
      default: false
    },
    href: String, // Correção aqui
    // ...
  },
  computed: {
    computedClasses() {
      return this.active
        ? 'hover:ml-4 w-full text-gray-800 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 dark:bg-gray-700 bg-gray-300 dark:hover:bg-gray-700 hover:bg-gray-100 p-2 pl-8 rounded-full transform ease-in-out duration-300 flex flex-row items-center space-x-3'
        : 'hover:ml-4 w-full text-gray-800 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 dark:bg-gray-900 bg-gray-400 dark:hover:bg-gray-700 hover:bg-gray-100 p-2 pl-8 rounded-full transform ease-in-out duration-300 flex flex-row items-center space-x-3';
    }
  }
};
</script>


