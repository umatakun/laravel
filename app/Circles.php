<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Circles extends Model
{
    const TABLE_NAME = 'circles';
    const ID = 'id';
    const NAME = 'name';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function users()
    {
        return $this->belongsToMany(
            User::class,
            CirclesUser::TABLE_NAME,
            CirclesUser::CIRCLE_ID,
            CirclesUser::USER_ID,
            User::ID,
        );
    }

}
