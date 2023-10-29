<?php

namespace App\Providers;

use App\Interfaces\IPlaceRepository;
use App\Repositories\PlaceRepository;

use App\Interfaces\IEvaluationRepository;
use App\Repositories\EvaluationRepository;

use App\Interfaces\ICountryRepository;
use App\Repositories\CountryRepository;

use App\Interfaces\ICityRepository;
use App\Repositories\CityRepository;

use App\Interfaces\IUserRepository;
use App\Repositories\UserRepository;

use App\Interfaces\IStateRepository;
use App\Repositories\StateRepository;

use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {

        $this->app->bind(IPlaceRepository::class, PlaceRepository::class);

        $this->app->bind(IEvaluationRepository::class, EvaluationRepository::class);

        $this->app->bind(ICountryRepository::class, CountryRepository::class);

        $this->app->bind(ICityRepository::class, CityRepository::class);

        $this->app->bind(IUserRepository::class, UserRepository::class);

        $this->app->bind(IStateRepository::class, StateRepository::class);

    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
