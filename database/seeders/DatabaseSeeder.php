<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Movements\NfeEntrada;
use App\Models\Movements\NfeItem;
use App\Models\Products\Product;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        if (DB::getDriverName() === 'mysql') {
            DB::statement('SET FOREIGN_KEY_CHECKS=0');
        }

        $this->call(UserSeeder::class);
        $this->call(CompanySeeder::class);
        $this->call(CategorySeeder::class);
        $this->call(SubcategorySeeder::class);
        $this->call(GroupSeeder::class);
        $this->call(SubgroupSeeder::class);
        $this->call(CollectionSeeder::class);
        $this->call(BrandSeeder::class);
        $this->call(ColorSeeder::class);
        $this->call(SupplierTypeSeeder::class);
        $this->call(SupplierSeeder::class);
        $this->call(CustomerTypeSeeder::class);
        $this->call(SectorSeeder::class);
        $this->call(SizeSeeder::class);
        $this->call(OfficeSeeder::class);
        $this->call(CustomerSeeder::class);
        $this->call(PartnerSeeder::class);
        $this->call(ProductSeeder::class);
        $this->call(EmployeeSeeder::class);
        $this->call(BannerSeeder::class);
        $this->call(SizeSeeder::class);
        
      // Create products first
  
      // Create 10 records of NfeEntrada, each with 5 associated items
      NfeEntrada::factory()
          ->count(60)
          ->has(
              NfeItem::factory()
                  ->count(5) // creates 5 items for each NfeEntrada
                  ->for(Product::factory()) // creates a product for each NfeItem
          )
          ->create();

      if (DB::getDriverName() === 'mysql') {
          DB::statement('SET FOREIGN_KEY_CHECKS=1');
      }
  }
}