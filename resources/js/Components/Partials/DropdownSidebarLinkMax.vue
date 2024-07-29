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
          ? 'cursor-pointer my-2 hover:ml-4 w-full text-gray-800 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 dark:bg-gray-700 bg-gray-300 dark:hover:bg-gray-700 hover:bg-gray-100 p-2 pl-8 rounded-full transform ease-in-out duration-300 flex flex-row items-center space-x-3"'
          : 'cursor-pointer my-2 hover:ml-4 w-full text-gray-800 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 dark:bg-gray-900 bg-gray-400 dark:hover:bg-gray-700 hover:bg-gray-100 p-2 pl-8 rounded-full transform ease-in-out duration-300 flex flex-row items-center space-x-3';
      }
    }
  };
  </script>
