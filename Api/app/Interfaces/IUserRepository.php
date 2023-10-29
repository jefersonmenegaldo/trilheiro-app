<?php

namespace App\Interfaces;

interface IUserRepository
{
    public function getAll();
    public function getById($id);
    public function delete($id);
    public function create(array $news);
    public function update($id, array $new);
}
