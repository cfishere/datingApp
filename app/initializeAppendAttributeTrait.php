<?php
namespace App;

trait AppendAttributeTrait
{
    public function initializeAppendAttributeTrait()
    {
        $this->append('fullname');
    }
    public function getFullnameAttribute()
    {
        return '...';
    }
}