<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Phones extends Model
{
    const TABLE_NAME = 'phones';
    const ID = 'id';
    const USER_ID = 'user_id';
    const PHONE = 'phone';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function users()
    {
        return $this->belongsTo(Users::class, self::USER_ID, Users::ID);
    }
}
