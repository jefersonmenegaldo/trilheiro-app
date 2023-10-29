<?php

namespace App\Repositories;

use Illuminate\Database\Eloquent\Model;

class BaseRepository
{
    protected $entity;

    public function __construct(Model $model)
    {
        $this->entity = $model;
    }

    public function getAll()
    {
        return $this->entity->get();
    }

    public function getById($Id)
    {
        return $this->entity->findOrFail($Id);
    }

    public function get($condition)
    {
        return $this->entity->firstWhere($condition);
    }

    public function delete($id)
    {
        $this->entity
            ->where('id', $id)
            ->delete();
    }

    public function create(array $Details)
    {
        return $this->entity->create($Details);
    }

    public function update($Id, array $newDetails)
    {
        return $this->entity->whereId($Id)->update($newDetails);
    }
}
