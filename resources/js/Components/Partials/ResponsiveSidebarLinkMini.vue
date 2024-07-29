<template>
     <a  :href="href" :class="computedClasses" @click="$emit('click')">
      <slot />
    </a>
  </template>

  <script>
  export default {
    props: {
      active: {
        active: Boolean,
         default: false
      },
      href: String, // Correção aqui
    },
    computed: {
      computedClasses() {
        return this.active
          ? 'cursor-pointer my-2 hover:ml-4 justify-end pr-3 dark:text-gray-200 text-gray-900 hover:text-purple-500 w-full dark:bg-gray-700 bg-gray-300 dark:hover:bg-gray-700 hover:bg-gray-100 p-3 rounded-full transform ease-in-out duration-500 flex'
          : 'cursor-pointer my-2 hover:ml-4 justify-end pr-3 dark:text-gray-200 text-gray-900 hover:text-purple-500 w-full dark:bg-gray-900 bg-gray-400 dark:hover:bg-gray-700 hover:bg-gray-100 p-3 rounded-full transform ease-in-out duration-500 flex';
      }
    }
  };
  </script>
