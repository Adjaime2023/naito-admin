<script setup>
import { ref, onMounted } from 'vue';
import { usePage } from '@inertiajs/vue3';

const page = usePage();
const supplierId = ref(null);
const originalSupplierData = ref({});
const changedFieldsString = ref('');
const alterar = ref(false);

onMounted(async () => {
    // Inicializa propriedades com dados do fornecedor
    supplierId.value = props.supplierId; // Supondo que supplierId é passado como propriedade

    // Recupera dados originais do fornecedor
    const response = await fetch(`/api/suppliers/${supplierId.value}`);
    const data = await response.json();

    if (response.ok) {
        originalSupplierData.value = data;

        // Verifica se algum campo foi alterado
        for (const [field, updatedValue] of Object.entries(data)) {
            if (updatedValue !== originalSupplierData.value[field]) {
                alterar.value = true;
                changedFieldsString.value += `${field}: ${originalSupplierData.value[field]} -> ${updatedValue}\n`;
            }
        }

        if (!alterar.value) {
            // Nenhum campo foi alterado, exiba uma mensagem de erro
            page.props.jetstream.flash = { bannerStyle: 'error', banner: 'Nenhum campo foi alterado.' };
        }
    } else {
        // Exiba mensagem de erro se o fornecedor não for encontrado
        page.props.jetstream.flash = { bannerStyle: 'error', banner: 'Fornecedor não encontrado.' };
    }
});

// ...

// Dentro da função que processa a atualização do fornecedor
if (alterar.value) {
    // Atualize o fornecedor apenas se algum campo foi alterado
    const updateData = {}; // Preencha com os dados que você deseja atualizar
    for (const [field, updatedValue] of Object.entries(updateData)) {
        if (updatedValue !== originalSupplierData.value[field]) {
            supplier[field] = updatedValue;
        }
    }

    // Acrescenta a informação sobre a alteração no campo 'action'
    const action = originalSupplierData.value['action'];
    const userAction = `Alterado por: ${Auth.user().name} em ${new Date().toLocaleString()}`;
    const updatedAction = `${userAction}\n${changedFieldsString.value}\n${action}`;

    // Atualize o campo 'action' no fornecedor
    supplier.action = updatedAction;

    // Exemplo de como enviar uma mensagem de sucesso
    page.props.jetstream.flash = { bannerStyle: 'success', banner: 'Fornecedor atualizado com sucesso.' };
}
</script>