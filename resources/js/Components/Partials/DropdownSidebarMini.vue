<template>
    <a :class="classes">
      <slot />
      <svg v-show="!open" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
           class="bi bi-chevron-down right-0 w-3" viewBox="0 0 16 16">
        <path fill-rule="evenodd"
              d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
      </svg>
      <svg v-show="open" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
           class="rotate-180 bi bi-chevron-down right-0 w-3" viewBox="0 0 16 16">
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
                ? 'hover:ml-4 justify-end py-3 pr-2 text-gray-900 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 w-full bg-gray-300  dark:bg-gray-700 dark:hover:bg-gray-700 hover:bg-gray-100 rounded-full transform ease-in-out duration-100 flex'
                : 'hover:ml-4 justify-end py-3 pr-2 text-gray-900 dark:text-gray-100 hover:text-purple-500 dark:hover:text-blue-500 w-full bg-gray-400  dark:bg-gray-900 dark:hover:bg-gray-700 hover:bg-gray-100 rounded-full transform ease-in-out duration-100 flex';
        }
    }
  };
  </script>
