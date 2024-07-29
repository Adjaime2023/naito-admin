<script setup>
import { Head, Link, router } from '@inertiajs/vue3';
import DropdownSidebarMax from '@/Components/Partials/DropdownSidebarMax.vue';
import DropdownSidebarLinkMax from '@/Components/Partials/DropdownSidebarLinkMax.vue';
import ResponsiveSidebarLinkMax from '@/Components/Partials/ResponsiveSidebarLinkMax.vue';
import { ref } from 'vue';
let openClientes = ref(false);
let openFornecedores = ref(false);



</script>

<template>
    <div
        class=" text-gray-800 dark:text-gray-100 bg-gray-200  dark:bg-gray-800 dark:border-[#0f0f0f] mt-20 flex-col space-y-2 w-full h-[calc(100vh)]">

        <!-- MAX SIDEBAR-->
        <ResponsiveSidebarLinkMax :href="route('dashboard')" :active="route().current('dashboard')">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor"
                class="w-4 h-4">
                <path strokeLinecap="round" strokeLinejoin="round"
                    d="M2.25 12l8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" />
            </svg>
            <div class=" w-full pl-0">
                Home
            </div>
        </ResponsiveSidebarLinkMax>

        <ResponsiveSidebarLinkMax title="Perfil" :href="route('profile.show')"  :active="route().current('profile.show')">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor"
                class="w-4 h-4">
                <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd">
                </path>
            </svg>
            <div class=" w-full pl-0">
                Perfil
            </div>
        </ResponsiveSidebarLinkMax>
        <ResponsiveSidebarLinkMax title="Perfil" :href="route('profile.show')"  :active="route().current('profile.show')">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                class="w-4 h-4">
                <path stroke-linecap="round" stroke-linejoin="round"
                    d="M3.75 5.25h16.5m-16.5 4.5h16.5m-16.5 4.5h16.5m-16.5 4.5h16.5" />
            </svg>
            <div class=" w-full pl-0">
                Table
            </div>
        </ResponsiveSidebarLinkMax>

        <div x-data="{ openFornecedores: false }">
            <DropdownSidebarMax title="Cadastros" @click="openFornecedores = !openFornecedores" :active= "openFornecedores ">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4">
                    <path fill-rule="evenodd"
                        d="M4 4a2 2 0 012-2h8a2 2 0 012 2v12a1 1 0 110 2h-3a1 1 0 01-1-1v-2a1 1 0 00-1-1H9a1 1 0 00-1 1v2a1 1 0 01-1 1H4a1 1 0 110-2V4zm3 1h2v2H7V5zm2 4H7v2h2V9zm2-4h2v2h-2V5zm2 4h-2v2h2V9z"
                        clip-rule="evenodd"></path>
                </svg>
                <span class="block w-full pl-0 hover:text-gray-300">Fornecedores</span>
            </DropdownSidebarMax>
            <div  class="ml-4 relative group" v-show="openFornecedores" >

                <DropdownSidebarLinkMax title="Cadastrar Fornecedor" :href="route('suppliers.create')"  :active="route().current('suppliers.create')">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"
                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                        <path
                            d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z">
                        </path>
                    </svg>
                    <div>
                        Cadastro
                    </div>
                </DropdownSidebarLinkMax>
                <DropdownSidebarLinkMax title="Listar Fornecedor" :href="route('suppliers.show')"  :active="route().current('suppliers.show')">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-4 h-4">
                        <path fill-rule="evenodd"
                            d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <div>
                        Listar
                    </div>
                </DropdownSidebarLinkMax>
                <DropdownSidebarLinkMax title="Cadastrar Vendedor" :href="route('salesperson.create')"  :active="route().current('salesperson.create')">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"
                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                        <path
                            d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z">
                        </path>
                    </svg>
                    <div>
                        Cadastro
                    </div>
                </DropdownSidebarLinkMax>
                
                <DropdownSidebarLinkMax title="Listar Vendedor" :href="route('salespeople.show')"  :active="route().current('salespeople.show')">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-4 h-4">
                        <path fill-rule="evenodd"
                            d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <div>
                        Listar
                    </div>
                </DropdownSidebarLinkMax>

            </div>
        </div>

        
            <div x-data="{ openClientes: false }"> 
            <DropdownSidebarMax  title="Cadastros" @click="openClientes = !openClientes" :active= "openClientes">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                    stroke="currentColor" class="w-4 h-4">
                    <path
                        d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z">
                    </path>
                </svg>
                <span class="block w-full pl-0 hover:text-gray-300">Clientes</span>
            </DropdownSidebarMax>
            <div class="ml-4 relative group" v-show="openClientes">
                
                <DropdownSidebarLinkMax  title="Cadastrar Clientes" :href="route('customers.create')"  :active="route().current('customers.create')">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"
                        stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                        <path
                            d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z">
                        </path>
                    </svg>
                    <div>
                        Cadastro
                    </div>
                </DropdownSidebarLinkMax>
                <DropdownSidebarLinkMax  title="Listar Clientes" :href="route('customers.show')"  :active="route().current('customers.show')">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                        stroke="currentColor" class="w-4 h-4">
                        <path fill-rule="evenodd"
                            d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            clip-rule="evenodd"></path>
                    </svg>
                    <div>
                        Listar
                    </div>
                </DropdownSidebarLinkMax>

            </div>
        </div>



    </div>
</template>
<script>
  export default {
    name: "Max",
  };
  </script>