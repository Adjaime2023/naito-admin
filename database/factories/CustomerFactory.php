<?php
namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Customer;
use App\Models\User;

class CustomerFactory extends Factory
{
    protected $model = Customer::class;

    public function definition()
    {
        $personType = $this->faker->randomElement(['Fisica', 'Juridica']);
        $documentNumber = $personType === 'Fisica' ? $this->generateFakeCPF() : $this->generateFakeCNPJ();
        $identificationNumber = $this->faker->unique()->numerify('##########');

        return [
            'name' => $this->faker->company,
            'user_id' => User::inRandomOrder()->first()?->id,
            'person_type' => $personType,
            'document_number' => $documentNumber,
            'identification_number' => $identificationNumber,
            'customer_type_id' => 1,
            'contact_name' => $this->faker->name,
            'email' => $this->faker->unique()->safeEmail,
            'whatsapp' => $this->faker->phoneNumber,
            'phone' => $this->faker->phoneNumber,
            'cep' => $this->faker->postcode,
            'city' => $this->faker->city,
            'uf' => 'MG',
            'address' => $this->faker->streetAddress,
            'number' => $this->faker->buildingNumber,
            'complement' => $this->faker->secondaryAddress,
            'neighborhood' => $this->faker->streetName,
            'action_user' => 'Criado por: Seeder em ' . now(),
            'discontinued' => $this->faker->boolean,
            'role' => 'customer', // Certifique-se de adicionar a coluna 'role' se necessário
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }

    private function generateFakeCPF()
    {
        $cpfNumbers = '';
        for ($i = 0; $i < 9; $i++) {
            $cpfNumbers .= mt_rand(0, 9);
        }

        $cpf = $cpfNumbers . $this->generateCPFVerifierDigits($cpfNumbers);

        return $cpf;
    }

    private function generateCPFVerifierDigits($cpfNumbers)
    {
        $sum = 0;
        for ($i = 0, $multiplier = 10; $i < 9; $i++, $multiplier--) {
            $sum += $cpfNumbers[$i] * $multiplier;
        }

        $remainder = $sum % 11;
        $firstDigit = $remainder < 2 ? 0 : 11 - $remainder;

        $sum = 0;
        for ($i = 0, $multiplier = 11; $i < 9; $i++, $multiplier--) {
            $sum += $cpfNumbers[$i] * $multiplier;
        }
        $sum += $firstDigit * 2;

        $remainder = $sum % 11;
        $secondDigit = $remainder < 2 ? 0 : 11 - $remainder;

        return "$firstDigit$secondDigit";
    }

    private function generateFakeCNPJ()
    {
        $cnpjNumbers = '';
        for ($i = 0; $i < 12; $i++) {
            $cnpjNumbers .= mt_rand(0, 9);
        }

        $cnpj = $cnpjNumbers . $this->generateCNPJVerifierDigits($cnpjNumbers);

        return $cnpj;
    }

    private function generateCNPJVerifierDigits($cnpjNumbers)
    {
        $weightsFirstDigit = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];
        $weightsSecondDigit = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2];

        $sum = 0;
        for ($i = 0; $i < 12; $i++) {
            $sum += $cnpjNumbers[$i] * $weightsFirstDigit[$i];
        }
        $remainder = $sum % 11;
        $firstDigit = $remainder < 2 ? 0 : 11 - $remainder;

        $sum = 0;
        for ($i = 0; $i < 12; $i++) {
            $sum += $cnpjNumbers[$i] * $weightsSecondDigit[$i];
        }
        $sum += $firstDigit * $weightsSecondDigit[12];
        $remainder = $sum % 11;
        $secondDigit = $remainder < 2 ? 0 : 11 - $remainder;

        return "$firstDigit$secondDigit";
    }
}
