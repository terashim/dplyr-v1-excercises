dplyr v1.0 練習帳
==========

dplyr バージョン 1.0.0 が正式にリリースされたので練習

## 参考

- Hadley Wickham [dplyr 1.0.0 available now! - Tidyverse](https://www.tidyverse.org/blog/2020/06/dplyr-1-0-0/)
- Romain François [dplyr 1.0.0 - Speaker Deck](https://speakerdeck.com/romainfrancois/dplyr-1-dot-0-0)
- @y__mattu [dplyr 1.0.0の新機能 / dplyr 1.0.0 - Speaker Deck](https://speakerdeck.com/y__mattu/dplyr-1-dot-0-0)
- yutannihilation [dplyr 1.0.0 を使ってみる: summarise() - Technically, technophobic.](https://notchained.hatenablog.com/entry/2020/06/28/134109)

---

## もくじ

- [1-1 `select` と `mutate`](01-1.md)
- [1-2 `select` の仲間 - `rename` と `relocate`](01-2.md)
- [2-1 `summarise` による集計](02-1.md)
- [2-2 グループ化とグループ解除](02-2.md)
- [3 `filter` によるデータの抽出](03.md)
- [4 `arrange` による並べ替え](04.md)
- [5 `left_join`, `inner_join` によるデータ結合](05.md)

---

## Docker Compose によるローカル RStudio Server 環境

[`docker-compose.yml`](docker-compose.yml) に記述されたDockerコンテナの起動設定が利用できる。
この設定では Docker イメージ `rocker/tidyverse:4.0.0` （2020/6/30 ビルド）を使用する。Rのバージョンは 4.0.0 となる。

### 起動

このREADMEファイルがあるディレクトリで以下を実行すると Docker コンテナが起動する

```sh
docker-compose up -d
```

### 利用

- ブラウザでURL <http://localhost:8787> を開く
- このREADMEファイルのあるディレクトリがコンテナの `/home/rstudio/dplyr-v1-excercises` にマウントされている
- Rprojファイル `/home/rstudio/dplyr-v1-excercises/dplyr-v1-excercises.Rproj` を選んでプロジェクトを開く
- 開いたプロジェクトで作業を行う

### 停止

このREADMEファイルがあるディレクトリで以下を実行すると Docker コンテナが停止する。
コンテナ内の マウントされていないファイルは消えてしまうので注意。

```sh
docker-compose down
```
