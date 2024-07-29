<script setup>
import { ref, computed } from 'vue';
import { useForm, usePage } from '@inertiajs/vue3';
import InputLabel from '@/Components/Partials/InputLabel.vue';
import TextInput from '@/Components/Partials/TextInput.vue';
import ButtonSubmit from '@/Components/Partials/ButtonSubmit.vue';

const { props } = usePage();
console.log(props.nfeEntrada); // Verifique os dados recebidos

const form = useForm({
  _method: 'PUT',
  id: props.nfeEntrada.id ?? null,
  chave_acesso: props.nfeEntrada.chave_acesso ?? '',
  numero: props.nfeEntrada.numero ?? '',
  serie: props.nfeEntrada.serie ?? '',
  data_emissao: props.nfeEntrada.data_emissao ?? '',
  data_recebimento: props.nfeEntrada.data_recebimento ?? '',
  nome_emitente: props.nfeEntrada.nome_emitente ?? '',
  cnpj_emitente: props.nfeEntrada.cnpj_emitente ?? '',
  nome_destinatario: props.nfeEntrada.nome_destinatario ?? '',
  cnpj_destinatario: props.nfeEntrada.cnpj_destinatario ?? '',
  valor_total: props.nfeEntrada.valor_total ?? '',
  valor_icms: props.nfeEntrada.valor_icms ?? '',
  items: props.nfeEntrada.nfe_items?.map(item => ({
    id: item.id,
    codigo_produto: item.codigo_produto,
    descricao: item.descricao,
    ncm: item.ncm,
    cst: item.cst,
    cfop: item.cfop,
    unidade: item.unidade,
    quantidade: item.quantidade,
    valor_unitario: item.valor_unitario,
    valor_total: item.valor_total,
  })) ?? [],
});

const items = computed(() => form.items);

function submit() {
  form.post(route('nfe.update', form.id), {
    onSuccess: () => {
      // Handle successful update if needed
    },
  });
}
</script>

<template>
  <div class="px-4 py-4 pb-6 bg-gray-200 dark:bg-gray-800 rounded-lg">

        <form @submit.prevent="submit">

         
          <div class="my-2 px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-lg ">
            <div class="grid grid-cols-1 lg:grid-cols-4 gap-4">
                <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="chave_acesso">Chave de Acesso</InputLabel>
                <TextInput id="chave_acesso" v-model="form.chave_acesso"  class="block mt-1 w-full" type="text" required />
                <InputError class="mt-2" :message="form.errors.chave_acesso" />
              </div>
                <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="numero">Número</InputLabel>
                <TextInput id="numero" v-model="form.numero"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.numero" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="serie">Série</InputLabel>
                <TextInput id="serie" v-model="form.serie"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.serie" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="data_emissao">Data de Emissão</InputLabel>
                <TextInput id="data_emissao" v-model="form.data_emissao"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.data_emissao" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="data_recebimento">Data de Recebimento</InputLabel>
                <TextInput id="data_recebimento" v-model="form.data_recebimento"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.data_recebimento" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="nome_emitente">Nome do Emitente</InputLabel>
                <TextInput id="nome_emitente" v-model="form.nome_emitente"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.nome_emitente" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="cnpj_emitente">CNPJ do Emitente</InputLabel>
                <TextInput id="cnpj_emitente" v-model="form.cnpj_emitente"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.cnpj_emitente" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="nome_destinatario">Nome do Destinatário</InputLabel>
                <TextInput id="nome_destinatario" v-model="form.nome_destinatario"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.nome_destinatario" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="cnpj_destinatario">CNPJ do Destinatário</InputLabel>
                <TextInput id="cnpj_destinatario" v-model="form.cnpj_destinatario"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.cnpj_destinatario" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="valor_total">Valor Total</InputLabel>
                <TextInput id="valor_total" v-model="form.valor_total"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.valor_total" />
              </div>
               <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                <InputLabel for="valor_icms">Valor ICMS</InputLabel>
                <TextInput id="valor_icms" v-model="form.valor_icms"  class="block mt-1 w-full" type="text" />
                <InputError class="mt-2" :message="form.errors.valor_icms" />
              </div>
            </div>
          </div>

          <div class="my-2 px-4 py-4 pb-6 bg-gray-300 dark:bg-gray-900/80 rounded-lg ">
            <!-- Itens -->
            <div v-for="(item, index) in form.items" :key="index" class="my-2">

              <div class="grid grid-cols-1 lg:grid-cols-6 gap-6">
                 <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                  <InputLabel :for="'item_codigo_produto_' + index">Código do Produto:</InputLabel>
                  <TextInput :id="'item_codigo_produto_' + index" v-model="item.codigo_produto"  class="block mt-1 w-full" type="text" required />
                </div>
                <div class="col-span-1 sm:col-span-2 md:col-span-2">
                  <InputLabel :for="'item_descricao_' + index">Descrição:</InputLabel>
                  <TextInput :id="'item_descricao_' + index" v-model="item.descricao"  class="block mt-1 w-full" type="text" required />
                </div>
                 <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                  <InputLabel :for="'item_quantidade_' + index">Quantidade:</InputLabel>
                  <TextInput :id="'item_quantidade_' + index" v-model="item.quantidade"  class="block mt-1 w-full" type="number" required />
                </div>
                 <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                  <InputLabel :for="'item_valor_unitario_' + index">Valor Unitário:</InputLabel>
                  <TextInput :id="'item_valor_unitario_' + index" v-model="item.valor_unitario"  class="block mt-1 w-full" type="number"
                    required />
                </div>
                 <!-- Campos do formulário -->
                <div class="col-span-1 sm:col-span-1 md:col-span-1">
                  <InputLabel :for="'item_valor_total_' + index">Valor Total:</InputLabel>
                  <TextInput :id="'item_valor_total_' + index" v-model="item.valor_total"  class="block mt-1 w-full" type="number" required />
                </div>
                <!-- Outros campos de item -->
              </div>
            </div>
          </div>

          <div class="flex items-center justify-center w-full mt-4">
            <ButtonSubmit class="px-4" type="submit">Atualizar NF-e</ButtonSubmit>
          </div>

        </form>
      </div>

</template>