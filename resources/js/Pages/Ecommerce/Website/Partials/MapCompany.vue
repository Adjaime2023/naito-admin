<template>
  <div id="map" class="z-10 w-full h-96 "></div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';


import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png';
import markerIcon from 'leaflet/dist/images/marker-icon.png';
import markerShadow from 'leaflet/dist/images/marker-shadow.png';
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
});

const company = ref(null);

onMounted(async () => {
  try {
    const response = await axios.get('/api/company/showCompany');
    company.value = response.data.data;
    console.log('Dados da empresa:', company.value);

    // Verifica se os dados da empresa existem e possuem latitude e longitude válidas
    if (company.value && company.value.latitude && company.value.longitude) {
      const map = L.map('map').setView([company.value.latitude, company.value.longitude], company.value.nivel_zoon || 13);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map);

      L.marker([company.value.latitude, company.value.longitude]).addTo(map)
        .bindPopup(`${company.value.address}, ${company.value.number} - ${company.value.neighborhood}, ${company.value.city} - ${company.value.uf}, ${company.value.cep}`)
        .openPopup();
    } else {
      console.error('Latitude e longitude não estão disponíveis nos dados da empresa');
    }
  } catch (error) {
    console.error('Erro ao buscar empresa:', error);
  }
});

</script>
