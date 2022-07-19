<?php

namespace App\Services\Parlor;

interface ParlorService {

    public function getAllParlors();
    public function getParlorHaircuts($id);
    public function getMyParlorHaircuts();
    public function addHaircut($data);
    public function removeHaircut($id);
}
