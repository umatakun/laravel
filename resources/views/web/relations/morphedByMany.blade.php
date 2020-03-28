<h3>多対多（ポリモーフィック）(morphToMany / morphedByMany)</h3>
<h4>コラムとコラムについたタグ一覧</h4>
<p>
@foreach($columns as $columns)
{{$columns->title}}のタグ一覧。<br>
@foreach($columns->tags ?? [] as $tag)
{{$tag->name ?? null}}<br>
@endforeach
<hr>
@endforeach
</p>

<h4>ニュースとニュースについたタグ一覧</h4>
<p>
@foreach($news as $_news)
{{$_news->title}}のタグ一覧。<br>
@foreach($_news->tags ?? [] as $tag)
{{$tag->name ?? null}}<br>
@endforeach
<hr>
@endforeach
</p>

<h4>タグとタグが紐づけられたコンテンツ一覧</h4>
<p>
@foreach($tags as $tag)
{{$tag->name}}の紐づくコンテンツ。<br>
<h5>コラム一覧</h5>
<p>
@foreach($tag->columns ?? [] as $column)
{{$column->title ?? null}}<br>
@endforeach
</p>
<hr>
<h5>ニュース一覧</h5>
<p>
@foreach($tag->news ?? [] as $news)
{{$news->title ?? null}}<br>
@endforeach
</p>
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

