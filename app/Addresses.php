<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Addresses extends Model
{
    const TABLE_NAME = 'addresses';
    const ID = 'id';
    const USER_ID = 'user_id';
    const PREFECTURE_ID = 'prefecture_id';
    const PREFECTURE = 'prefecture';
    const ADDRESS1 = 'address1';
    const ADDRESS2 = 'address2';
    const ADDRESS3 = 'address3';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function owner()
    {
        return $this->belongsTo(User::class, self::USER_ID, User::ID);
    }

    public function users()
    {
        return $this->belongsTo(User::class, self::USER_ID, User::ID);
    }

    public function images()
    {
        return $this->morphMany(
            Images::class,
            'related',// imagesテーブルで関連付けに使うカラムの接頭辞。接頭辞を使う場合関連テーブルを保存するカラム名が 【接頭辞】_type, 当該テーブルの主キーを保存するカラム名が【接頭辞】_idとして認識される。 
            'related', // imagesテーブルで連携する対象のテーブル(モデル名)を格納。接頭辞の規則に従う場合は指定不要。
            'target_id' // imagesテーブルで連携する対象の主キーを格納。接頭辞の規則に従う場合は指定不要。
        );
    }
}
