<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tags extends Model
{
    const TABLE_NAME = 'tags';
    const ID = 'id';
    const NAME = 'name';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function columns()
    {
        return $this->morphedByMany(
            Columns::class,                 // relationを貼る対象。
            TagRelations::TABLE_NAME,       // relationを貼る絡むの接頭辞　**_idと**_typeを自動で設定してくる。
            TagRelations::TABLE_NAME,       // 中間テーブル名
            TagRelations::TAG_ID,           // 中間テーブルに定義された自身(Tags)のローカルキー。
            TagRelations::TAG_RELATIONS_ID, // 中間テーブルの中に入っているrelation先のサロゲートキーを入れているカラム。
        );
    }
    
    public function news()
    {
        return $this->morphedByMany(
            News::class,                    // relationを貼る対象。
            TagRelations::TABLE_NAME,       // relationを貼る絡むの接頭辞　**_idと**_typeを自動で設定してくる。
            TagRelations::TABLE_NAME,       // 中間テーブル名
            TagRelations::TAG_ID,           // 中間テーブルに定義された自身(Tags)のローカルキー。
            TagRelations::TAG_RELATIONS_ID, // 中間テーブルの中に入っているrelation先のサロゲートキーを入れているカラム。
        );
    }
}
