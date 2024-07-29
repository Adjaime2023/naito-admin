<template>
   <div
            class="p-2 lg:p-4 bg-white rounded-lg dark:bg-gray-800 dark:bg-gradient-to-bl dark:from-gray-700/50 dark:via-transparent border-b border-gray-200 dark:border-gray-700">
         
      <Line :data="chartData" :options="chartOptions" />
    </div>
  </template>
  
  <script setup>
  import { Line } from 'vue-chartjs';
  import { Chart as ChartJS, Title, Tooltip, Legend, LineElement, CategoryScale, LinearScale, PointElement } from 'chart.js';
  
  ChartJS.register(Title, Tooltip, Legend, LineElement, CategoryScale, LinearScale, PointElement);
  
  const chartData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [
      {
        label: 'Total Users',
        borderColor: '#FF6384',
        backgroundColor: '#FF6384',
        data: [65, 59, 80, 81, 56, 55],
      },
    ],
  };
  
  const chartOptions = {
    responsive: true,
    maintainAspectRatio: false,
  };
  </script>
  
  <style scoped>
  </style>
  