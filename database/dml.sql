/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# テーブルのダンプ addresses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addresses`;

CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `zipcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prefecture_id` bigint(20) unsigned DEFAULT NULL,
  `prefecture` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;

INSERT INTO `addresses` (`id`, `user_id`, `zipcode`, `prefecture_id`, `prefecture`, `address1`, `address2`, `address3`, `created_at`, `updated_at`)
VALUES
	(1,1,'1500001',13,'東京都','渋谷区','神宮前','1-1','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,1,'1020076',13,'東京都','千代田区','五番町','1-1','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,3,'1620825',13,'東京都','新宿区','神楽坂','1-1','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(4,2,'0640941',1,'北海道','札幌市中央区','旭ケ丘','1-1','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(5,2,'8692312',43,'熊本県','阿蘇市','小倉','1-1','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ circles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `circles`;

CREATE TABLE `circles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `circles` WRITE;
/*!40000 ALTER TABLE `circles` DISABLE KEYS */;

INSERT INTO `circles` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'釣り部','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,'写真部','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,'サッカー部','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(4,'フットサル部','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(5,'お菓子部','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(6,'ゲーム部','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(7,'帰宅部','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `circles` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `columns`;

CREATE TABLE `columns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;

INSERT INTO `columns` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`)
VALUES
	(1,1,'gitのユーザー名とemailを設定する。','gitのリポジトリを作っただけだと想定しないユーザー名でコミットしてしまうことがあります。\n僕もしょっちゅうやってしまうので備忘録的に書いておきます。\n\ngitでcommitするときに「ec2-user」など謎の名前でcommitしてしてしまい自分のcommitログなのにcommitしてる奴誰コレ？的な問題が発生しないようにするおまじないを備忘録的に。\n\ngit config --local user.name \"ユーザー名\"\ngit config --local user.email \"メールアドレス\"\nコレを設定しておくと、.git/ディレクトリの中のconfigに設定した内容が記録されます。\n\nvi .git/config \n[user]\n        name = umatakun\nちなみに僕は色々なリポジトリにpushすることが多いからlocalで設定することがほとんどだけど、globalで設定する場合はオプションにglabal指定をしてあげるだけ。\n\ngit config --global user.name \"ユーザー名\"\ngit config --global user.email \"メールアドレス\"','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,1,'gitのdefaultエディターを設定する方法。','Cloud9 で git commit しようとすると nano エディタが開いて使い勝手がよくわからず困っていました。\n\n※注\ninstance によって設定されている default エディターは異なるようなのでもしかしたら Cloud9 でも標準で vim が支えている人もいるかもしれません。\n\ngit config --global core.editor vim\nこれひとつでgit commit の時に nano エディタが開くことはなくなります。\n\nnano エディターさんバイバイ。','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,1,'Laravelでファイル操作。','laravelを使ってファイルアップロードする仕組みを試してみました。\n試した結果はこちら。\n最初ブランチを切り忘れてdevelopブランチにそのままコミットしちゃいました。。。\n\nまずはLaravelを使ってローカルにファイルを保存する方法です。\n\nhttps://github.com/umatakun/laravel/commit/4e3d369a5945701b5b703671922884f6a6549fb6\n\nフォームの生成用にlaravelcollectiveを入れました。\n\ncomposer require laravelcollective/html\nconfig/app.phpにproviderとaliasを追加\n\n    \'providers\' => [\n        /*\n         * Laravel Framework Service Providers...\n         */\n        Illuminate\\Auth\\AuthServiceProvider::class,\n...【中略】...\n        Collective\\Html\\HtmlServiceProvider::class,\n    ],\n    \'aliases\' => [\n        \'App\' => Illuminate\\Support\\Facades\\App::class,\n...【中略】...\n        \'Form\' => Collective\\Html\\FormFacade::class,\n        \'Html\' => Collective\\Html\\HtmlFacade::class,\n    ],\nまずはローカルディレクトリにファイルを保存。\n\nパスを設定する。\n\nphp artisan storage:link\nシンボリックリンクが貼られました。\n\npublic/storage -> storage/app/public\n\n今後こう言うルールにしていこうと思います。\n\nフロント側URL\nstorage/published (公開領域)\nstorage/temp (一時保存領域)\n\n保存場所\nstorage/app/public/published (公開領域)\nstorage/app/public/temp (一時保存領域)\nstorage/app/deleted (削除領域)\n\n※一時領域と削除領域ですが、一時領域は1日くらい保存して経過後削除。\n削除領域は1月くらい保存して経過後削除…の予定。。。\n\n次はGCSにファイルをアップロードする方法。\n\nhttps://github.com/umatakun/laravel/pull/1\n\nとりあえずGCSにファイルをアップロードするところまで試してみたのですが、試しきれなかったことを書いておきます。\n\nwebsight/l5-google-cloud-storageのインストールができなかった。(Frameworkのバージョン問題？)google/cloud-storageを使った場合ファイルの種類を指定できなかった。GCSにアップロードしたファイルが見えるようになるまでに謎の時間がかかる。\n1. と2.についてはなんとかなりそうな気がしますが、アップロードしたファイルが見えるまでに時間がかかるのは割ときついなと思いました。\n\nオブジェクトは取れるはずなので、最悪オブジェクトを取得して画像として出力するAPIを作らないといけないのかな。。。','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'ラクラク妄想設計所','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,'ウマタCompanyLtd.,','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ images
# ------------------------------------------------------------

DROP TABLE IF EXISTS `images`;

CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target_id` bigint(20) unsigned DEFAULT NULL,
  `related` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;

INSERT INTO `images` (`id`, `src`, `target_id`, `related`, `img_type`, `created_at`, `updated_at`)
VALUES
	(1,'umatakun.jpg',2,'App\\User','PROF','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,'shikaemon.jpg',1,'App\\User','PROF','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,'ushiokun.png',3,'App\\User','PROF','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(4,'jingumae.png',1,'App\\Addresses','MAIN','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(5,'kagurazaka.png',3,'App\\Addresses','MAIN','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(6,'shikaemon_sub1.png',1,'App\\User','SUB','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(7,'shikaemon_sub2.png',1,'App\\User','SUB','2020-03-27 00:00:00',NULL);

/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ news
# ------------------------------------------------------------

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`)
VALUES
	(1,1,'Laravelでunittestを書く。','Laravelでunittestを書いていきます。\nセットアップからunittestとfunctionalテストを書きます。\n認証が必要なページの処理もやりたいのですが、それは別記事でアップします。\n早速初めていきましょう！\n\nlaravelをセットアップします。今回使うLaravelはいつものCloud9上のLaravelです。\n\n\n早速unittestを実行してみましょう。\n\nec2-user:/var/www/hash_de_go (unittest) $ git branch\n  develop\n* unittest\nec2-user:/var/www/hash_de_go (unittest) $ vendor/bin/phpunit \nPHPUnit 8.5.2 by Sebastian Bergmann and contributors.\n\n.F                                                                  2 / 2 (100%)\n\nTime: 172 ms, Memory: 20.00 MB\n\nThere was 1 failure:\n\n1) Tests\\Feature\\ExampleTest::testBasicTest\nExpected status code 200 but received 500.\nFailed asserting that false is true.\n\n/var/www/hash_de_go/vendor/laravel/framework/src/Illuminate/Foundation/Testing/TestResponse.php:185\n/var/www/hash_de_go/tests/Feature/ExampleTest.php:19\n\nFAILURES!\nTests: 2, Assertions: 2, Failures: 1.\nec2-user:/var/www/hash_de_go (unittest) $ \nみるも無残にエラーが出ました。\n\nエラーを見てみると…。\n\n/var/www/hash_de_go/tests/Feature/ExampleTest.php:19\nここでエラーが出ているようです。\nログを確認してみます。\n(最初はログの権限がapacheになってたかな？と疑ったりしましたが違いました。。)\n\n[2020-03-27 03:49:12] testing.ERROR: SQLSTATE[HY000]: General error: 1 no such table: users (SQL: select * from \"users\") {\"exception\":\"[object] (Illuminate\\\\Database\\\\QueryException(code: HY000): SQLSTATE[HY000]: General error: 1 no such table: users (SQL: select * from \\\"users\\\") at /var/www/hash_de_go/vendor/laravel/framework/src/Illuminate/Database/Connection.php:669)\n[stacktrace]\nDBにテーブルがないと言われているようです。\nはて？\nテーブルアルヨ？\n\nmysql> show databases;\n+--------------------+\n| Database           |\n+--------------------+\n| information_schema |\n| laravel            |\n| mysql              |\n| performance_schema |\n| sys                |\n+--------------------+\n5 rows in set (0.00 sec)\n\nmysql> use laravel;\nReading table information for completion of table and column names\nYou can turn off this feature to get a quicker startup with -A\n\nDatabase changed\nmysql> show tables;\n+-------------------+\n| Tables_in_laravel |\n+-------------------+\n| failed_jobs       |\n| migrations        |\n| password_resets   |\n| users             |\n+-------------------+\n4 rows in set (0.00 sec)\nphpunitが使うテスト用のDBのことかな？ということでphpunitの設定を確認します。\nphpunit.xmlを開きます。\n\n    <php>\n        <server name=\"APP_ENV\" value=\"testing\"/>\n        <server name=\"BCRYPT_ROUNDS\" value=\"4\"/>\n        <server name=\"CACHE_DRIVER\" value=\"array\"/>\n        <server name=\"DB_CONNECTION\" value=\"sqlite\"/>\n        <server name=\"DB_DATABASE\" value=\":memory:\"/>\n        <server name=\"MAIL_DRIVER\" value=\"array\"/>\n        <server name=\"QUEUE_CONNECTION\" value=\"sync\"/>\n        <server name=\"SESSION_DRIVER\" value=\"array\"/>\n    </php>\n末尾の方にこういう記載があります。\n\nDB_CONNECTION => sqlite\nDB_DATABASE => :memory:\nとのことですが、テストしたい環境と違うので設定を変えてやりましょう。\nその前にテスト用のDBを作成しましょう。\nまずはusersテーブルのdumpから。\n\nmysql> show create table users;\n+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+\n| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |\n+-------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+\n| users | CREATE TABLE `users` (\n  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,\n  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,\n  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,\n  `email_verified_at` timestamp NULL DEFAULT NULL,\n  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,\n  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n  `created_at` timestamp NULL DEFAULT NULL,\n  `updated_at` timestamp NULL DEFAULT NULL,\n  PRIMARY KEY (`id`),\n  UNIQUE KEY `users_email_unique` (`email`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci |\nDBとテーブル作成していきます。\n\nmysql> create database laravel_test;\nQuery OK, 1 row affected (0.00 sec)\n\nmysql> use laravel_test;\nDatabase changed\nmysql> CREATE TABLE `users` (\n    ->   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,\n    ->   `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,\n    ->   `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,\n    ->   `email_verified_at` timestamp NULL DEFAULT NULL,\n    ->   `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,\n    ->   `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,\n    ->   `created_at` timestamp NULL DEFAULT NULL,\n    ->   `updated_at` timestamp NULL DEFAULT NULL,\n    ->   PRIMARY KEY (`id`),\n    ->   UNIQUE KEY `users_email_unique` (`email`)\n    -> ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ;\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> show tables;\n+------------------------+\n| Tables_in_laravel_test |\n+------------------------+\n| users                  |\n+------------------------+\n1 row in set (0.00 sec)\nphpunit.xmlの末尾を修正。\n\n    <php>\n        <server name=\"APP_ENV\" value=\"testing\"/>\n        <server name=\"BCRYPT_ROUNDS\" value=\"4\"/>\n        <server name=\"CACHE_DRIVER\" value=\"array\"/>\n        <server name=\"DB_CONNECTION\" value=\"mysql\"/>\n        <server name=\"DB_DATABASE\" value=\"laravel_test\"/>\n        <server name=\"MAIL_DRIVER\" value=\"array\"/>\n        <server name=\"QUEUE_CONNECTION\" value=\"sync\"/>\n        <server name=\"SESSION_DRIVER\" value=\"array\"/>\n    </php>\nもう一度unittestを実行します。\n\nec2-user:/var/www/hash_de_go (unittest) $ vendor/bin/phpunit \nPHPUnit 8.5.2 by Sebastian Bergmann and contributors.\n\n..                                                                  2 / 2 (100%)\n\nTime: 157 ms, Memory: 18.00 MB\n\nOK (2 tests, 2 assertions)\n今度はうまくいきました。\nとりあえずOKとしちゃいましょう。\ngitに上げた差分はこちら。\nhttps://github.com/umatakun/laravel/commit/f0017e11544e8b1ff58ce92d61c595aef24e2229\n\n「unittestを書くっ！」て聞くと面倒なイメージがあると思いますが、テスト時だけじゃなく、unittestを書くことによって自分の書いたコードの妥当性を検証する機会になるので面倒くさがらずに書くことをお勧めします。\n実際に面倒なのは最初に上の設定を作ることぐらいですよ☆\n\n…知らんけど。。。','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,1,'鹿でもできる！githubアカウントを作成・SSHキー登録からinitialコミットをしてみるよ。','githubでソースコードを管理する手順を解説します。個人でファイル管理をするときには別にgithub使わなくてもと思うかもしれませんが、何かしらのきっかけで他の人に手伝ってもらったり、最悪の場合自分のPCが壊れたりしたときにリモートにあげといて良かったと思える日が来るかもしれません。\n\ngithubのページにアクセスします。\nsign upをクリックしてアカウントを作成します。\n\n\n途中簡単なクイズが出ますが多分余裕で解けます。\n\n\nプランはフリーを選択してください。\n\n\n必要事項を適当に埋めて登録します。\nあとで使うこともないのでなんでもいいです。\n\n\n登録をクリックすると確認メールが届きます。\n\n「Verify email address」をクリックしてアカウントを有効化しましょう。\n\n\nアカウントが有効化されるとすぐにリポジトリを作成するように言われます。\n\nまぁなんでもいいですが、今回は基本のHTMLを管理するリポジトリにしたいので「basic_html」としました。\n今回公開設定は「public」にします。無料のアカウントでは非公開リポジトリは3つまでしか作れません。\n今回はみなさんに見ていただけるように「public」にしています。\n\n\nページ下の「Create repository」をクリックします。\n\nリポジトリが作られました。\n\n\nここから自分のPCからsshを使ってgithubにアクセスできるように設定していきましょう。\n\n右上のアイコンをクリックしてプルダウンメニューから「Settings」をクリックします。\n\n\nその前にプロフィールを盛っておきましょう。\n\n\n「Update profile」をクリックして更新します。\n\nそれではSSHキーを登録します。\n\n\n画面左側に「SSH and GPG keys」というリンクがあるのでクリックします。\n\n開いたページで右上の「New SSH key」ボタンをクリックします。\n\nこちらにSSHキーの情報を入力していきます。\n\nそれでは、githubに登録するためのキーを作っていきましょう。\nmacのホームディレクトリ配下にworkspaceというディレクトリを作りその下に、umatakunというディレクトリを作ります。\n\nmkdir -p ~/workspace/umatakun\ncd ~/workspace/umatakun\npwd\nここで鍵を作ります。\n\nssh-keygen -t rsa\n鍵の名前を「umatakun_no_key」とします。\n\nパスフレーズを求められますがとりあえず何も設定しなくて大丈夫です。リターンキーを2回クリックしましょう。\n\nls -al\nディレクトリの中を見てみると「umatakun_no_key」と「umatakun_no_key.pub」というファイルができていることがわかります。\n\nこのファイルですが、「umatakun_no_key」を秘密鍵、「umatakun_no_key.pub」を公開鍵と言います。\n\nこれをsshキーを管理するディレクトリに移動させます。\n\nmkdir -p ~/.ssh\n\nmv umatakun_no_key* ~/.ssh/\nSSHキーを管理するディレクトリに移動しましょう。\n\ncd ~/.ssh/\nls -al\n秘密鍵「umatakun_no_key」の左側に「-rw——-」と書かれていますが、これは自分しか読めないし、書き込めないファイルだよという意味です。もし違う設定になっていた場合は以下のコマンドで権限を変えておきましょう。\n\nchmod 0600 ~/.ssh/umatakun_no_key\nちょっとだけ鍵の中身をのぞいてみましょうか？\n秘密鍵は誰にも見せてはいけないので厳重に管理しましょう。\n\nvi umatakun_no_key\n間違って改変してしまわないように、「esc」、「:」、「!」、「w」、「q」とキーを押してエディターを閉じてください。\n\nvi umatakun_no_key.pub\n間違って改変してしまわないように、「esc」、「:」、「!」、「w」、「q」とキーを押してエディターを閉じてください。\n\nさて、ここでできた鍵のうち、公開鍵「umatakun_no_key.pub」の方をgithubに登録しましょう。\nとりあえずtitleは「umatakun_no_key」としておきます。\nこちらのコマンドでクリップボードの鍵の中身をコピーできます。くれぐれも秘密鍵の方を登録しちゃわないようにしてください。(※一応エラーが出て登録できないようになっているはずですが。。)\n\n\npbcopy < ~/.ssh/umatakun_no_key.pub\nクリップボードにコピーできたら先ほどのgithubのページに移動して公開鍵を貼り付けて「Add SSH key」をクリックします。\n\nSSHキーが登録されました。\n\n今度は登録したこのSSHキーを簡単に呼び出せるようにsshの設定をしていきます。\n\n「~/.ss/config」に以下の書式で設定を書き込みます。\n\nHost 【接続するときに呼び出す名前】\n  User git\n  HostName github.com\n  IdentityFile ~/.ssh/【先ほど作った秘密鍵のファイル名】\n  Port 22\n【】で括ったところだけご自身の環境で変えてください。\n私は接続するときに「umatano_git」で呼び出したいのと先ほど作った秘密鍵が「umatakun_no_key」なのでこういう設定になりました。\n\nvi ~/.ssh/config\n設定ファイルを開きます。\n\nHost umata\n  User git\n  HostName github.com\n  IdentityFile ~/.ssh/umatakun_no_key\n  Port 22\n編集が終わったら「esc」、「:」、「w」、「q」キーを押してください。\n\n\nここでgithubのアカウントを複数持っている場合は「Host 【接続するときに呼び出す名前】」を変えてやるとキーの使い分けができます。\n\n最初は面倒なので「github.com」を指定することをお勧めします。\n\nそれではちゃんとgithubに接続できるか試してみます。\nテストコマンドはこちらです。\n\nssh -T git@【接続するときに呼び出す名前】\nアットマーク「@」前のgitはユーザーで指定した「git」なのですが、ここを変えるとうまくいかないということもあるようで基本的に困ることはないので「git」にしておきましょう。\n\nssh -T git@umata\nテストコマンドを流すと。。\n\nHi umatakun! You\'ve successfully authenticated\nうまくいきました。えへへという感じですw。\n\nそれでは先ほど作った「basic_html」を初期化して自分のPC（ローカル）に落としてきましょう。\n最初にgithub内（リモート）のブランチを落としてくることをcloneするといいます。\n\n左側のメニューから「Repositories」をクリックするとリポジトリのリンクが一覧になりますので先ほど作ったリポジトリ（ここでは「basic_html」）を選択します。\n\n「Quick setup」でclone方法で「SSH」を選択しましょう。\n\n「basic_html」のページを開いてみると何やら書いていますね。。\n\n…or create a new repository on the command line\n\n以下の部分を大体そのままコピーペーストしていきます。\nここで一点注意していかないといけないのが、今回githubのhostを「umata」で設定しました。\nですのでMACのSSH設定が先ほど登録したキーを呼び出すには「github.com」のところを「umata」に変更する必要があります。\n\ngit remote add origin git@umata:umatakun/basic_html.git\nそれでは、作業スペースに移動しましょう。\n\ncd ~/workspace/umatakun/\n\necho \"# basic_html\" >> README.md\ngit init\ngit add README.md\ngit commit -m \"first commit\"\ngit remote add origin git@umata:umatakun/basic_html.git\ngit push -u origin master\n特に何もおきなかったはずです。。\n先ほどのgithubのリポジトリのページを更新してみましょう。\n\nREADME.mdというファイルが作られ、「first commit」と履歴が付いています。\n\n\nここまでできたらとりほぼほぼ作業は完了です。\n\nMACの中にどんなブランチがあるかみてみると「master」ブランチの中にいることがわかります。\nmasterブランチで作業するのは割とイケてないので、「master」ブランチから「develop」ブランチを切って基本的に「develop」ブランチに向かって作業をマージしていくようにしましょう。\n\nまず「develop」を切り出します。\n\ngit checkout -b develop\nこれで「develop」ブランチができました。\n念のため作ったブランチをリモートにpushしておきましょう。\n\ngit push origin develop\n\nこれから作業がどんどん進められていきそうな気がします。\nとりあえず今日はここまでにしておきましょうか？\n\nお疲れ様でした！！','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ phones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phones`;

CREATE TABLE `phones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;

INSERT INTO `phones` (`id`, `user_id`, `phone`, `created_at`, `updated_at`)
VALUES
	(1,1,'123-4567-8901','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,2,'098-7654-3210','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ prefectures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `prefectures`;

CREATE TABLE `prefectures` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `prefectures` WRITE;
/*!40000 ALTER TABLE `prefectures` DISABLE KEYS */;

INSERT INTO `prefectures` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'北海道',NULL,NULL),
	(2,'青森県',NULL,NULL),
	(3,'岩手県',NULL,NULL),
	(4,'宮城県',NULL,NULL),
	(5,'秋田県',NULL,NULL),
	(6,'山形県',NULL,NULL),
	(7,'福島県',NULL,NULL),
	(8,'茨城県',NULL,NULL),
	(9,'栃木県',NULL,NULL),
	(10,'群馬県',NULL,NULL),
	(11,'埼玉県',NULL,NULL),
	(12,'千葉県',NULL,NULL),
	(13,'東京都',NULL,NULL),
	(14,'神奈川県',NULL,NULL),
	(15,'新潟県',NULL,NULL),
	(16,'富山県',NULL,NULL),
	(17,'石川県',NULL,NULL),
	(18,'福井県',NULL,NULL),
	(19,'山梨県',NULL,NULL),
	(20,'長野県',NULL,NULL),
	(21,'岐阜県',NULL,NULL),
	(22,'静岡県',NULL,NULL),
	(23,'愛知県',NULL,NULL),
	(24,'三重県',NULL,NULL),
	(25,'滋賀県',NULL,NULL),
	(26,'京都府',NULL,NULL),
	(27,'大阪府',NULL,NULL),
	(28,'兵庫県',NULL,NULL),
	(29,'奈良県',NULL,NULL),
	(30,'和歌山県',NULL,NULL),
	(31,'鳥取県',NULL,NULL),
	(32,'島根県',NULL,NULL),
	(33,'岡山県',NULL,NULL),
	(34,'広島県',NULL,NULL),
	(35,'山口県',NULL,NULL),
	(36,'徳島県',NULL,NULL),
	(37,'香川県',NULL,NULL),
	(38,'愛媛県',NULL,NULL),
	(39,'高知県',NULL,NULL),
	(40,'福岡県',NULL,NULL),
	(41,'佐賀県',NULL,NULL),
	(42,'長崎県',NULL,NULL),
	(43,'熊本県',NULL,NULL),
	(44,'大分県',NULL,NULL),
	(45,'宮崎県',NULL,NULL),
	(46,'鹿児島県',NULL,NULL),
	(47,'沖縄県',NULL,NULL);

/*!40000 ALTER TABLE `prefectures` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ tag_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tag_relations`;

CREATE TABLE `tag_relations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL,
  `tag_relations_id` bigint(20) unsigned NOT NULL,
  `tag_relations_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tag_relations` WRITE;
/*!40000 ALTER TABLE `tag_relations` DISABLE KEYS */;

INSERT INTO `tag_relations` (`id`, `tag_id`, `tag_relations_id`, `tag_relations_type`, `created_at`, `updated_at`)
VALUES
	(1,1,3,'App\\Columns','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,1,1,'App\\News','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,2,1,'App\\Columns','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(4,2,2,'App\\Columns','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(5,2,2,'App\\News','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(6,3,3,'App\\Columns','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `tag_relations` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'laravel','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,'git','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,'gcp','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ user_circles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_circles`;

CREATE TABLE `user_circles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `circle_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `user_circles` WRITE;
/*!40000 ALTER TABLE `user_circles` DISABLE KEYS */;

INSERT INTO `user_circles` (`id`, `user_id`, `circle_id`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,1,3,'2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,1,7,'2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(4,2,2,'2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(5,2,4,'2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `user_circles` ENABLE KEYS */;
UNLOCK TABLES;


# テーブルのダンプ users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `company_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,1,'shiakemon','shikaemon@abc.de','2020-03-27 00:00:00','hogehoge','fugafuga','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(2,2,'umatakun','umatakun@abc.de','2020-03-27 00:00:00','ageage','poyopoyo','2020-03-27 00:00:00','2020-03-27 00:00:00'),
	(3,2,'ushiokun','ushio@abc.de','2020-03-27 00:00:00','mushamusha','mushamusha','2020-03-27 00:00:00','2020-03-27 00:00:00');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
