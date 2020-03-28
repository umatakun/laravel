<h3>１対１(hasOne / belongsTo)</h3>
{{Html::link(route('onebyone'), 'sample')}}
<hr>

<h3>１対多 (hasMany)</h3>
{{Html::link(route('onebymany'), 'sample')}}
<hr>

<h3>多対多 (belongsToMany / pivot)</h3>
{{Html::link(route('manybymany'), 'sample')}}
<hr>

<h3>Has One Through (中間テーブルを経由して一つ取得) (hasOneThrough)</h3>
{{Html::link(route('hasOneThrough'), 'sample')}}
<hr>

<h3>Has Many Through (中間テーブルを経由して複数取得) (hasManyThrough)</h3>
{{Html::link(route('hasManyThrough'), 'sample')}}
<hr>

<h3>１対１（ポリモーフィック）(morphTo / morphOne)</h3>
{{Html::link(route('morphOne'), 'sample')}}
<hr>

<h3>１対多（ポリモーフィック）(morphTo / morphMany)</h3>
{{Html::link(route('morphMany'), 'sample')}}
<hr>

<h3>多対多（ポリモーフィック）(morphToMany / morphedByMany)</h3>
{{Html::link(route('morphedByMany'), 'sample')}}
<hr>

<h3>おまけ</h3>
{{Html::link(route('omake'), 'sample')}}
<hr>
