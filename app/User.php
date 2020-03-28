<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Images as Img;

class User extends Authenticatable
{
    use Notifiable;

    const TABLE_NAME = 'users';
    const ID = 'id';
    const COMPANY_ID = 'company_id';
    const NAME = 'name';
    const EMAIL = 'email';
    const EMAIL_VERIFIED_AT = 'email_verified_at';
    const PASSWORD = 'password';
    const REMEMBER_TOKEN = 'remember_token';
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    protected $primaryKey = self::ID;
    protected $table = self::TABLE_NAME;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function circles()
    {
        return $this->belongsToMany(
            Circles::class,
            CirclesUser::TABLE_NAME,
            CirclesUser::USER_ID,
            CirclesUser::CIRCLE_ID,
        );
    }

    public function addresses()
    {
        return $this->hasMany(Addresses::class, Addresses::USER_ID, self::ID);
    }

    public function jusho()
    {
        return $this->hasMany(Addresses::class, Addresses::USER_ID, self::ID);
    }

    public function hoge()
    {
        return $this->hasOne(Phones::class, Phones::USER_ID, self::ID);
    }

    public function phones()
    {
        return $this->hasOne(Phones::class, Phones::USER_ID, self::ID);
    }

    public function profImage()
    {
        return $this->morphOne(
            Images::class,
            'related',// imagesテーブルで関連付けに使うカラムの接頭辞。接頭辞を使う場合関連テーブルを保存するカラム名が 【接頭辞】_type, 当該テーブルの主キーを保存するカラム名が【接頭辞】_idとして認識される。 
            'related', // imagesテーブルで連携する対象のテーブル(モデル名)を格納。接頭辞の規則に従う場合は指定不要。
            'target_id' // imagesテーブルで連携する対象の主キーを格納。接頭辞の規則に従う場合は指定不要。
        )->where(Images::TABLE_NAME.'.'.Images::IMG_TYPE, Images::IMG_TYPE_PROF);
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
