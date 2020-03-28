<h3>１対１(hasOne / belongsTo)</h3>
<p>Usersテーブルが一つだけもつPhonesテーブルの電話番号情報を取得。</p>

<p>
@foreach($users as $user)
{{$user->name}} => {{$user->phones->phone ?? '登録なし'}}<br>
@endforeach
</p>

{{Html::link(route('relations_top'), 'relationへ戻る。')}}

<h3>Query</h3>
<pre>
<?php
print_r($logs);
?>
</pre>