<?php

namespace App;

use Illuminate\Support\Facades\DB;

class AdminPages extends DB
{
    const TABLE_NAME = 'admin_pages';

    const ID = 'id';
    const PAGE_NAME = 'page_name';
    const STATUS = 'status';
    const DEL_FLG = 'del_flg';
    const DEL_USER_ID = 'del_user_id';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $table = self::TABLE_NAME;
}
