<h3>多対多 (belongsToMany / pivot)</h3>
<p>Usersテーブルが中間テーブルuser_circlesテーブルを経由してcirclesを取得。</p>

<p>
@foreach($users as $user)
{{$user->name}} が所属しているサークル一覧。
@if($user->circles->isNotEmpty())
@foreach($user->circles as $circle)
<br>{{$circle->name}}
@endforeach
@else
<br>所属しているサークルはありません。
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