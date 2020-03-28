<h3>１対１（ポリモーフィック）(morphTo / morphOne)</h3>
<p>Companyテーブルに登録されているUserIdを元にAddress情報を複数取得。</p>
<p>
    UsersテーブルはAddressに関する情報を持っておらず、AddressesテーブルもCompanisに関する情報を持っていない。<br>
    要は親テーブルであるCompaniesテーブルがこテーブルのUsersテーブルを中間テーブルとして、Addressesテーブルの情報を取得する。
</p>
<p>
    withを使ってクエリを組むときにはAddressesとの関係を定義しておく必要がある。発行されるクエリはhasOneThroughでもhasManyThrough同じ。
</p>

<p>
@foreach($users as $user)
{{$user->name}}の画像一覧。<br>
@if($user->images->isNotEmpty())
@foreach($user->images as $image)
{{$image->src}}<br>
@endforeach
@else
画像の登録はありません。
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

