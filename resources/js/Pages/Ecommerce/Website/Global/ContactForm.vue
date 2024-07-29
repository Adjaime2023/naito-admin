<template>
    <div class="w-full px-4 lg:w-5/12 xl:w-4/12">
      <div
        class="animate__animated animate__fadeInUp rounded-lg bg-white dark:bg-gray-900 py-2 px-8 shadow-lg dark:shadow-none sm:py-2 sm:px-10 md:p-[60px] lg:p-10 lg:py-12 lg:px-10 2xl:p-[60px]"
        style="animation-delay: 0.2s;">
        <h3
          class="mb-8 text-2xl font-semibold md:text-[28px] md:leading-[1.42] text-gray-700 dark:text-gray-200">
          Envie-nos uma mensagem
        </h3>
        <form @submit.prevent="submitForm">
          <div class="mb-[22px]">
            <label for="fullName" class="block mb-2 text-sm text-gray-800 dark:text-gray-200">Nome
              completo*</label>
            <input type="text" v-model="form.fullName" id="fullName" placeholder="Adam Gelius"
              autocomplete="name"
              class="bg-transparent w-full text-gray-800 dark:text-gray-200 placeholder:text-gray-800/60 border-0 border-b border-[#f1f1f1] dark:border-dark-3 pb-3 focus:border-primary focus:outline-none" />
          </div>
          <div class="mb-[22px]">
            <label for="email" class="block mb-2 text-sm text-gray-800 dark:text-gray-200">Email*</label>
            <input type="email" v-model="form.email" id="email" placeholder="example@yourmail.com"
              autocomplete="email"
              class="bg-transparent w-full text-gray-800 dark:text-gray-200 placeholder:text-gray-800/60 border-0 border-b border-[#f1f1f1] dark:border-dark-3 pb-3 focus:border-primary focus:outline-none" />
          </div>
          <div class="mb-[22px]">
            <label for="phone" class="block mb-2 text-sm text-gray-800 dark:text-gray-200">Telefone*</label>
            <input type="text" v-model="form.phone" id="phone" placeholder="+885 1254 5211 552"
              autocomplete="tel"
              class="bg-transparent w-full text-gray-800 dark:text-gray-200 placeholder:text-gray-800/60 border-0 border-b border-[#f1f1f1] dark:border-dark-3 pb-3 focus:border-primary focus:outline-none" />
          </div>
          <div class="mb-[30px]">
            <label for="message" class="block mb-2 text-sm text-gray-800 dark:text-gray-200">Mensagem*</label>
            <textarea v-model="form.message" id="message" rows="1" placeholder="type your message here"
              autocomplete="off"
              class="bg-transparent w-full text-gray-800 dark:text-gray-200 placeholder:text-gray-800/60 resize-none border-0 border-b border-[#f1f1f1] dark:border-dark-3 pb-3 focus:border-primary focus:outline-none"></textarea>
          </div>
          <div class="mb-0">
            <button type="submit"
              class="inline-flex items-center justify-center px-10 py-3 text-base font-medium text-white transition duration-300 ease-in-out rounded-md bg-primary hover:bg-blue-dark">
              Enviar
            </button>
          </div>
        </form>
        <div v-if="successMessage" class="mt-4 text-green-600">{{ successMessage }}</div>
      </div>
    </div>
  </template>

  <script setup>
  import { ref } from 'vue';
  import { useForm } from '@inertiajs/vue3';

  // Formulário reativo utilizando Inertia.js
  const form = useForm({
    fullName: '',
    email: '',
    phone: '',
    message: ''
  });

  // Mensagem de sucesso
  const successMessage = ref('');

  // Função para submissão do formulário
  const submitForm = () => {
    form.post('/api/contact', {
      onSuccess: () => {
        successMessage.value = 'Email enviado com sucesso!';
        form.reset();
      }
    });
  };
  </script>
