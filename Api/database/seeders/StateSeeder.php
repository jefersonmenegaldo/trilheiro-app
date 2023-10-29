<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\State;
use App\Models\City;

class StateSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $json = file_get_contents('cities_br.json');
        $data = json_decode($json);
        foreach ($data as $city) {
            $state = State::where('acronym', '=', $city->microrregiao->mesorregiao->UF->sigla)->first();
            if (is_null($state)) {
                $state = new State([
                    'name' => $city->microrregiao->mesorregiao->UF->nome,
                    'acronym'=> $city->microrregiao->mesorregiao->UF->sigla,
                    'country_id' => 1
                ]);
                $state->save();
            }

            (new City([
                'name' => $city->nome,
                'acronym' => $city->id,
                'state_id' => $state->id
            ]))->save();
        }
    }
}
