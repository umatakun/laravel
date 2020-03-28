<h3>１対多 (hasMany)</h3>
<p>Usersテーブルが複数もつaddressesテーブルの電話番号情報を取得。</p>

<p>
@foreach($users as $user)
{{$user->name}} の住所一覧。
@if($user->addresses->isNotEmpty())
@foreach($user->addresses as $address)
<br>{{$address->address1}} {{$address->address2}} {{$address->address3}}
@endforeach
@else
<br>登録なし
@endif
<hr>
@endforeach
</p>

{{Html::link(route('relations_top'), 'relationへ戻る。')}}

<h3>Query</h3>
<pre>
<?php
print_r($logs);
?>
</pre>