dplyr ver1 練習帳
==========

dplyr のバージョン 1.0.0 が公式リリースされたとのことなので練習する

## 参考

- Hadley Wickham [dplyr 1.0.0 available now! - Tidyverse](https://www.tidyverse.org/blog/2020/06/dplyr-1-0-0/)
- Romain François [dplyr 1.0.0 - Speaker Deck](https://speakerdeck.com/romainfrancois/dplyr-1-dot-0-0)
- @y__mattu [dplyr 1.0.0の新機能 / dplyr 1.0.0 - Speaker Deck](https://speakerdeck.com/y__mattu/dplyr-1-dot-0-0)
- yutannihilation [dplyr 1.0.0 を使ってみる: summarise() - Technically, technophobic.](https://notchained.hatenablog.com/entry/2020/06/28/134109)

---

## もくじ

- [1 select と mutate](01.md)
- [2-1](02-1.md)
- [2-2](02-2.md)

---

## Docker Compose によるローカル RStudio Server 環境

`docker-compose.yml` に記述されたDockerコンテナの起動設定が利用できる。
この設定では Docker イメージ `rocker/tidyverse:4.0.0` （2020/6/30 ビルド）を使用する。Rのバージョンは 4.0.0 となる。

### 起動

このディレクトリで以下を実行すると Docker コンテナが起動する

```sh
docker-compose up -d
```

### 利用

- ブラウザでURL <http://localhost:8787> を開く
- このREADMEファイルのあるディレクトリがコンテナの `/home/rstudio/dplyr-v1-excercises` にマウントされている
- Rprojファイル `/home/rstudio/dplyr-v1-excercises/dplyr-v1-excercises.Rproj` を選んでプロジェクトを開く
- 開いたプロジェクトで作業を行う

### 停止

このディレクトリで以下を実行すると Docker コンテナが停止する

```sh
docker-compose down
```
