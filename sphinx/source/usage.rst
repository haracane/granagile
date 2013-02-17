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

    # git clone https://github.com/haracane/granagile.git
    # ./granagile/bin/chef-solo-role agile

Sphinx PDF出力のセットアップ
============================

SphinxのPDF出力機能を使う場合は

* `conf.pyへのPDFの設定の追加 <http://sphinx-users.jp/cookbook/pdf/rst2pdf.html#pdf>`_
* `make pdfコマンドの追加 <http://sphinx-users.jp/cookbook/pdf/rst2pdf.html#id7>`_
* `PDF出力用スタイルシートの設定 <http://sphinx-users.jp/cookbook/pdf/rst2pdf.html#id8>`_

を行います。

各種サーバの起動
================

