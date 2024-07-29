<script setup>
import { ref } from 'vue';
import SideLink from '@/Components/Sidebar/SideLink.vue';

const subMenuStates = ref({
    products: false,
    productsClassifications: false,
    nestedSubMenus: {
        categories: false,
        subCategorias: false,
        groups: false,
        subgroups: false,
        collection: false,
        brand: false,
        color: false,
        size: false,

    },
    Cadastros: false,
    nestedSubMenusCad: {
        customers: false,
        suppliers: false,
        employees: false,
        partners: false,
        company: false,
    },
    Website: false,
    nestedSubMenusWeb: {
        banners: false,
    },
    nestedSubMenusMovements: {
        notaEntrada: false,
    },
},
);

const toggleSubMenu = (menu) => {
    subMenuStates.value[menu] = !subMenuStates.value[menu];
};

const toggleNestedSubMenu = (menu, type = 'nestedSubMenus') => {
    subMenuStates.value[type][menu] = !subMenuStates.value[type][menu];
};
</script>


<template>
    <ul
        class="list-reset flex flex-col border-y border-slate-500 text-gray-900 dark:text-gray-200 bg-gray-50 dark:bg-gray-900">
        <SideLink :href="route('dashboard')" :active="route().current('dashboard')">
            <i class="fas fa-tachometer-alt mx-2"></i>
            <span class="flex-1 text-xs">Dashboard</span>
            <i class="fas fa-angle-right"></i>
        </SideLink>

        <!-- Produtos -->
        <li
            class="w-full h-full py-2 list-reset px-2 border-b border-slate-400 flex flex-col hover:bg-slate-200 dark:hover:bg-gray-800">
            <div class="flex items-center cursor-pointer font-sans font-hairline" @click="toggleSubMenu('products')">
                <i class="fas fa-box mx-2"></i>
                <span class="flex-1 text-xs">Produtos</span>
                <i class="fa" :class="subMenuStates.products ? 'fa-angle-down' : 'fa-angle-right'"></i>
            </div>
            <ul v-show="subMenuStates.products"
                class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 mt-2 ml-4">
                <SideLink :href="route('product.create')" :active="route().current('product.create')">
                    <i class="fas fa-plus mx-2"></i>
                    <span class="flex-1 text-xs">Novo</span>
                </SideLink>
                <SideLink :href="route('products.show')" :active="route().current('products.show')">
                    <i class="fas fa-list mx-2"></i>
                    <span class="flex-1 text-xs">Listar</span>
                </SideLink>
            </ul>
        </li>

        <!-- ProductsClassifications -->
        <li class="w-full h-full py-2 list-reset px-2 flex flex-col hover:bg-slate-200 dark:hover:bg-slate-800">
            <div class="flex items-center cursor-pointer font-sans font-hairline"
                @click="toggleSubMenu('productsClassifications')">
                <i class="fas fa-tags mx-2"></i>
                <span class="flex-1 text-xs">Classificação Prod.</span>
                <i class="fa" :class="subMenuStates.productsClassifications ? 'fa-angle-down' : 'fa-angle-right'"></i>
            </div>
            <ul v-show="subMenuStates.productsClassifications"
                class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 mt-2 ml-4">
                <!-- Categorias -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('categories')">
                    <i class="fas fa-folder-open mx-2"></i>
                    <span class="flex-1 text-xs">Categorias</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenus.categories ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.categories"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('category.create')" :active="route().current('category.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('categories.show')" :active="route().current('categories.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- SubCategorias -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('subCategorias')">
                    <i class="fas fa-folder-open mx-2"></i>
                    <span class="flex-1 text-xs">Subcategorias</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenus.subCategorias ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.subCategorias"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('subcategory.create')" :active="route().current('subcategory.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('subcategories.show')" :active="route().current('subcategories.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Groups -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('groups')">
                    <i class="fas fa-layer-group mx-2"></i>
                    <span class="flex-1 text-xs">Groups</span>
                    <i class="fa" :class="subMenuStates.nestedSubMenus.groups ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.groups"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('group.create')" :active="route().current('group.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('groups.show')" :active="route().current('groups.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Subgroups -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('subgroups')">
                    <i class="fas fa-layer-group mx-2"></i>
                    <span class="flex-1 text-xs">Subgroups</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenus.subgroups ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.subgroups"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('subgroup.create')" :active="route().current('subgroup.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('subgroups.show')" :active="route().current('subgroups.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Collection -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('collection')">
                    <i class="fas fa-cubes mx-2"></i>
                    <span class="flex-1 text-xs">Collection</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenus.collection ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.collection"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('collection.create')" :active="route().current('collection.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('collections.show')" :active="route().current('collections.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Brand -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('brand')">
                    <i class="fas fa-registered mx-2"></i>
                    <span class="flex-1 text-xs">Brand</span>
                    <i class="fa" :class="subMenuStates.nestedSubMenus.brand ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.brand"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('brand.create')" :active="route().current('brand.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('brands.show')" :active="route().current('brands.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Color -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('color')">
                    <i class="fas fa-palette mx-2"></i>
                    <span class="flex-1 text-xs">Color</span>
                    <i class="fa" :class="subMenuStates.nestedSubMenus.color ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.color"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('color.create')" :active="route().current('color.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('colors.show')" :active="route().current('colors.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>
                <!-- Tamanho -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('size')">
                    <i class="fas  fa-ruler-combined mx-2"></i>
                    <span class="flex-1 text-xs">Tamanho</span>
                    <i class="fa" :class="subMenuStates.nestedSubMenus.size ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenus.size"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('size.create')" :active="route().current('size.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('sizes.show')" :active="route().current('sizes.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>
            </ul>
        </li>

        <!-- Cadastros -->
        <li
            class="w-full h-full py-2 list-reset px-2 border-y border-slate-400 flex flex-col hover:bg-slate-200 dark:hover:bg-gray-800">
            <div class="flex items-center cursor-pointer font-sans font-hairline" @click="toggleSubMenu('Cadastros')">
                <i class="fas fa-clipboard-list mx-2"></i>
                <span class="flex-1 text-xs">Cadastros</span>
                <i class="fa" :class="subMenuStates.Cadastros ? 'fa-angle-down' : 'fa-angle-right'"></i>
            </div>
            <ul v-show="subMenuStates.Cadastros"
                class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 mt-2 ml-4">
                <!-- Clientes -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('customers', 'nestedSubMenusCad')">
                    <i class="fas fa-users mx-2"></i>
                    <span class="flex-1 text-xs">Clientes</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusCad.customers ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusCad.customers"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('customer.create')" :active="route().current('customer.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('customers.show')" :active="route().current('customers.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Fornecedores -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('suppliers', 'nestedSubMenusCad')">
                    <i class="fas fa-truck mx-2"></i>
                    <span class="flex-1 text-xs">Fornecedores</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusCad.suppliers ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusCad.suppliers"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('supplier.create')" :active="route().current('supplier.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('suppliers.show')" :active="route().current('suppliers.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Employees -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('employees', 'nestedSubMenusCad')">
                    <i class="fas fa-user-tie mx-2"></i>
                    <span class="flex-1 text-xs">Employees</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusCad.employees ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusCad.employees"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('employee.create')" :active="route().current('employee.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('employees.show')" :active="route().current('employees.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Partners -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('partners', 'nestedSubMenusCad')">
                    <i class="fas fa-handshake mx-2"></i>
                    <span class="flex-1 text-xs">Partners</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusCad.partners ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusCad.partners"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('partner.create')" :active="route().current('partner.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('partners.show')" :active="route().current('partners.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Company -->
                <SideLink :href="`/company/1/edit`">
                    <i class="fa-regular fa-building mx-2"></i>
                    <span class="flex-1 text-xs">Company</span>
                </SideLink>

            </ul>




        </li>

        <!-- Website -->
        <li
            class="w-full h-full py-2 list-reset px-2 border-y border-slate-400 flex flex-col hover:bg-slate-200 dark:hover:bg-gray-800">
            <div class="flex items-center cursor-pointer font-sans font-hairline" @click="toggleSubMenu('Site')">
                <i class="fas fa-clipboard-list mx-2"></i>
                <span class="flex-1 text-xs">Site</span>
                <i class="fa" :class="subMenuStates.Cadastros ? 'fa-angle-down' : 'fa-angle-right'"></i>
            </div>
            <ul v-show="subMenuStates.Site"
                class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 mt-2 ml-4">
                <!-- Barnners -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('banners', 'nestedSubMenusWeb')">
                    <i class="fas fa-photo-film mx-2"></i>
                    <span class="flex-1 text-xs">Banner</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusWeb.banners ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusWeb.banners"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('banner.create')" :active="route().current('banner.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('banners.show')" :active="route().current('banners.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>

                <!-- Produtos -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('products', 'nestedSubMenusWeb')">
                    <i class="fas fa-box mx-2"></i>
                    <span class="flex-1 text-xs">Products</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusWeb.products ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusWeb.products"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('launch.show')" :active="route().current('launch.show')">
                        <i class="fas fa-rocket mx-2"></i>
                        <span class="flex-1 text-xs">Lanç./Prom.</span>
                    </SideLink>
                </ul>

                <!-- Produtos -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('partners', 'nestedSubMenusWeb')">
                    <i class="fas fa-handshake mx-2"></i>
                    <span class="flex-1 text-xs">Parceiros</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusWeb.partners ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusWeb.partners"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('sitePartner.show')" :active="route().current('sitePartner.show')">
                        <i class="fas fa-rocket mx-2"></i>
                        <span class="flex-1 text-xs">Parceiros Site</span>
                    </SideLink>
                </ul>
            </ul>

        </li>

        <!-- Movimentação -->
        <li
            class="w-full h-full py-2 list-reset px-2 border-y border-slate-400 flex flex-col hover:bg-slate-200 dark:hover:bg-gray-800">
            <div class="flex items-center cursor-pointer font-sans font-hairline" @click="toggleSubMenu('Movements')">
                <i class="fas fa-clipboard-list mx-2"></i>
                <span class="flex-1 text-xs">Movimentação</span>
                <i class="fa" :class="subMenuStates.Movements ? 'fa-angle-down' : 'fa-angle-right'"></i>
            </div>
            <ul v-show="subMenuStates.Movements"
                class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 mt-2 ml-4">
                <!-- Nota Entrada -->
                <div class="bg-gray-200 dark:bg-gray-900 py-2 hover:bg-slate-200 dark:hover:bg-gray-800 flex items-center cursor-pointer font-sans font-hairline border-b border-slate-400"
                    @click="toggleNestedSubMenu('notaEntrada', 'nestedSubMenusMovements')">
                    <i class="fas fa-photo-film mx-2"></i>
                    <span class="flex-1 text-xs">Nota Entrada</span>
                    <i class="fa"
                        :class="subMenuStates.nestedSubMenusMovements.notaEntrada ? 'fa-angle-down' : 'fa-angle-right'"></i>
                </div>
                <ul v-show="subMenuStates.nestedSubMenusMovements.notaEntrada"
                    class="bg-gray-200 dark:bg-gray-900 list-reset text-gray-900 dark:text-gray-100 border-b border-slate-400 mt-2 ml-4">
                    <SideLink :href="route('nfe-entrada.create')" :active="route().current('nfe-entrada.create')">
                        <i class="fas fa-plus mx-2"></i>
                        <span class="flex-1 text-xs">Novo</span>
                    </SideLink>
                    <SideLink :href="route('nfe-entradas.show')" :active="route().current('nfe-entrada.show')">
                        <i class="fas fa-list mx-2"></i>
                        <span class="flex-1 text-xs">Listar</span>
                    </SideLink>
                </ul>
            </ul>
        </li>

    </ul>
</template>
