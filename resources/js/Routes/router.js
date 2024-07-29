import { createRouter, createWebHistory } from 'vue-router';
import Subcategories from '../Pages/Ecommerce/Website/Subcategories.vue';
import Groups from '../Pages/Ecommerce/Website/Groups.vue';
import Products from '../Pages/Ecommerce/Website/Products.vue';


const routes = [
    {
        path: '/website/subcategories/:category_id',
        name: 'Subcategories',
        component: Subcategories,
        props: true, // Certifique-se de que props: true está definido
    },

    {  path: '/website/groups/:subcategory_id',
        name: 'Groups',
        component: Groups,
        props: true, // Certifique-se de que props: true está definido
    },
    {
        path: '/website/products/:group_id',
        name: 'Products',
        component: Products,
        props: true,
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
