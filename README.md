# sample-rails-slack-api とは

Ruby on Rails でSlack APIを利用する際のサンプルです。

## 対応API
| メソッド名 | タイトル | スコープ |
| ---- | ---- | ---- |
| slack_send_messege_email  | メールアドレスからユーザーに対してDMを送信 | users:read.email , chat:write |

## テンプレート
https://github.com/nna1016/sample-docker-rails7

## 各バージョン
| 名前 | バージョン |
| ---- | ---- |
| Ruby  | 3.1.3p185 |
| Rails | Rails 7.0.4 |
| MySQL | 8.0.31 | 

## 最初にやること

1. リポジトリのクローン   
`git clone git@github.com:nna1016/sample-rails-slack-api.git`
2. DB作成   
`docker-compose run web rails db:create`
3. Docker起動   
`docker-compose up`
