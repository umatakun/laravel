<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    const TABLE_NAME = 'news';
    const ID = 'id';
    const USER_ID = 'user_id';
    const TITLE = 'title';
    const CONTENT = 'content';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function user()
    {
        return $this->belongsTo(User::class, self::USER_ID, User::ID);
    }

    public function tags()
    {
        return $this->morphToMany(
            Tags::class,
            TagRelations::TABLE_NAME,
            TagRelations::TABLE_NAME,       // 中間テーブル名
            TagRelations::TAG_RELATIONS_ID, // 中間テーブルの中に入っているrelation先のサロゲートキーを入れているカラム。
            TagRelations::TAG_ID,           // 中間テーブルに定義された自身(Tags)のローカルキー。
        );
    }
}
