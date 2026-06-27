# hobby-terraform

terraformについて勉強する

## 初回セットアップ

- `backend.tf` を作成する
- `terraform init` コマンドを実行する

## 構成要素

### backend

- `tfstate` の保存先を設定する
- 変数を使うことは出来ないので、秘匿情報等を渡したい場合はPartial Configurationを使うと良い
  - `terraform init -backend-config="s3.tfbackend"` で指定する

`s3.tfbackend` の例

```properties
bucket = "my-tfstate-backet"
```

### tfvars

- 環境ごとに異なる値やgitにcommitしたくない情報を入れる
- エントリーポイントとなるファイル内で、`var` で参照できる
- ファイル名は `terraform.tfvars` が推奨

### provider

- terraformの実行先のproviderに関する情報を設定する
  - awsのregion等

### variable

- 動作に必要な変数の宣言を行う

### output

- 他のmoduleに渡したい値等を出力するために使う

### data

- terraform管理外のリソースから情報を読み込む場合に使う

## 反映方法

- `terraform plan` で変更内容の確認
- `terraform apply` で反映する

## workspaceについて

- 多くのベストプラクティスで非推奨
- workspaceは同じ構成でセットアップする場合に使う
  - `terraform apply` の動作確認
  - 開発者ごとにworkspaceを割り当てる
- productionとstaging等構成が異なる場合は個別にディレクトリを作成する
