# Rails グループ交流アプリ ver3

このレポジトリは次のKindle電子書籍で作成しているアプリケーションのソースコードの一つです。

**Webアプリケーションを作ってみよう**  
**（Bootstrap Rails MySQL 活用編）**

- アプリケーションを作成しよう１（画面遷移まで）  
- アプリケーションを作成しよう２（基本動作まで）  
- アプリケーションを作成しよう３（完成まで）  
- **アプリケーションを作成しよう４（派生アプリ作成） <--このソースコードです**  

## 動作環境  
次の環境で動作を確認しています。  
OS: Ubuntu16.04  
Bootstrap: 3.3.7  
MySQL: 5.7.16    
Ruby: 2.3.3  
Rails: 5.0.0.1  

## インストール手順  

[0]事前にアプリが動作する環境を構築しておきます。  
（動作環境の構築については書籍の付録などをご確認ください）  

[1]GithubのレポジトリでClone or downloadボタンを押して圧縮ファイルをダウンロードします。  

[2]ファイルを解凍しrails_talkapp_ver3-masterディレクトリに移動します。  

[3]下記コマンドを実行して必要なGemパッケージをインストールします。  
bundle install

[4]MySQLでデータベースとユーザーを準備してその情報をconfig/database.ymlに設定します。  

（例）  
create database talkapp DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;  
grant all privileges on talkapp.* to ken@localhost identified by 'pass123';  

と準備した場合config/database.ymlには次のように設定します。  

default: &default  
  adapter: mysql2  
  encoding: utf8  
  pool: 5  
  username: ken  
  password: pass123  
  socket: /var/run/mysqld/mysqld.sock  

development:  
  <<: *default  
  database: talkapp  

[5]次のコマンドを実行してデータベースに必要なテーブルを作成します。  
rails db:migrate  

[6]サーバーを起動しhttp://localhost:3000でアクセス  
rails s  

## ライセンス
RailsのフレームワークはMITライセンスのもとにリリースされています。このプログラムはMITライセンスを採用しています。ライセンスの詳細についてはLICENSEファイルを参照してください。
