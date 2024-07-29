<template>
    <a :class="classes"  :href="href" >
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
      href: {
      type: String,
      default: '#'
    }
    },
    data() {
      return {
        open: false
      };

    },
    computed: {
      classes() {
        return this.active
            ? 'cursor-pointer my-2 p-3 hover:ml-4 justify-end text-gray-900 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 w-full dark:bg-gray-700 bg-gray-300 dark:hover:bg-gray-700 hover:bg-gray-100 rounded-full transform ease-in-out duration-500 flex'
            : 'cursor-pointer my-2 p-3 hover:ml-4 justify-end text-gray-900 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 w-full dark:bg-gray-900 bg-gray-400 dark:hover:bg-gray-700 hover:bg-gray-100 rounded-full transform ease-in-out duration-500 flex';
        }
    }
};
  </script>
