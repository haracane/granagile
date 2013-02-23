===============================
Granagileでアジャイルサーバ構築
===============================

Granagileを使ったアジャイルサーバ(CentOS6)のインストールは下記の手順で実施します。

ALMiniumをインストール
======================

`ALMiniumのページ <http://alminium.github.com/alminium/>`_
の手順通りにALMiniumをインストールします::

    # yum install git 
    # git clone https://github.com/alminium/alminium.git
    # cd alminium
    # bash ./smelt

Granagile Chefで環境構築
========================

GranagileのChef設定を反映してアジャイルサーバを構築します::

    # cd /opt
    # git clone https://github.com/haracane/granagile.git
    # ./granagile/bin/install

各種サーバの起動
================

Unicorn, Nginx(ALMinium用), Apache(Git/Subversionリポジトリ用), Jenkins, ngIRCd, minechanを起動します::

    # /sbin/service unicorn-alminium start
    # /sbin/service nginx start
    # /sbin/service httpd start
    # /sbin/service jenkins start
    # /sbin/service ngircd start

これでセットアップは完了です!

各サービスには以下のアドレス、ポートからアクセスできますので確認してください。

* ALMinium http://server-address/alminium
* Jenkins http://server-address:8080
* ngIRCd server-address:6667

minechanの設定＆起動
====================

minechanを利用する場合はRedmineの[管理]->[設定]->[認証]から"RESTによるWebサービスを有効にする"をチェックして、[個人設定]からAPIアクセスキーを確認します。

RedmineのAPIキーを確認したら/opt/granagile/conf.d/redmine.shに以下の設定を追加します::

    REDMINE_API_KEY=(RedmineのAPIアクセスキー)

APIアクセスキーを設定したらminechanを起動します::

    # /sbin/service minechan start

minechanはngIRCdが起動していれば各Redmineプロジェクトの"#(プロジェクト識別子)"チャンネルに参加します。

Sphinx PDF出力のセットアップ
============================

新しいプロジェクトでSphinxのPDF出力機能を使う場合はsphinx-quickstartで作成したディレクトリで

* `conf.pyへのPDFの設定の追加 <http://sphinx-users.jp/cookbook/pdf/rst2pdf.html#pdf>`_
* `make pdfコマンドの追加 <http://sphinx-users.jp/cookbook/pdf/rst2pdf.html#id7>`_
* `PDF出力用スタイルシートの設定 <http://sphinx-users.jp/cookbook/pdf/rst2pdf.html#id8>`_

を行います。

