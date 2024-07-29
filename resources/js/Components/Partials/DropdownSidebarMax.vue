<template>
    <a :class="classes">
      <slot />
      <svg v-show="!open" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
           class="bi bi-chevron-down right-0" viewBox="0 0 16 16">
        <path fill-rule="evenodd"
              d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
      </svg>
      <svg v-show="open" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
           class="rotate-180 bi bi-chevron-down right-0" viewBox="0 0 16 16">
        <path fill-rule="evenodd"
              d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
      </svg>
    </a>
  </template>

  <script>
  export default {
    props: {
      active: {
        type: Boolean,
        default: false
      },
  
    },
    data() {
      return {
        open: false
      };
    },
    computed: {
      classes() {
        return this.active
          ? 'cursor-pointer hover:ml-4 w-full dark:text-gray-200 text-gray-800 hover:text-purple-500 dark:bg-gray-700 bg-gray-300 dark:hover:bg-gray-700 hover:bg-gray-100 p-2 pl-8 rounded-full transform ease-in-out duration-300 flex justify-between items-center flex flex-row items-center space-x-3'
          : 'cursor-pointer hover:ml-4 w-full dark:text-gray-200 text-gray-800 hover:text-purple-500 dark:bg-gray-900 bg-gray-400 dark:hover:bg-gray-700 hover:bg-gray-100 p-2 pl-8 rounded-full transform ease-in-out duration-300 flex justify-between items-center flex flex-row items-center space-x-3';
      }
    }
  };
  </script>
