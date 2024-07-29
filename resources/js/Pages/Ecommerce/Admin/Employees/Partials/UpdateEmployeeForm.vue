<script setup>
import { ref, onMounted, computed } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';
import ButtonLink from '@/Components/Partials/ButtonLink.vue';
import ImageEmployeeForm from './ImageEmployeeForm.vue';
import { mask } from 'vue-the-mask';

// Obtendo propriedades da página
const { props } = usePage();

// Lógica para exibir mensagem flash
const message = ref('');
onMounted(() => {
    // Obter a mensagem flash da propriedade 'jetstream.flash.message'
    message.value = props.jetstream?.flash?.message || '';
    // Limpar a mensagem flash para evitar que seja exibida novamente
    if (props.jetstream && props.jetstream.flash) {
        props.jetstream.flash = null;
    }
});

const user = computed(() => props.auth.user);
const actionUser = computed(() => {
    const userName = user.value ? user.value.name : 'Desconhecido';
    return `Atualizado por: ${userName} em ${new Date().toLocaleString()}`;
});

// Variáveis reativas e funções adicionais do seu componente
const form = useForm({
  _method: 'PUT',
  id: props.employee?.id || '',
  name: props.employee?.name || '',
  office_id: props.employee?.office_id || '',
  user_id: props.employee?.user_id || '',
  cpf: props.employee?.cpf || '',
  identification_number: props.employee?.identification_number || '',
  contact_name: props.employee?.contact_name || '',
  email: props.employee?.email || '',
  whatsapp: props.employee?.whatsapp || '',
  phone: props.employee?.phone || '',
  cep: props.employee?.cep || '',
  city: props.employee?.city || '',
  uf: props.employee?.uf || '',
  address: props.employee?.address || '',
  number: props.employee?.number || '',
  complement: props.employee?.complement || '',
  neighborhood: props.employee?.neighborhood || '',
  action_user: props.employee?.action_user || '',
});

// Função para atualizar o Funcionário
const updateEmployee = () => {
  form.put(route('employee.update', { id: form.id }), {
    onSuccess: () => {
      if (props.jetstream) {
        props.jetstream.flash = { message: 'Funcionário atualizado com sucesso!' };
      }
    },
    onError: () => {
      if (props.jetstream) {
        props.jetstream.flash = { error: 'Erro ao atualizar o Funcionário.' };
      }
    },
  });
};

// Função para buscar o endereço pelo CEP
const buscarEnderecoPorCEP = async () => {
    try {
        if (!form.cep || form.cep.replace(/\D/g, '').length < 8) {
            throw new Error('Erro na digitação do CEP. Por favor, verifique e tente novamente.');
        }

        const cep = form.cep.replace(/\D/g, '');
        const response = await fetch(`https://viacep.com.br/ws/${cep}/json/`);

        if (!response.ok) {
            throw new Error('Erro ao buscar o CEP. Por favor, tente novamente.');
        }

        const endereco = await response.json();

        if (endereco.erro) {
            throw new Error('CEP não encontrado ou inexistente.');
        }

        // Atualiza os campos de endereço com os dados encontrados
        form.address = endereco.logradouro || '';
        form.complement = endereco.complemento || '';
        form.neighborhood = endereco.bairro || '';
        form.city = endereco.localidade || '';
        form.uf = endereco.uf || '';

        console.log('Endereço encontrado:', endereco);

        if (props.jetstream) {
            props.jetstream.flash = { message: 'Endereço encontrado com sucesso!' };
        }
    } catch (error) {
        console.error('Erro ao buscar o CEP:', error.message);
        if (props.jetstream) {
            props.jetstream.flash = { error: error.message };
        }
    }
};
</script>

<template>


    <div class="mx-2 px-4 pt-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">
        <form @submit.prevent="updateEmployee" enctype="multipart/form-data">
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">

                <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                    <InputLabel for="name">Nome do Cliente</InputLabel>
                    <TextInput v-model="form.name" id="name" name="name" class="block mt-1 w-full" type="text"
                        required />
                    <InputError class="mt-2" :message="form.errors.name" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="office_id">Função:</InputLabel>
                    <div class="flex items-center mt-1">
                        <select v-if="props.offices && props.offices.length"
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                            v-model="form.office_id" id="office_id">
                            <option v-for="office in props.offices" :key="office.id"
                                :value="office.id">
                                {{ office.name }}
                            </option>
                        </select>
                    </div>
                    <InputError class="mt-2" :message="form.errors.office_id" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="user_id">Usuário:</InputLabel>
                    <div class="flex items-center mt-1">
                        <select v-if="props.users && props.users.length"
                            class="form-control w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                            v-model="form.user_id" id="user_id">
                            <option v-for="user in props.users" :key="user.id" :value="user.id">
                                {{ user.name }}
                            </option>
                        </select>
                    </div>
                    <InputError class="mt-2" :message="form.errors.user_id" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="cpf">CPF </InputLabel>
                    <TextInput id="cpf" name="cpf" v-model="form.cpf"
                        v-mask="['###.###.###-##']" class="form-control w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.cpf" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="identification_number">Documento Identidade</InputLabel>
                    <TextInput id="identification_number" name="identification_number"
                        v-model="form.identification_number" class="form-control w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.identification_number" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="contact_name">Nome de Contato</InputLabel>
                    <TextInput id="contact_name" name="contact_name" v-model="form.contact_name"
                        class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.contact_name" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="email">Email de Contato</InputLabel>
                    <TextInput id="email" name="email" v-model="form.email" class="block mt-1 w-full" type="email" />
                    <InputError class="mt-2" :message="form.errors.email" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="whatsapp">WhatsApp de Contato</InputLabel>
                    <TextInput id="whatsapp" name="whatsapp" v-mask="['(##) ####-####', '(##) #####-####']"
                        v-model="form.whatsapp" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.whatsapp" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="phone">Telefone de Contato</InputLabel>
                    <TextInput id="phone" name="phone" v-mask="['(##) ####-####', '(##) #####-####']"
                        v-model="form.phone" class="block mt-1 w-full" type="text" />
                    <InputError class="mt-2" :message="form.errors.phone" />
                </div>
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                    <InputLabel for="cep">CEP</InputLabel>
                    <div class="relative flex">
                        <TextInput id="cep" name="cep" v-mask="'#####-###'" v-model="form.cep" class="block w-full"
                            type="text" />
                        <button type="button" @click="buscarEnderecoPorCEP"
                            class="absolute top-0 right-0 underline-offset-2 py-3  px-2 space-x-2 text-sm   bg-gradient-to-r dark:from-cyan-900 dark:to-blue-900 from-blue-700  via-purple-700 to-purple-500   hover:dark:from-cyan-600 hover:dark:to-blue-600  bg-gray-600 hover:from-indigo-500 hover:via-purple-500 hover:to-purple-500 text-gray-100 rounded-r">
                            Buscar</button>
                    </div>
                    <InputError class="mt-2" :message="form.errors.cep" />
                </div>
            </div>
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                <div class="lg:col-span-3">
                    <div class="grid grid-cols-1 sm:grid-cols-3 md:grid-cols-3 gap-3">

                        <div class="col-span-1 sm:col-span-1 md:col-span-2">
                            <InputLabel for="city">Cidade</InputLabel>
                            <TextInput id="city" name="city" v-model="form.city" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.city" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-1">
                            <InputLabel for="uf">UF</InputLabel>
                            <TextInput id="uf" name="uf" v-model="form.uf" class="block mt-1 w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.uf" />
                        </div>
                        <div class="col-span-1 sm:col-span-2 md:col-span-2">
                            <InputLabel for="address">Endereço</InputLabel>
                            <TextInput id="address" name="address" v-model="form.address" class="block mt-1 w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.address" />
                        </div>
                        <div>
                            <InputLabel for="number">Número</InputLabel>
                            <TextInput id="number" name="number" v-model="form.number" class="form-control w-full"
                                type="text" />
                            <InputError class="mt-2" :message="form.errors.number" />
                        </div>

                        <div class="col-span-1 sm:col-span-1 md:col-span-2">
                            <InputLabel for="complement">Complemento</InputLabel>
                            <TextInput id="complement" name="complement" v-model="form.complement"
                                class="form-control w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.complement" />
                        </div>

                        <div>
                            <InputLabel for="neighborhood">Bairro</InputLabel>
                            <TextInput id="neighborhood" name="neighborhood" v-model="form.neighborhood"
                                class="form-control w-full" type="text" />
                            <InputError class="mt-2" :message="form.errors.neighborhood" />
                        </div>


                        <div class="col-span-1 sm:col-span-2 md:col-span-3">
                            <InputLabel for="action_user">Ação:</InputLabel>


                            <textarea
                                class="form-control mt-1 w-full border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm"
                                v-model="form.action_user" id="action_user" readonly></textarea>
                            <InputError class="mt-2" :message="form.errors.action_user" />
                        </div>
                    </div>
                </div>
                <div class="row-span-1 col-span-1">
                    <ImageEmployeeForm />
                </div>

            </div>

            <div class="flex items-center justify-center w-full mt-4">
                <ButtonLink :href="route('employee.create')" :active="route().current('employee.create')"
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Novo
                </ButtonLink>
                <ButtonSubmit class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6" :class="{ 'opacity-25': form.processing }"
                    :disabled="form.processing">
                    Atualizar
                </ButtonSubmit>
                <ButtonLink :href="route('employees.show')" :active="route().current('employees.show')"
                    class="w-1/3 sm:w-1/4 md:1/5 lg:w-1/6">
                    Listar
                </ButtonLink>


            </div>
        </form>
    </div>



</template>
<script>
export default {
    directives: { mask },
};
</script>
