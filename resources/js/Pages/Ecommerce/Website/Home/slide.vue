<template>
    <div>
      <div v-if="banners && banners.length">
        <div v-for="banner in banners" :key="banner.id">
          <img :src="banner.image_url_mobile" alt="Banner">
        </div>
      </div>
      <div v-else>
        <p>Nenhum banner encontrado.</p>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  
  const banners = ref([]);
  
  onMounted(async () => {
    try {
      const response = await axios.get('/api/website/siteBanner');
      banners.value = response.data.data;
    } catch (error) {
      console.error('Erro ao buscar banners:', error);
    }
  });
  </script>
  