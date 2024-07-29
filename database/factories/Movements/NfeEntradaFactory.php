<?php
namespace Database\Factories\Movements;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Movements\NfeEntrada;
use Carbon\Carbon;

class NfeEntradaFactory extends Factory
{
    protected $model = NfeEntrada::class;

    public function definition()
    {
        return [
            'chave_acesso' => $this->faker->unique()->numerify('#########################'),
            'numero' => $this->faker->randomNumber(8),
            'serie' => $this->faker->randomNumber(3),
            'data_emissao' => $this->faker->date(),
            'data_recebimento' => Carbon::parse($this->faker->date())->addDays(1),
            'nome_emitente' => $this->faker->company,
            'cnpj_emitente' => $this->faker->numerify('##############'),
            'nome_destinatario' => $this->faker->company,
            'cnpj_destinatario' => $this->faker->numerify('##############'),
            'valor_total' => $this->faker->randomFloat(2, 100, 10000),
            'valor_icms' => $this->faker->randomFloat(2, 10, 1000),
        ];
    }
}
