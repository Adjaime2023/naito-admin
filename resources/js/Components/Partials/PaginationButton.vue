 <script setup>
  import { computed } from 'vue';
  
  const props = defineProps({
    computedPages: {
      type: Array,
      required: true,
    },
    currentPage: {
      type: Number,
      required: true,
    },
    gotoPage: {
      type: Function,
      required: true,
    },
  });
  </script>
  
  <template>
    <div v-for="pageNumber in computedPages" :key="pageNumber">
      <button @click="gotoPage(pageNumber)" name="pageNumber" id="pageNumber"
        :class="[
          'relative inline-flex items-center px-4 py-2 text-sm font-medium',
          { 'text-blue-500 dark:text-blue-300 bg-blue-100 dark:bg-blue-800': pageNumber === currentPage, 
            'text-gray-200 dark:text-gray-700 bg-gray-600 dark:bg-gray-100': pageNumber !== currentPage }
        ]"
        type="button">
        {{ pageNumber }}
      </button>
    </div>
  </template>
  
 