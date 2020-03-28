<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Companies extends Model
{
    const TABLE_NAME = 'companies';
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

    public function addresses()
    {
        return $this->hasManyThrough(
            Addresses::class,
            User::class,
            User::COMPANY_ID,
            Addresses::USER_ID,
            self::ID,
            User::ID
        );
    }

    public function usersAddresses()
    {
        return $this->hasManyThrough(
            Addresses::class,
            User::class,
            User::COMPANY_ID,
            Addresses::USER_ID,
            self::ID,
            User::ID
        );
    }

    /**
     * 多分これは何かしらで絞り込みをかけたいときに使うのだろう。
     */
    public function usersAddress()
    {
        return $this->hasOneThrough(
            Addresses::class,
            User::class,
            User::COMPANY_ID,
            Addresses::USER_ID,
            self::ID,
            User::ID
        );
    }
}
