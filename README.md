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
- [6-1 ベクトルの長さと `summarise`, `mutate` の使い分け](06-1.md)
- [6-2 間違えやすい問題](06-2.md)
- [6-3 `rowwise` で行ごとに処理](06-3.md)
- [7 カウント系の関数](07.md)
- [8 並べてくっつける `bind_rows` / `bind_cols`](08.md)
- [9 縦横に変換する `pivot_longer` / `pivot_wider`](09.md)
- [10 "動的な" 列選択 `tidyselect` ヘルパー関数群](10.md)
- [11 複数の列をまとめて変更・集計 - `across()`](11.md)
- [12-1 ウィンドウ関数 その１ ランキング関数](12-1.md)
- [12-2 ウィンドウ関数 その２ オフセット関数](12-2.md)
- [12-3 ウィンドウ関数 その３ 累積集計関数](12-3.md)
- [12-4 ウィンドウ関数 その４ ローリング集計関数](12-4.md)
- [12-5 ウィンドウ関数 その５ リサイクルされた集計](12-5.md)
- [13 ネストしたデータ構造](13.md)
- [13-1 ネストしたデータ構造の活用 その１ 数値シミュレーション](13-1.md)
- [13-2 ネストしたデータ構造の活用 その２ モデル作成](13-2.md)


---

## Docker Compose によるローカル RStudio Server 環境

[`docker-compose.yml`](docker-compose.yml) に記述されたDockerコンテナの起動設定が利用できる。
この設定では Docker イメージ `rocker/tidyverse:4.0.0` （2020/6/30 ビルド）に `RcppRoll` パッケージをインストールしたものを使用する。Rのバージョンは 4.0.0 となる。

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
