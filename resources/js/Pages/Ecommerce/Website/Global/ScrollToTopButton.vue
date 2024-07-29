<template>
  <a href="javascript:void(0)" @click="scrollToTop" v-if="showButton" class="fixed bottom-8 right-8 z-[999] h-8 w-8 flex items-center justify-center rounded-lg  dark:bg-blue-800 bg-[#3f90d2] text-white shadow-md transition duration-300 ease-in-out hover:bg-black-600">
    <svg xmlns="http://www.w3.org/2000/svg" class="w-6 h-6 rotate-90"  fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/>
        </svg>
  </a>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const showButton = ref(false);

const handleScroll = () => {
  if (window.scrollY > 50 || document.documentElement.scrollTop > 50) {
    showButton.value = true;
  } else {
    showButton.value = false;
  }
};

const scrollToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: "smooth"
  });
};

onMounted(() => {
  window.addEventListener("scroll", handleScroll);
});

onUnmounted(() => {
  window.removeEventListener("scroll", handleScroll);
});
</script>



