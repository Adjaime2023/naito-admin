<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Employee;
use App\Models\User;
use App\Models\Office;
/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Employee>
 */
class EmployeeFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */


    protected $model = Employee::class;

        public function definition()
        {
            $documentNumber = $this->generateFakeCPF();
            $identificationNumber = $this->faker->unique()->numerify('##########');

            return [
                'name' => $this->faker->company,
                'user_id' => User::inRandomOrder()->first()?->id,
                'office_id' => Office::inRandomOrder()->first()?->id, // Atualizado para office_id
                'cpf' => $documentNumber,
                'identification_number' => $identificationNumber,
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
                'role' => 'employee',
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


}
