<script setup>
import { ref, provide } from 'vue';
import { Head } from '@inertiajs/vue3';
import Navbar from './Global/Navbar.vue';
import FooterEcommerce from './Global/FooterEcommerce.vue';
import ScrollToTopButton from './Global/ScrollToTopButton.vue';
import CarouselBanner from './Home/CarouselBanner.vue';
import Contact from './Home/Contact.vue';
import About from './Home/About.vue';
import Partners from './Home/Partners.vue';
import Releases from './Home/Releases.vue';
import Promotion from './Home/Promotion.vue';
import UniversalModal from './Global/UniversalModal.vue';
import Groups from './Home/Groups.vue';
import BannerSite from './Home/BannerSite.vue';

const title = ref('Home');

const isModalVisible = ref(false);
const modalTitle = ref('');
const modalMessage = ref('');

const openModal = (title, message) => {
  modalTitle.value = title;
  modalMessage.value = message;
  isModalVisible.value = true;
};

const closeModal = () => {
  isModalVisible.value = false;
};

// Provide the openModal function to the child components
provide('openModal', openModal);

// Example usage of the modal, you can call this function anywhere in your page
const showSuccessModal = () => {
  openModal('Sucesso', 'Esta é uma mensagem de sucesso!');
};
</script>

<template>
  <Head :title="title" />

  <Navbar />
  <div id="main-content" class="text-black/50 dark:text-white/50">
    <main>
      <CarouselBanner class="w-screen pt-12 sm:pt-12 md:pt-12 lg:pt-[72px]" />  
      <Releases  class="w-full px-0 sm:px-4 md:pt-16 lg:pt-[74px]" />
      <BannerSite class="w-screen " />       
      <Promotion  class="w-full px-0 sm:px-4 md:pt-16 lg:pt-[74px]"  />
      <Groups  class="w-full px-0 sm:px-4 md:pt-16 lg:pt-[74px] lg:pr-4" />
      <Contact class="w-full px-0 sm:px-4 md:pt-16 lg:pt-[74px]" />
      <Partners class="w-full px-4 sm:px-4 md:pt-6 lg:pt-[74px]" /> 
      <About class="w-full px-0 sm:px-4 md:pt-16 lg:pt-[74px]" />
    </main>
  </div>

  <footer class="w-screen text-sm text-black dark:text-white/70">
    <FooterEcommerce />
  </footer>

  <!-- Back To Top Start -->
  <div class="pr-4">
    <ScrollToTopButton />
  </div>
  <!-- Back To Top End -->

  <!-- Modal Universal -->
  <UniversalModal
    :title="modalTitle"
    :message="modalMessage"
    :isVisible="isModalVisible"
    @close="closeModal"
  />
</template>
