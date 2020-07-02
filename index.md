---
title: "dplyr ver1 練習帳"
author: "terashim"
date: "2020/7/1"
output:
  html_document:
    keep_md: yes
---




## パッケージのインストール

普通にCRANから dplyr パッケージをインストールするとバージョン 1.0 になる（2020年7月1日現在）


```r
install.packages("dplyr")
```

インストールされた dplyr パッケージのバージョンを確認


```r
installed.packages()["dplyr", "Version"]
```

```
## [1] "1.0.0"
```

パッケージのロード


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

-----

## 練習用データ

練習用データとして **`airquality`** を使う。


```r
airquality
```

```
##     Ozone Solar.R Wind Temp Month Day
## 1      41     190  7.4   67     5   1
## 2      36     118  8.0   72     5   2
## 3      12     149 12.6   74     5   3
## 4      18     313 11.5   62     5   4
## 5      NA      NA 14.3   56     5   5
....
## 147     7      49 10.3   69     9  24
## 148    14      20 16.6   63     9  25
## 149    30     193  6.9   70     9  26
## 150    NA     145 13.2   77     9  27
## 151    14     191 14.3   75     9  28
## 152    18     131  8.0   76     9  29
## 153    20     223 11.5   68     9  30
```

---

## select() - 列選択・列名変更・列の並べ替え

### select() で列選択

select で列を選択


```r
airquality %>% 
  select(Solar.R, Temp, Month, Day)
```

```
##     Solar.R Temp Month Day
## 1       190   67     5   1
## 2       118   72     5   2
## 3       149   74     5   3
## 4       313   62     5   4
## 5        NA   56     5   5
....
## 147      49   69     9  24
## 148      20   63     9  25
## 149     193   70     9  26
## 150     145   77     9  27
## 151     191   75     9  28
## 152     131   76     9  29
## 153     223   68     9  30
```

列名は文字列でもOK


```r
airquality %>% 
  select("Solar.R", "Temp", "Month", "Day")
```

```
##     Solar.R Temp Month Day
## 1       190   67     5   1
## 2       118   72     5   2
## 3       149   74     5   3
## 4       313   62     5   4
## 5        NA   56     5   5
....
## 147      49   69     9  24
## 148      20   63     9  25
## 149     193   70     9  26
## 150     145   77     9  27
## 151     191   75     9  28
## 152     131   76     9  29
## 153     223   68     9  30
```
文字列ベクトルでもOK


```r
airquality %>% 
  select(c("Solar.R", "Temp", "Month", "Day"))
```

```
##     Solar.R Temp Month Day
## 1       190   67     5   1
## 2       118   72     5   2
## 3       149   74     5   3
## 4       313   62     5   4
## 5        NA   56     5   5
....
## 147      49   69     9  24
## 148      20   63     9  25
## 149     193   70     9  26
## 150     145   77     9  27
## 151     191   75     9  28
## 152     131   76     9  29
## 153     223   68     9  30
```

### select() で列の並べ替え


```r
airquality %>% 
  select(Month, Day, Solar.R, Temp)
```

```
##     Month Day Solar.R Temp
## 1       5   1     190   67
## 2       5   2     118   72
## 3       5   3     149   74
## 4       5   4     313   62
## 5       5   5      NA   56
....
## 147     9  24      49   69
## 148     9  25      20   63
## 149     9  26     193   70
## 150     9  27     145   77
## 151     9  28     191   75
## 152     9  29     131   76
## 153     9  30     223   68
```

### select() で列名変更


```r
airquality %>% 
  select(month = Month, day = Day, solar_radiation = Solar.R, temperature = Temp)
```

```
##     month day solar_radiation temperature
## 1       5   1             190          67
## 2       5   2             118          72
## 3       5   3             149          74
## 4       5   4             313          62
## 5       5   5              NA          56
....
## 147     9  24              49          69
## 148     9  25              20          63
## 149     9  26             193          70
## 150     9  27             145          77
## 151     9  28             191          75
## 152     9  29             131          76
## 153     9  30             223          68
```

---

## mutate() - 列の追加・列の変更

### mutate で列の追加

このデータは1973年の観測値なので、**定数値 1973 の入った列 year を付け加える**


```r
airquality %>% 
  mutate(
    year = 1973
  )
```

```
##     Ozone Solar.R Wind Temp Month Day year
## 1      41     190  7.4   67     5   1 1973
## 2      36     118  8.0   72     5   2 1973
## 3      12     149 12.6   74     5   3 1973
## 4      18     313 11.5   62     5   4 1973
## 5      NA      NA 14.3   56     5   5 1973
....
## 147     7      49 10.3   69     9  24 1973
## 148    14      20 16.6   63     9  25 1973
## 149    30     193  6.9   70     9  26 1973
## 150    NA     145 13.2   77     9  27 1973
## 151    14     191 14.3   75     9  28 1973
## 152    18     131  8.0   76     9  29 1973
## 153    20     223 11.5   68     9  30 1973
```

年 year を作り、さらに月 Month, 日 Day の列と合わせて **日付の列 date を作る**


```r
airquality %>% 
  mutate(
    year = 1973,
    date = as.Date(sprintf("%04d-%02d-%02d", year, Month, Day))
  )
```

```
##     Ozone Solar.R Wind Temp Month Day year       date
## 1      41     190  7.4   67     5   1 1973 1973-05-01
## 2      36     118  8.0   72     5   2 1973 1973-05-02
## 3      12     149 12.6   74     5   3 1973 1973-05-03
## 4      18     313 11.5   62     5   4 1973 1973-05-04
## 5      NA      NA 14.3   56     5   5 1973 1973-05-05
....
## 147     7      49 10.3   69     9  24 1973 1973-09-24
## 148    14      20 16.6   63     9  25 1973 1973-09-25
## 149    30     193  6.9   70     9  26 1973 1973-09-26
## 150    NA     145 13.2   77     9  27 1973 1973-09-27
## 151    14     191 14.3   75     9  28 1973 1973-09-28
## 152    18     131  8.0   76     9  29 1973 1973-09-29
## 153    20     223 11.5   68     9  30 1973 1973-09-30
```

列 Temp は華氏温度で表した気温を表す。
この列を元に **摂氏温度に変換した列 temperature を作って付け加える**


```r
airquality %>% 
  mutate(
    temperature = (Temp - 32) / 1.8
  )
```

```
##     Ozone Solar.R Wind Temp Month Day temperature
## 1      41     190  7.4   67     5   1    19.44444
## 2      36     118  8.0   72     5   2    22.22222
## 3      12     149 12.6   74     5   3    23.33333
## 4      18     313 11.5   62     5   4    16.66667
## 5      NA      NA 14.3   56     5   5    13.33333
....
## 147     7      49 10.3   69     9  24    20.55556
## 148    14      20 16.6   63     9  25    17.22222
## 149    30     193  6.9   70     9  26    21.11111
## 150    NA     145 13.2   77     9  27    25.00000
## 151    14     191 14.3   75     9  28    23.88889
## 152    18     131  8.0   76     9  29    24.44444
## 153    20     223 11.5   68     9  30    20.00000
```

列 Wind は mph (マイル毎時) 単位で表した風速を表す。
この列を元に **メートル毎秒単位に変換した列 wind を作って付け加える**


```r
airquality %>% 
  mutate(
    wind = Wind * 1609 / 3600
  )
```

```
##     Ozone Solar.R Wind Temp Month Day      wind
## 1      41     190  7.4   67     5   1 3.3073889
## 2      36     118  8.0   72     5   2 3.5755556
## 3      12     149 12.6   74     5   3 5.6315000
## 4      18     313 11.5   62     5   4 5.1398611
## 5      NA      NA 14.3   56     5   5 6.3913056
....
## 147     7      49 10.3   69     9  24 4.6035278
## 148    14      20 16.6   63     9  25 7.4192778
## 149    30     193  6.9   70     9  26 3.0839167
## 150    NA     145 13.2   77     9  27 5.8996667
## 151    14     191 14.3   75     9  28 6.3913056
## 152    18     131  8.0   76     9  29 3.5755556
## 153    20     223 11.5   68     9  30 5.1398611
```

### mutate() で列を変更

気温 Temp を華氏温度から摂氏温度に変換して **上書き** する


```r
airquality %>% 
  mutate(
    Temp = (Temp - 32) / 1.8
  )
```

```
##     Ozone Solar.R Wind     Temp Month Day
## 1      41     190  7.4 19.44444     5   1
## 2      36     118  8.0 22.22222     5   2
## 3      12     149 12.6 23.33333     5   3
## 4      18     313 11.5 16.66667     5   4
## 5      NA      NA 14.3 13.33333     5   5
....
## 147     7      49 10.3 20.55556     9  24
## 148    14      20 16.6 17.22222     9  25
## 149    30     193  6.9 21.11111     9  26
## 150    NA     145 13.2 25.00000     9  27
## 151    14     191 14.3 23.88889     9  28
## 152    18     131  8.0 24.44444     9  29
## 153    20     223 11.5 20.00000     9  30
```
風速 Wind をマイル毎時からメートル毎秒に変換して **上書き** する


```r
airquality %>% 
  mutate(
    Wind = Wind * 1609 / 3600
  )
```

```
##     Ozone Solar.R      Wind Temp Month Day
## 1      41     190 3.3073889   67     5   1
## 2      36     118 3.5755556   72     5   2
## 3      12     149 5.6315000   74     5   3
## 4      18     313 5.1398611   62     5   4
## 5      NA      NA 6.3913056   56     5   5
....
## 147     7      49 4.6035278   69     9  24
## 148    14      20 7.4192778   63     9  25
## 149    30     193 3.0839167   70     9  26
## 150    NA     145 5.8996667   77     9  27
## 151    14     191 6.3913056   75     9  28
## 152    18     131 3.5755556   76     9  29
## 153    20     223 5.1398611   68     9  30
```

### select() と mutate() を組み合わせて使う

- 月 `Month`, 日 `Day` を元に日付の列 `date` を作る
- 華氏気温 `Temp` から摂氏気温の列 `temperaure` を作る
- マイル毎時単位の風速 `Wind` からメートル毎秒単位の風速 `wind` を作る
- 列名 `Month`, `Day`, `Ozone` を小文字に変更する
- 列名 `Solar.R` を `solar_radiation` に変更する
- 列を `date`, `month`, `day`, `ozone`, `solar_radiation`, `wind`, `temperature` の順に並べる


```r
airquality %>% 
  mutate(
    year = 1973,
    date = as.Date(sprintf("%04d-%02d-%02d", year, Month, Day)),
    temperature = (Temp - 32) / 1.8,
    wind = Wind * 1609 / 3600
  ) %>% 
  select(
    date,
    year,
    month = Month,
    day = Day,
    ozone = Ozone,
    solar_radiation = Solar.R,
    wind, 
    temperature
  )
```

```
##           date year month day ozone solar_radiation      wind temperature
## 1   1973-05-01 1973     5   1    41             190 3.3073889    19.44444
## 2   1973-05-02 1973     5   2    36             118 3.5755556    22.22222
## 3   1973-05-03 1973     5   3    12             149 5.6315000    23.33333
## 4   1973-05-04 1973     5   4    18             313 5.1398611    16.66667
## 5   1973-05-05 1973     5   5    NA              NA 6.3913056    13.33333
....
## 147 1973-09-24 1973     9  24     7              49 4.6035278    20.55556
## 148 1973-09-25 1973     9  25    14              20 7.4192778    17.22222
## 149 1973-09-26 1973     9  26    30             193 3.0839167    21.11111
## 150 1973-09-27 1973     9  27    NA             145 5.8996667    25.00000
## 151 1973-09-28 1973     9  28    14             191 6.3913056    23.88889
## 152 1973-09-29 1973     9  29    18             131 3.5755556    24.44444
## 153 1973-09-30 1973     9  30    20             223 5.1398611    20.00000
```

---

## 集計

### 整形したデータ

`select()` と `mutate()` で整形したデータ **`airquality_mod`** を用意する. また data.frame を tibble にする.


```r
airquality_mod <-
  airquality %>% 
  mutate(
    year = 1973,
    date = as.Date(sprintf("%04d-%02d-%02d", year, Month, Day)),
    temperature = (Temp - 32) / 1.8
  ) %>% 
  select(
    date,
    year,
    month = Month,
    day = Day,
    ozone = Ozone,
    solar_radiation = Solar.R,
    wind = Wind, 
    temperature
  ) %>% 
  as_tibble()

airquality_mod
```

```
## # A tibble: 153 x 8
##    date        year month   day ozone solar_radiation  wind temperature
##    <date>     <dbl> <int> <int> <int>           <int> <dbl>       <dbl>
##  1 1973-05-01  1973     5     1    41             190   7.4        19.4
##  2 1973-05-02  1973     5     2    36             118   8          22.2
##  3 1973-05-03  1973     5     3    12             149  12.6        23.3
##  4 1973-05-04  1973     5     4    18             313  11.5        16.7
##  5 1973-05-05  1973     5     5    NA              NA  14.3        13.3
##  6 1973-05-06  1973     5     6    28              NA  14.9        18.9
##  7 1973-05-07  1973     5     7    23             299   8.6        18.3
##  8 1973-05-08  1973     5     8    19              99  13.8        15  
##  9 1973-05-09  1973     5     9     8              19  20.1        16.1
## 10 1973-05-10  1973     5    10    NA             194   8.6        20.6
## # … with 143 more rows
```

### `summarise()` で全体の平均値を取る

`wind`, `temperature` の平均値を計算して `avg_wind`, `avg_temperature` とする.


```r
airquality_mod %>% 
  summarise(
    avg_wind = mean(wind),
    avg_temperature = mean(temperature)
  )
```

```
## # A tibble: 1 x 2
##   avg_wind avg_temperature
##      <dbl>           <dbl>
## 1     9.96            25.5
```

### `group_by()` と `summarise()` でグループごとに平均値を取る

`month` でグループ化してから `wind`, `temperature` の平均値を計算する


```r
airquality_mod %>% 
  group_by(month) %>% 
  summarise(avg_wind = mean(wind), avg_temperature = mean(temperature))
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## # A tibble: 5 x 3
##   month avg_wind avg_temperature
##   <int>    <dbl>           <dbl>
## 1     5    11.6             18.6
## 2     6    10.3             26.2
## 3     7     8.94            28.8
## 4     8     8.79            28.9
## 5     9    10.2             24.9
```

ここで、`month` によるグループ化が `summarise()` によって解除される旨の警告メッセージが表示される。
これはバージョン 1.0.0 での変更点である。

### グループ化されたデータを表示する

グループ化前


```r
airquality_mod
```

```
## # A tibble: 153 x 8
##    date        year month   day ozone solar_radiation  wind temperature
##    <date>     <dbl> <int> <int> <int>           <int> <dbl>       <dbl>
##  1 1973-05-01  1973     5     1    41             190   7.4        19.4
##  2 1973-05-02  1973     5     2    36             118   8          22.2
##  3 1973-05-03  1973     5     3    12             149  12.6        23.3
##  4 1973-05-04  1973     5     4    18             313  11.5        16.7
##  5 1973-05-05  1973     5     5    NA              NA  14.3        13.3
##  6 1973-05-06  1973     5     6    28              NA  14.9        18.9
##  7 1973-05-07  1973     5     7    23             299   8.6        18.3
##  8 1973-05-08  1973     5     8    19              99  13.8        15  
##  9 1973-05-09  1973     5     9     8              19  20.1        16.1
## 10 1973-05-10  1973     5    10    NA             194   8.6        20.6
## # … with 143 more rows
```
グループ化後


```r
airquality_mod %>% 
  group_by(month)
```

```
## # A tibble: 153 x 8
## # Groups:   month [5]
##    date        year month   day ozone solar_radiation  wind temperature
##    <date>     <dbl> <int> <int> <int>           <int> <dbl>       <dbl>
##  1 1973-05-01  1973     5     1    41             190   7.4        19.4
##  2 1973-05-02  1973     5     2    36             118   8          22.2
##  3 1973-05-03  1973     5     3    12             149  12.6        23.3
##  4 1973-05-04  1973     5     4    18             313  11.5        16.7
##  5 1973-05-05  1973     5     5    NA              NA  14.3        13.3
##  6 1973-05-06  1973     5     6    28              NA  14.9        18.9
##  7 1973-05-07  1973     5     7    23             299   8.6        18.3
##  8 1973-05-08  1973     5     8    19              99  13.8        15  
##  9 1973-05-09  1973     5     9     8              19  20.1        16.1
## 10 1973-05-10  1973     5    10    NA             194   8.6        20.6
## # … with 143 more rows
```
`gropu_by()` によってデータ本体は変わらず、グループ化されたことを表す情報表示 `# Groups:   month [5]` が出る。

### `groups()` でグループ化の状態を確認する

`groups()` 関数を使うとグループ化の状態が確認できる.

グループ化しないと⁄き


```r
airquality_mod %>% groups()
```

```
## list()
```

列 `month` でグループ化したとき


```r
airquality_mod %>% 
  group_by(month) %>%
  groups()
```

```
## [[1]]
## month
```

列 `year` と `month` でグループ化したとき


```r
airquality_mod %>% 
  group_by(year, month) %>%
  groups()
```

```
## [[1]]
## year
## 
## [[2]]
## month
```

### `summarise()` した後のグルーピングを確認する

ここで `summarise()` によるグループ化解除の挙動を実験する

#### (1) `month` でグループ化した後、 `summarise()` する


```r
airquality_mod %>% 
  group_by(month) %>% 
  summarise(avg_wind = mean(wind), avg_temperature = mean(temperature)) %>% 
  groups()
```

```
## `summarise()` ungrouping output (override with `.groups` argument)
```

```
## list()
```

メッセージの通り、**グループ化が解除されている.**

#### (2) `year`, `month` でグループ化した後、 `summarise()` する


```r
airquality_mod %>% 
  group_by(year, month) %>% 
  summarise(avg_wind = mean(wind), avg_temperature = mean(temperature)) %>% 
  groups()
```

```
## `summarise()` regrouping output by 'year' (override with `.groups` argument)
```

```
## [[1]]
## year
```

`month` によるグループ化が解除され、**`year` によるグループ化が残っている**

#### (3) `month`, `year` の順でグループ化した後、 `summarise()` する


```r
airquality_mod %>% 
  group_by(month, year) %>% 
  summarise(avg_wind = mean(wind), avg_temperature = mean(temperature)) %>% 
  groups()
```

```
## `summarise()` regrouping output by 'month' (override with `.groups` argument)
```

```
## [[1]]
## month
```

`year` によるグループ化が解除され、**`month` によるグループ化が残っている**

**解除されるグループはグループ化の順序によって変わる.**


