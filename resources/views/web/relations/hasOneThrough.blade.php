<h3>Has One Through (中間テーブルを経由して一つ取得) (hasOneThrough)</h3>
<p>Companyテーブルに登録されているUserIdを元にAddress情報を一つ取得。</p>
<p>
    UsersテーブルはAddressに関する情報を持っておらず、AddressesテーブルもCompanisに関する情報を持っていない。<br>
    要は親テーブルであるCompaniesテーブルがこテーブルのUsersテーブルを中間テーブルとして、Addressesテーブルの情報を取得する。
</p>
<p>
    withを使ってクエリを組むときにはAddressesとの関係を定義しておく必要がある。発行されるクエリはhasOneThroughでもhasManyThrough同じ。
</p>

<p>
@foreach($companies as $company)
{{$company->name}}の従業員の住所一つ。<br>
{{$company->usersAddress->address1 ?? ''}} - {{$company->usersAddress->address2 ?? ''}} - {{$company->usersAddress->address3 ?? ''}}
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

