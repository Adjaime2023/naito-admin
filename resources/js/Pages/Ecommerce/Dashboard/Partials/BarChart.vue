<template>
    <div
            class="p-2 lg:p-4 bg-white rounded-lg dark:bg-gray-800 dark:bg-gradient-to-bl dark:from-gray-700/50 dark:via-transparent border-b border-gray-200 dark:border-gray-700">
         
      <Bar :data="chartData" :options="chartOptions" />
    </div>
  </template>
  
  <script setup>
  import { Bar } from 'vue-chartjs';
  import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js';
  
  ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);
  
  const chartData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [
      {
        label: 'Total Sales',
        backgroundColor: '#42A5F5',
        data: [40, 20, 12, 39, 10, 40],
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
  