<h3>１対１（ポリモーフィック）(morphTo / morphOne)</h3>
<p>imagesテーブルの中に保持されているUserIdを元に特定のキーのついたデータを一つ取得。</p>

<p>
@foreach($users as $user)
{{$user->name}}のプロフ画像。<br>
{{$user->profImage->src ?? '未設定'}}
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

