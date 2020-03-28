<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TagRelations extends Model
{
    const TABLE_NAME = 'tag_relations';
    const ID = 'id';
    const TAG_ID = 'tag_id';
    const TAG_RELATIONS_ID = 'tag_relations_id';
    const TAG_RELATIONS_TYPE = 'tag_relations_type';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    public function columns()
    {
        return $this->morphedByMany(Columns::class, 'taggable');
    }
    
    public function posts()
    {
        return $this->morphedByMany(News::class, 'taggable');
    }
}
