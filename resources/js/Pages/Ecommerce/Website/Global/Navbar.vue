<template>
  <nav class="z-40 px-2 flex w-full items-stretch fixed top-0 shadow-md bg-gray-200/90 dark:bg-gray-900/90">
    <div class="w-full">
      <div class="relative -mx-2 flex items-center justify-start">
        <div class="pl-4 py-2">
          <a href="#home" class="z-50 py-2">
            <ApplicationMark class="block h-9 w-auto" />
          </a>
        </div>
        <div class="flex w-full items-center justify-center animate__animated animate__fadeInUp">
          <button id="navbarToggler"
            class="absolute right-6 top-1/2 block -translate-y-1/2 rounded-lg py-[6px] ring-blue-700 focus:ring-2 lg:hidden"
            @click="toggleNavbar">
            <span class="relative my-[6px] block h-[2px] w-[30px] bg-gray-900 dark:bg-white"></span>
            <span class="relative my-[6px] block h-[2px] w-[30px] bg-gray-900 dark:bg-white"></span>
            <span class="relative my-[6px] block h-[2px] w-[30px] bg-gray-900 dark:bg-white"></span>
          </button>
          <nav
            :class="['absolute right-4 top-full', { hidden: !isNavbarOpen }, 'w-full bg-gray-200/90 dark:bg-gray-900/90 max-w-[200px] z-50 rounded-b-lg lg:static lg:block lg:w-full lg:max-w-full lg:bg-transparent lg:px-4 lg:py-0 lg:shadow-none dark:lg:bg-transparent xl:px-6']">
            <ul class="block lg:flex 2xl:ml-20">
              <li v-for="(item, index) in menuItems" :key="index"
                :class="['group relative', { 'lg:ml-7': index !== 0 }]">
                <a :href="route('home') + '#' + item.url"
                  class="mx-2 flex py-2 px-4 text-black dark:text-white rounded-lg font-medium group-hover:text-blue-700 dark:hover:text-blue-400 lg:inline-flex lg:px-0 lg:py-6 lg:group-hover:opacity-70"
                  @click="toggleSubmenu(index)">
                  {{ item.label }}
                </a>
                <ul v-if="item.submenu && item.submenu.length"
                  :class="['submenu z-50 absolute left-0 top-full w-[250px] rounded-lg bg-gray-200/90 dark:bg-gray-900/90 text-gray-800 dark:text-white opacity-0 group-hover:opacity-100 lg:invisible lg:absolute lg:top-[110%] lg:block lg:opacity-0 lg:shadow-lg lg:group-hover:visible lg:group-hover:top-full', { block: isSubmenuOpen === index, hidden: isSubmenuOpen !== index }]">
                  <li v-for="subItem in item.submenu" :key="subItem.id">
                    <a :href="subItem.url"
                      class="block rounded px-4 py-[10px] text-sm text-gray-900 dark:text-gray-200 hover:text-blue-700 dark:hover:text-blue-400">
                      {{ subItem.label }}
                    </a>
                  </li>
                </ul>
              </li>
            </ul>
          </nav>

          <!-- Dark Mode button Start -->
          <div class="absolute right-20 top-1/2 z-50 -translate-y-1/2 rounded-lg py-[6px] ring-blue-700 focus:ring-2">
            <a type="button" @click="toggleDark()" class="dark:text-white text-black ">
              <img src="/storage/images/dark_mode.svg" alt="Logo" class="dark:hidden h-6" />
              <img src="/storage/images/light_mode.svg" alt="Logo" class="hidden dark:block text-white h-6" />
            </a>
          </div>
          <!-- Dark Mode Button End -->
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { usePage } from '@inertiajs/vue3';
import { useDark, useToggle } from "@vueuse/core";
import ApplicationMark from '@/Components/ApplicationMark.vue';
import axios from 'axios';

const isDarkMode = useDark();
const toggleDark = useToggle(isDarkMode);

const { props } = usePage();
const route = window.route;

const isNavbarOpen = ref(false);
const isSubmenuOpen = ref(null);
const groups = ref([]);
const menuItems = ref([]);

// Função para alternar o submenu
const toggleSubmenu = (index) => {
  if (isSubmenuOpen.value === index) {
    isSubmenuOpen.value = null;
  } else {
    isSubmenuOpen.value = index;
  }
};

// Função para buscar grupos da API
const fetchGroups = async () => {
  try {
    const response = await axios.get('/api/website/siteGroups');
    groups.value = response.data;
    updateMenuItems();
  } catch (error) {
    console.error('Erro ao buscar grupos:', error);
  }
};

// Função para atualizar menuItems com grupos obtidos da API
const updateMenuItems = () => {
  menuItems.value = [
    { label: "Home", url: "home" },
    { label: "Lançamentos", url: "releases" },
    { label: "Promoção", url: "promotion" },
    { label: "Sobre Nós", url: "about" },
    { label: "Parceiros", url: "partners" },
    { label: "Contato", url: "contact" },
    {
      label: "Produtos",
      url: "group",
      submenu: groups.value.map(group => ({
        label: group.name,
        url: route('websiteProducts', { group_id: group.id }),
      })),
    },
  ];
};

onMounted(fetchGroups);

const toggleNavbar = () => {
  isNavbarOpen.value = !isNavbarOpen.value;
};
</script>

<style scoped>
/* Adicione seus estilos aqui, se necessário */
</style>
