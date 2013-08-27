# Rails入門
## 第一回やること
1. プロジェクトを作成する
2. サーバーを起動する
3. generatorを使ってアプリケーションのひな形を作る
4. ルーティングを変更する
5. viewテンプレートをいじる
6. Controllerをいじる


### 1. プロジェクトを作成する
プロジェクトは```rails new <Project Name>```	で作成します。  
上記コマンドを実行すると```<Project Name>```のディレクトリができます。

	$ rails new MyBlog
	$ cd MyBlog
	

### 2. サーバを起動する
サーバーはWebrickがデフォルトでインストールされ、```rails server```で起動することができます。  
サーバーを起動したまま開発するには別のシェルを立ち上げます。


### 3. generatorを使ってアプリケーションのひな形を作る
ブログの1つの記事を```Entry```とします。```Entry```には```タイトル```,```本文```,```作成日時```があればよいとします。  
Railsにはデータ型があり、以下のものが使えます。

	binary
	boolean
	date
	datetime
	decimal
	float
	integer
	primary_key
	string
	text
	time
	timestamp

RailsではActiveRecordというO/Rマッパーがデータベースを抽象化し、どんなRDBMSでもRails上では同じように使えます。  

Entryでは```タイトル```は```string```、```本文```は```text```、```作成日時```は```timestamp```とします。  
Railsのgeneratorのscaffoldを使って、アプリケーションの基本的な機能の一覧(index)、詳細(show)、新規作成(new/create)、編集(edit/update)、削除(destroy)を行うために必要なコントローラ、モデル、ビューをまとめて生成します。  
コマンドは```rails generate scaffold <Model Name> <column1>:<type> <column2>:<type> …```のように使います。


	$ rails generate scaffold Entry title:string body:text

コマンドを実行すると下記のような出力がされます。
  
	invoke  active_record
    create    db/migrate/20130822162845_create_entries.rb
    create    app/models/entry.rb
    invoke    test_unit
    create      test/models/entry_test.rb
    create      test/fixtures/entries.yml
    invoke  resource_route
     route    resources :entries
    invoke  scaffold_controller
    create    app/controllers/entries_controller.rb
    invoke    erb
    create      app/views/entries
    create      app/views/entries/index.html.erb
    create      app/views/entries/edit.html.erb
    create      app/views/entries/show.html.erb
    create      app/views/entries/new.html.erb
    create      app/views/entries/_form.html.erb
    invoke    test_unit
    create      test/controllers/entries_controller_test.rb
    invoke    helper
    create      app/helpers/entries_helper.rb
    invoke      test_unit
    create        test/helpers/entries_helper_test.rb
    invoke    jbuilder
    create      app/views/entries/index.json.jbuilder
    create      app/views/entries/show.json.jbuilder
    invoke  assets
    invoke    coffee
    create      app/assets/javascripts/entries.js.coffee
    invoke    scss
    create      app/assets/stylesheets/entries.css.scss
    invoke  scss
    create    app/assets/stylesheets/scaffolds.css.scss

scaffoldを使うとModel, Controller, View Templates, migration script, js, cssなどが自動的に生成されます。
生成されたマイグレーションスクリプトを実行してDBを構築します。

	$ rake db:migrate
	==  CreateEntries: migrating ==================================================
	-- create_table(:entries)
	   -> 0.0015s
	==  CreateEntries: migrated (0.0016s) =========================================

サーバーを立ち上げて、[localhost:3000/entries](localhost:3000/entries)へアクセスすると```Listing entries```と表示されてひと通りの入力、表示、編集、削除ができるようになります。

### 4. ルーティングテーブルを変更する
ルーティングテーブルは下記コマンドで確認できます。

	$ rake routes

ルートにアクセスした時、```Listing entries```が表示してもらいたいので、ルーティングテーブルを変更します。
下記を```config/routes.rb```へ追記して、```rake routes```コマンドで確認して下さい。

	root 'entries#index'



### 5. viewテンプレートをいじってみる

現在の状態で[http://localhost:3000/](http://localhost:3000/)にアクセスした時に表示されるViewテンプレートは```app/views/entries/index.html.erb```というファイルです。
これを以下のように変更してください。  
すると[http://localhost:3000/](http://localhost:3000/)をリロードすると変更が反映されているはずです。

	<h1>Listing entries</h1>

	<table>
	  <thead>
	    <tr>
	      <th>Title</th>
	      <th></th>
	      <th></th>
	    </tr>
	  </thead>
	
	  <tbody>
	    <% @entries.each do |entry| %>
	      <tr>
	        <td><%= link_to(entry.title, entry) %></td>
	        <td>[<%= link_to 'Edit', edit_entry_path(entry) %>]</td>
	        <td>[<%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %>]</td>
		  </tr>
	    <% end %>
	  </tbody>
	</table>

	<br>

	<%= link_to 'New Entry', new_entry_path %>



### 6. Controllerをいじってみる
controllerはアクセスを受け、どんな処理をし、その処理結果をどう返すかを決定します。
まずは作成日時の近い順に一覧表示させることをやってみます。```app/controllers/entries_controller.rb```を以下のように変更します。

	@entries = Entry.all

	↓

	@entries = Entry.all.order("created_at DESC")

すると投稿日時の近い順で表示されます



## 第二回やること
1. Blogモデルの生成
2. Blog-Entryの関連付け
3. seedデータの投入
4. Viewの修正

くわしくはコミットログを見てください。
