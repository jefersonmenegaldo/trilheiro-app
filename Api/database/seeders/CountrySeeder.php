<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Country;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        (new Country([
            'id' => '1',
            'name' => 'Brasil',
            'code' => '076',
            'acronym' => 'BR',
        ]))->save();

        (new Country([
            'name' => 'Argentina',
            'code' => '032',
            'acronym' => 'AR',
        ]))->save();

        (new Country([
            'name' => 'Uruguai',
            'code' => '858',
            'acronym' => 'UY',
        ]))->save();

        (new Country([
            'name' => 'Chile',
            'code' => '152',
            'acronym' => 'CL',
        ]))->save();

        (new Country([
            'name' => 'Estados Unidos',
            'code' => '840',
            'acronym' => 'US',
        ]))->save();
    }
}
