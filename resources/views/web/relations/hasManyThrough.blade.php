<h3>Has Many Through (中間テーブルを経由して複数取得) (hasManyThrough)</h3>
<p>Companyテーブルに登録されているUserIdを元にAddress情報を複数取得。</p>
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
@if($company->usersAddresses->isNotEmpty())
@foreach($company->usersAddresses as $address)
{{$address->address1 ?? ''}} - {{$address->address2 ?? ''}} - {{$address->address3 ?? ''}}<br>
@endforeach
@else
住所の登録はありません。
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

