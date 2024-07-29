<script setup>
import { Link } from '@inertiajs/vue3';
</script>

<template>
    <Link :href="'/admin'">
          <!-- Logo -->
  <img src="/storage/images/logo-black.svg" alt="Logo" class="dark:hidden h-8" />
  <img src="/storage/images/logo-white.svg" alt="Logo" class="hidden dark:block h-8" />
    </Link>
</template>

