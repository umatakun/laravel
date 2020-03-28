<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CirclesUser extends Model
{
    const TABLE_NAME = 'user_circles';
    const ID = 'id';
    const USER_ID = 'user_id';
    const CIRCLE_ID = 'circle_id';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    
}
