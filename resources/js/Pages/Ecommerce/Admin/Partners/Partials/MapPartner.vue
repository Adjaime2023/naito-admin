<template>
  <div id="map" class="z-10 w-full h-64"></div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

// Correção dos ícones do Leaflet (opcional)
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png';
import markerIcon from 'leaflet/dist/images/marker-icon.png';
import markerShadow from 'leaflet/dist/images/marker-shadow.png';

delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
});

const partner = ref(null);

onMounted(async () => {
  try {
    const response = await axios.get('/api/website/sitePartner');
    partner.value = response.data.data;

    // Verifica se os dados do parceiro existem e possuem latitude e longitude válidas
    if (partner.value && partner.value.latitude && partner.value.longitude) {
      const map = L.map('map').setView([partner.value.latitude, partner.value.longitude], partner.value.nivel_zoon || 13);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map);

      L.marker([partner.value.latitude, partner.value.longitude]).addTo(map)
        .bindPopup(`${partner.value.address}, ${partner.value.number} - ${partner.value.neighborhood}, ${partner.value.city} - ${partner.value.uf}, ${partner.value.cep}`)
        .openPopup();
    } else {
      console.error('Latitude e longitude não estão disponíveis nos dados do parceiro');
    }
  } catch (error) {
    console.error('Erro ao buscar parceiros:', error);
  }
});


</script>
