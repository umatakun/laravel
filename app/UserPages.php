<?php

namespace App;

use Illuminate\Support\Facades\DB;

class UserPages extends DB
{
    const TABLE_NAME = 'user_pages';

    const ID = 'id';
    const ADMIN_PAGE_ID = 'admin_page_id';
    const USER_ID = 'user_id';
    const STATUS = 'status';
    const DEL_FLG = 'del_flg';
    const DEL_USER_ID = 'del_user_id';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $table = self::TABLE_NAME;
}
