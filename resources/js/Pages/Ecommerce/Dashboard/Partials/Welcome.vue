<script setup>
import { ref } from 'vue';
import BarChart from './BarChart.vue';
import LineChart from './LineChart.vue';

const totalUsers = ref(150);
const totalSales = ref(12345.67);
const totalContact = ref(25);

const recentOrders = ref([
    { id: 1, customer: 'John Doe', total: 199.99 },
    { id: 2, customer: 'Jane Smith', total: 299.99 },
]);
</script>

<template>
    <div class="w-full">
        <div
            class="p-2 lg:p-4 bg-white rounded-lg dark:bg-gray-800 dark:bg-gradient-to-bl dark:from-gray-700/50 dark:via-transparent border-b border-gray-200 dark:border-gray-700">
            <div class="">

                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div
                        class="flex p-4 place-items-center rounded shadow bg-gray-300 text-gray-900 dark:text-gray-300 dark:bg-gray-900 ">

                        <div
                            class="px-2 py-4 align-middle text-3xl rounded shadow hover:text-blue-600 bg-white text-gray-900 dark:text-gray-300 dark:bg-gray-800 ">
                            <i class="fas fa-users mx-2"></i>
                        </div>
                        <div class="pl-2">
                            <h2 class="text-lg font-semibold">Total Users</h2>
                            <p class="text-sm">{{ totalUsers }}</p>
                        </div>
                    </div>

                    <div
                        class="flex px-4 place-items-center rounded shadow bg-gray-300 text-gray-900 dark:text-gray-300 dark:bg-gray-900 ">

                        <div
                            class="px-2 py-4 align-middle text-3xl rounded shadow hover:text-blue-600 bg-white text-gray-900 dark:text-gray-300 dark:bg-gray-800 ">
                            <i class="fas fa-tags mx-2"></i>
                        </div>
                        <div class="pl-2">
                            <h2 class="text-lg font-semibold">Total Sales</h2>
                            <p>${{ totalSales.toFixed(2) }}</p>
                        </div>
                    </div>

                    <div
                        class="flex px-4 place-items-center rounded shadow bg-gray-300 text-gray-900 dark:text-gray-300 dark:bg-gray-900 ">

                        <div
                            class="px-2 py-4 align-middle text-3xl rounded shadow hover:text-blue-600 bg-white text-gray-900 dark:text-gray-300 dark:bg-gray-800 ">
                            <i class="fas fa-handshake mx-2"></i>
                        </div>
                        <div class="pl-2">
                            <h2 class="text-lg font-semibold">Total Contacts</h2>
                            <p class="text-sm">{{ totalContact }}</p>
                        </div>
                    </div>

                    <div
                        class="flex px-4 place-items-center rounded shadow bg-gray-300 text-gray-900 dark:text-gray-300 dark:bg-gray-900 ">
                        <div
                            class="px-2 py-4 align-middle text-3xl rounded shadow hover:text-blue-600 bg-white text-gray-900 dark:text-gray-300 dark:bg-gray-800 ">
                            <i class="fas fa-handshake mx-2"></i>
                        </div>
                        <div class="pl-2">
                            <h2 class="text-lg font-semibold">Recent Orders</h2>
                            <ul>
                                <li v-for="order in recentOrders" :key="order.id">
                                    <p class="text-xs">{{ order.customer }} - ${{ order.total.toFixed(2) }}</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mt-4">
            <div class="col-span-2">
                <BarChart />
            </div>
            <div class="col-span-2">
                <LineChart />
            </div>
        </div>
    </div>
</template>

<style scoped>
.grid {
    display: grid;
}
</style>
