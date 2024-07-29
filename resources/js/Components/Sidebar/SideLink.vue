 <script setup>
  import { computed } from 'vue';
  import { Link } from '@inertiajs/vue3';

  const props = defineProps({
      href: String,
      active: Boolean,
  });

  const classes = computed(() => {
      return props.active
          ? 'w-full h-full py-2 px-2 border-b border-slate-400 flex items-center bg-blue-500/30   hover:bg-slate-200 dark:hover:bg-slate-800'
          : 'w-full h-full py-2 px-2 border-b border-slate-400 flex items-center  bg-gray-50 dark:bg-gray-900  hover:bg-slate-200 dark:hover:bg-slate-800';
  });
  </script>



<template>
     <li :class="classes">
    <Link :href="href" class="flex items-centerfont-sans font-hairline hover:font-normal text-sm text-nav-item no-underline w-full">
        <slot />
    </Link>
    </li>
</template>




