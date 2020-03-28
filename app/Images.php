<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Images extends Model
{
    const TABLE_NAME = 'images';
    const ID = 'id';
    const SRC = 'src';
    const TARGET_ID = 'target_id';
    const IMG_TYPE = 'img_type';
    const RELATED = 'related';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    const IMG_TYPE_PROF = 'PROF';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function users()
    {
        return $this->belongsTo(User::class, self::USER_ID, User::ID);
    }

    public function imageable()
    {
        return $this->morphTo(self::class, self::RELATED, self::TARGET_ID);
    }
}
