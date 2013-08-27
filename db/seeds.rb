# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Blog.create([ { title: "市況かぶ全力２階建",
                description: "Twitterと２ちゃんねる市況板を拠点に盛り上がった株ネタや震える材料を紹介しています"
              },
              { title: "CodeIQ Blog",
                description: "自分の実力を知りたいITエンジニア向けの、実務スキル評価サービス「CodeIQ（コードアイキュー）」の公式ブログです。"
              } ])

Entry.create([{ title: "いいとも100億円男cisさん2ちゃんねる個人情報流出の犠牲に",
                body: "702 名前：名無しさん＠お金いっぱい。[] 投稿日：2013/08/26(月) 18:43:00.16 ID:at7jLo7Q0
しっさんは、●買ってないの？

708 名前：名無しさん＠お金いっぱい。[sage] 投稿日：2013/08/26(月) 18:49:09.35 ID:vhrsTMQx0
●さえ買ってなければ、書き込みばれることもないんでしょ？",
                blog_id: 1
              },
              { title: "いまさら聞けない「オブジェクト指向設計の3つのコツ」～オブジェクト指向設計問題解説 #objectoriented",
                body: "CodeIQ中の人、millionsmileです。いろいろ経歴を積むと、「いまさら聞けない」ことが増えてきます。「オブジェクト指向」というのもそんないまさら聞けないものの一つでしょうか。そんなわけで、いまさら聞けないことをイマサラ問題として出題してみました。",
                blog_id: 2
              }])
