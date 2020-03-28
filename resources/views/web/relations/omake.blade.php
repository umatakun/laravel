<h3>おまけ</h3>
<p>relationで発行されているクエリはかなり合理的に見えるものの、中間テーブルのデータも全てpivotとして取得し、<br>Laravel内で取得しているデータを全てオブジェクト化しているため実際に使っているメモリー量が不必要に肥大化する。</p>

{{Html::link(route('relations_top'), 'relationへ戻る。')}}

<h3>Query</h3>
<pre>
<?php
print_r($logs);
?>
</pre>

<pre>
<?php
print_r($tags);
?>
</pre>

