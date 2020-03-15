<h3>UPLOAD</h3>
{{Form::open(['url' => route('top_upload'), 'files' => true])}}
{{Form::file('image')}}
{{Form::submit('送信')}}
{{Form::close()}}
<hr>

<h3>URL取得</h3>
{{Form::open(['url' => route('top_get_image'), 'method' => 'get'])}}
{{Form::text('file_name')}}
{{Form::submit('送信')}}
{{Form::close()}}
<hr>

<h3>公開</h3>
{{Form::open(['url' => route('top_publish')])}}
{{Form::text('file_name')}}
{{Form::submit('送信')}}
{{Form::close()}}
<hr>

<h3>削除</h3>
{{Form::open(['url' => route('top_delete')])}}
{{Form::text('file_name')}}
{{Form::submit('送信')}}
{{Form::close()}}
<hr>


<h3>復元</h3>
{{Form::open(['url' => route('top_recover')])}}
{{Form::text('file_name')}}
{{Form::submit('送信')}}
{{Form::close()}}
<hr>

