--- 
title: "jamovi完全攻略ガイド"
author: "芝田 征司"
date: "2021-06-10"
output: 
  pdf_document:
    extra_dependencies:["flafter"]
papersize: a5j
biblio-style: apalike
link-citations: null
colorlinks: yes
fontsize: 12pt
site: bookdown::bookdown_site
description: 本書は初めてjamoviを使用する人のためのガイドです。
github-repo: rstudio/bookdown
documentclass: bxjsbook
classoption: lualatex, ja=standard
cover-image: images/cover.jpg
---


# はじめに {-#preface}
\IntroChapter{はじめに}{Intro}




\jlogo{}は，高度な統計手法をできるだけ簡単に使用できるようにすることを目的として作成された統計ソフトウェアです。操作はマウス（トラックパッド）によるメニュー選択が基本で，複雑なコマンドを入力したりする必要はありません。jamoviと同じようにマウスで操作できる統計ソフトウェアとして非常に有名なものに[SPSS](https://www.ibm.com/jp-ja/analytics/spss-statistics-software)があり，大学を含め，さまざまな機関で統計処理や統計法の学習に使用されていますが，SPSSは非常に高価なソフトウェアであり，個人で気軽に購入できるようなものではないため，大学のコンピューター室でしか課題作業ができない（家で課題をできない）というような問題がありました。


しかし，近年ではオープンソース^[プログラムの中身が公開されていて，誰でも自由に使えるソフトウェアのことです。]の統計解析環境である[R](https://www.r-project.org)が専門家の間で広く使われるようになっています。オープンソースであるRは基本的に無料で使用できるため，誰もが自由に自分のPCにインストールして統計処理を行えるのです。ただし，Rはコマンドを入力して実行するという形式で分析を進めていくため，使いこなすにはコンピューター・プログラミングの基本的な知識が必要です。そのため，無料で使用できるとはいえ，入門者にはかなりハードルの高いものでした。

このような状況を打開するために作られたのがjamoviです^[同様のソフトに[JASP](https://jasp-stats.org/)もあります。見た目や使用方法はどちらも非常によく似ていますが，こちらは*ベイズ推定*に重点をおいたものになっています。]。jamoviはSPSS以上に単純な操作で使用できますが，内部ではRが動作しており，統計計算の正確さは専門家が使用するソフトウェアと同じです。また，jamoviもRと同様にオープンソース・ソフトウェアであり無料ですので，自分が所有するPCに自由にインストールして使用することができます。

このように，jamoviはとくに統計法の入門者にとって最適と言えるソフトウェアなのですが，現在のところソフトウェアが英語版のみであることや，とくに日本語で得られる情報が非常に少ないことが導入の妨げになっているようです。そこで本書では，jamoviの基本的な使用方法からjamoviの分析ツールとその設定オプションの使い方まで，簡単なサンプルデータを用いて実践的に解説を行いました。本書の構成はjamoviのメニューや設定項目に沿った形になっていますので，jamoviの入門書としてだけでなく，リファレンスマニュアルとしても使えるものになっているのではないかと思います。

なお，本書はjamoviのバージョン1.8.0.0を元に作成していますが，jamoviは開発が活発に進んでおり，バージョンがどんどん新しくなっていくため，本書の画面と実際の画面が異なっていることがあるかもしれません。その点はご了承ください。

本書はjamoviの解説書であって，統計法の教科書ではありません。その点は誤解のないようにお願いします。統計法の教科書や入門書ではありませんので，統計手法の詳細については説明していません。ただし，それぞれの分析を利用するにあたって知って必要と思われる最低限の考え方については，各分析手法の最初に説明するようにしています。

また，本書はすべて，Rの[bookdown](https://bookdown.org/)パッケージを用いて作成されています。本書のソースコードおよびサンプルデータは，[GitHub](https://github.com/sbtseiji/jmv_compguide.git)から入手可能です。


* Version 1.0.0 2021年6月10日公開

<br/>
<br/>
```{=html}
<div style="text-align: right"> 芝田 征司（SHIBATA Seiji） </div>
```
```{=latex}
\vspace{2\zh}
\hfill 芝田 征司（SHIBATA Seiji）
```
<br/>
<br/>

```{=html}
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />本書は <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">クリエイティブ・コモンズ 表示 - 非営利 - 継承 4.0 国際 ライセンス</a>の下に提供されています。
```

```{=latex}
\vfill
\begin{center}
\includegraphics[width=3cm]{images/CC-BY-NC-SA}
\end{center}
本書は，\href{http://creativecommons.org/licenses/by-nc-sa/4.0/}{クリエイティブ・コモンズ 表示 - 非営利 - 継承 4.0 国際 ライセンス}の下に提供されています。
```



<!--chapter:end:index.Rmd-->

# (PART) 導入編 {-#part-one}

<!--chapter:end:00-part1.Rmd-->



# Getting Started：jamoviの導入 {#ch:introduction}

この章ではまず，jamoviのインストール方法やソフトウェア全体の基本操作について見ていきます。jamoviはメニューやツールが非常によく整理されて作られていますので，他の統計ソフトに比べて操作に迷うことはだいぶ少ないはずです。

また，jamoviは心理学者が中心に開発していることもあって，心理学系の論文やレポートに適した設定が初めからなされています。そのため，普段の使用で設定を変更する必要はほとんどないかもしれませんが，念のため，一通りの設定項目についても見ておきましょう。


## Installation：jamoviのインストール {#sec:intro-install}

まずはソフトウェアのインストールからです。jamoviウェブサイトの[ダウンロードページ](https://www.jamovi.org/download.html)から，ソフトウェアをダウンロードしましょう。ダウンロードページには「1.x.xx solid」というダウンロードボタンと「1.x.xx current」というダウンロードボタンの2種類があります（図\@ref(fig:jamovi-download)）。

このうちの「solid 」のほうは「安定版」で，最新の機能は含まれていませんが，動作が安定しているバージョンです。もう一方の「current」は最新版で，最新の機能が取り入れられているのですが，やや動作が不安定かもしれません。どちらを選ぶか迷った場合は，ひとまず「solid（安定板）」を選んでおくとよいでしょう。

なお，本書ではバージョン1.8.0を元に説明します^[執筆時点での安定版は1.6.23ですが，1.8.0.0から重要な機能がいくつか追加されているためです。]。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/jamovi-download} 

}

\caption{jamoviのダウンロード画面（Mac版）}(\#fig:jamovi-download)
\end{figure}


#### Windowsでのインストール方法 {-#sub:intro-install-win}

Windowsを使用している人の場合，ダウンロードしたファイルをダブルクリックするとインストーラが実行されるので，あとはインストーラの指示に従っていけばインストールは完了です。

#### Macでのインストール方法 {-#sub:intro-install-mac}

Macを使用している人の場合，ダウンロードしたファイルをダブルクリックして開き，その中にある「jamovi」を「アプリケーション」フォルダにドラッグ・アンド・ドロップすればインストールは完了です。

#### LinuxまたはChromebookでのインストール方法 {-#sub:intro-install-other}

最近のバージョンでは，LinuxやChromebook^[Chromebookにインストールするには「Linux」サポートが有効になっている必要があります。]でもjamoviを利用できるようになりました。Linuxの場合にはディストリビューションごとに設定方法が少しずつ異なりますので，ここでは具体的なインストール方法は省略します。ウェブサイトに示された手順にしたがってインストールしてください。


## Starting Up：起動と終了{#sec:intro-launch-quit}

まずはソフトウェアの起動と終了の仕方を見ておきましょう。

### jamoviの起動 {#sub:intro-launch}

Windowsの場合，jamoviを起動するにはデスクトップに配置されている\infig{logo-v.pdf}アイコンをダブルクリックしてください。デスクトップにアイコンがない場合，「スタートメニュー」の「すべてのアプリ」から「jamovi」を選択すれば起動することができます。Macの場合は，「アプリケーション」フォルダまたはLaunchpadで\infig{logo-v.pdf}を選択して実行してください。

jamoviを起動すると図\@ref(fig:jamovi-screen)のような画面が現れます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/jamovi-overview} 

}

\caption{jamoviのアプリケーション画面}(\#fig:jamovi-screen)
\end{figure}

基本的な使い方については「[基本操作](#sec:basics)」で説明しますので，ここでは起動できるかどうかだけ確認しておきましょう。

### jamoviの終了 {#sub:intro-quit}

jamoviの終了方法は，開いているjamoviウィンドウをすべて閉じるだけです。作業中の内容がある場合には，忘れずに作業内容を保存しておいてください。ファイルの保存方法についてはこの後の「[ファイル操作](#sec:intro-file)」で説明します。

## Settings：環境設定{#sec:intro-option}

画面最上部，青色の帯の一番右端にある「**⋮**」をクリックすると，ウィンドウ右側にjamoviの画面表示や動作に関する設定項目が表示されます（図\@ref(fig:options-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/options-menu} 

}

\caption{環境設定メニュー}(\#fig:options-menu)
\end{figure}

実際の使用場面では環境設定を変更する必要はほとんどないと思いますが，どのような設定項目があるのかを一通りみておくことにしましょう（図\@ref(fig:options-window)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/options} 

}

\caption{環境設定項目}(\#fig:options-window)
\end{figure}

これらの項目のうち，数値と*p値*の書式については説明が必要かもしれません（図\@ref(fig:options-number-format)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/options-results} 

}

\caption{数値表示形式の設定}(\#fig:options-number-format)
\end{figure}

「Number format（数値書式）」と「p-value format（p値書式）」の表示形式は，「significant figures（有効桁数）」と「decimal places（小数位）」の２通りの方法で設定できます。「significant figures（有効桁数）」は，結果を表示させる際に整数部分を含めて最低何桁まで表示させるかを指定する方法で，有効桁数を３桁（`3 sf`）にすると，「1」は「1.00」，「1.3」は「1.30」，「12.3」は「12.3」というように，少なくとも３桁分の数値が表示されるようになります。なお，指定した有効桁数よりも整数部分の桁数が多い場合は，整数部分のみが表示され，小数点以下は表示されません。たとえば，有効桁数３桁（`3 sf`）で結果の値が「9999.999」であったような場合には，画面上では「9999」という表示になります。

これに対し，「decimal places（小数位）」は小数点以下を何桁目まで表示させるかという設定方法で，小数位を２桁（`2 dp`）にすると，「1」は「1.00」，「1.3」は「1.30」，「12.3」は「12.30」と表示されます。先ほどの有効桁数の場合とよく似ていますが，「12.3」の場合には表示方法が異なっている点に注意してください。小数位（`dp`）による指定では，整数部分が何桁あるかにかかわらず，小数点以下は指定した桁数だけ表示されるのです。またこの場合，指定した桁数よりも数値が短い場合には，その分を「0」で埋める形で表示されます。たとえば，小数位２桁（`2 dp`）の指定で結果の数値が「12」であった場合には，画面上には「12.00」と表示されます。

実験レポートの場合，小数点以下の数値の桁数がそろっていることが求められるため，「小数位２桁（`2 dp`）」あるいは「小数位３桁（`3 dp`）」の設定にしておくのがよいでしょう。なお，この設定はあくまでも結果の表示に関するものなので，ここを変更しても入力中のデータの表示は変わりません。


#### Syntax mode：シンタックスモード {-#syn}

環境設定項目の「Syntax mode」は，「シンタックスモード」と呼ばれる特殊モードのオン・オフです。jamoviは内部でRのスクリプト^[小規模なプログラムのことです。]を実行しており，このモードをオンにすると，分析のために使用したRスクリプトが結果画面に表示されます。将来的にjamoviからRへとステップアップしたい人にとって，このような機能はとても役立つことでしょう。




## Files：ファイル操作{#sec:intro-file}

### ファイルメニュー{#subsec:intro-file-menu}
jamoviでデータファイルを読み込んだり作業内容を保存したりする場合には，画面左上の「**≡**」を使用します（図\@ref(fig:file-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/file} 

}

\caption{ファイルメニュー}(\#fig:file-menu)
\end{figure}


#### New：新規{-#subsec:intro-file-new}

新規に別のファイルを作成したい場合は，ファイルメニューの「**New**」を使用します。「**New**」を実行すると，アプリの起動直後と同じ空白のファイルが作成されます。

#### Open：開く{-#subsec:intro-file-open}

「**Open**」メニューは，すでにあるjamoviファイルやデータファイルを開く際に使用します（図\@ref(fig:file-open)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/file-open} 

}

\caption{Open（開く）メニュー}(\#fig:file-open)
\end{figure}

「**Open**」を選択すると，さらに「**This PC**」と「**Data Library**」の２つのメニューが表示されます。「**This PC**」はそのコンピューター上のファイル，「**Data Library**」はデータライブラリのファイルを開くことを意味しています。ExplorerやFinderなど，OS標準のファイルブラウザ（ファイルマネージャ）でファイルを選択して開きたい場合には，「**This PC**」が選択されていることを確認してから「\infig{place-browse.pdf} Browse」をクリックしてください。

jamoviで開くことのできるデータファイルは，次の通りです。

:::{.jmvblue data-latex=""}
+ jamoviファイル（拡張子「.omv」）
+ コンマ区切りテキストファイル（.csv，.txt）
+ LibreOffice（Microsoft Officeの互換ソフト）形式ファイル（.ods）
+ Excelファイル（.xlsx）
+ SPSS（市販統計ソフト）ファイル（.sav，.zsav，.por）
+ R（オープンソースの統計ソフト）ファイル（.RData，.RDS）
+ Stata（市販統計ソフト）ファイル（.dta）
+ SAS（市販統計ソフト）ファイル（.xpt，.sas7bdat）
+ JASP（オープンソースの統計ソフト）ファイル（.jasp）
:::

また，これらのデータ形式に加え，jamoviのテンプレートファイル（分析手順が保存されたファイル「.omt」）を開くこともできます。


#### Import：読み込み{-#sec:intro-file-import}

「**Import**」のメニューは，いま作業中のファイルに別のデータファイルの内容を追加する場合に使用します。「**Open**」とよく似ているのですが，「**Import**」の場合には現在開いているデータファイルの内容が読み込んだファイルの内容に更新される点が異なります。なお，開いているデータファイルと「Import」したファイルで変数名が異なる場合には，それらは新たな*変数*としてデータファイルに追加されます。


#### Save, Save As：保存，別名で保存{-#sec:intro-file-save}

入力したデータや分析結果をjamoviファイルとして保存するには「**Save**」または「**Save As**」を使用します。保存場所を指定するには「\infig{place-browse.pdf} Browse」をクリックしてください。なお，jamoviファイルの拡張子は「.omv」です。

#### Export：書き出し{-#sec:intro-file-export}

作業中のデータや分析結果をワープロソフトや別の統計ソフトなどで使用したい場合に使用します。書き出し可能なデータ形式は以下の通りです。


:::{.jmvblue data-latex=""}
+ 別の統計ソフト用にデータを書き出す
  - コンマ区切りテキストファイル（.csv） 
  - Rオブジェクト（.rds，RData）
  - SPSSファイル（.sav）
  - SASファイル（.sas7bdat，.xpt）
  - Stataファイル（.dta）
+ 分析結果をワープロなどで利用できるように書き出す
  - PDFファイル（.pdf）
  - Webページ（.html，.htm）
  - LaTeXバンドル^[LaTeXはオープンソースの組版システムです。]（.zip）
+ 分析手順をテンプレートとして書き出す
  - jamoviテンプレート（.omt）　
:::

## Exercise：実践 ファイルを開く{#sec:intro-exercise1}

#### jamoviデータファイルの場合 {-#jamovidatafilenobaai}

それでは，ファイルを開く練習をしましょう。まず，次の練習用データファイルをダウンロードしてください。

+ 練習用データファイル1（[intro_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/intro_data01.omv)）


このファイルはjamoviのデータファイルなので，通常はこのファイルをダブルクリックすればjamoviで開くことができるのですが，ここではファイルメニューを使ってこのファイルを開いてみます。

##### 手順1 {-#iti}
「≡」をクリックしてファイルメニューを開きます。


##### 手順2 {-#ni}
「Open」で「This PC」が選択されていることを確認します。

##### 手順3 {-#san}

「\infig{place-browse.pdf} Browse」をクリックします（図\@ref(fig:file-exercise)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/exercise} 

}

\caption{ファイルを開く手順}(\#fig:file-exercise)
\end{figure}

##### 手順4 {-#yon}

目的のデータファイルを選択します。


図\@ref(fig:file-exercise-done)のような画面が表示されたら完了です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/exercise-done} 

}

\caption{データファイルを開いた様子}(\#fig:file-exercise-done)
\end{figure}



#### テキストファイル・Excelファイルの場合 {-#exceldatafilenobaai}

テキストファイル（`.csv`）やExcelファイル（`.xlsx`）として保存されているデータファイルの開き方も手順は同じです。次の２つのデータファイルをダウンロードしてください。

+ 練習用データファイル2（[intro_data01.csv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/csv/intro_data01.csv)）

+ 練習用データファイル3（[intro_data01.xlsx](https://github.com/sbtseiji/jmv_compguide/raw/main/data/xlsx/intro_data01.xlsx)）

この２つのデータファイルをそれぞれjamoviで開いてみましょう。テキストファイル（`.csv`）とExcelファイル（`.xlsx`）のどちらから先に開いても構いません。どちらの場合も，先ほどと同じ画面になるはずです。

なお，テキストファイルやExcelファイルを使用する場合，データファイルの1行目は変数名とみなされます。実際のデータは2行目以降に入力されている必要がありますので注意してください。また，テキストファイルでは，各データ値の区切りには半角のコンマ（`,`）を使用します（図\@ref(fig:file-exercise-example)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/intro/exercise-example} 

}

\caption{データファイルの入力例}(\#fig:file-exercise-example)
\end{figure}


<!--chapter:end:01-getting-started.Rmd-->



# Data：データ操作 {#ch:basics}

本章では，jamoviでのデータ操作の方法について見ていきます。jamoviでのデータの操作はExcelなどの表計算ソフトによく似ていますので，それらに慣れた人であればjamoviでの操作にもすぐ慣れるはずです。また，jamoviではかなり幅広い種類のファイルをデータとして読み込むことができますので，大量のデータを入力する際には，慣れたソフトで入力したものをjamoviで開いて分析するという使い方もできるでしょう。

また，複数の質問への回答を合計あるいは平均して得点を算出するということはExcelのような表計算ソフトでも可能ですが，データに修正が生じた場合などのことを考えると，それらをjamoviでできるようになっておくのがよいでしょう。

この章では，jamoviにおけるそうしたデータ操作の基本について見ていきます。

## Application Window：画面構成 {#sec:components}

jamoviの画面は，以下の要素で構成されています。

:::{.jmvblue data-latex=""}
+ **タブ**　使用するツールボタンを切り替える際に使用します
+ **ツールボタン（リボン）**　jamoviのさまざまな機能にアクセスするためのボタン群です
+ **スプレッドシート**　データの入力や編集を行う部分です
+ **出力ウィンドウ**　ここに分析結果が表示されます
:::


### タブ{#subsec:tabs}

jamoviには，「Data（データ）」，「Analyses（分析）」，「Edit（編集）」の3つのタブが用意されています。Dataタブにはデータの入力や編集の際に，Analysesタブにはデータの分析の際に使用するツールボタンが集められています。Editタブは，分析結果にメモを書き込んだりする場合に使用します。

それぞれのタブにどのような項目が用意されているのかを見てみましょう。

#### Data：データタブ {-#subsubsec:data-tab}  
Dataタブにはデータの入力や編集に使用するツールボタンが並んでいます（図\@ref(fig:data-overview)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-overview} 

}

\caption{データタブのツールボタン}(\#fig:data-overview)
\end{figure}

:::{.jmvribbon data-latex=""}
+ **Clipboard**（クリップボード）　データのコピー（\infig{menu-data-copy.pdf}）や貼り付け（\infig{menu-data-paste.pdf}），切り取り（\infig{menu-data-cut.pdf}）などに使用します。使い方はWordやExcelなどと基本的に同じです。
+ **Edit**（編集）　操作の取り消し（\infig{menu-undo.pdf}），やり直し（\infig{menu-redo.pdf}）を行います。
+ **Variables**（変数）　変数の設定や変数値の処理に使用するツール群です。
    - \infig{menu-variable-edit.pdf} Setup（設定）　データの種類や変数名の設定を行います。
    - \infig{menu-compute.pdf} Compute（計算）　すでにある変数値から新たな変数を作成します
    - \infig{menu-data-transform.pdf} Transform（変換）　すでにある変数値に変換を適用して新たな変数を作成します。
    - \infig{menu-variable-add.pdf} Add（追加）　スプレッドシートの選択位置に変数（列）を挿入（\infig{menu-variable-insert.pdf} Insert）または列の最後に追加（\infig{menu-variable-append.pdf} Append）します。
    - \infig{menu-variable-remove.pdf} Delete（削除）　スプレッドシート上で選択した変数（列）を削除します。
+ **Rows**（データ行）　データ行の追加や削除に使用するツール群です。
    - \infig{menu-data-filter.pdf} Filters（フィルタ）　特定の条件に適合する行のみ表示させたい場合（男性のみ，女性のみ，など）に使用します。
    - \infig{menu-row-add.pdf} Add（追加）　選択部分にデータ行を挿入（\infig{menu-row-insert.pdf}）または最後の行にデータ行を追加（\infig{menu-row-append.pdf}）します。
    - \infig{menu-row-remove.pdf} Delete（削除）　選択行を削除します。
:::

変数操作に関するボタン群，データ行の編集に関するボタン群の詳しい使い方については「[データ変数](#sec:data-handling)」の操作のところで説明します。

#### Analyses：分析タブ {-#subsubsec:analyses-tab}  
Analysesタブには，統計分析のためのツールボタンが並んでいます（図\@ref(fig:analyses-tab)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/analyses-tab} 

}

\caption{Analyses（分析）タブのツールボタン}(\#fig:analyses-tab)
\end{figure}

:::{.jmvribbon data-latex=""}
+ \infig{analysis-descriptives.pdf} Exploration（探索）　平均値などの基本統計量の算出やグラフの作成に使用します（第\@ref(ch:exploration)章）
+ \infig{analysis-ttest.pdf} T-Tests（t検定）　1つあるいは2つの平均値の差の検定を行います（第\@ref(ch:ttests)章）
+ \infig{analysis-anova.pdf} ANOVA（分散分析）　3つ以上の平均値の差の検定を行います（第\@ref(ch:ANOVA)章）
+ \infig{analysis-regression.pdf} Regression（回帰分析）　回帰分析と呼ばれる手法を用いて変数間の関係を分析します（第\@ref(ch:regression)章）
+ \infig{analysis-frequencies.pdf} Frequencies（度数分析）　$\chi^{2}$（カイ二乗）検定など，度数・比率の検定を行います（第\@ref(ch:frequencies)章）
+ \infig{analysis-factor.pdf} Factor（因子分析）　因子分析を実施します（第\@ref(ch:factor)章）
:::

このように，分析タブのツールは分析手法ごとに非常にわかりやすく整理されています。また，これらの基本メニューに加え，画面の一番右には「\infig{analysis-more.pdf}Modules（モジュール）」というツールもあります。これはjamoviにさらに高度な機能を追加したい場合に使用します^[jamovi 1.8以降のバージョンでは，さまざまな散布図を作成するための`scatr`というモジュールが標準でインストールされており，このモジュールをオンにするとExplorationツールに「Scatterplot(散布図)」と「Pareto Chart（パレート図）」いうメニュー項目が追加されます。これらの項目については，本書では省略します。]。

これら分析ツールの使用方法については，「分析編」で詳しく説明します。

#### Edit：編集タブ {-#subsubsec:edit-tab}  
Editタブには，フォントや段落の設定など，編集に関連したツールボタンが並んでいます（図\@ref(fig:edit-tab)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/edit-tab} 

}

\caption{Edit（編集）タブのツールボタン}(\#fig:edit-tab)
\end{figure}

:::{.jmvribbon data-latex=""}
+ Clipboard（クリップボード）　Dataタブのボタンと同じです。
+ Edit（編集）　**Data**タブのボタンと同じです。
+ Font（書体）　文字を太字にしたり，斜体にしたりする際に使用します。
+ Paragraph（段落）　文字全体を中央揃えにしたり，箇条書きにしたりなど，段落の書式を変更する際に使用します。
+ Insert（挿入）　メモに数式を含めたい場合に使用します。数式はTeX形式で記述します^[厳密には[KaTeX](https://katex.org/docs/supported.html)というシステムの書式を使用しています。]。 
+ Styles（スタイル）　その他の文書スタイルを設定するためのツールボタン群です。
  - \infig{edit-code.pdf} Code-Block（コードブロック）　メモ中に分析プログラムを記載したい場合に使用します。
  - \infig{edit-heading.pdf} Heading（見出し）　指定した部分を「見出し」行にしたい場合に使用します。
  - \infig{edit-link.pdf} Link（リンク）　メモにリンクを挿入したい際に使用します。
:::

これらのボタンは，いずれも出力ウィンドウの内容を編集してメモを作成する際に用いられるものです。

## Data Variable：データ変数 {#sec:data-handling}

jamoviが扱う*変数*には，「*Data Variable*（データ変数）」，「*Computed Variable*（計算変数）」，「*Transformed Variable*（変換変数）」の３種類があります。このうち，もっとも基本的で重要なものがテータ変数です。ここではまず，データ変数を用いてjamoviにおけるデータの操作方法を見ていきましょう。

データ変数は，調査や実験で得られた測定値（データ値）を格納するための変数で，jamoviにおける分析の基本となるものです。データファイルから読み込んだ値は，すべてデータ変数として扱われます。また，データ変数の値はスプレッドシートに直接入力することもできます。

データファイルからデータを読み込む方法についてはすでに第\@ref(ch:introduction)章の「[ファイル操作](#sec:intro-file)」で説明しましたので，ここではスプレッドシートを用いたデータの編集方法について見ておきましょう。


### スプレッドシートでの入力{#sub:basics2-spreadsheet}

スプレッドシートでの入力は，Excelの操作によく似ています。入力したいセル（マス目）をマウスクリックし，キーボードから値を入力するだけです。入力後，「Enter」キーまたは「↓」キーを押すと次の値が入力できるようになります。

基本的に，統計処理をするデータは各行が1人分（あるいは1試行分）の測定値で，各列はさまざまな変数（参加者番号や年齢，性別など）となります。なお，jamoviを起動した直後の画面にはＡ，Ｂ，Ｃの3つの変数しかありませんが，4列目以降にも値を入力することができます。空白の列に値を入力すると，その列は新たなデータ変数として扱われます。

では，実際にスプレッドシートにデータを入力してみましょう。ここでは表\@ref(tab:basics-datavariable-sampledata)のデータを用いることにします。

\begin{table}

\caption{(\#tab:basics-datavariable-sampledata)サンプルデータ}
\centering
\begin{tabular}[t]{ccccc}
\toprule
ID & 性別 & 年齢 & 身長 & 体重\\
\midrule
1 & 男 & 18 & 175 & 70\\
2 & 女 & 19 & 158 & 45\\
3 & 男 & 19 & 172 & 62\\
\bottomrule
\end{tabular}
\end{table}


スプレッドシートの1列目（Aの列）にIDの値，2列目に性別の値を入力してください。なお，性別については「男」を「1」，「女」を「2」として入力してください。また，3列目から5列目には「年齢」，「身長」，「体重」の値をそれぞれ入力しましょう。変数名は後で設定しますので，ここでは数値を入力するだけです。

入力が終わった状態では，画面は図\@ref(fig:data-sample-data)のようになっているはずです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-sample-data} 

}

\caption{データ変数の入力例}(\#fig:data-sample-data)
\end{figure}

このように，jamoviではExcelなどの表計算ソフトを操作する感覚で簡単にデータ入力を行うことができます。

### 行・列の編集{#sub:basics-data-variable-row-edit}

今度は，入力済みデータを行・列の単位で編集する方法についてみてみましょう。jamoviでは，データの行と列はそれぞれ異なった意味をもちますので，追加・削除のメニューは行と列のそれぞれに別々に用意されています（図\@ref(fig:edit-row-col)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/edit-row-col} 

}

\caption{行・列の編集}(\#fig:edit-row-col)
\end{figure}

#### 行の編集 {-}

基本的に，jamoviではスプレッドシートの行は「参加者1人分のデータ」を意味します。つまり，スプレッドシートに25行のデータが入力されていれば，それは参加者25人分のデータがあるということです。

すでに入力されているデータに新たな参加者のデータを追加する場合は単純で，データがまだ入力されていない行にデータを入力するだけです。そうでなく，途中にデータを追加したい場合には，データを挿入したい部分を選択してDataタブの「Rows」にある「Add」から「Insert（挿入）」を選択します（図\@ref(fig:add-row)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/add-row} 

}

\caption{行の追加}(\#fig:add-row)
\end{figure}

なおこの際，「Insert」の代わりに「Append（追加）」を実行すると，データの最後に新しい行が追加されます。

また，不要な行がある場合には，その行を選択し，Dataタブの「Rows」にある「Delete（削除）」を実行します（図\@ref(fig:edit-row-delete)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/edit-row-delete} 

}

\caption{行の削除}(\#fig:edit-row-delete)
\end{figure}


なお，これらの操作は，右クリックで表示されるメニューからも行うことができます（図\@ref(fig:add-row-submenu)）。

<!-- ボタンの画面 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/add-row-submenu} 

}

\caption{行の追加}(\#fig:add-row-submenu)
\end{figure}



#### 列の編集 {-}

jamoviスプレッドシートの列は，*変数*（回答者番号や年齢，性別，回答値，測定値など）として扱われます。列の編集方法も基本的には行の編集方法と同じで，列（変数）を追加・削除したい箇所を選択してから，Dataタブの「Variables」にある「Add（追加）」または「Delete（削除）」を実行するだけです。

ただし，jamoviが扱う変数には「Data Variable（データ変数）」，「Computed Variable（計算変数）」，「Transformed Variable（変換変数）」の3種類がありますので，変数を追加する際にはどの種類の変数を追加するのかを指定しなければなりません（図\@ref(fig:edit-col-add)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/edit-col-add} 

}

\caption{列（変数）の追加}(\#fig:edit-col-add)
\end{figure}

なお，jamoviの現在のバージョンでは，変数の順序を並び替えることができません。変数を追加する場合には，追加する場所をよく考えてからにしましょう。

#### データ変数の設定{-#subsubsec:data-data-setup}

空白のスプレッドシートにデータを入力した場合，そのままでは変数名が「A」，「B」，「C」などになっていて，どの列が何のデータなのかがわかりにくいですね。そこで，先ほど入力したデータを用い，基本的な変数設定の方法を見ておきましょう。

「A」列の変数名の部分（「A」の部分）をダブルクリックするか，または「A」列を選択してからツールバーの「\infig{menu-variable-edit.pdf} Setup（設定）」ボタンをクリックしてください（図\@ref(fig:data-variable-open)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-variable-open} 

}

\caption{データ変数の設定画面を開く}(\#fig:data-variable-open)
\end{figure}

すると，データ変数の設定画面が表示されますので（図\@ref(fig:data-variable)），この画面の「DATA VARIABLE（データ変数）」の欄に変数名を入力します。データの1列目には「ID」が入力されているので，変数名は「ID」としておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-variable} 

}

\caption{データ変数の設定画面}(\#fig:data-variable)
\end{figure}

変数名には日本語を使用することも可能です。ただし，グラフなどの一部の機能で日本語がうまく表示されないことがありますので，そうしたトラブルを避けたければ，変数名はアルファベットと数字の組み合わせにしておいた方がいいでしょう。本書では，わかりやすさを重視して変数名に日本を用いることにします。


その下の「Description（説明）」の欄は，変数の説明を記入する部分です。この欄は分析には影響しませんので，ここは空欄でも構いません。

1列目の変数名の設定が終わったら，画面右横の「\infig{modules-analyses-arrow-r.pdf}（次へ）」をクリックして2列目以降の変数名も設定しましょう。2列目の変数名は「性別」，3列目以降はそれぞれ「年齢」，「身長」，「体重」としておきます。

##### Measure type（尺度型）{-}

設定画面の「Measure type（尺度型）」は，変数の尺度型の設定です。データ変数には，測定値の尺度水準に応じて次の４つの尺度型があります（図\@ref(fig:data-variable-measure-type)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-variable-measure-type} 

}

\caption{データ変数の尺度型}(\#fig:data-variable-measure-type)
\end{figure}

:::{.jmvsettings data-latex=""}
+ \infig{variable-nominal.pdf} Nominal（名義）型　*名義尺度*で測定されたデータです。
+ \infig{variable-ordinal.pdf} Ordinal（順序）型　*順序尺度*で測定されたデータです。
+ \infig{variable-continuous.pdf} Continuous（連続）型　*比率尺度*や*間隔尺度*で測定されたデータです。
+ \infig{variable-id.pdf} ID型　参加者番号など，それぞれのデータを識別するために用いる特殊なデータ型です。
:::

データ変数の尺度型によって使用可能な分析手法が変わってきますので，変数の尺度型は適切に設定しましょう。なお，それぞれの変数がどの尺度型として扱われているのかについては，スプレッドシートの変数名の横にあるアイコンで確認することもできます。

データ1列目の`ID`変数は個人を特定するための番号ですので，尺度タイプは「\infig{variable-continuous.pdf} ID」型にしておきましょう。2列目の「性別」変数は「\infig{variable-nominal.pdf} Nominal」型，「年齢」から「体重」まではすべて「\infig{variable-continuous.pdf} Continuous」型です。

##### Data type：データ型{-}

データ変数には，さらに「Integer（整数）」，「Decimal（小数）」，「Text（文字）」というデータ型の区別もあります。

「Integer」型は，「1」や「15」など，測定値に小数点以下の値が含まれない場合，「Decimal」型は，「1.5」や「7.49」など，測定値に小数点以下の値が含まれる場合です。この2つのデータ型は画面上の表示方法がやや異なるくらいで本質的な違いはありませんが，「Decimal」型は尺度型が「Continuous（連続）」の場合にしか指定できません。「Text」型は，入力されたデータ値を「数値」としてではなく「文字」として扱います。「Text」型を指定できるのは，「\infig{variable-nominal.pdf} Nominal」型または「\infig{variable-ordinal.pdf} Ordinal」型の場合のみです。

ほとんどの場合，データ型についてはjamoviが自動的に判定してくれますので，設定の必要はないでしょう。何からの理由でデータ型を指定したい場合，データ変数の測定型と指定できるデータ型の関係は表\@ref(tab:measure-data-type)の通りです。

\begin{table}

\caption{(\#tab:unnamed-chunk-4)データ変数の測定型とデータ型 \label{tab:measure-data-type}}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & Decimal（小数型） & Integer（整数型） & Text（文字型）\\
\midrule
Nominal（名義型） & × & ○ & ○\\
Ordinal（順序型） & ○ & ○ & ○\\
Continuous（連続型） & ○ & ○ & ×\\
\bottomrule
\end{tabular}
\end{table}


##### Missing values：欠損値{-#Missinmissin}

「Missing values（欠損値）」の欄では，データ中の欠損値の指定を行います。たとえば，1〜5の５段階尺度で得られたデータで未回答の部分を「9」として入力したようなデータの場合には，ここで「9」を欠損値として指定することができます。

今回のサンプルデータには欠損値はありませんので，ここは空欄のままにしておいてください。

#### Levels：水準{-#levelslvels}

「Levels（水準）」は，その変数が「\infig{variable-ordinal.pdf} Ordinal」型あるいは「\infig{variable-nominal.pdf} Nominal」型の場合に使用できます。たとえば「S・A・B・C・D」の5段階で入力された成績評価データがあったとします。そしてそのデータでは，1人目が「D」，2人目が「A」，3人目が「S」，4人目が「C」というようなものだったとしましょう。この場合，そのままではこの変数値が「D・A・S・C・B」という順で扱われたり，あるいはアルファベット順に「A・B・C・D・S」という順に扱われたりしてしまいます。なぜなら，統計ソフトには成績の良いほうから「S・A・B・C・D」の順であるという知識はないからです。

このような場合には，この「Levels」の右横にある上下矢印で変数値を適切な順番に並べ替えることで，分析においても「S・A・B・C・D」という順が維持されるようになります（図\@ref(fig:data-variable-levels-order)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-variable-levels-order} 

}

\caption{データ順序の設定}(\#fig:data-variable-levels-order)
\end{figure}


また，今回のサンプルデータのように，「性別」の値で男性が「1」，女性が「2」と入力されている場合，分析結果の出力画面には性別の値は入力値のまま「1」や「2」と表示されるのですが，「1」や「2」という表示ではどちらが男性でどちらが女性なのかがわかりづらいですね。もし，男女をとり違えて結果を解釈してしまったら大変です。

そのような場合，この「Levels」の「1」の欄に「男」，「2」の欄に「女」と入力し，それぞれの値に*変数ラベル*をつけることができます。そうすると，データ画面上や結果の表示では性別データの「1」が「男」，「2」が「女」と表示されるようになり，男女のとり違えといったミスを防ぐことができるのです（図\@ref(fig:data-variable-levels)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-variable-levels} 

}

\caption{変数ラベルの設定}(\#fig:data-variable-levels)
\end{figure}

このようにして変数ラベル設定した場合，本来の変数値は「Levels」欄の右下で確認できます。

なお，その下にある「Retain unused levels（未使用の水準を保持）」のスイッチを「オン」にした場合，データの修正などによって特定の水準値を含む行の数が0になった場合にもその水準値が保持されます。ここを「オフ」にした場合には，データ中に含まれていない水準値は「Levels」から削除されます。

```{=latex}
\clearpage
```

さて，これでサンプルデータの入力と設定は完了です。変数の設定画面を閉じるとスプレッドシートは図\@ref(fig:data-sample-data-complete)のようになっているはずです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-sample-data-complete} 

}

\caption{データの入力と設定が終わった後の画面}(\#fig:data-sample-data-complete)
\end{figure}


## Computed Variable：計算変数{#sec:basics-computed-variable}

実際のデータ分析では，複数の質問項目の回答値から参加者ごとに合計得点を算出したり，平均値を算出したりして，それをデータとして使用する場合が多々あります。このように，他の変数値を用いた計算の結果を新たな変数値として使用するのが「Computed Variable（計算変数）」です。

### 計算変数の作成 {#sub:basics-computed-variable-new}

先ほど作成したデータを使って計算変数の作成方法について見てみましょう。ここでは，身長と体重のデータから，一人一人のBMI値（体格指数）を算出することにします。


計算変数を使用するには，スプレッドシートで列名が空欄になっている部分をダブルクリックするか，その列を選択してツールバーの「\infig{menu-variable-edit.pdf} Setup（設定）」ボタンをクリックします。すると，図\@ref(fig:data-new-variable)のような変数作成画面が表示されますので，ここで「NEW COMPUTED VARIABLE（新規計算変数）」のボタンをクリックします。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-new-variable} 

}

\caption{新規に変数を作成する}(\#fig:data-new-variable)
\end{figure}

あるいは，ツールバーの「\infig{menu-compute.pdf} Compute（計算）」ボタンをクリックすると，新しい列に計算変数が作成されて変数設定画面になります。

計算変数の設定画面は図\@ref(fig:data-computed-variable)のようになっています。変数名と説明の部分はデータ変数の場合と同じです。この計算変数の変数名は「BMI」としておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-computed-variable} 

}

\caption{計算変数の設定画面}(\#fig:data-computed-variable)
\end{figure}


その下の部分はデータ変数の場合とはだいぶ違いますね。計算変数は，この設定画面の中央，数式ボックスの「=」の後ろに計算式を入力して値を設定します。

### 計算変数の設定 {#sub:basics-computed-variable-setting}

では，早速BMI値を計算変数として設定しましょう。数式ボックスに計算式を入力します。BMIの値は，次のようにして求められます。

\[
\text{BMI} = \text{体重(kg)} \div (\text{身長(m)})^2
\]

これを入力式の形に直すと「= 体重 / (身長/100)^2」になります。BMIの式では身長はメートルで計算する必要がありますので，センチメートルで記録されている身長データを100で割ってメートルに変換するのを忘れないようにしてください。数式ボックスの「=」の後ろの部分をクリックし，この式を入力します。

このとき，変数名の入力ミスなどがあるとエラーになってしまいますので注意してください。変数名の入力ミスを防ぐには，数式ボックスのすぐ左隣にある「関数ボタン（\infig{filters-formula.pdf}）」を使うのがよいでしょう。この部分をクリックすると，「Functions（関数）」と「Variables（変数）」という画面が表示されます（図\@ref(fig:data-computed-variable-function)）。左側の「Functions」の部分は，平均値などの計算用の関数のリストで，それぞれの関数名をクリックするとその関数簡単な説明が下側に表示されるようになっています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-computed-variable-function} 

}

\caption{計算変数の作成結果}(\#fig:data-computed-variable-function)
\end{figure}

ここでは関数は使用しませんが，「Functions」の関数は，複数の質問項目の回答値を平均して合成得点を求めたりする場合に役立ちます。なお，計算変数に使用できる関数は，以下のグループに分類されています。これらの関数の詳細については[付録](#ch:appendix)にまとめてありますのでそちらを参照してください。

:::{.jmvfunctions data-latex=""}
+ **Math**（数学関数）　絶対値（ABS），指数（EXP），対数（LN）など，数学的な計算を行う関数群です。
+ **Statistical**（統計関数）　合計値（SUM），平均値（MEAN）など，基本的な統計量を算出する関数群です。
+ **Logical**（論理関数）　条件に応じて異なる計算を行いたい場合に使用する関数群です。
+ **Text**（文字関数）　文字データを結合したり，数値を文字に変換したりする場合に使用する関数群です。
+ **Reference**（参照関数）　特定の条件に合致するセルを指定して計算を行いたい場合などに使用します。
+ **Misc**（その他）　数値と文字の変換など，その他の処理を行うための関数群です。
+ **Simulation**（シミュレーション）　特定の確率分布をもつデータを擬似的に作成したい場合に使用します。
:::

この画面で，「Variables」にある「体重」をダブルクリックすると，その変数名が数式ボックスに入力されます（図\@ref(fig:data-sample-data-computed)）。こうした機能を使いながら，計算変数の数式を完成させましょう。式を入力し終わったら，キーボードの「エンター（リターン）」キーを押して式を確定させます。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-sample-data-computed} 

}

\caption{関数と変数のリスト}(\#fig:data-sample-data-computed)
\end{figure}

すると，スプレッドシートの「体重」の横に「BMI」という変数が作成され，そこに各個人のBMI値が入力されます。なお，この計算変数に格納されているのは式だけですので，計算変数の作成後に計算に使われている変数（「体重」と「身長」）の値が変更されると自動的に再計算されて新しい値に更新されます。計算変数は，スプレッドシートでは変数名の欄の右上に黒丸がついた状態で表示されます。

計算変数の計算式を修正したい場合には，計算変数のタイトル部分をダブルクリックするか，修正したい計算変数の列を選択したうえで「\infig{menu-variable-edit.pdf} Setup」ボタンをクリックしてください。


## Transformed Variable：変換変数{#subsec:tranformed-variable}

質問紙調査のデータで*逆転項目*が複数ある場合，その回答値の逆転処理は計算変数でも可能ですが，逆転項目がたくさんある場合，その1つ1つに対して計算式を入力して計算変数を作成するのは面倒ですし，途中でミスが発生する可能性も増大します。

このように，複数の変数に対して同じ処理を繰り返し実施したい場合には，「Transformed Variable（変換変数）」が便利です。変換変数は，空の列の列名をダブルクリックして変数作成画面を開き，そこで「NEW TRANSFORMED VARIABLE（新規変換変数）」を選択するか，ツールバーの「\infig{menu-data-transform.pdf} Transfrom（変換）」ボタンをクリックすることで作成できます。

サンプルデータでは変換変数を使う必要性はとくにありませんが，せっかくなので使ってみましょう。ここでは，身長の測定値をセンチメートルからメートルに変換する処理を，変換変数を使って行ってみます。

スプレッドシートで「身長」の列を選択したら，ツールバーの「\infig{menu-data-transform.pdf} Transfrom」をクリックして変換変数を1つ作成してください。「身長」を選択してから「\infig{menu-data-transform.pdf} Transfrom」をクリックすると，変数名などが自動で入力された状態で設定画面が開きます（図\@ref(fig:data-transformed-setting)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-transformed-setting} 

}

\caption{変換関数の設定画面}(\#fig:data-transformed-setting)
\end{figure}

変数名は，これがメートル単位の身長だということがわかりやすいように「身長 (m)」としておきましょう。その下の「Source variable」の部分は，変換を適用する変数を指定します（図\@ref(fig:data-transformed-source-select)）。「身長」の列を選択してから変換変数を作成した場合，ここは自動的にその変数が選択された状態になります。もし変換対象とは異なる変数が指定されている場合には，適切な変数を選択してください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-transformed-source-select} 

}

\caption{変換対象の選択}(\#fig:data-transformed-source-select)
\end{figure}

変換対象を適切に設定したら，その下の「using transform」の部分で適用する変換を指定します。今はまだ適用できる変換がありませんので，「Create New Transform...（変換の新規作成）」を選択して変換を作成しましょう（図\@ref(fig:data-transformed-transform-select)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-transformed-transform-select} 

}

\caption{変換の指定}(\#fig:data-transformed-transform-select)
\end{figure}

すると，図\@ref(fig:data-transformed-transform)のような設定画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-transformed-transform} 

}

\caption{変換の設定画面}(\#fig:data-transformed-transform)
\end{figure}

最初の部分はこの変換の名前です。再利用する際に便利なように，できるだけわかりやすい名前をつけておきましょう。今回の変換はセンチメートルからメートルへの変換ですので，「cm -&gt; m」という名前にしておきます。

その下の「Description」の部分は変換の説明です。変換名からどのようなことをしているのかがわかるようであればここは空欄で構いませんが，そうでない場合はここに簡単に説明を書いておいたほうがよいでしょう。

この「Description」の隣の「Variable suffix」は，この変換を適用した後の変数名の末尾に自動的につける文字を設定します。ここでは空欄にしておきますが，たとえば逆転項目の逆転処理を行うような変換の場合には，ここに「R」と設定しておけば，「Q1 - R」，「Q2 - R」のように，変換後の変数名として元の変数名（「Q1」や「Q2」など）の末尾に「 - R」をつけた名前が自動的に設定されるようになります。

関数ボタンと数式ボックスの使用方法は計算変数の場合と同じです。必要に応じて関数ボタンで変数名や関数を選択し，数式ボックスの中に変換式を記入します。今回の変換ではセンチメートルで記録された身長のデータをメートルに変換するので，数式ボックス内の式は「\$source / 100」となります（図\@ref(fig:data-transformed-transform-complete)）。なお，「\$source」は変換元の値を意味します。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-transformed-transform-complete} 

}

\caption{変換式の作成}(\#fig:data-transformed-transform-complete)
\end{figure}


ここでは使用しませんが，変換ボックスのすぐ上にある「Add recode condition（変換条件の追加）」を用いれば，元の値の範囲に応じて異なる変換式を適用するようなこともできます。

変換式が完成したら，「エンター（リターン）」キーで式を確定し，設定画面を閉じてください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-transformed-transform-recoded} 

}

\caption{変換の設定が完了した様子}(\#fig:data-transformed-transform-recoded)
\end{figure}

すると，「using transform」の部分が先ほど作成した「cm -&gt; m」になっているはずです（図\@ref(fig:data-transformed-transform-recoded)）。この変換変数も，計算変数の場合と同様に，変換元の変数値が変化すると自動的に値が更新されます。また，この変換式は，その右横にある「Edit...（編集）」ボタンをクリックすることで修正可能です。変換変数は，スプレッドシートでは変数名の欄の右上に赤丸がついた状態で表示されます。

変換対象の変数が1つしかない場合には，計算変数と変換変数のどちらを用いてもあまり違いはありませんが，質問紙調査における逆転項目の処理のように，同じ変換を複数の変数に対して適用する場合には，1つの「変換式」を複数の変数に適用できる変換変数のほうが効率的でしょう。

## Filters：データフィルタ{#sec:data-filter}

データ分析では，データ全体のうちの一部だけを使って分析したいということもよくあります。たとえば，男性のデータだけを分析したいとか，小学校低学年の児童のデータだけを分析したいとかいうような場合です。そのような場合，分析のたびに全体のデータファイルから特定の行をとり出し，それを別のデータファイルとして作成するというのも1つの方法ですが，そのような方法はかなり手間がかかりますし，対象データを抜き出す過程でミスが生じる可能性も高くなります。

jamoviには，そのような場合に便利なフィルタ（Filters）と呼ばれる機能が搭載されています。フィルタは条件に合致するデータ行だけを表示し，それ以外を非表示にすることができる機能で，フィルタをオンにしている間は，表示されているデータのみが分析の対象となります。また，フィルタはいつでも簡単にオン・オフの切り替えができますので，男女別や学年別にデータファイルを別々にしなくても，フィルタを使えば男女別の分析や特定の学年のみを対象とした分析が簡単に実行できるのです。

では，これまでに使用してきたサンプルのデータを用いてフィルタを体験してみましょう。ここでは，フィルタを使って男性のデータだけを抽出してみます。

フィルタを使用するには，ツールバーの「\infig{menu-data-filter.pdf} Filters（フィルタ）」をクリックします。すると，図\@ref(fig:data-filter-setting)のような設定画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-filter-setting} 

}

\caption{フィルタの設定画面}(\#fig:data-filter-setting)
\end{figure}

設定画面の左側にある十時のボタン（\infig{filters-add.pdf}）はフィルタの追加ボタンです。フィルタは必要に応じて複数設定することができます。その下の目の形をしたアイコン（\infig{filters-visible.pdf}）は，フィルタにあてはまる行だけを表示させるかどうかを切り替えるボタンです。

画面中央の部分がフィルタの条件式を設定する部分で，最初の関数ボタンとボックスは計算変数や変換変数の場合と基本的には同じです。ただ，ここには計算式ではなく，表示させるデータの条件を示す式を記入します。条件式を複数使用したい場合は，ボックスの右側にある小さいほうの「（\infig{filters-add.pdf}）」ボタンをクリックすると条件式を追加できます。

その下の「Description」の部分は，そのフィルタについての説明欄です。後から見返したときにそのフィルタが何のためのものなのかがわからなくならないように，説明をきちんと書いておきましょう。条件式ボックスの右上にあるのは，そのフィルタのオン・オフの切り替えスイッチとフィルタの削除ボタンです。

では，男性のデータだけを表示させるフィルタを作成しましょう。条件式のボックスに「`性別 == 1`」と入力してください。このとき，「性別」と「1」の間の等号（=）は2つ連続で入力する必要がある点に注意してください。式を入力して確定すると，スプレッドシートの表示が図\@ref(fig:data-filter-gender)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-filter-gender} 

}

\caption{男性フィルタの設定後}(\#fig:data-filter-gender)
\end{figure}

「Filter 1」の列に「\infig{correct.pdf}」が表示されているのがこのフィルタの条件にあてはまるデータ行，「\infig{incorrect.pdf}」が表示されているのがフィルタにはあてはまらないデータ行です。見てわかるように，性別が「男」の行だけ「\infig{correct.pdf}」になっています。また，フィルタ設定画面あるいはスプレッドシート下部にある\infig{filters-visible.pdf}アイコンをクリックすると，フィルタにあてはまらない行を非表示にすることができます（図\@ref(fig:data-filter-on-off)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/data-filter-on-off} 

}

\caption{フィルタ表示方法の変更}(\#fig:data-filter-on-off)
\end{figure}

フィルタ設定画面の条件式ボックス右上にあるスイッチでは，フィルタのオン・オフをフィルタごとに個別に切り替え可能です。フィルタを使用しない場合は，忘れずに「inactive（オフ）」にしておきましょう。

なお，「20代の女性で〜な人のみ」というような複雑な条件でデータを抽出する場合は，複雑な条件式のフィルタを1つ作るよりも，「20代の女性」，「〜な人」というシンプルなフィルタを作成し，それらを組み合わせて使用するほうがよいでしょう。そうすることで，思い通りの結果が得られない場合にどのフィルタ条件がおかしいのかを簡単に突き止められるようになります。

## Exercise：調査票データの処理{#sec:practice-handling}

ここまで，jamoviにおけるデータ操作方法の基本について一通り見てきましたので，ここでは実際の分析場面により近い形で実践してみましょう。まず，練習用データファイル（[basics_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/basics_data01.omv)）をjamoviで開いてください。





\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise} 

}

\caption{練習用データファイル}(\#fig:basics-exercise)
\end{figure}

このデータファイルには，「ID」，「年齢」，「性別」の各変数値と，「Q1」から「Q7」までの回答値が入力されています（図\@ref(fig:basics-exercise)）。「Q1」から「Q7」は，それぞれ「外向性」を測定する心理尺度の回答データで，いずれも「まったくそう思わない(1)」から「とてもそう思う(7)」までの7段階で回答されています。

この練習データを用い，調査票データの分析場面でよく用いられる次の処理について実践してみましょう^[1.8.0以降のバージョンでは，ここでとりあげる3つの処理のうち，最初の2つについてはjamoviの分析ツールを使用して行うこともできます。]。

* 逆転項目の処理を行う
* 尺度得点を算出する
* 尺度得点に基づいて対象者をグループに分割する


### 逆転項目の処理 {#sub:basics-reverse-items}

一般に，リカート法^[各質問文に対し「あてはまらない」，「どちらでもない」，「あてはまる」など，複数の段階で回答させて数量化する方法]などを用いた心理尺度では，1つの測定概念について複数の質問を用意して測定を行います。たとえば，「外向性」を測定したい場合には，「初対面の人とでも会話を楽しめる」や「いろんな人と出会うのは楽しい」といった，外向性の高さに関連する質問文を複数用意して，そのすべてに「まったくそう思わない(1)」から「とてもそう思う(7)」の7段階で回答させるということを行うわけです。

この際，それらの質問文の中には「よく知らない人との交流は苦手だ」のような，外向性の高さとは逆の内容の文が含まれていることがあります。このように，本来測定したいものとは逆の内容を含む質問文のことを*逆転項目*といいます（図\@ref(fig:basics-exercise-reverse)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-reverse} 

}

\caption{逆転項目}(\#fig:basics-exercise-reverse)
\end{figure}


練習用データでは質問文の内容がわかりませんが，ここでは仮に，偶数番号の質問（Q2，Q4，Q6）が逆転項目だったとしましょう。この場合，「Q1」や「Q3」の質問に対して`6`や`7`と回答した人は外向性が高いことになるのですが，「Q2」や「Q4」に「6」や「7」と回答した人は外向性が低いことを意味します。このように，逆転項目は他の項目とは点数の方向が逆になるため，その扱いには注意が必要です。通常，こうした逆転項目の回答値は，それ以外の回答値と向きがそろうように変換したうえで分析に用います。

jamoviでは，逆転項目は「Computed Variable（計算変数）」または「Transformed Variable（変換変数）」を用いて処理することができます。どちらを用いても構いませんが，逆転項目が複数ある場合には，変換変数を用いたほうが手軽に処理できるでしょう。そこで，ここでは変換変数を用いて逆転項目を処理することにします。


#### 「変換変数」の作成{-}

それでは，「Q2」について逆転項目の処理を行いましょう。ここでは，「Q2」のすぐ後ろに，回答値を逆転した変換変数「Q2.R」を作成します。

まず，「Q2」の列名のところをクリックして，「Q2」の列を選択します（図\@ref(fig:basics-exercise-select-col)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-select-col} 

}

\caption{列の選択}(\#fig:basics-exercise-select-col)
\end{figure}


その状態でDataタブの「Variables」にある「\infig{menu-data-transform.pdf}  Transform」ボタンをクリックします（図\@ref(fig:basics-exercise-add-transform)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-add-transform} 

}

\caption{変換変数の追加}(\#fig:basics-exercise-add-transform)
\end{figure}


すると，図\@ref(fig:basics-exercise-set-transform)のような変換変数の設定画面が表示されますので，作成した変換変数の名前を「Q2.R」に設定しましょう。このとき，「Source variable」の部分が「Q2」になっていることを確認してください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-set-transform} 

}

\caption{変換変数名の設定}(\#fig:basics-exercise-set-transform)
\end{figure}

次に，「using transform」のメニューから「Create New Transform...」を選択して実行します（図\@ref(fig:basics-exercise-using-transform)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-using-transform} 

}

\caption{「変換」の作成}(\#fig:basics-exercise-using-transform)
\end{figure}

すると，図\@ref(fig:basics-exercise-transform-name)のような「TRANSFORM（変換）」の設定画面が表示されます。再利用の際にわかりやすいように，この変換の名前を「逆転項目」にしましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-transform-name} 

}

\caption{変換名の設定}(\#fig:basics-exercise-transform-name)
\end{figure}

そして「Add recode condition」の数式ボックスに逆転のための変換式を設定します。

5段階尺度や7段階尺度の場合，逆転項目の変換式は次の形で求めることができます。

\[
\text{逆転項目の回答値} = (\text{回答段階の最大値}+\text{回答段階の最小値}) - \text{元の回答値}
\]

練習データでは，「Q2」は「1」から「7」までの値で回答してもらう形式ですので，逆転項目を処理する際の変換式は次のようになります。

\[
\text{逆転項目の回答値} = (7+1) - \text{元の回答値} = 8 - \text{元の回答値}
\]

そこで，変換式の部分を次のように設定します（図\@ref(fig:basics-exercise-transform-formula)）。

:::{.jmvformula data-latex=""}
= 8 - $source
:::

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-transform-formula} 

}

\caption{変換式の設定}(\#fig:basics-exercise-transform-formula)
\end{figure}


画面右側の\infig{action-back-circle-d.pdf}をクリックして変換の設定画面を閉じ，\infig{action-back-circle-u.pdf}で変数設定画面を閉じると，「Q2」のすぐ後ろの列に「Q2.R」という変換変数が作成されていることが確認できます
（図\@ref(fig:basics-exercise-trans-q2)）。この変数が変換変数であることは，変数名の部分の右肩に小さな赤丸がついていることから判断できます。

この変数の値を確認すると，「Q2」の値が「1」の場合には「Q2.R」は「7」，「Q2」の値が「7」の場合には「Q2.R」は「1」というように，値が逆転しているのがわかると思います。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-trans-q2} 

}

\caption{作成した変換変数とその目印}(\#fig:basics-exercise-trans-q2)
\end{figure}

`Q2`の逆転処理はこれでおしまいです。次は「Q4」の逆転処理を行いましょう。「Q4」の列を選択して「\infig{menu-data-transform.pdf}  Transform」をクリックすると，再び変換変数の設定画面が表示されます。新しく作成した変換変数の名前を「Q4.R」に設定したら，「Source variable」の部分が「Q4」になっていることを確認し，「using transform」のメニューをクリックしてください。すると，メニュー項目の中に，先ほど作成した「逆転項目」があるはずです
（図\@ref(fig:basics-exercise-set-transform-q4)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-set-transform-q4} 

}

\caption{作成済みの変換を他の変数に適用}(\#fig:basics-exercise-set-transform-q4)
\end{figure}


この「逆転項目」を選択して変数設定画面を閉じれば「Q4」の逆転処理は完了です。このように，一度作成した変換式は繰り返し利用できますので，逆転項目が複数ある場合には変換変数で逆転処理を行うのが便利です。

先ほどと同様の手順で，「Q6」についても逆転処理を行ってください。これで逆転項目の処理はおしまいです。



### 尺度得点の算出 {#sub:basics2-scale-score}

「外向性」などの単一の概念について複数の質問文を用いて測定する場合には，それら複数の質問文に対する回答値を合計または平均し，それを*尺度得点*として用いるのが一般的です。ここでは，「Q1」から「Q7」までの回答の合計値を尺度得点として算出することにしましょう。なお，その際，「Q2」や「Q4」などの逆転項目については逆転処理を行った後の変数値（「Q2.R」や「Q4.R」など）を用いる必要がある点に注意してください。

この「外向性尺度」の尺度得点は，データの一番最後の列に新たな計算変数として作成しましょう。Dataタブの「Variables」にある「\infig{menu-variable-add.pdf} Add（追加）」を使用して，新たな「Computed Variable（計算変数）」を「\infig{menu-computed-append.pdf} Append（追加）」してください
（図\@ref(fig:basics-exercise-add-compvar)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-add-compvar} 

}

\caption{計算変数の追加}(\#fig:basics-exercise-add-compvar)
\end{figure}


作成された計算変数の変数名部分をダブルクリックすると，変数の設定画面が表示されます。変数名は「N」になっているかと思いますが，このままだと何の値か分からないので，変数名を「外向性」に変更します
（図\@ref(fig:basics-exercise-gaiko)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-gaiko} 

}

\caption{計算変数の名前を設定}(\#fig:basics-exercise-gaiko)
\end{figure}


変数名の設定ができたら，その下の計算式の部分に，変数値を合計するための式を入力します。ここでは尺度得点として回答値の合計を用いるので，関数ボタン（\infig{filters-formula.pdf}）で表示される関数の中から「SUM」を探してダブルクリックします
（図\@ref(fig:basics-exercise-sum)）。この「SUM」という関数は，括弧の中に指定された値の合計値を求める関数です^[尺度得点に平均値を用いる場合には，「MEAN」関数を使用します。これらの関数の詳細については，付録を参照してください。]。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-sum} 

}

\caption{関数一覧からSUM関数を入力する}(\#fig:basics-exercise-sum)
\end{figure}

数式ボックスの中に「`= SUM()`」と入力されているのを確認したら，括弧の間に合計対象となる変数を記入していきます。この際，変数名はキーボードから入力してもよいですが，関数の右側に表示される変数一覧から必要な変数名をダブルクリックして入力したほうが，タイプミスの心配もなく，わかりやすいでしょう。今回，合計値の対象となるのは，「Q1」，「Q2.R」，「Q3」，「Q4.R」，「Q5」，「Q6.R」，「Q7」の7つの変数です。各変数の区切りにはコンマ（,）を使用します。変数名を1つ入力したら，日本語入力はオフにした状態でコンマ（,）を入力し，次の変数名を入力するようにしてください。

完成した外向性得点の算出式は次のようになります
（図\@ref(fig:basics-exercise-sum-complete)）。

:::{.jmvformula data-latex=""}
= SUM(Q1,Q2.R,Q3,Q4.R,Q5,Q6.R,Q7)
:::

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-sum-complete} 

}

\caption{SUM関数を完成させる}(\#fig:basics-exercise-sum-complete)
\end{figure}


式の入力が終わったら，画面右の\infig{action-back-circle-u.pdf}をクリックして変数設定画面を閉じます。これで各対象者の外向性得点（合計値）が算出されました
（図\@ref(fig:basics-exercise-sumscore)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-sumscore} 

}

\caption{算出された外向性得点}(\#fig:basics-exercise-sumscore)
\end{figure}



### グループへの分割 {#sub:basics2-split-groups}

実際の分析場面では，算出された尺度得点を元に，対象者を外向性が高い群と低い群に分けて分析するといったこともよく行われます。ここでは，外向性得点の平均値を基準に，平均値以上の人を外向性「高群」，平均値未満の人を外向性「低群」としてグループ分けする方法についてみていきます。

対象者を外向性の高・低2群に分割した結果は計算変数に格納しますので，「Variables」の「\infig{menu-variable-add.pdf} Add（追加）」から，新たな「Computed Variable（計算変数）」を「\infig{menu-computed-append.pdf} Append（追加）」してください
（図\@ref(fig:basics-exercise-grouping)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-grouping} 

}

\caption{グループ分け用の計算変数を追加}(\#fig:basics-exercise-grouping)
\end{figure}


そして新しく作成した計算変数の設定画面を開き，変数名を「群」に変更しましょう
（図\@ref(fig:basics-exercise-group-name)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-name} 

}

\caption{計算変数の名前を`Group`に設定}(\#fig:basics-exercise-group-name)
\end{figure}

続いて，数式ボックスにグループ分けのための式を入力します。関数ボタン（\infig{filters-formula.pdf}）で表示される関数一覧の中から，「IF」を選択してください
（図\@ref(fig:basics-exercise-group-if)）。このIF関数は，条件式の結果に応じて異なる値を設定できる関数です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-if} 

}

\caption{計算式でIF関数を使用}(\#fig:basics-exercise-group-if)
\end{figure}

この「IF( )」の括弧の中には，次のように「条件式」，「条件式にあてはまる場合の値」，「条件式にあてはまらない場合の値」の3つをコンマで区切って指定します。

```
IF(条件式, あてはまる場合の値, あてはまらない場合の値)
```

今回は，外向性得点の平均値を基準にして対象者を外向性高群と低群の2群に分割したいので，「条件式」の部分には各対象者の外向性得点が平均値以上であるかどうかを判断する式（\(\text{外向性得点} \geqq \text{外向性得点の平均値}\)）を記入することになります。

そこでまず，変数名一覧から「外向性」をダブルクリックして括弧内に入力し，続けてキーボードから`>=`と入力します
（図\@ref(fig:basics-exercise-group-if-formula)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-if-formula} 

}

\caption{条件式の入力}(\#fig:basics-exercise-group-if-formula)
\end{figure}

さらに，関数一覧から「VMEAN」を選択して入力します
（図\@ref(fig:basics-exercise-group-vmean)）。この「VMEAN」は，指定した変数の平均値を算出する関数です^[平均値を算出する関数には「MEAN」と「VMEAN」の2つがありますが，「MEAN」は複数の変数値の平均値を「各対象者ごと」に計算するのに対し，「VMEAN」は1つの変数値について「対象者全体」での平均値を算出する点が異なります。]。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-vmean} 

}

\caption{全体の平均値の算出式を入力}(\#fig:basics-exercise-group-vmean)
\end{figure}


そしてこの「VMEAN」関数の括弧の中に「外向性」を指定します
（図\@ref(fig:basics-exercise-group-vmean-gaiko)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-vmean-gaiko} 

}

\caption{平均値を算出する変数を指定}(\#fig:basics-exercise-group-vmean-gaiko)
\end{figure}


この「`Gaiko >= VMEAN(Gaiko)`」の式が，「\(\text{外向性得点} \geqq \text{外向性得点の平均値}\)」を意味します。この条件式に続けて，条件式にあてはまる場合の値として「高群」，あてはまらない場合の値として「低群」を，それぞれコンマ（,）で区切って入力します
（図\@ref(fig:basics-exercise-group-if-full)）。このとき，変数値に「高群」や「低群」のような文字を用いる場合には，その値を引用符（""）で括る必要がありますので注意してください。

```{=html}
<pre><code>
=IF(Gaiko >= VMEAN(Gaiko),"高群","低群")
</code></pre>
```

```{=latex}
\begin{jmvgray}
  \verb|=IF(Gaiko >= VMEAN(Gaiko),"高群","低群")|
\end{jmvgray}
```

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-if-full} 

}

\caption{グループ分けの式を完成させる}(\#fig:basics-exercise-group-if-full)
\end{figure}

式を完成させて変数設定画面を閉じると，新しく作成した「群」変数に「高群」または「低群」が値として入力されているのを確認することができます
（図\@ref(fig:basics-exercise-group-var)）。条件式の部分がやや難しく感じられたかもしれませんが，計算変数ではこのようにしてデータをグループ分けすることもできるのです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics/exercise-group-var} 

}

\caption{グループ分けの変数の完成}(\#fig:basics-exercise-group-var)
\end{figure}

このような，逆転項目の回答値の処理や尺度得点の算出，グループ分けといった処理は，Excelなどの表計算ソフトで行うこともできますし，そのほうが簡単だと思う人もいるかもしれません。しかし，表計算ソフトで処理をした場合，元のデータに入力ミスが見つかったなどの理由でデータに修正が生じた際には，これらの処理をやり直さなければなりません。

これに対し，jamoviでこれらの処理を行った場合には，仮に元のデータに修正が生じたとしても，計算変数や変換変数の値は自動的に最新の内容に更新されるため，計算し直す必要がありません。分析データを確実に最新の状態に保てることは，jamoviでデータ処理を行う大きな利点といえます。


<!--chapter:end:02-basics.Rmd-->



# Analyses & Edit：分析と編集 {#ch:basics-more}

この章では，jamoviにおける基本的な分析の手順，およびメモ作成機能について見ていきましょう。より詳細については「分析編」で説明しますが，jamoviでは1つ1つの分析が簡単にできるだけでなく，それを再利用して効率的に分析が進められるような工夫がなされています。

また，多くの統計ソフトでは，結果に注釈をつけたり説明を加えたりするには分析結果をワープロソフトに貼り付けたりする必要がありますが，jamoviでは分析結果に直接説明を加えることが可能です。論文の序論から考察までのすべてをjamoviだけでやろうというのはさすがに無理ですが，ちょっとした分析結果のレポート程度であれば，jamoviだけで完了してしまうかもしれません。

## Analyses：分析の基本操作 {#sec:analysis-basic}



ここでは，次のサンプルデータ（[basics2_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/basics2_data01.omv)）を用いて，jamoviにおける分析の基本的な手順，そして分析作業を効率化してくれるいくつかの機能について見ていくことにしましょう（図\@ref(fig:bs2-data01)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/data01} 

}

\caption{サンプルデータの中身}(\#fig:bs2-data01)
\end{figure}


このデータには，対象者の`ID`，「年齢」，「性別」，そして何の得点かはわかりませんが，各対象者の「得点」が含まれています。

### 分析の実行 {#subsec:basic2-execute-analysis}

jamoviでは，分析のためのツールはすべて「Analyses（分析）」タブにまとめられています（図\@ref(fig:bs2-analyses-tab)）。第\@ref(ch:basics)章で説明したように，jamoviのAnalysesタブは非常にわかりやすく整理されているので，統計法の基本的な知識があれば，必要な分析手法を見つけることは難しくないでしょう。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/analyses-tab} 

}

\caption{Analyses（分析）タブ}(\#fig:bs2-analyses-tab)
\end{figure}


ここでは，jamoviにおける分析手順を理解するために，サンプルデータを用いて基本的な記述統計量の算出を行うことにします。

jamoviでの記述統計量の算出には，Analysesタブの「\infig{analysis-descriptives.pdf} Exploration（探索）」を使用します。「Exploration」ツールボタンをクリックすると「Descriptives（記述統計）」という項目が表示されるので，それを選択してください（図\@ref(fig:bs2-descriptives-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/descriptives-menu} 

}

\caption{記述統計量の算出}(\#fig:bs2-descriptives-menu)
\end{figure}

すると図\@ref(fig:bs2-descriptives-setting)のような設定画面が現れます
<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/descriptives-setting} 

}

\caption{記述統計の設定画面}(\#fig:bs2-descriptives-setting)
\end{figure}


この設定画面の左側には，分析で使用可能な変数の一覧が示されています。jamoviでは，この変数一覧から分析対象の変数を選択し，右側の欄に移動する形で分析を進めていきます。

また，この時点ですでに出力ウィンドウには「Descriptives」という表が表示されていますが，表の中に数値はありません。表の中身は分析の設定後に反映されます。

さて，まず対象者の「年齢」について記述統計量を算出してみましょう。それには，画面左側の変数一覧から「年齢」を選択し，「→」をクリックして「Variables」の欄に移動するだけです（図\@ref(fig:bs2-descriptives-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/descriptives-var} 

}

\caption{分析対象の指定}(\#fig:bs2-descriptives-var)
\end{figure}

すると，先ほどまでは空欄だった結果の表に，数値が表示されているはずです（図\@ref(fig:bs2-descriptives-res)）。一般的な統計ソフトでは，分析についてあれこれと設定をした後に何らかの形で「実行」処理をしないと計算が行われないのですが，jamoviでは分析設定がほぼリアルタイムで結果に反映されていきますので，他の統計ソフトのようにいちいち「実行」を指示する必要はないのです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/descriptives-res} 

}

\caption{分析結果}(\#fig:bs2-descriptives-res)
\end{figure}


なお，ここではあくまでも分析の基本手順について説明することを目的にしていますので，結果の見方などについては触れません。それらの詳細については，「分析編」を参照してください。分析が終わったら，設定画面右上の\infig{action-back-circle.pdf}をクリックして設定画面を閉じましょう。

### 分析の修正 {#subsec:basic2-modify-analysis}

#### データ修正後の再分析 {-}
実際の分析場面では，分析後にデータに入力ミスが見つかった，というようなこともあり得ます。たとえば，サンプルデータの「年齢」には，入力ミスと思われるデータが1つ含まれています。「ID」が「3」の対象者の年齢が「118」になっているのがわかるでしょうか（図\@ref(fig:bs2-data-error)）。他の対象者の年齢は「18」から「22」なので，この値だけが突出しています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/data-error} 

}

\caption{ID=3の対象者の年齢が118}(\#fig:bs2-data-error)
\end{figure}


ここで，この「118」という値は「18」の打ち間違いだったとしましょう。このようにしてデータの入力ミスが見つかった場合，一般的な統計ソフトでは，この値を修正した後で再度分析を実行し直す必要があります。

しかしjamoviでは，データを修正するとそれが自動で分析結果に反映されます。つまり，分析をし直す必要がないのです。実際に試してみましょう。「118」という値を「18」と修正すると，結果に表示されている値のいくつかがほぼリアルタイムに変更されるのがわかると思います（図\@ref(fig:bs2-edit-analysis)）。


<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/edit-analysis} 

}

\caption{データの修正と分析結果}(\#fig:bs2-edit-analysis)
\end{figure}



#### 分析設定の変更 {-}

データ分析の際には，途中で分析対象の変数を変更したくなったり，平均値と標準偏差を中央値と四分位数に変更したいなど，算出する値を変更したくなったりすることがあるかもしれません。たとえば，先ほど算出した記述統計量の分析対象を「年齢」から「得点」に変更したいとしましょう。一般的な統計ソフトでは，このような場合には再度「得点」を対象とした分析を実行し直すことになります。その場合，分析対象を変更する前の分析結果（「年齢」の記述統計量）の後に変更後の分析結果（「得点」の記述統計量）の両方が表示されることになり，分析結果がごちゃごちゃしたものになりがちです。

jamoviでは，このような場合にもとても柔軟に対応することができます。出力ウィンドウに表示されている結果の表をクリックしてみてください。すると，その分析の設定画面が開くはずです（図\@ref(fig:bs2-modify-analysis)）。

<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/modify-analysis} 

}

\caption{分析設定の変更}(\#fig:bs2-modify-analysis)
\end{figure}

そして，ここで分析対象の変数を「年齢」から「得点」に変更すると，分析結果も「得点」の記述統計量に変更されるのです。これなら，古い分析結果と新しい分析結果が混在してごちゃごちゃになるということがありません。分析対象の変数を「年齢」から「得点」に変更するには，「Variables」にある「年齢」を選択して「\infig{action-back.pdf}」で変数一覧に戻した後に，「得点」を「Variables」に入れるだけです。すると，すぐに結果の表の中身が「得点」のものに更新されます（図\@ref(fig:bs2-change-var)）。

<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/change-var} 

}

\caption{分析対象を変更}(\#fig:bs2-change-var)
\end{figure}


#### 分析の複製 {-}

複数の変数に対して同じような分析を繰り返したい場合というのもあるはずです。その場合には，分析結果の複製（Duplicate）機能を使うとよいでしょう。

出力ウィンドウの分析結果を右クリックしてみてください。すると，図\@ref(fig:bs2-duplicate-analysis)のようなメニュー項目が表示されます。

<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/duplicate-analysis} 

}

\caption{分析を複製}(\#fig:bs2-duplicate-analysis)
\end{figure}

ここで「Analysis（分析）」の「Duplicate（複製）」を実行すると，選択した結果が複製されます。この複製された結果をクリックすると，先ほどと同様に分析設定画面が表示されます。ここで分析対象の変数を変更すれば，まったく同じ分析を別の変数に対して適用できるわけです。

#### 分析の削除 {-}

実行した分析結果が不要になるような場合もあるでしょう。その場合には，不要な分析結果を右クリックし，「Analysis（分析）」から「Remove（除去）」を選択することで不要な分析結果を削除できます（図\@ref(fig:bs2-remove-analysis)）。

<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/remove-analysis} 

}

\caption{分析結果を削除}(\#fig:bs2-remove-analysis)
\end{figure}

#### 注釈の追加 {-}
分析結果として表示される表や図には，注釈をつけることもできます。注釈をつけたい図あるいは表を右クリックしてください。すると，「Image」や「Table」というメニュー項目が表示されます。その中にある「Add Note（注を追加）」という項目を選択すれば，図あるいは表の下に注釈を記入することができるのです（図\@ref(fig:bs2-add-note)）。


<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/add-note} 

}

\caption{表に注釈を追加}(\#fig:bs2-add-note)
\end{figure}

#### 分析結果の書き出し {-}

jamoviの分析結果は，結果全体，分析ごと，図・表ごとなどいくつかの単位で書き出すことができます。出力ウィンドウで右クリックすると，右クリックする場所によって，「All（全体）」，「Analysis（分析）」，「Table（表）」などのメニューが表示されるので，そこから「Export（書き出し）」を選択すれば，それぞれ結果全体（All），その分析のみ（Analysis），その表のみ（Table）をPDFファイル，またはhtmlファイルとして書き出せます（図\@ref(fig:bs2-result-export)）。


<!-- 図 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/result-export} 

}

\caption{分析結果の書き出し}(\#fig:bs2-result-export)
\end{figure}



このとき，結果を画像ファイルとして書き出すのであればPDFファイルとして，表の内容をWordなどで編集したいのであればhtmlファイル（Webページ）として書き出すのがよいでしょう^[htmlファイルをそのままダブルクリックして開こうとするとWebブラウザが起動し，結果がWebページとして表示されますが，Microsoft Wordのファイルメニューでhtmlファイルを選択して開けば，結果ファイルをWordで開いて編集することができるようになります。]。


## Edit：メモの作成 {#sec:reporting}
多くの統計用ソフトウェアでは，表示された分析結果に手を加えることはできません。そのため，多数の分析を行った場合には，どの結果がどの分析のものだったかがわからなくなってしまいがちです。

しかし，jamoviではタイトルを変更したり，分析結果に説明や注釈を加えたりすることができます。分析結果に必要な説明を加えておけば，どの結果がどの分析のものかがわからなくなるということがなくなります。また，しっかりとした説明をつけておけば，実験レポートや研究論文を書く際の時間短縮にもなるでしょう。

出力ウィンドウに表示されている結果のタイトル部分をクリックすると，その部分を変更できるのがわかると思います（図\@ref(fig:bs2-report)）。また，タイトルの下の部分には説明文を追加することができます。その際，ワープロソフトほどではありませんが，文字を太字にしたり斜体にしたりすることも可能ですし，箇条書きや数式などを用いることも可能です。それらの書式の指定には「Edit（編集）」タブのツールボタンを用います。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/basics2/report} 

}

\caption{結果のタイトルや説明の編集}(\#fig:bs2-report)
\end{figure}



<!--chapter:end:03-basics2.Rmd-->

# (PART) 分析編 {-#part-two}




<!--chapter:end:04-part2.Rmd-->



# Exploration：探索 {#ch:exploration}

ここからはjamoviを使った分析方法についての説明です。「分析編」では，jamoviのメニュー順に分析手法について見ていくことにします。


まずは「\infig{analysis-descriptives.pdf} Exploration（探索）」ツールから見ていきましょう。このツールはデータを記述要約するためのものです。データの特徴を知るためには欠かせないツールですので，使い方をしっかり理解しましょう。

この分析ツールの使い方を見るために，簡単なサンプルデータ（[exploration_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/exploration_data01.omv)）を用いることにします（図\@ref(fig:exploration-sample)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/exploration-sample} 

}

\caption{サンプルデータ}(\#fig:exploration-sample)
\end{figure}

このサンプルデータには，男女計50人分の次の変数値が格納されています^[本書で利用するサンプルデータはすべて架空のデータです。]。

:::{.jmvvar data-latex=""}

+ `ID`　対象者のID：\infig{variable-id.pdf} ID型
+ `性別`　対象者の性別：\infig{variable-nominal.pdf} Nominal（名義）型
+ `年齢`　対象者の年齢：\infig{variable-continuous.pdf} Continuous（連続）型
+ `身長`　対象者の身長（cm）：\infig{variable-continuous.pdf} Continuous（連続）型
+ `体重`　対象者の体重（kg）：\infig{variable-continuous.pdf} Continuous（連続）型
+ `血液型`　対象者の血液型：\infig{variable-nominal.pdf} Nominal（名義）型
+ `体力`　対象者の体力レベル（5段階判定）：\infig{variable-ordinal.pdf} Ordinal（順序）型
+ `学力`　対象者の学力レベル（5段階判定）：\infig{variable-ordinal.pdf} Ordinal（順序）型
:::

この「\infig{analysis-descriptives.pdf} Exploration」は，記述統計など，データの特徴を掴むために使用するツールです。jamoviの基本構成では，ここには「Descriptives（記述統計）」という項目が含まれています（図\@ref(fig:Exploration-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-menu} 

}

\caption{Exploration（探索）ツールの構成}(\#fig:Exploration-menu)
\end{figure}

それでは，メニューから「Descriptives」を選択してください。これで分析開始です。

## Descriptives：記述統計{#sec:exp-exploration-descriptives}

Descriptives（記述統計）の設定画面は図\@ref(fig:Exploration-descriptives-panel)のようになっています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-panel} 

}

\caption{Descriptives（記述統計）の分析設定画面}(\#fig:Exploration-descriptives-panel)
\end{figure}

画面左側の部分は，データファイルに含まれている変数の一覧です。ここから，分析したい変数を選択し，それをその右側にある「Variables」の欄に移動すると，指定した変数に関する記述統計量を算出することができます。また，画面の下のほうには［Statistics（統計量）］や［Plots（作図）］と書かれた部分がありますが，この部分の左側にある「\infig{modules-analyses-arrow-r.pdf}」をクリックすると，それぞれ統計量の算出や作図に関する詳細設定項目が表示されるようになっています。

各項目の詳細の説明は後回しにして，まずは実際にいろいろと分析してみましょう。まず，「性別」について記述統計量を求めてみます。左側の変数リストで「性別」を選択したら，「Variables」の隣にある「\infig{action-forward.pdf}」をクリックしてください。すると，「性別」が左の変数リストから右側の「Variables」に移動され，それと同時に画面右側の出力ウィンドウに計算結果が表示されます（図\@ref(fig:Exploration-descriptives-seibetsu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-seibetsu} 

}

\caption{「性別」の記述統計量の算出}(\#fig:Exploration-descriptives-seibetsu)
\end{figure}

ここがjamoviの面白いところで，分析画面で変数を指定したり，あるいは分析の設定を変更したりすると，その変更がすぐに結果画面に反映されるのです。他の多くの統計ソフトでは，分析対象の変数を変更したり，分析の設定を変更したりした場合には，分析の再実行を行わないと結果は更新されません。しかし，jamoviでは，このようにほぼリアルタイムに結果が更新されていくので，設定変更による結果を確認しながら分析を進めていくことができます。

では，計算結果についても簡単に見ておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-seibetsu-table} 

}

\caption{「性別」の記述統計量}(\#fig:Exploration-descriptives-seibetsu-table)
\end{figure}

結果の表の各項目の意味は，図\@ref(fig:Exploration-descriptives-seibetsu-table)に色字で示したとおりです。この結果から，総度数（データの総数）が「50」，平均値が「1.34」といったことがわかります。

ただ，この計算結果には問題があります。「性別」は名義型変数なので，平均値は意味をなしません。この変数は男性を「1」，女性を「2」として入力されていて，平均値の計算自体はできるのですが，この「性別の平均値が1.34」というのはまったく意味がありません。

このような名義尺度データでは，まず男性と女性がそれぞれ何人ずつなのか，といったことを知りたいはずです。その場合，変数リストのすぐ下にある「Frequency tables（度数分布表）」のチェックをオンにします（図\@ref(fig:Exploration-descriptives-seibetsu-frequency-tables)）。なお，この「Frequency tables」のところには\infig{variable-nominal.pdf} \infig{variable-ordinal.pdf}というアイコンが付けられています。これは，この項目は分析変数が「\infig{variable-nominal.pdf} Nominal（名義型）」と「\infig{variable-ordinal.pdf} Ordinal（順序型）」の場合のみ使用できるということを意味しています。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-seibetsu-frequency-tables} 

}

\caption{度数分布表の表示設定}(\#fig:Exploration-descriptives-seibetsu-frequency-tables)
\end{figure}

このチェックをオンにすると，すぐに出力ウィンドウに図\@ref(fig:Exploration-descriptives-seibetsu-table2)のような度数分布表が表示されます。度数分布表には，変数値ごとの度数とそのパーセント値，および累積パーセント値が示されています。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-seibetsu-table2} 

}

\caption{度数分布表}(\#fig:Exploration-descriptives-seibetsu-table2)
\end{figure}


### Statistics：統計量{#subsec:exp-statistics}

さて，これで度数分布表はできましたが，先ほどの平均値の表はそのままになっていますので，これをなんとかしたいですね。そこで，結果に表示させる値をもう少し細かく設定することにしましょう。そのためには，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Statistics}}（統計量）の左側にある「\infig{modules-analyses-arrow-r.pdf}」をクリックし，詳細項目を展開します。

すると，非常にたくさんの項目が表示されました（図\@ref(fig:Exploration-descriptives-statistics)）。各項目の使い方についてはまた後ほど説明することとして，ここではこの画面で設定可能な項目の一覧を見ておきましょう。項目が多いので，図の中に示す説明は太字の部分だけにして，残りは文中で示すことにします。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-statistics} 

}

\caption{Statistics（統計量）の詳細設定}(\#fig:Exploration-descriptives-statistics)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Sample Size**（標本サイズ）　標本サイズに関連する情報の設定を行います。
  - N（総数）　分析変数に含まれるデータ総数を表示します。
  - Missing（欠損値）　分析変数に含まれる欠損値の個数を表示します。
  
+ **Percentile Values**（パーセンタイル値）　パーセンタイル値や分位数に関する設定を行います。
  - Cut points for [　　] equal groups（n分位数）　データ全体をn等分する位置にある値を算出します。
  - Percentiles（パーセンタイル）　値の小さいほうから数えてn%の位置にある値を算出します。複数のパーセント点を指定する場合は，それらの値をコンマで区切って入力します。

+ **Dispersion**（ばらつき）　パーセンタイル値や分位数に関する設定を行います。
  - Std. deviation（標準偏差）　標準偏差を算出します。
  - Variance（分散）　分散を算出します。
  - Range（範囲）　範囲（最大値 – 最小値の幅）を算出します。
  - Minimum（最小値）　最小値を算出します。
  - Maximum（最大値）　最大値を算出します。
  - IQR（四分位範囲）　四分位範囲を算出します。

+ **Mean Dispersion**（平均値のばらつき）
  - Std. error of Mean（平均値の標準誤差）　平均値の推定における標準誤差を算出します。
  - Confidence interval for Mean（平均値の信頼区間）　平均値の信頼区間（下限値と上限値）を算出します。初期設定では95%信頼区間を算出しますが，数値を変更すれば90%や99％などで信頼区間を算出することができます。

+ **Central Tendency**（中心傾向）　データの中心位置に関する統計量を算出します。
  - Mean（平均値）　平均値を算出します。
  - Median（中央値）　中央値を算出します。
  - Mode（最頻値）　最頻値を算出します。
  - Sum（合計値）　合計値を算出します。
  
+ **Distribution**（分布）　データの分布に関する統計量を算出します。
  - Skewness（歪度）　歪度（分布が左右対称からずれている程度）を算出します。
  - Kurtosis（尖度）　尖度（分布が中心に集中している程度）を算出します。

+ **Normality**（正規性）
  - Shapiro-Wilk（シャピロ=ウィルク検定）　分布が正規分布からずれているかどうかを検定します。
:::


「性別」の記述統計で平均値などの不要な値を表示しないようにするには，この画面で「Mean（平均値）」などの不要な項目のチェックを外すだけです。「N」と「Missing」だけを残してそれ以外のチェックを外すと，結果の表示は図\@ref(fig:Exploration-descriptives-seibetsu-table3)のようになります。これですっきりです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-seibetsu-table3} 

}

\caption{設定変更後の結果}(\#fig:Exploration-descriptives-seibetsu-table3)
\end{figure}


では，他の変数についても同様に記述統計量を算出しましょう。次は，「性別」と同じく名義尺度型変数である「血液型」について記述統計量を算出することにします。まずは，設定画面の右上にある\infig{action-back-circle.pdf}をクリックして，この設定画面を一旦閉じましょう。

そして，再度「\infig{analysis-descriptives.pdf} Exploration」から「Descriptives」を実行して設定画面を開きます。すると，先ほどの分析結果の下に新しい結果の表が作成され，そして再び先ほどの設定画面が現れます。

「血液型」でも，性別のときと同様に度数分布表を作成することにしましょう。また，性別と違って血液型には4種類の値が含まれていますので，今回は*最頻値*についても算出することにします。この場合，分析の設定画面は図\@ref(fig:Exploration-descriptives-ketsueki)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-ketsueki} 

}

\caption{血液型の記述統計}(\#fig:Exploration-descriptives-ketsueki)
\end{figure}

最頻値（Mode）は`1.00`となっていますが，このデータでは血液型が「A=1，B=2，O=3，AB=4」として入力されているので，最頻値は「A型」ということになります。度数分布表では値そのものではなく変数ラベルが表示されるのですが，記述統計量の表では残念ながら変数ラベルではなく値そのものが表示されるので，その点は注意が必要です。

#### 順序尺度データの記述統計 {-#subsub:exp-ordinal}

今度は順序尺度データである「体力」と「学力」について記述統計量を算出しましょう。一旦この設定画面を閉じ，再び「\infig{analysis-descriptives.pdf} Exploration」から「Descriptives」を選択して設定画面を開いてください。

なお，この「体力」と「学力」の変数の値はどちらも5段階評価によるもので，値が大きいほど評価が高いことを意味します。このように，この2つの変数は共通した部分が多いのでまとめて分析することにしましょう。「Variables」の欄に，「体力」と「学力」の2つを移動させると，出力ウィンドウにはこれらの変数についての計算結果がひとまとめに表示されます。

この2つの変数は，値が5種類しかない順序尺度変数ですので，今回も度数分布表を作成することにしましょう。また，順序尺度データなので，平均値や標準偏差にはあまり意味はありませんね。ですので，これらは非表示にしておきます。その代わり，データのばらつきの指標として*四分位数*を算出したいと思います。四分位数を算出するには，設定画面の「Cut points for …」の部分にチェックを入れ，入力欄の数値を「4」にします。なお，第2四分位数（50％点）は*中央値*と同じですので，「Median」のチェックも外してしまいましょう（図\@ref(fig:Exploration-descriptives-tairyoku)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-tairyoku} 

}

\caption{体力と学力の記述統計}(\#fig:Exploration-descriptives-tairyoku)
\end{figure}

この設定にすると，分析結果には2変数の測定値の総数と欠損値の個数，第1四分位数（25％点），第2四分位数（50％点=中央値），第3四分位数（75％点）が含まれた記述統計量の表と，それぞれの変数の度数分布表が表示されます。記述統計量だけで見ると2つの変数は非常によく似た結果になっていますが，度数分布表を見ると「体力」のほうがややばらつきが大きいようです。

#### 間隔・比率尺度データの記述統計 {-#subsub:exp-continuous}

最後に連続型変数，つまり，間隔尺度あるいは比率尺度による測定値の記述統計です。サンプルデータでは「年齢」，「身長」，「体重」の3つがこの型です。「Descriptives」の設定画面を閉じ，再び「\infig{analysis-descriptives.pdf} Exploration」から「Descriptives」を選択して分析を実行してください。

「年齢」，「身長」，「体重」の3つを「Variables」に移動したら，せっかくなので［Statistics（統計量）］で設定できるさまざまな値を算出してみましょう^[ここでは説明のためにいろいろな値を算出していますが，実際の分析では必要なものだけを選んで実行してください。]。「**Dispersion**（ばらつき）」，「**Mean Dispersion**（平均値のばらつき）」，「**Distribution**（分布）」，「**Normality**（正規性）」にある項目のすべてにチェックを入れてみてください（図\@ref(fig:Exploration-descriptives-continuous-setting)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-continuous-setting} 

}

\caption{分析の設定}(\#fig:Exploration-descriptives-continuous-setting)
\end{figure}

なお，連続型の変数の場合には「Frequency Tables」のチェックをオンにしても度数分布表は作成されません。度数分布表は，その横のアイコンからわかるように，名義型（\infig{variable-nominal.pdf}）と順序型（\infig{variable-ordinal.pdf}）の変数の場合のみの機能だからです。

設定が終わると，分析結果は図\@ref(fig:Exploration-descriptives-continuous-table)のようになっているはずです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-continuous-table} 

}

\caption{記述統計の結果の表}(\#fig:Exploration-descriptives-continuous-table)
\end{figure}

結果の表には，上から順に標本サイズ，中心傾向，ばらつき，分布，正規性に関する値が示されています。なお，「Mean Dispersion」で設定を行う「Std. error mean（平均値の標準誤差）」と「95% CI mean lower bound（信頼区間の下限値）」，「95% CI mean upper bound（信頼区間の上限値）」の値は，平均値の推定精度に関する指標のため，中心傾向の項目である「平均値」のすぐ下に示されます。

なお，ほとんどの統計ソフトでもそうなのですが，jamoviで算出される分散や標準偏差などのばらつきの指標は，このデータの母集団が持つ値についての推定値であって，データそのものについての値ではありません。そのため，「Variance（分散）」は，平均値からの偏差2乗の合計を「標本サイズ – 1」で割った，*不偏分散*の値になっています。また，「Standard deviation（分散）」には，この不偏分散の正の平方根が用いられていますので，その点は注意してください（図\@ref(fig:exp-dispersion)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/dispersion} 

}

\caption{統計ソフトで算出される分散と標準偏差の値}(\#fig:exp-dispersion)
\end{figure}

その下の「分布」の項目については，あまり馴染みがないかもしれません。これらは，このデータの分布（標本）から推定される母集団の分布が*正規分布*からどれだけずれているかを示すものです。心理統計におけるさまざまな分析手法は，その多くがデータの母集団が正規分布であることを前提としていますので，分布に極端な偏りがないことを確認しておくことはとても重要です。この分布の指標は，そうした偏りの程度を数値化したものです（図\@ref(fig:exp-distribution)）。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/distribution} 

}

\caption{歪度と尖度}(\#fig:exp-distribution)
\end{figure}

このうちの「Skewness（*歪度*）」は，分布の中心が左右にどれだけ偏っているかを示す値です。歪度がプラスの値の場合には，分布の中心が真ん中より左にずれていることを，マイナスの値の場合には右にずれていることを示します。歪度が「0」の場合には分布の中心が分布全体のちょうど真ん中にあるということです。jamoviでは，この歪度の推定値とその標準誤差が算出されます。一般に，この歪度の絶対値がその標準誤差の2倍以上の大きさである場合，分布が左右にかなり偏っているとみなされます。

もう1つの「Kurtosis（*尖度*）」は，分布がどの程度尖った形になっているかを示す値です。分布が尖った形になっているというのは，中心部分に多くの値が集まり，周辺部分には値が少ないことを意味します。反対に，分布が平たい形の場合には，値が全体的に広い範囲に散らばっているということになります。この尖度がプラスの値の場合，その母集団分布は正規分布よりも尖った形に，マイナスの値の場合には，正規分布よりも平たい形になっていることを意味します。この尖度の値についても，推定値と標準誤差が算出され，尖度の絶対値がその標準誤差の2倍以上の大きさである場合，分布の尖り具合に偏りが大きいとみなされます。

一番下の「Shapiro-Wilk（*シャピロ=ウィルク検定*）」は，このデータの母集団の分布が正規分布から大きくずれているかどうかについての検定です。シャピロ=ウィルク検定では，「母集団分布は正規分布である（母集団の分布と正規分布のずれは0である）」という*帰無仮説*を用いた統計的仮設検定を実施します。結果の表の「Shapiro-Wilk W」は，この検定で算出される検定統計量Wの値で，この値が1であれば正規分布からのずれが0であり，そこから値が小さくなるほど正規分布からのずれが大きいことを意味します。ただし，正規分布からのずれが大きいといえるかどうかの基準は標本サイズ（データの総数）によって異なるため，このWの値だけでは判断が困難です。そこで，「Shapiro-Wilk p」として，このWの値の有意確率（*p値*）の算出結果が合わせて示されます。一般に，このpの値が有意水準（一般にα=0.05）未満である場合に，母集団の分布が正規分布でないとみなされます。


#### グループごとの記述統計 {-#subsub:exp-groupby}

ところで，先ほど算出した身長や体重の平均値は，男女を区別せず，すべての測定値を用いて算出されています。ですが，身長や体重というのは男女差が比較的大きいですよね？ですので，平均値や標準偏差などは男女別に算出しておいたほうがよさそうです。その場合，どうすればよいでしょうか。その1つとして，「男性のデータのみ」，「女性のデータのみ」というフィルタ（第\@ref(ch:basics)章「[フィルタ](#sec:data-filter)参照」）を作成し，そのフィルタを結果に適用するという方法が挙げられます。ただ，その場合，男性と女性の結果を同時に見ることはできません。それでは不便ですので，別の方法を用いたほうがよいでしょう。

このような場合，設定画面の「Variables」の下にある「Split by」を使うと便利です。変数リストから「性別」を選び，それを「Split by」に移動しましょう。すると，すべての記述統計量が男女別に算出されます（図\@ref(fig:Exploration-descriptives-split-by)）。なお，この「Split by」には右下に名義型変数のアイコン（\infig{variable-nominal.pdf}）がついていますので，ここに指定できるのはNominal（名義型）の変数だけです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-split-by} 

}

\caption{グループごとの分析}(\#fig:Exploration-descriptives-split-by)
\end{figure}

### Plots：作図{#subsec:exp-plots}

ここまでは「Descriptives（記述統計）」を使った記述統計量の算出方法を見てきました。多くの場合，これらの機能だけでも十分ではあるのですが，数値だけではわかりにくい部分もあるので，データの特徴を視覚的に捉えることができるといいですね。jamoviには基本的な作図機能も備わっていますので，今度はデータの視覚化の方法について見ていきましょう。

#### 名義型・順序型データの視覚化 {-#subsub:exp-plot-nominal}

ではまず，名義型（\infig{variable-nominal.pdf} Nominal）データである血液型の分析結果をグラフ表示してみようと思います。なお，順序型（\infig{variable-ordinal.pdf} Ordinal）データの場合も視覚化の手順は同じです。

画面右側の出力ウィンドウから，「血液型」の分析結果を探し，それをクリックしてください。すると，この分析の際に使用した設定画面が表示されます。これもjamoviの面白く，かつ便利なところで，jamoviでは一度実行した分析をクリックすれば，いつでもその分析の設定を変更することができるのです。

また，第\@ref(ch:basics-more)章の「[分析の修正](#subsec:basic2-modify-analysis)」のところで見たように，jamoviの分析結果はデータに修正を加えると分析結果も自動的に更新されるようになっています。SPSSなどの統計ソフトでは，一度実行した分析の結果は変更できません。そのため，分析の設定を変更したい場合には，再度分析をやり直すしかありませんし，データに修正が生じた場合も分析をやり直すしかないのですが，jamoviならそうした手間は不要です。

さて，「血液型」の分析画面を開いたら，その下のほうにある「Plots」の欄を展開して表示させてください。統計量については変更しませんので，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Statistics}}の部分は畳んで設定項目を非表示にしておくとよいでしょう。

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Plots}}（作図）には，以下の項目が含まれています（図\@ref(fig:Exploration-descriptives-plots-setting)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-setting} 

}

\caption{作図の設定項目}(\#fig:Exploration-descriptives-plots-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Histograms**（ヒストグラム）　ヒストグラムに関する設定項目です。
  - Histogram（ヒストグラム）　度数分布をヒストグラムとして図示します。
  - Density（密度曲線）　度数分布をカーネル平滑化した密度曲線グラフを作成します。

+ **Q-Q Plots**（Q-Qプロット）　正規Q-Qプロットの設定項目です。
  - Q-Q　正規Q-Qプロットを作成します。

+ **Box Plots**（箱ひげ図）　箱ひげ図（ボックスプロット）に関する設定項目です。
  - Box plot（箱ひげ図）　箱ひげ図を作成します。
  - Violin（バイオリン図）　バイオリン図を作成します。
  - Data（データ点）　1つ1つのデータを点として表示します。
  - Mean（平均値）　箱ひげ図やバイオリン図上に平均値を表示します。

+ **Bar Plots**（棒グラフ）　棒グラフに関する設定項目です。
  - Bar plot（棒グラフ）　棒グラフを作成します。
:::

これらのうち，名義尺度データで有効なのは「**Bar Plots**（棒グラフ）」の項目です。それ以外の項目も使用できなくはないですが，グラフの性質上，意味のある結果は得られません。

「**Bar Plots**（棒グラフ）」にある「Bar Plot（棒グラフ）」のチェックをオンにすると，図\@ref(fig:Exploration-descriptives-plots-bar-plot)のようなグラフが作成されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-bar-plot} 

}

\caption{棒グラフ}(\#fig:Exploration-descriptives-plots-bar-plot)
\end{figure}

#### 連続型データの視覚化 {-#subsub:exp-plot-continuous}

今度は連続型（\infig{variable-continuous.pdf} Continuous）のデータを視覚化してみましょう。「年齢」，「身長」，「体重」の分析結果をクリックし，これらの変数に関する分析設定画面を表示させてください。連続型のデータでは，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Plots}}にあるすべての項目が使用可能です。 順番に見ていきましょう。

#### Histograms：ヒストグラム{-#subsubsub:exp-plots-histograms}

「**Histograms**」には，「Histogram（ヒストグラム）」と「Density（密度曲線）」の2つの項目があります。この2つは，組み合わせて使用することもできます。図\@ref(fig:Exploration-descriptives-plots-histograms)は，「体重」のヒストグラムと密度曲線，その2つを組み合わせた場合の結果のグラフです^[縦軸の「男」，「女」の部分が日本語だとうまく表示されず，□になってしまっているかもしれません。その場合の選択肢は，変数ラベルを「M」や「F」などのアルファベットに変更するか，これはこういうものだと思ってあきらめるかのいずれかです。]。ここでは性別をグループ変数として用いているので，男女別に図が作成されています。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-histograms} 

}

\caption{ヒストグラム}(\#fig:Exploration-descriptives-plots-histograms)
\end{figure}

##### Histogram：ヒストグラム{-}

2種類のグラフのうち，*ヒストグラム*についてはとくに説明は必要ないでしょう。これは度数分布を視覚化する際によく用いられるグラフです。なお，身長や体重のような連続変数で度数を集計する際の測定値の間隔（*階級*，*ビン*）は，jamoviでは自動的に設定されます。残念ながら階級の幅を自分で設定することはできませんので，思ったとおりの結果が得られない場合には，ExcelやRなどを用いて自分で作成する必要があります。

##### Density：密度曲線{-}

2つ目の*密度曲線*は，*カーネル平滑化*と呼ばれる手法を用い，度数分布を滑らかな曲線で表現したものです。こうすることによってヒストグラムに見られる細かな凸凹が平滑化され，全体的な傾向を捉えやすくなります。


#### Q-Q Plots：Q-Qプロット{-#subsubsub:exp-plots-qq}

「**Q-Q Plots**」にある「Q-Q」の項目では，*Q-Qプロット*や*正規Q-Qプロット*と呼ばれる図を作成します（図\@ref(fig:Exploration-descriptives-plots-qq)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-qq} 

}

\caption{正規Q-Qプロット}(\#fig:Exploration-descriptives-plots-qq)
\end{figure}

これはデータの分布が*正規分布*になっているかどうかを視覚的に確かめるために用いられるもので，グラフの横軸にはこのデータが正規分布である場合にとると考えられる値，縦軸には実際の測定値（の標準得点）がとられています。このグラフのデータ点が，グラフ中央の直線上に並べばデータが正規分布しているといえ，そこから大きくずれていれば正規分布から外れているということになります。

#### Box Plots：箱ひげ図{-#subsubsub:exp-plots-box}

「**Box Plots**」には，箱ひげ図やそれに関連した作図の項目が含まれています。

##### Box plot：箱ひげ図{-}

1つ目の「Box plot（箱ひげ図）」は，箱ひげ図（ボックスプロット）と呼ばれるグラフを作成します（図\@ref(fig:Exploration-descriptives-plots-box)）。箱ひげ図は，中央値と四分位数を用いてデータのばらつきを示すためのグラフで，「箱」の部分には四分位数，「ひげ」の部分には*四分位範囲*（第3四分位数 – 第1四分位数の幅）の1.5倍の範囲内における最大値および最小値までの幅が示されます。また，それより外の範囲にあるデータは*外れ値*として点で示されます。

##### Violin：バイオリン図{-}

その下にある「Violin（バイオリン図）」で作成されるバイオリン図は，密度曲線を横倒しにし，さらに左右対称にして分布の特徴を表したものです（図\@ref(fig:Exploration-descriptives-plots-box)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-box} 

}

\caption{箱ひげ図とバイオリン図}(\#fig:Exploration-descriptives-plots-box)
\end{figure}

##### Data：データ点{-}
一番下の「Data（データ点）」のチェックをオンにすると，1つ1つのデータが点として示されます（図\@ref(fig:Exploration-descriptives-plots-data-jittered)）。その際，その下のメニューで，それぞれのデータ点が重ならないように点の位置をちりばめるようにしてずらす（jittered）か，積み上げるような形にして表示する（stacked）かを選択することができます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-data-jittered} 

}

\caption{データ点の表示}(\#fig:Exploration-descriptives-plots-data-jittered)
\end{figure}

この箱ひげ図とバイオリン図，データ点の表示は，複数を重ね合わせて使用することもできます（図\@ref(fig:Exploration-descriptives-plots-box-combined)）。また，**Box Plots**の一番下にある「Mean（平均値）」にチェックを入れると，各グループの平均値をグラフ上に示すことができます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-box-combined} 

}

\caption{グラフの重ね合わせ}(\#fig:Exploration-descriptives-plots-box-combined)
\end{figure}


```{=latex}
\clearpage
```

#### Bar Plots：棒グラフ{-#subsubsub:exp-plots-bar}

連続型の変数の場合，「**Bar Plots**」の「Bar plot（棒グラフ）」では平均値の棒グラフが作成されます。このとき，グラフには平均値とその*標準誤差*が示されます（図\@ref(fig:Exploration-descriptives-plots-bar)）。グラフの誤差線（ひげの部分）は標準偏差ではありませんので，その点は注意してください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/exploration/Exploration-descriptives-plots-bar} 

}

\caption{棒グラフ}(\#fig:Exploration-descriptives-plots-bar)
\end{figure}

<!--chapter:end:04a-exploration.Rmd-->




# T-Tests：ｔ検定 {#ch:ttests}

「\infig{analysis-ttest.pdf}  T-Tests（t検定）」は，1つあるいは2つの平均値の検定のためのツールです。jamoviの基本構成では，ここには次の3つの分析メニューが含まれています（図\@ref(fig:ttests-ttest-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/ttests-menu} 

}

\caption{T-Tests（t検定）のメニュー}(\#fig:ttests-ttest-menu)
\end{figure}

:::{.jmvmenu data-latex=""}
+ Independent Samples T-Test（対応なしt検定）　2群の独立標本（対応なしデータ）の平均値の検定を行います
+ Paired Samples T-Test（対応ありt検定）　対応ありデータの2つの平均値の検定を行います
+ One Sample T-Test（1標本t検定）　標本の平均値と基準となる平均値の間で検定を行います
:::

これらの分析メニューでは，平均値の検定だけでなく，それぞれに対応した*ノンパラメトリック検定*を行うこともできます。また，本書では詳しくはとりあげませんが，*ベイズ統計*の考え方を用いた指標を算出することも可能です。

## Independent Samples T-Test：対応なしt検定{#sec:ttests-independent-samples}

対応なしt検定（独立標本t検定）は，お互いに関連のない（*独立*な）2つのグループの間で母集団の平均値に統計的な差があるといえるかどうかを確かめたい場合に使用される分析手法です（図\@ref(fig:ttests-independent-t)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/independent-t} 

}

\caption{対応なしt検定}(\#fig:ttests-independent-t)
\end{figure}


### 考え方 {#subsec:ttests-independent-basics}

統計的仮説検定は，*推測統計*と呼ばれる統計手法を応用したもので，手元にあるデータは関心の対象である集団全体（*母集団*）から*無作為抽出*された一部（*標本*，*サンプル*）であるとみなします（図\@ref(fig:ttests-population-sample)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/population-sample} 

}

\caption{母集団と標本}(\#fig:ttests-population-sample)
\end{figure}

推測統計の詳細については統計法の入門書を参照していただきたいと思いますが，母集団からその一部を標本として無作為抽出したとき，その標本がもつ値（平均値や分散など）は母集団のもつ値（母平均や母分散など）とは必ずしも一致しません。母集団の中から無作為に標本を抽出するということは，標本抽出のたびにそこからとり出される値が異なるということですから，同じ母集団から抽出された標本であっても，その平均値や分散は標本ごとにいくらか異なる値になるためです。

<!-- -->

もちろん，標本ごとに平均値や分散が異なるとはいえ，まったくでたらめに異なるわけではなく，そこには確率的な法則性が存在します。たとえば，平均値0，分散1で正規分布する母集団から無作為抽出された標本の平均値は0に近い値になる場合がほとんどで，10や\(-\textsf{8}\)といった値になることは確率的にごくまれです。統計的仮説検定では，こうした母集団と標本の間の確率的な関係を利用しながら，母集団の特徴について判断を行うのです。

<!-- -->

対応なしt検定では，「両母集団の平均値は同じである（母集団間の平均値の差は0である）」という仮説（*帰無仮説*）についての検討を行います。もし2つの母集団（2つのグループ）の平均値が同じであるならば，そこからそれぞれ別々に抽出された標本の平均値もほぼ同じ値になるはずです。にもかかわらず，2グループの標本の平均値が大きく異なっていたとしたら，それは「両母集団の平均値は同じ」という仮説自体に無理があるということになるでしょう。

<!-- -->

このような考え方に基づいて，対応なしt検定では，2標本の平均値の差が帰無仮説のもとではあり得ないほど大きなものである場合に帰無仮説を*棄却*します。このとき，この「あり得なさ」の判断基準となるのが*有意確率*（*p*）です。このp値は，「帰無仮説が正しい」場合に手元の標本における平均値の差と同じかそれより大きな差が得られる確率を示しており，この値が*有意水準* *α*（一般には0.05）より小さい場合に，帰無仮説が正しくない（つまり2グループの平均値に*有意差*がある）と判断します。

### 分析手順 {#subsec:ttests-independent-analysis}

ここでは次のサンプルデータ（[ttests_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/ttests_data01.omv)）を用いて対応なしt検定の実施方法について見ていきましょう。このデータに含まれている変数は次のとおりです（図\@ref(fig:ttests-data01)）。データファイルには，グループ1とグループ2のそれぞれ20名ずつ，計40名の課題得点データが含まれています。




\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/data01} 

}

\caption{サンプルデータ}(\#fig:ttests-data01)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象者のID
* `グループ`　対象者のグループ（`1`または`2`）
* `得点`　対象者の課題得点
:::



それでは，グループ1とグループ2で，課題得点の平均値に差があるといえるかどうかを検定してみましょう。対応なしt検定を行うには，Analysesタブの「\infig{analysis-ttest.pdf} T-Tests」から「Independent Samples T-Test（対応なしt検定）」を選択します（図\@ref(fig:ttests-independent-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/independent-menu} 

}

\caption{対応なしt検定の実行}(\#fig:ttests-independent-menu)
\end{figure}

すると，図\@ref(fig:ttests-independent-analysis)のような画面が表示されます。設定項目がたくさんあるので，まずは全体的な構成を見ておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/independent-analysis} 

}

\caption{対応なしt検定の分析設定画面}(\#fig:ttests-independent-analysis)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Dependent Variables（従属変数）　分析対象の変数を指定します。
+ Grouping Variable（グループ変数）　グループの別が入力されている変数を指定します。
+ **Tests**（検定）　分析に用いる検定のタイプを指定します。
+ **Hypothesis**（仮説）　検定に用いる仮説を選択します。
+ **Missing values**（欠損値）　データに欠損値が含まれている場合の対処方法を指定します。
+ **Additional Statistics**（追加の統計量）　一般的な分析結果に加えて算出したい統計量を指定します。
+ **Assumption Checks**（前提チェック）　検定に必要な前提条件が満たされているかどうかの確認を行います。
:::

この分析で必ず設定する必要がある項目は「Dependent Variables（従属変数）」と「Grouping Variable（グループ変数）」の2つです。従属変数は検定対象になる平均値を算出する変数（サンプルデータでは「得点」），グループ変数は比較したいグループの分類基準となる変数（サンプルデータでは「グループ」）です。2つのグループの平均値の差について検定するわけですから，「グループ」と「得点」の指定が必要なのは当然でしょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/t-setting} 

}

\caption{対応なしt検定の分析設定}(\#fig:ttests-t-setting)
\end{figure}

<!-- -->
この2つを設定すると，すぐにそれが分析結果に反映されます（図\@ref(fig:ttests-t-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/t-resutls} 

}

\caption{対応なしt検定の分析結果}(\#fig:ttests-t-results)
\end{figure}


<!-- -->

結果の表の一番左（「得点」）は従属変数の名前，左から2番目は検定方法の名前です。対応なしt検定には*スチューデントの検定*と*ウェルチの検定*と呼ばれる2とおりの方法があり，ここに「Student's t」と示されていれば，それはスチューデントの検定の結果であるということを示しています。

その隣の「**Statistic**（統計量）」の列は検定統計量（ここでは*スチューデントのt*），その隣の「**df**」は*自由度*，「**p**」は有意確率（*p値*）です。このpが有意水準（一般にはα=0.05）より小さい場合に「差が有意」と判断します。ここで表示されている結果ではp=0.024ですから，グループ1と2の平均値の間には統計的に有意な差があるということになります。

さて，ほとんどの場合，これで「対応なしt検定」はおしまいです。拍子抜けするくらいに簡単ですね。

### 分析の詳細設定 {#sub:ttest-setting2}

先ほど見たように，jamoviを用いたt検定では設定らしい設定が不要で，分析の実行は驚くほど簡単なのですが，場合によっては分析設定の変更が必要になる場合があるかもしれません。そこで，ここでは対応なしt検定における設定の詳細について見ておくことにしましょう。

#### Test：検定{-#subsub:ttest-test2}

「**Test**（検定）」には，以下の項目が含まれています（図\@ref(fig:ttests-tests)）。ここでは，t検定における検定統計量の算出方法について設定を行います。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/tests} 

}

\caption{Test（検定）の設定項目}(\#fig:ttests-tests)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Student's（スチューデントの検定）　スチューデントの検定による検定結果を表示します。
  - Bayes factor（ベイズ因子）　帰無仮説と対立仮説の間でベイズ因子を算出します。
+ Welch's（ウェルチの検定）　ウェルチの検定による検定結果を表示します。
+ Mann-Whitney U（マン=ホイットニーのU）　マン=ホイットニーのU検定の結果を表示します。
:::


##### Student's：スチューデントの検定{-#subsub:ttest-student}

この項目がチェックされている場合，*スチューデントのt検定*を用いた検定結果が表示されます。スチューデントのt検定では，平均値の差について検討する2つの母集団は平均値だけでなく分散も等しいという仮定のもとで検定統計量を算出します。そのため，一般には「2つの母集団で分散が等しい」という仮定から大きく逸脱しないデータで検定する際の方法として使用されています。

この項目に含まれる「Bayes factor（*ベイズ因子*）」は，ベイズ統計の考え方を用いて仮説検定をする際に用いられる値です。この値は，*対立仮説*の確からしさと*帰無仮説*の確からしさを比で表したもので，この値が1の場合には帰無仮説と対立仮説の確からしさが同じであることを，1未満の場合には帰無仮説の方が，1より大きい場合には対立仮説の方が確からしいことを意味します。一般には，このベイズ因子の値が3.0以上である場合に，帰無仮説を棄却して対立仮説を採択します^[jamoviのt検定におけるベイズ因子は「対立仮説（H\(_1\)）：帰無仮説（H\(_0\)）」の比（BF\(_{10}\)）の形で示されています。「帰無仮説（H\(_0\)）：対立仮説（H\(_1\)）」の比（BF\(_{01}\)）として示されている場合には，ベイズ因子の値が0に近いほど対立仮説が確からしいことを意味します。]。

このベイズ因子の項目にある「Prior（事前値）」はベイズ因子の算出に使用されるもので，これは*事前分布*に関する設定値です。この値は初期値では「\(\sqrt{2}/2=0.707\)」に設定されています。ベイズ因子の算出にチェックを入れた場合，ベイズ因子の隣にその推定誤差（±%）も表示されます。

<!-- -->

##### Welch's：ウェルチの検定{-#subsub:ttest-welch}

スチューデントの検定では2つの母集団で分散が等しいという仮定を用いて検定統計量を算出しますが，*ウェルチのt検定*ではそうした前提を設けずに検定統計量を算出します。そのため，一般にこの方法は2つの母集団で分散が異なっている場合に用いられます。

ウェルチの検定の項目にチェックを入れた場合，結果の表では「Welch's t」の行にその分析結果が表示されます。ウェルチの検定では，多くの場合，自由度（df）が整数でなく，小数点以下の値を含んだものになります。

##### Mann-Whitney U：マン=ホイットニーのU{-#subsub:ttest-mann}

t検定は母集団の分布が正規分布であるという前提のもとで計算を行います。しかし実際のデータでは，このような前提が成り立たない場合，あるいは成り立つかどうかが不明な場合というのもあり得ます。

これに対し，*マン=ホイットニーのU検定*は，母集団の分布の形に特別な仮定を設けずに検定を行うため，正規分布でないようなデータであっても分析が可能になります。このような方法は，*ノンパラメトリック検定*と呼ばれます。

「Mann-Whitney U」にチェックを入れた場合，その結果は「Mann-Whitney U」の行に表示されます。

#### Hypothesis：仮説{-#subsub:ttest-hypothesis}

「**Hypothesis**（仮説）」には，次の項目が含まれています（図\@ref(fig:ttests-hypothesis)）。
<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/hypothesis} 

}

\caption{Hypothesis（仮説）の設定項目}(\#fig:ttests-hypothesis)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Group 1 ≠ Group 2　グループ1とグループ2で平均値が異なるかどうかを検定します（両側検定）
+ Group 1 &gt; Group 2　グループ1の平均値がグループ2の平均値より大きいかどうかを検定します（片側検定）
+ Group 1 &lt; Group 2　グループ1の平均値がグループ2の平均値より小さいかどうかを検定します（片側検定）
:::

ここでは検定に使用する対立仮説の設定を行います。一般に，t検定における対立仮説には「Group 1 ≠ Group 2」が用いられます。この対立仮説は，2つのグループで平均値が異なるということのみを示しており，グループ1とグループ2のどちらの平均値が大きいかまでは述べていません。この場合，グループ1の平均値がグループ2の平均値より大きくても小さくても検定結果が有意になります。このような検定方法は*両側検定*と呼ばれます。

これに対し，「Group 1 &gt; Group 2」はグループ1の平均値がグループ2より大きい場合のみ，「Group 1 &lt; Group 2」はグループ1の平均値がグループ2より小さい場合のみ検定結果が有意になります。このように，一方のグループの平均値がもう一方よりも大きいかどうかのみ，あるいは小さいかどうかのみを確かめる検定方法は*片側検定*と呼ばれます。

#### Missing values：欠損値{-#subsub:ttest-missing-values}

「**Missing values**（欠損値）」には，以下の項目が含まれています（図\@ref(fig:ttests-missing-values)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/missing-values} 

}

\caption{Missing values（欠損値）の設定項目}(\#fig:ttests-missing-values)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Exclude cases analysis by analysis（分析ごとに除外）
+ Exclude cases listwise（行全体を除外）
:::

ここでは，データに欠損値があった場合にどう対処するかについての設定を行います。この設定は，同時に複数の変数について平均値の検定を行う場合にのみ影響します。

###### Exclude cases analysis by analysis：分析ごとに除外{-}

ここで「Exclude cases analysis by analysis（分析ごとに除外）」を選択した場合，それぞれの検定において欠損値を分析から除外します。2種類の変数XとYについてグループ1とグループ2で平均値に差があるかどうかを検定している場合で，ある対象者のXの値が欠落している場合，Xの平均値の検定においてはその対象者のデータは分析から除外されますが，Yの平均値の検定でその対象者のデータが分析から除外されることはありません。

###### Exclude cases listwise：行全体を除外{-}

これに対し，「Exclude cases listwise」を選択した場合には，XまたはYのいずれかの値が欠落している対象者のデータは，XとYの両方の検定で分析から除外されます。

#### Additional Statistics：追加の統計量{-#subsub:ttest-additional-statistics}

「**Additional Statistics**（追加の統計量）」には，以下の項目が含まれています（図\@ref(fig:ttests-additional)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/additional} 

}

\caption{Additional Statistics（追加の統計量）の設定項目}(\#fig:ttests-additional)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Mean difference（平均値の差）　グループ間の平均値の差とその標準誤差を算出します。
  - Confidence interval（信頼区間）　平均値の差の信頼区間を算出します。
+ Effecr size（効果量）　平均値の差についての効果量を算出します。
  - Confidence interval（信頼区間）　効果量の信頼区間を算出します。
+ Descriptives（記述統計量）　従属変数について，グループごとの記述統計量を算出します。
+ escriptives plots（記述統計量のグラフ）　従属変数の平均値と中央値についてのグラフを作成します。
:::

##### Mean difference：平均値の差{-}

「Mean difference（平均値の差）」にチェックを入れると，2グループ間の平均値の差の値と，その標準誤差が表示されます。なお，t検定の検定統計量（t）は，この「グループ間の平均値の差」を標準誤差で割ることによって算出されます。

その下にある「Confidence interval（信頼区間）」にチェックを入れると，平均値の差の信頼区間（下限および上限）が算出されます。信頼区間の幅は初期設定では95%になっていますが，数値を変更すれば99%信頼区間などを算出することも可能です。

##### Effect size：効果量{-}

「Effect size（効果量）」にチェックを入れると，平均値の差についての効果量が算出されます。また，その下にある「Confidence interval（信頼区間）」にチェックを入れると，その効果量についての信頼区間が算出できます。なお，t検定に対する効果量としては「*コーエンのd*（Cohen's d）」が，マン=ホイットニーのU検定に対する効果量としては「*順位双列相関係数*（rank biserial correlation）」が算出されます。

平均値の検定で検定統計量として用いられるtは，「差の大きさ」を表す値ではありません。この値は平均値の差を標準誤差で割って求められますが，標準誤差は標本サイズが大きくなるほど小さくなるため，標本サイズの大きなデータを対象とした検定では，平均値の差が実質的に無意味なほど小さなものであっても結果が有意になる場合があるのです。

これに対し，コーエンのdという統計量は，平均値の差が標準偏差の何倍の大きさであるかを示した値です。標準誤差と違い，標準偏差は標本サイズの大小によって極端に変わるようなことがありません。そのため，どのような標本データに対しても「差の大きさ」を安定的に評価できるのです。このdの値（の絶対値）が大きいほど，平均値の差が大きいことを意味します。コーエンのdの大きさの解釈については，一般に表\@ref(tab:ttests-d-cohen)のような目安が用いられています。[APAの論文執筆マニュアル第7版](https://apastyle.apa.org/products/publication-manual-7th-edition)や[日本心理学会の論文執筆・投稿の手びき](https://psych.or.jp/manual/)に見られるように，近年では分析結果で効果量を示すよう求められることが多くなってきています。

\begin{table}[H]

\caption{(\#tab:ttests-d-cohen)効果量dの解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
dの値 & 効果の大きさ\\
\midrule
0.8 & 大\\
0.5 & 中\\
0.2 & 小\\
\bottomrule
\end{tabular}
\end{table}


なお，マン=ホイットニーのU検定の場合には効果量として*順位双列相関係数*という値が算出されます。これは，順序データと2値データの間の相関係数です。順位双列相関係数の解釈の仕方は，基本的にはピアソンの積率相関係数と同様です。

##### Descriptives：記述統計量{-}

「**Additional Statistics**」にある「Descriptives（記述統計量）」にチェックを入れると，分析対象の変数（従属変数）について，グループごとの平均値や標準偏差などの記述統計量が算出されます（図\@ref(fig:ttests-descriptives)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/descriptives} 

}

\caption{グループごとの記述統計量}(\#fig:ttests-descriptives)
\end{figure}

##### Descriptives plots：記述統計量のグラフ{-}
また，その下の「Descriptives plots（記述統計量のグラフ）」にチェックを入れると，グループごとの平均値および中央値が図\@ref(fig:ttests-desc-plot)のようなグラフで示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/desc-plot} 

}

\caption{グループごとの記述統計量のグラフ}(\#fig:ttests-desc-plot)
\end{figure}

#### Assumption Checks：前提チェック{-#subsub:ttest-assumption-checks}


「**Assumption Checks**（前提チェック）」には，以下の項目が含まれています（図\@ref(fig:ttests-assumption)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/assumption} 

}

\caption{前提チェック}(\#fig:ttests-assumption)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Homogeneity test（等質性検定）　分散の等質性についての検定を実施します。
+ Normality test（正規性検定）　分布の正規性についての検定を実施します。
+ Q-Q plot（Q-Qプロット）　正規Q-Qプロットを作成します。
:::

対応なしt検定では，分析対象となる母集団の分布についていくつかの仮定（前提）を設けることによって計算を効率化しているため，それらの前提を満たしていないデータに対しては分析結果の信頼性が低くなります。t検定の前提条件についての詳細は統計法の教科書などを参照してもらうこととして，ここではそれらのうち，jamoviの設定項目と関連する2つの前提について見ておきます。

##### Homogeneity test：等質性検定{-}

まず，1つ目の「Homogeneity test（等質性検定）」ですが，これは2つのグループで分散が等しいかどうかについて確かめるものです。スチューデントの検定では，2つのグループで分散が等しいことを前提として検定統計量を算出します。そのため，2群の分散が極端に異なる場合には，正確な検定結果を得ることができません。そこで，2つのグループで分散が極端に異ならないかどうかを検定するのがこの設定項目です。

この「Homogeneity test」にチェックを入れると，図\@ref(fig:ttests-levene)のような形で*ルビーン検定*と呼ばれる分散の等質性検定の結果が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/levene} 

}

\caption{分散の等質性検定}(\#fig:ttests-levene)
\end{figure}

この表の「F」の値は，2つのグループにおける分散の比で，この値が1であれば2群の分散が等しいことを，1より極端に大きければ，2群で分散が大きく異なることを意味します。一般には，このFについての有意確率（p）が0.05未満，または0.10未満の場合に2つのグループで分散が異なると判断します。この検定の結果が有意であった場合，スチューデントの検定の前提条件が満たされないことになりますので，その場合にはウェルチの検定を用いることになります。

##### Normality test：正規性検定{-}

前提チェックの2つ目の項目である「Normality test（正規性検定）」は，分析対象のデータが正規分布からかけ離れていないかどうかを確かめるものです。対応なしのt検定では，データの母集団が正規分布であることを前提としていますので，この前提が満たされない場合には，母集団に正規分布を仮定しないマン=ホイットニーのUなどのノンパラメトリックな手法を用いる必要があります。

そこでjamoviでは，*シャピロ=ウィルク検定*と呼ばれる手法を用いて正規性の検定を行います。この検定は，「標本データは正規分布する母集団から無作為抽出されたものである」という帰無仮説について検定を行います。一般に，この分析結果のp値が0.05未満の場合に，データの母集団が正規分布でないとみなします（図\@ref(fig:ttests-normality)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/normality} 

}

\caption{正規性検定}(\#fig:ttests-normality)
\end{figure}

##### Q-Q plot：Q-Qプロット{-}

前提チェックの3つ目の項目である「Q-Q plot（Q-Qプロット）」は，標本データが正規分布からかけ離れていないかどうかを視覚的に確認するための手法です。正規分布する母集団から無作為抽出された標本は，母集団と同じく正規分布になるという数学的な性質がありますので，標本データが正規分布からかけ離れている場合には，母集団の分布も正規分布でない可能性が高まります。

「Q-Q plot」の項目にチェックを入れると，出力ウィンドウに次のようなグラフが表示されます。このQ-Qプロットと呼ばれる図では，横軸に理論的な分位数，縦軸に標準化残差をとって，各測定値をグラフ上にプロットします。このとき，データが正規分布している場合には，すべての測定値は直線上に並ぶことになります。そのため，このQ-Qプロットで各測定値を示す点が直線から極端に離れていなければ，標本データはほぼ正規分布しているということになり，その母集団も正規分布である可能性が高まります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/qqplot} 

}

\caption{Q-Qプロット}(\#fig:ttests-qqplot)
\end{figure}


例題データの場合，両端のデータ点が直線からやや外れた位置にありますが，それ以外はほぼ直線上にあるので，正規分布から極端に離れていることはなさそうです。

## Paired Samples T-Test：対応ありt検定{#sec:ttests-paired}

今度は対応ありt検定について見ていきましょう。対応ありt検定は，2種類の測定値の間に明確なペアが存在する場合に，その母集団の平均値に統計的な差があるといえるかどうかを確かめるのに使用されます（図\@ref(fig:ttests-paired-t)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/paired-t} 

}

\caption{対応ありt検定}(\#fig:ttests-paired-t)
\end{figure}


この検定が用いられる典型的な場面は，ある処置を行う前後で平均値に差があるかどうかを確かめるというものです。この場合，それぞれの対象者について処置前と処置後の2回の測定を行いますので，同じ対象者の測定値同士で前後の比較を行うことができます。このように，2つのグループ（処置前と処置後）の測定値の間で特定のペアが成立するデータを一般に「対応ありデータ」と呼びます。

### 考え方 {#subsec:ttests-paired-basics}

対応なしのt検定の場合と異なり，対応ありのt検定では対象者ごとに2つの条件における測定値の差を求め，その「測定値の差の平均値」を用いて検定を行います。2つの条件（処置前と処置後など）に違いがなければ，どちらの条件の測定値も同じような値になるはずで，その場合，2条件の測定値の差の平均値は0に近い値になります。このような考えから，対応ありt検定では，2条件の測定値の差の平均値が0であるといえるかどうかを確かめます。

### 分析手順 {#subsec:ttests-paired-analysis}

ここでは次のサンプルデータ（[ttests_data02.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/ttests_data02.omv)）を用いて対応ありt検定の実施方法を見ていきましょう。このデータは，20名の参加者を対象に，効率的な記憶法の訓練前と訓練後における記憶課題の成績を測定したものです。このデータファイルには，次の3つの変数値が格納されています（図\@ref(fig:ttests-data02)）。




\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/data02} 

}

\caption{サンプルデータ}(\#fig:ttests-data02)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象者のID
* `訓練前`　訓練前の記憶課題成績
* `訓練後`　訓練後の記憶課題成績
:::

それでは，訓練前と訓練後で，記憶課題成績の平均値に差があるといえるかどうかを検定してみましょう。対応ありt検定を行うには，Analysesタブの「\infig{analysis-ttest.pdf}  T-Tests（t検定） 」から「Paired Samples T-Test（対応ありt検定）」を選択します（図\@ref(fig:ttests-paired-t-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/paired-t-menu} 

}

\caption{対応ありt検定の実行}(\#fig:ttests-paired-t-menu)
\end{figure}

すると，図\@ref(fig:ttests-paired-setting)のような画面が表示されます。設定項目がたくさんありますが，そのほとんどは対応なしt検定の場合と同じです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/paired-setting} 

}

\caption{対応ありt検定の分析設定画面}(\#fig:ttests-paired-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Paired Variables（変数ペア）　分析対象の変数ペアを指定します
+ **Tests**（検定）　分析に用いる検定を指定します
+ **Hypothesis**（仮説）　検定に用いる仮説を選択します
+ **Missing values**（欠損値）　データに欠損値が含まれている場合の対処方法を指定します
+ **Additional Statistics**（追加の統計量）　一般的な分析結果に加えて算出したい統計量を指定します
+ **Assumption Checks**（前提チェック）　検定に必要な前提条件が満たされているかどうかの確認を行います
:::

この分析で必ず設定する必要がある項目は「Paired Variables（変数ペア）」のみです。変数ペアには，分析対象となる変数のペアを指定します。サンプルデータの場合，「訓練前」と「訓練後」の差について検定したいので，この2つを「Paired Variables」欄に移動します。

このとき，「訓練前」と「訓練後」を1つずつ「Paired Variables」欄に移動することもできますが，2つまとめて移動させる方がわかりやすいでしょう。まずどちらか一方の変数名をクリックして選択した後，「SHIFT(⇧)」キーを押しながらもう一方の変数名をクリックすると2つの変数を同時に選択することができますので，その状態で「\infig{action-forward.pdf}」をクリックして変数ペアの設定を行います（図\@ref(fig:ttests-paired-variables)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/paired-variables} 

}

\caption{変数ペアの設定}(\#fig:ttests-paired-variables)
\end{figure}

対応なしt検定の場合と同様に，この設定だけで基本的な分析結果が得られます（図\@ref(fig:ttests-paired-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/paired-results} 

}

\caption{対応ありt検定の分析結果}(\#fig:ttests-paired-results)
\end{figure}

変数名の代わりに変数ペアが表示されること以外は，分析結果の表も対応なしt検定の場合と同じです。この分析結果では，有意確率pの値が「<.001（0.001未満）」となっていますので，検定結果は有意，つまり記憶法の訓練前後で平均値に有意な差があるということになります。


なお，検定統計量は変数ペアの左側の変数から右側の変数の値を引いて算出されています（サンプルデータの場合は「訓練前 &minus; 訓練後」）。両側検定の場合，検定結果が有意かどうかは統計量の絶対値で判断しますので問題ありませんが，片側検定の場合，この統計量がどちらからどちらを引いた値に基づくものであるのかに注意が必要になります。

なお，分析の設定項目は，「**Tests**（検定）」の部分を除いて対応なしt検定の場合と同じです。重複する部分については説明を省略します。

#### Tests：検定{-#subsub:ttest-test}

対応ありt検定の「**Tests**（検定）」には以下の項目が含まれています（図\@ref(fig:ttests-paired-test)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/paired-test} 

}

\caption{Test（検定）の設定項目}(\#fig:ttests-paired-test)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Student's（スチューデントの検定）　スチューデントの検定による検定結果を表示します。
  - Bayes factor（ベイズ因子）　帰無仮説と対立仮説の間でベイズ因子を算出します。
+ Wilcoxon rank（ウィルコクソン符号順位検定）　ウィルコクソン符号順位検定の結果を表示します。
:::

「**Tests**」の項目もほとんどは対応なしのt検定と同じですが，対応ありt検定の場合，t検定の計算方法は*スチューデントの検定*のみになります。また，この場合のノンパラメトリック検定には，*ウィルコクソン符号順位検定*と呼ばれる検定手法が用いられます。

それ以外の項目は，すべて対応ありt検定の場合と同じですので，詳細については対応なしt検定のところを参照してください。

なお，スチューデントの検定について「**Additional Statistics**（追加の統計量）」で効果量を算出した場合は，対応なしt検定の場合と同様にコーエンのdが，ウィルコクソン符号順位検定について効果量を算出した場合，マン=ホイットニーの検定の場合と同様に*順位双列相関係数*（rank biserial correlation）が表示されます。

## One Sample T-Test：1標本t検定{#sec:ttests-one}

最後に1標本のt検定です。1標本t検定は，ある母集団の平均値と特定の値の間に差があるかどうかを確かめたい場合の検定方法です（図\@ref(fig:ttests-one-sample)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-sample} 

}

\caption{1標本t検定}(\#fig:ttests-one-sample)
\end{figure}

この検定は，あるテストにおける母平均が50点になっているかどうかを確かめたい場合，手元の標本が想定する母集団（平均値100の母集団など）から抽出されたものであるといえるかどうかを確かめたい場合などに用いられます。

### 考え方 {#subsec:ttests-one-basics}

ある母集団から無作為抽出された標本の平均値は，確率的には元の母集団の平均値と同じ値（実際には母集団の平均値周辺の値）になるという性質があります。つまり，平均値が50の母集団から抽出された標本では，その標本の平均値は50，平均値が100の母集団から抽出された標本では，その標本の平均値は100またはその周辺の値になるのです。


この関係を利用して，ある1つの標本について，その母集団の平均値についての検討を行うのがこの1標本t検定です。もし，標本の平均値が51などの値であれば，その標本が平均値50の母集団から抽出されたものである可能性は高いといえるでしょう。しかし，標本の平均値が150の場合，そのような平均値をもつ標本が平均値50の母集団から抽出されたとは考えにくくなります（図\@ref(fig:ttests-one-sample-basic)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-sample-basic} 

}

\caption{母集団の平均値と標本の平均値の関係}(\#fig:ttests-one-sample-basic)
\end{figure}


### 分析手順 {#subsec:ttests-one-analysis}

ここでは次のサンプルデータ（[ttests_data03.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/ttests_data03.omv)）を用いて1標本t検定の実施方法を見ていきましょう（図\@ref(fig:ttests-data03)）。





\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/data03} 

}

\caption{サンプルデータ}(\#fig:ttests-data03)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象者のID
* `得点`　対象者の課題得点
:::


このデータには，20名の対象者について，ある課題の得点が入力されています。この標本の母集団において，課題得点の平均値が50点であるといえるかどうかを確かめたいとしましょう。

1標本t検定を行うには，Analysesタブの「\infig{analysis-ttest.pdf}  T-Tests（t検定）」から「One T-Test（1標本t検定）」を選択します（図\@ref(fig:ttests-one-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-menu} 

}

\caption{1標本t検定の実行}(\#fig:ttests-one-menu)
\end{figure}

すると，図\@ref(fig:ttests-one-setting)のような画面が表示されます。設定項目がたくさんありますが，そのほとんどは対応ありt検定のものと同じです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-setting} 

}

\caption{1標本t検定の分析設定画面}(\#fig:ttests-one-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Dependent Variables（従属変数）　分析対象の変数を指定します。
+ **Tests**（検定）　分析に用いる検定を指定します。
+ **Hypothesis**（仮説）　検定に用いる仮説を選択します。
+ **Missing values**（欠損値）　データに欠損値が含まれている場合の対処方法を指定します。
+ **Additional Statistics**（追加の統計量）　一般的な分析結果に加えて算出したい統計量を指定します。
+ **Assumption Checks**（前提チェック）　検定に必要な前提条件が満たされているかどうかの確認を行います。
:::


設定画面で対応ありt検定と異なっている部分は**Hypothesis**（仮説）欄だけです（図\@ref(fig:ttests-one-hypothesis)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-hypothesis} 

}

\caption{仮説の設定}(\#fig:ttests-one-hypothesis)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Test value（検定値）　比較したい値を指定します。
+ ≠ Test value　平均値が検定値と異なるかどうかを検定します（両側検定）
+ &gt; Test value　平均値が検定値より大きいかどうかを検定します（片側検定）
+ &lt; Test value　平均値が検定値より小さいかどうかを検定します（片側検定）
:::


では分析の設定を行いましょう。まず，「得点」を「Dependent Variables（従属変数）」に設定します（図\@ref(fig:ttests-one-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-set-var} 

}

\caption{分析変数の設定}(\#fig:ttests-one-set-var)
\end{figure}


次に，比較対象の値を設定します。今回のサンプルデータでは，平均値が50点といえるかどうかを確かめたいので，「**Hypothesis**（仮説）」にある「Test value（検定値）」の値を50に設定します（図\@ref(fig:ttests-one-test-value)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-test-value} 

}

\caption{検定値の設定}(\#fig:ttests-one-test-value)
\end{figure}

従属変数と検定値の設定が終わると，出力ウィンドウの結果は図\@ref(fig:ttests-one-results)のようになっているはずです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-results} 

}

\caption{対応ありt検定の分析結果}(\#fig:ttests-one-results)
\end{figure}

表示される結果は対応なしt検定や対応ありt検定の場合とほぼ同じですが，表の下に「H\(_\text{a}\) population mean ≠ 50」という検定仮説に関する注釈がつけられている点が異なります。これは，「母集団の平均値が50でない」という対立仮説のもとで検定を行ったことを示しています。1標本t検定では分析者が指定した検定値を用いて検定を行うため，その情報がここに表示されているのです。

この分析結果では，有意確率pが0.002と小さな値ですので，「差が有意（母集団の平均値は50でない）」が分析結果になります。

### 1標本t検定と対応ありt検定 {#sub:ttest-one-paired}

この1標本t検定は，対応ありt検定と関係が深い分析手法です。対応ありt検定では，2つのグループ間でペアとなる測定値の差を求め，その測定値の差の平均値が0であるかどうかを検定します。このとき，「ペアとなる測定値の差」そのものを一種の測定変数とみなすと，これは「測定値の差」という変数の平均値が0であるかどうかを検定していることになり，1標本t検定とまったく同じになるのです。つまり，対応ありt検定は1標本t検定の特殊ケースなのです。

そのことをここで確かめておきましょう。対応ありt検定のところで使用したサンプルデータ（[ttests_data02.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/ttests_data02.omv)）を再度開いてください（図\@ref(fig:ttests-data02a)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/data02} 

}

\caption{対応ありt検定のサンプルデータ}(\#fig:ttests-data02a)
\end{figure}

データファイルを開いたら，「変化量」という名前の計算変数を作成し，そこに記憶訓練実施前の得点（「訓練前」）と実施後の得点（「訓練後」）の差を格納しましょう。まず，Dataタブの「Variables」にある「\infig{menu-variable-add.pdf} Add（変数の追加）」ボタンから「Computed Variable（計算変数）」の「\infig{menu-computed-append.pdf} Append」を選択して新たに計算変数を追加します（図\@ref(fig:ttests-append-compvar)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/append-compvar} 

}

\caption{計算変数を追加}(\#fig:ttests-append-compvar)
\end{figure}


次に，作成した計算変数の変数名の部分「\infig{variable-nominal.pdf} D」をダブルクリックして，変数設定画面を表示します。変数名を「変化量」に変更し，計算式の部分に「`訓練前 - 訓練後`」と入力してください。マイナス記号（`-`）を入力する際は，日本語入力がオフになっていることを確認しましょう（図\@ref(fig:ttests-set-compvar)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/set-compvar} 

}

\caption{計算変数の設定}(\#fig:ttests-set-compvar)
\end{figure}

入力を確定して変数設定画面を閉じると，「訓練前」と「訓練後」の差が「変化量」に入力されていることがわかります（図\@ref(fig:ttests-compvar-diff)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/compvar-diff} 

}

\caption{作成したDIFF変数}(\#fig:ttests-compvar-diff)
\end{figure}


変数の作成が完了したら，Analysesタブの「\infig{analysis-ttest.pdf} T-Tests」から「One Sample T-Test」を選択します（図\@ref(fig:ttests-diff-one)
）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/diff-one} 

}

\caption{1標本t検定を実行}(\#fig:ttests-diff-one)
\end{figure}


設定画面で，先ほど作成した「変化量」をDependent Variables（従属変数）に設定します（図\@ref(fig:ttests-diff-one-setting)
）。対応ありt検定では，2グループの差の平均値が0であるかどうかについての検定を行いますので，「**Hypothesis**」の「Test value」は0のままで構いません。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/diff-one-setting} 

}

\caption{分析の設定}(\#fig:ttests-diff-one-setting)
\end{figure}


設定が完了すると，分析結果は図\@ref(fig:ttests-one-paired-results)
の「One Sample T-Test」の部分のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ttests/one-paired-results} 

}

\caption{分析結果}(\#fig:ttests-one-paired-results)
\end{figure}

この結果と，「訓練前」と「訓練後」の間で対応ありt検定を行った場合の結果（Paired Samples T-Test）を見比べてみてください。「変化量」の部分が「訓練前　訓練後」になっていることを除けば，他はすべて同じですね。このように両者で結果が同じになるのは，対応ありt検定が「訓練前」と「訓練後」の差で構成された1標本データについて，その母集団の平均値が0と異なるかどうかを確かめているのと同じことだからなのです。



<!--chapter:end:05-t-tests.Rmd-->



# ANOVA：分散分析 {#ch:ANOVA}


「\infig{analysis-anova.pdf}  ANOVA（分散分析）」は，3つの平均値について同時に検定する際に使用される分析ツールです。jamoviの基本構成では，ここには次の分析メニューが含まれています（図\@ref(fig:ANOVA-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/menu} 

}

\caption{ANOVA（分散分析）のメニュー}(\#fig:ANOVA-menu)
\end{figure}

:::{.jmvmenu data-latex=""}
+ One-Way ANOVA（1要因分散分析） 
+ ANOVA（分散分析） 
+ Repeated Measures ANOVA（反復測定分散分析） 
+ ANCOVA（共分散分析） 
+ MANCOVA（多変量共分散分析） 
+ **Non-Parametric**（ノンパラメトリック検定）
  - One-Way ANOVA [Kruskal-Wallis]（1要因分散分析：クラスカル=ウォリス検定） 
  - Repeated Measures ANOVA [Friedman]（反復測定分散分析：フリードマン検定） 
:::

*分散分析*は，心理学では実験データの分析の際に非常によく用いられています。t検定と合わせて，平均値の分析においては必須ともいえる分析手法です。英語では，*AN*alysis *O*f *VA*riance（分散の分析）を省略した*ANOVA*という表現がよく用いられます。

jamoviの分散分析メニューには，ノンパラメトリックな手法によるものも含め，さまざまなタイプの分散分析が含まれています。

## One-Way ANOVA：1要因分散分析{#sec:ANOVA-oneway}



分散分析にはさまざまなタイプのものがあるのですが，その中でもっとも単純なものが1要因分散分析です。1要因分散分析の「要因」とは，平均値に影響を与えると考えられる要素のことです。

たとえば，ある性格特性について男女で平均値に差があるかどうかを検討したいとします。その場合には，対象者の「性別」が「要因」に相当します。同様にして，ある技能について幼稚園児と小学校低学年，中学年の児童の間で比較したい場合には，対象児の「年齢（学年）」が「要因」ということになります。

1要因分散分析とは，このような要因を1種類だけ用いた分散分析のことです。分析に2つの要因（たとえば性別と学年）を用いる場合には，2要因分散分析，3つの要因（性別と学年，地域など）を用いるなら3要因分散分析です。要因の数が1つであっても複数であっても基本的には同じように分析が可能なのですが，jamoviでは1要因分散分析については個別に分析メニューが用意されていますので，まずはこの1要因分散分析のメニューを用い，分散分析の基本について見ていくことにします。

### 考え方 {#sub:ANOVA-oneway-basics}

ここでは，次のサンプルデータ（[anova_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data01.omv)）を用いて分散分析の基本的な考え方について見ていくことにしましょう（図\@ref(fig:ANOVA-data01)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data01} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data01)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　実験参加者のID
+ `条件`　文字条件（なし，不一致，一致）
+ `得点`　課題の成績（最低0&ndash;最高50）
:::

このデータファイルには，ある実験における認知課題の成績が記録されています。この実験では，イヌとネコの写真を1枚ずつ左右に並べてPC画面に表示し，そのうちの「ネコ」の写真が呈示されたほうのボタンをできるだけ素早く押してもらうという課題を行いました。その際，実験条件として，ネコの写真の下に「ネコ」，イヌの写真の下に「イヌ」と表示する条件（一致条件），ネコの写真の下に「イヌ」，イヌの写真の下に「ネコ」と表示する条件（不一致条件），文字は表示せず，写真だけを呈示する条件（文字なし条件）の3条件で測定を行っています。

この実験では，3つの測定条件それぞれについて25名，合計75名の参加者からデータを収集しました。データファイルの「条件」は実験条件，「得点」はこの課題成績を0点から50点の範囲になるように得点化した値です。ここでは，実験条件によって成績の平均値に差が見られるかどうかについて確かめたいとします。

まず手始めに，実験条件ごとの平均値と標準偏差を算出してみましょう。Analysesタブの「\infig{analysis-descriptives.pdf} Exploration」から「Descriptives（記述統計）」を選択して実行し，「Variables（変数）」欄に「得点」を，「Split by（グループ変数）」に「文字」を指定してください（図\@ref(fig:ANOVA-oneway-descriptives)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-descriptives} 

}

\caption{まずは記述統計から}(\#fig:ANOVA-oneway-descriptives)
\end{figure}

設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Statistics}}（統計量）の部分で不要な指標のチェックを外し，平均値（Mean）と標準偏差（Std. deviation）だけを表示させると図\@ref(fig:ANOVA-oneway-means)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-means} 

}

\caption{各条件の平均値と標準偏差}(\#fig:ANOVA-oneway-means)
\end{figure}

そしてこの結果を，標準偏差を誤差線としてグラフに示すと図\@ref(fig:ANOVA-oneway-means-plot)のようになります。このグラフはjamoviではなく別のソフトウェアで作成したものですが，このようにしてグラフに示すと，各測定条件の間で平均値にばらつきがありそうだということだけでなく，それぞれの条件においても測定値にばらつきがあることがわかります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-means-plot} 

}

\caption{各条件の平均値と標準偏差のグラフ}(\#fig:ANOVA-oneway-means-plot)
\end{figure}

この，それぞれのグループ内での測定値のばらつきは，同じ実験条件内におけるばらつきなわけですから，実験条件の違いからは説明できません。これらは，実験条件とは別の要因（個人差や測定誤差など）によって生じている一種の誤差と考えられます。

ここで，もし実験条件の違いによる平均値のばらつきがグループ内の測定値のばらつきよりも小さかったとすると，実験条件による平均値の差は誤差と変わらない，つまり大した違いではなということになります。そうでなく，実験条件による平均値の差が誤差と考えられるグループ内のばらつきよりも十分大きな場合には，実験条件によって平均値が大きくばらついている，つまり実験条件の違いによって平均値に差があると考えられるわけです。

このように，分散分析はじつは平均値そのものについて検定しているわけではありません。条件間での平均値のばらつきが，グループ内での測定値のばらつき（誤差）より大きいといえるかどうかを検定しているのです。この分析が「分散分析」と呼ばれるのは，このようにして平均値や誤差のばらつき（分散）を用いて分析を行うためです。

なお，t検定の場合と同様に，分散分析にも対応なしの場合と対応ありの場合とがありますが，ここではまず，対応なしのデータを用いた分散分析について見ていくことにします。

### 分析手順 {#sub:ANOVA-oneway-procedure}

それでは分析手順を見てみましょう。分析の実行には，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」から「One-Way ANOVA（1要因分散分析）」を選択します（図\@ref(fig:ANOVA-oneway-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-menu} 

}

\caption{1要因分散分析の実行}(\#fig:ANOVA-oneway-menu)
\end{figure}

1要因分散分析の設定画面は次のようになっています（図\@ref(fig:ANOVA-oneway-settings)）。詳細については，後ほど個別に見ていくとして，ここではまず，大きな部分の構成だけを見ておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-settings} 

}

\caption{1要因分散分析の設定画面}(\#fig:ANOVA-oneway-settings)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Dependent Variables（従属変数）　分析対象の測定値が入力されている変数を指定します。
+ Grouping Variable（グループ変数）　グループの値が入力されている変数を指定します。
+ **Variances**（分散）　分析における分散の扱い方について設定します。
+ **Missing Values**（欠損値）　欠損値の処理方法について設定します。
+ **Additional Statistics**（追加の統計量）　記述統計量の算出と表示に関する設定を行います。
+ **Assumption Checks**（前提チェック）　分散分析の前提が満たされているかどうかを確かめます。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post Hoc Tests}}（事後検定）　分散分析の事後検定に関する設定を行います。
:::

1要因分散分析の基本設定は，対応なしt検定の場合とよく似ています。分析対象の測定値が入った変数を「Dependent Variables（従属変数）」の欄に，グループの別が入力されている変数を「Grouping Variable（グループ変数）」の欄に移動すれば，基本的な分析は終了です（図\@ref(fig:ANOVA-oneway-setvar)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-setvar} 

}

\caption{1要因分散分析の分析設定}(\#fig:ANOVA-oneway-setvar)
\end{figure}


すると，図\@ref(fig:ANOVA-oneway-results)のような形で分析結果が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-results} 

}

\caption{1要因分散分析の結果}(\#fig:ANOVA-oneway-results)
\end{figure}

分散分析では，F分布と呼ばれる確率分布を利用して検定を行います。このFは，2つの分散の比に関する分布です。分散分析では，各条件の平均値の差（これを*主効果*といいます）の分散が誤差の分散の何倍の大きさかという形で検定統計量Fを算出します。そのため，主効果の分散の自由度（**df1**）と誤差の分散の自由度（**df2**）という，2種類の自由度が結果に表示されるのです。

表の右端の「**p**」は，このFの値についての有意確率です。このpの値が有意水準よりも小さければ条件間の平均値の分散が誤差の分散よりも有意に大きい（条件間で平均値に差がある）とみなします。

この分析結果では，有意確率は「p<.001」ですので，検定結果は有意です。つまり，実験条件によって課題成績の平均値に差があるというのが分析結果です。

### 分析の詳細設定{#sub:ANOVA-oneway-details}

対応なしt検定の場合と同様に，1要因分散分析も基本的な分析方法は非常に簡単なのですが，適切な結果を得るためには，この分析においてどのような設定が可能であるのかを知っておく必要があるでしょう。ここでは，1要因分散分析における分析設定の詳細について見ておくことにします。

#### Variances：分散{-}

分析設定画面の「**Variances**（分散）」には，次の2つの項目が含まれています。

:::{.jmvsettings data-latex=""}
- Don'tassume equal (Welch's)　各グループの分散が等しいと想定しない形で分析を行います（ウェルチの検定）
- Assume equal (Fisher's)　各グループで分散が等しいという仮定の元に分析を行います（フィッシャーの検定）
:::

この設定項目は，分析において各条件の分散をどう扱うかについての設定です。

対応なしt検定でも，2群で分散が等しいという仮定をおくか（*スチューデントの検定*），そのような仮定をおかないか（*ウェルチの検定*）という選択肢がありましたが，これは分散分析においても同様です。分散分析はイギリスの統計学者フィッシャーによって開発された手法ですが，この方法は各条件で分散が等しいことを前提としています。一般的な心理統計法の教科書で説明される分散分析はこちらの方法です。これに対し，ウェルチによる修正法ではそのような前提は必要としません。jamoviでは，この2つの方法のどちらを用いるかを選択することができます。

##### Don't assume equal (Welch's)：ウェルチの検定{-}

この設定項目で「Don'tassume equal (Welch's)（等分散を仮定しない：ウェルチの検定）」にチェックを入れると，各条件で分散が等しいという前提をおかない形で分析を行った結果が表示されます。jamoviの分散分析では初期設定値ではこちらの方法が選択されていますので，先ほど見た結果の表にも「One Way ANOVA (Welch's)」というように，ウェルチの方法を用いて分析したことが示されていました。

##### Assume equal (Fisher's)：フィッシャーの検定{-}

もう一方の「Assume equal (Fisher's)（等分散を仮定：フィッシャーの検定）」にチェックが入っている場合は，各条件の分散が等しいという前提のもとで分散分析を行った結果が表示されます。

この2つの方法で分析結果を比較して見てみると，検定統計量Fの値や誤差の自由度の値がかなり異なっているのがわかります（図\@ref(fig:ANOVA-oneway-fisher-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-fisher-results} 

}

\caption{1要因分散分析の結果}(\#fig:ANOVA-oneway-fisher-results)
\end{figure}

適切な分析結果を得るためには，この2つの方法のどちらを用いるべきかをしっかり見極めなくてはなりません。

#### Missing Values：欠損値{-}

設定画面の「**Missing Values（欠損値）**」には，次の2つの項目が含まれています。

:::{.jmvsettings data-latex=""}
+ Exclude cases analysis by analysis（分析ごとに除外）
+ Exclude cases listwise（行全体を除外）
:::

これらはいずれも対応なしt検定のところで説明したものと同じですので，ここでは説明を省略します。詳細については対応なしt検定（第\@ref(ch:ttests)章）の「[Missing values（欠損値）](#subsub:ttest-missing-values)」のところを参照してください。

#### Additional Statistics：追加の統計量{-}

この「**Additional Statistics**（追加の統計量）」では，各条件の記述統計量を表に示すか，図に示すかを設定することができます。

:::{.jmvsettings data-latex=""}
+ Descriptives table（記述統計量の表）
+ Descriptives plots（記述統計量の図）
:::

ここで「Descriptives table（記述統計量の表）」にチェックを入れると記述統計量が表に，「Descriptives plots（記述統計量の図）」にチェックを入れると記述統計量が図に示されます（図\@ref(fig:ANOVA-oneway-additional-statistics)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-additional-statistics} 

}

\caption{追加の統計量の設定}(\#fig:ANOVA-oneway-additional-statistics)
\end{figure}

この設定で作成される記述統計量の表には，各条件の標本サイズ，平均値，標準偏差と平均値の標準誤差が示されます。また，記述統計量の図には，各条件の平均値と95%信頼区間が示されます。

#### Assumption Checks：前提チェック {-}

設定画面の「**Assumption Checks（前提チェック）**」には，次の3つの項目が含まれています。

:::{.jmvsettings data-latex=""}
+ Homogeniety test（等質性検定）　分散の等質性についての検定を行います。
+ Normality test（正規性検定）　データの正規性についての検定を行います。
+ Q-Q Plot（Q-Qプロット）　正規Q-Qプロットを作成します。
:::

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-assumption-checks} 

}

\caption{前提チェック}(\#fig:ANOVA-oneway-assumption-checks)
\end{figure}

##### Homogeneity test：等質性検定{-}

先ほど「**Variances**（分散）」の設定のところでも触れたように，フィッシャーの方法による分散分析では，各条件で分散が等しいことが前提条件の1つとなっています。そこで「Homogeniety test（等質性検定）」では，ルビーン検定を用いて分散の等質性についての検定を行います。この検定では，「分散が等しい」ことを帰無仮説としているので，p値が有意水準を下回る場合には，分散が有意に異なるという結論になります（図\@ref(fig:ANOVA-oneway-assumption-checks)）。分散が有意に異なる場合には，フィッシャーの方法による分散分析では適切な結果が得られない可能性が高くなります。

##### Normlity test：正規性検定{-}

また，分散分析においても，t検定と同様にデータが正規分布にそっていることが前提となっています。この前提を満たしているかどうかを確認する方法として，jamoviではシャピロ=ウィルク検定とQ-Qプロットの2とおりが提供されています。シャピロ=ウィルク検定については記述統計やt検定のところで説明しているのでここでは詳しく触れませんが，この検定結果の有意確率pが有意水準を下回っている場合には，データの分布が正規分布からかけ離れていることが示唆されます。

##### Q-Q Plot：Q-Qプロット{-}

正規Q-Qプロットについても，これまで記述統計やt検定のところで説明してきているのでここでは詳しく触れません。この図のデータ点が右肩上がりの直線上に並んでいる場合にはデータが正規分布からかけ離れていないことが，そうでない場合には正規分布からかけ離れていることが示唆されます。これらの分析の結果，データが正規分布からかけ離れていることが示唆される場合には，ノンパラメトリック検定の使用を検討したほうがよいでしょう。


### Post-Hoc Tests：事後検定{#sub:ANOVA-oneway-posthoc}

分散分析では，条件の違いによって生じる平均値のばらつきが誤差による測定値のばらつきよりも大きいかどうかを検定しています。そのため，分散分析の結果が有意であった場合，条件によって平均値が異なる場合があるということはわかっても，どの条件とどの条件の間に差があるのかまではわかりません。

そこで，分散分析の結果が有意であった場合には，どの条件間に差があるのかを確かめるために*多重比較*と呼ばれる方法がとられるのが一般的です。多重比較では，3つあるいはそれ以上の条件の中から2つずつのペアを形成し，それぞれのペアについてt検定を行うという形で分析が行われます。ただし，そのままt検定を繰り返すと，検定全体での有意水準が設定した値（一般にはα=0.05）を大きく超えてしまうため，そうならないように調整を行った方法で比較が行われます。このようにして，分散分析の実施後に行われる詳細についての分析は，*事後検定*とも呼ばれます。

1要因分散分析の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post-Hoc Tests}}（事後検定）には，次の設定項目が含まれています。

:::{.jmvsettings data-latex=""}
+ **Post-Hoc Test**（事後検定）　事後検定についての設定を行います。
  - None（なし）　事後検定を行いません。
  - Games-Howell (unequal variances)　ゲームス=ハウエル法による多重比較を行います。この方法では分散の等質性を仮定しません。
  - Tukey (equal variances)　テューキー法による多重比較を行います。この方法では各条件の分散が等質であることが前提となります。
+ **Statistics**（統計量）　事後検定の統計量に関する設定を行います。
  - Mean difference（平均値の差）　条件間の平均値の差を算出します。
  - Report significance（有意確率の報告）　検定統計量の有意確率（p値）を表示します。
  - Test results (t and df)（検定結果：tと自由度）　検定統計量と自由度を表示します。
  - Flag significant comparisons（差が有意なペアにマーク）　差が有意であったペアに「\*」などの印をつけて示します。
:::

#### Post-Hoc Test：事後検定{-}

まず，事後検定の方法（**Post-Hoc Test**：事後検定）について見てみましょう。jamoviの1要因分散分析では，多重比較の方法として*ゲームス=ハウエル法*と呼ばれる手法と*テューキー法*と呼ばれる手法の2とおりを使用することができます。

###### Games-Howell (unequal variances)：ゲームス=ハウエル法{-}

ゲームス=ハウエル法は，ペアとなる条件の分散が等しいという前提をおかない検定手法です。そのため，分散分析にウェルチの検定を用いた場合には，こちらの方法を用いるのが適切です。

ゲームス=ハウエル法の結果は，図\@ref(fig:ANOVA-oneway-posthoc-games)のような形で示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-posthoc-games} 

}

\caption{ゲームス=ハウエル法による多重比較の結果}(\#fig:ANOVA-oneway-posthoc-games)
\end{figure}

###### Tukey (equal variances)：テューキー法{-}

もう1つのテューキー法は，ペアとなる2つの条件で分散が等しいことを前提とした多重比較の方法です。そのため，分散分析にフィッシャーの検定を用いた場合には，こちらの方法を用いるのが適切といえます。

テューキー法による多重比較の結果も，表示され方はゲームス=ハウエル法の場合と同じです。この2つでは，p値が異なる場合があるだけです（図\@ref(fig:ANOVA-oneway-posthoc-tukey)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-posthoc-tukey} 

}

\caption{テューキー法による多重比較の結果}(\#fig:ANOVA-oneway-posthoc-tukey)
\end{figure}

この多重比較の結果から，今回のサンプルデータでは一致条件と文字なし条件，一致条件と不一致条件の間で平均値の差が有意であることがわかります。

#### Statistics：統計量{-}

最後に，「**Statistics**（統計量）」の部分を見ておきましょう。ここに含まれる項目は，多重比較結果の表示方法について設定するものです。

##### Mean difference：平均値の差 {-}
まず，「Mean difference（平均値の差）」の項目では，条件間の平均値の差の表示・非表示を設定します。

##### Report significance：有意確率の報告 {-}
次に，「Report significance（有意確率の報告）」では，検定統計量の有意確率（p値）の表示・非表示を設定します。jamoviの初期設定値では，この2つがオンになっています。


##### Test results (t and df)：検定結果（tと自由度）
その次の「Test results (t and df)（検定結果：tと自由度）」の項目にチェックを入れると，それぞれの多重比較の際に算出された検定統計量tとその自由度の情報が表示されます。

##### Flag significant compariso：差が有意なペアにマーク {-}
最後の「Flag significant comparisons（差が有意なペアにマーク）」の項目にチェックを入れると，差が有意であった部分に「\*」などの印が表示されます。これらの設定項目のすべてにチェックを入れると，結果の表示は図\@ref(fig:ANOVA-oneway-posthoc-statistics)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/oneway-posthoc-statistics} 

}

\caption{多重比較における検定統計量の表示設定}(\#fig:ANOVA-oneway-posthoc-statistics)
\end{figure}


## ANOVA：分散分析{#sec:ANOVA-anova}



先ほど見たように，分散分析は1つの要因に3つ以上のグループ（水準）がある場合の平均値の検定として使用される分析方法です。しかし，分散分析は単に3つ以上の平均値の間に差があるかどうかを見ることができるだけではありません。測定値に影響すると考えられる要因が複数ある場合に，それらの影響を同時に分析することもできるのです。むしろ，そうした複数要因の分析こそが，分散分析が本領発揮できる場面だといえるかもしれません。


### 考え方 {#sub:ANOVA-anova-basics}

分散分析の基本的な考え方については，すでに先ほどの1要因分散分析のところで説明しましたが，複数の要因による影響を分析する場合には，複数の要因それぞれによる単独の影響（*主効果*）の他に，それらの要因による組み合わせ効果である*交互作用*についても検討する必要があります。

交互作用は複数要因の組み合わせ効果のことをいうわけですが，ではその「組み合わせ効果」とは具体的にどのようなもののことをいうのでしょうか。ここでは，次のサンプルデータ（[anova_data02.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data02.omv)）を用いて交互作用がどのようなものであるのかを簡単に見ておくことにしましょう（図\@ref(fig:ANOVA-data02)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data02} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data02)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　実験参加者のID
+ `条件`　呈示条件（なし，不一致，一致）
+ `課題`　実験課題（文字，写真）
+ `得点`　課題成績（最低0&ndash;最高50）
:::

このデータは，1要因分散分析で使用したものとよく似ているのですが，このファイルには，画面の左右に表示された情報のうち，ネコの「写真」のほうのボタンを押してもらうという課題と，ネコという「文字」のほうのボタンを押してもらうという課題の2種類の課題を実施した結果が含まれています。この実験は，参加者を2つの課題&times;3つの刺激条件の組み合わせによる6つのグループに分けて実施しました。

なお，この実験ではそれぞれの条件に25人ずつの参加者を割りあてていたのですが，実験機器の不具合で，「写真・なし」の条件で参加者2人のデータが記録できていませんでした。そのため，このファイルに入力されているデータは，「写真・なし」条件のみ23人，残りの条件ではいずれも25人分です。

まずは，それぞれの条件における平均値を見てみましょう。Analysesタブの「\infig{analysis-descriptives.pdf} Exploration」から「Descriptives（記述統計）」を選択して実行し，「Variables（変数）」欄に「得点」を，「Split by（グループ変数）」に「条件」と「課題」を指定してください。そして，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Statistics}}（統計量）の部分で平均値（Mean）のチェックだけをオンにすると，結果は図\@ref(fig:ANOVA-anova-descriptives)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-descriptives} 

}

\caption{各条件の平均値を算出}(\#fig:ANOVA-anova-descriptives)
\end{figure}

また，「Split by」に「条件」のみを入れた場合，「課題」のみを入れた場合についても平均値を求めましょう。そしてこれらの平均値を1つにまとめたのが表\@ref(tab:ANOVA-anova-marginal-means)です。

\begin{table}[H]

\caption{(\#tab:ANOVA-anova-marginal-means)各条件の平均値のまとめ}
\centering
\begin{tabular}[t]{lrrrr}
\toprule
  & なし & 不一致 & 一致 & 全体\\
\midrule
文字 & 29.04 & 22.64 & 31.72 & 27.80\\
写真 & 33.22 & 30.80 & 33.00 & 32.32\\
全体 & 31.04 & 26.72 & 32.36 & 30.03\\
\bottomrule
\end{tabular}
\end{table}



交互作用の説明に入る前に，まずは呈示条件と課題のそれぞれの主効果について考えます。この場合，たとえば呈示条件の主効果というのは，2つの課題の違いを考えないで，呈示条件の違いのみに注目した場合の平均値，先ほどの表でいうと，一番下の「全体」行にある31.04，26.72，32.36の違いということになります。同様にして，課題の主効果は表の右端にある27.8と32.32の2つの平均値の違いです。

このとき，たとえば不一致条件全体の平均値（26.72）は，呈示条件の違いを考えない参加者全員分の平均値（30.03）より3.31だけ値が小さく，そして一致条件全体の平均値（32.36）は全員の平均値より2.33だけ値が大きくなっています。これが呈示条件の違いによる主効果なわけです。


同様に，文字課題の平均値（27.8）は全員の平均値（30.03）より4.52小さく，そして写真課題の平均値は全員の平均値より2.29大きくなっていて，これが課題の主効果です。

では，いよいよ交互作用です。交互作用の影響は，この平均値の表のどの部分にどのように表れているのでしょうか。ここで，文字課題の不一致条件の平均値に注目してください。先ほど文字課題の主効果について説明した際，文字課題の平均値は全員の平均値から\(-\textsf{4.52}\)した値で，これが主効果だといいました。また，不一致課題の平均値は全員の平均値に比べて\(-\textsf{3.31}\)で，これが不一致条件の主効果です。

さて，もし呈示条件と課題の間に交互作用，つまり組み合わせによる効果がまったくなかったとしたら，文字・不一致条件の平均値はどのような値になると考えられるでしょうか。文字課題だと全体から\(-\textsf{4.52}\)，不一致課題だと全体から\(-\textsf{3.31}\)なのですから，組み合わせによって効果が変わるようなことがなければ，文字・不一致条件の平均値は「全体（30.03） + 文字課題（\(-\textsf{4.52}\)）+ 不一致課題（\(-\textsf{3.31}\)）= 24.49」で 24.49になるはずです^[人数が異なる条件が混じっているのでこのような計算では正確な値は得られませんが，人数の違いはわずかですのでここではこのように単純化して計算します。]。

ところが，実際の文字・不一致条件の平均値は（22.64）で，2つの主効果の影響を単純合計して求めた値からさらに2点ほど小さな値になっています。そしてこのずれの大きさが交互作用による影響です。文字・不一致条件の平均値が，文字条件の場合の影響と不一致条件の場合の影響から計算した値よりも小さいということは，文字条件と不一致条件という2つが組み合わさることによって，それらの効果を単純に合計するよりも，さらに平均値値を下げるような力が働いているということになるわけです。

そして分析においては，これらの交互作用の影響による分散が，主効果と同様に誤差の分散に比べて大きいといえるかどうかを確かめていくことになります。


### 分析手順{#sub:ANOVA-anova-procedure}

それでは分析手順を見てみましょう。分析の実行には，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」から「ANOVA（分散分析）」を選択します（図\@ref(fig:ANOVA-anova-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-menu} 

}

\caption{分散分析の実行}(\#fig:ANOVA-anova-menu)
\end{figure}

すると，図\@ref(fig:ANOVA-anova-settings)のように1要因分散分析のときとは少し違った設定画面が表示されます。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-settings} 

}

\caption{分散分析の設定画面}(\#fig:ANOVA-anova-settings)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Dependent Variables（従属変数）　分析対象の測定値が入力されている変数を指定します。
+ Fixed Factors（固定要因）　分析の独立変数（実験条件など）を指定します。
+ **Model Fit**（モデル適合度）　モデルの適合度について検定を行います。
+ **Effect Size**（効果量）　主効果および交互作用の効果量を算出します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model}}（モデル）　分析モデルに関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Assumption Checks}}（前提チェック）　分析の前提が満たされているかどうかを確認します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Contrasts}}（対比）　
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post Hoc Tests}}（事後検定）　分散分析の事後検定に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）　分析モデルに基づく各条件の平均値の推定値（推定周辺平均）を算出します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Save}}（保存）　分散分析モデルの誤差（残差）を変数として保存します。
:::

1要因分散分析の場合と同様に，ここでもまずは基本設定での分析結果を見てみることにしましょう。設定画面の「Dependent Variables（従属変数）」の部分に「得点」を，そして「Fixed Factors（固定要因）」の部分には2種類の条件（「条件」と「課題」）を設定します。「*固定要因*」というのは，実験条件など，実験者によって値が固定されている変数のことです。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-setvar} 

}

\caption{分散分析の分析設定}(\#fig:ANOVA-anova-setvar)
\end{figure}


なお，この「ANOVA」のツールでは，1要因の分散分析も可能です。先ほどの「One-Way ANOVA（1要因分散分析）」は1要因分散分析に特化することで設定項目を簡素化していますが，その分，分析結果も最低限のものしか表示されません。分析データが1要因しかない場合であっても，より詳細な結果を知りたい場合には，こちらを使って分析するとよいでしょう。ただし，グループ間で分散が異なる場合のウェルチの検定を利用可能なのは「One-Way ANOVA」のみです。

さて，これで基本的な分析の設定は終わりです。分析結果を見てみましょう。

### 分析結果{#sub:ANOVA-anova-results}

分散分析の結果は，図\@ref(fig:ANOVA-anova-results)のような形で示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-results} 

}

\caption{分散分析の結果}(\#fig:ANOVA-anova-results)
\end{figure}

1要因分散分析の場合に比べ，表示される項目も多くなっています。まず，表の一番左の部分は分析に使用した変数めいで，ここには「条件＊課題」のように交互作用も含まれています。また，その列の一番下にあるのは，分散分析のモデルでは説明しきれないデータのばらつき（*残差*）で，これは誤差に相当する部分です。

変数名の隣には，「**Sum of Squares**（*2乗和*，*平方和*）」という値が示されています。これは，それぞれの条件における測定値と平均値のずれ（偏差）を2乗した値の合計値です。その1つ隣の「**df**」は自由度，そしてその隣の「**Mean Square**（*2乗平均*，*平方平均*）」は，先ほどの2乗和の値を自由度で割って求められる値で，これは主効果や交互作用の「分散」に相当する値です。

そしてその隣の「**F**」が検定統計量で，これはそれぞれの主効果や交互作用の2乗平均を残差の2乗平均で割って求められます。分散分析では，このFの値が，主効果または交互作用の自由度と誤差の自由度という2つの自由度を持つF分布において極端といえるほど大きなものであるかどうかを確かめます。

それぞれのF値が，対応するF分布においてどの程度の確率で生じうるかを示した値がその隣の有意確率pで，このpの値が有意水準を下回る場合に，その主効果または交互作用が有意と判断されます。今回の分析結果では，2種類の実験条件の主効果（呈示条件はF(2,142)=9.62でp &lt;.001，課題はF(1,142)=16.71でp &lt;.001）と，その2つの条件の組み合わせ効果である交互作用（F(2,142)=3.27でp=0.041）がいずれも有意となりました。つまり，これらの結果が意味することは，ネコという文字に対して反応するかネコ写真に対して反応するかで課題成績が異なり，また文字・写真とセットにして表示する情報の間に不一致があるかないかによっても課題成績が有意に異なるということ，そして課題，呈示条件の効果の大きさは，2つの条件の組み合わせ方によっても有意に異なるということです。

### 分析の詳細設定 {#sub:ANOVA-anova-details}

「ANOVA（分散分析）」の分析設定は，「One-Way ANOVA」に比べて複雑ですので，1つ1つ順番に確認していきましょう。まずは，変数設定欄のすぐ下にある項目からです。

#### Model Fit：モデル適合度{-}

この部分には，「Overall model test（モデル全体の検定）」の1項目だけが含まれています。この項目にチェックを入れると，*帰無モデル*（独立変数を1つも使用しないモデル）に比べて，分析モデルのデータへの適合度が有意に高いといえるかどうか（モデル全体の説明力が0でないかどうか）についての検定結果が表示されます（図\@ref(fig:ANOVA-anova-overalltest)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-overalltest} 

}

\caption{モデル全体の検定}(\#fig:ANOVA-anova-overalltest)
\end{figure}


この検定は，第\@ref(ch:regression)章の*線形回帰*におけるモデル全体の適合度の検定と同じものです。この検定の結果における有意確率pが有意水準より小さい場合，モデルは有意（説明力が0でない）と判断されます。


#### Effect Size：効果量{-}

検定統計量というのは，帰無仮説が正しい場合にこのデータのような値が得られる確率がどれくらいかを見るための値であって，差の大きさや効果の大きさを示す値ではありません。そのため，標本サイズが大きなデータの場合，ごくわずかな平均値の違いであっても，分散分析の結果が有意になる場合があります。そこで，主効果や交互作用の大きさについて評価する際には，標本サイズによる影響を受けくにい指標として*効果量*が用いられます。

jamoviでは，分散分析の効果量として$\eta^2$（*イータ2乗*），偏$\eta^2$（*偏イータ2乗*，$\eta^2_p$），$\omega^2$（*オメガ2乗*）という3種類の値を算出することができます（図\@ref(fig:ANOVA-anova-es)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-es} 

}

\caption{分散分析の効果量}(\#fig:ANOVA-anova-es)
\end{figure}


まず，$\eta^2$ですが，これは主効果や交互作用の偏差の2乗和をデータ全体の偏差2乗和で割った値です。つまり，その主効果あるいは交互作用の影響が，データ全体のばらつきに比べてどの程度大きいかを示します。この$\eta^2$の大きさの解釈の目安は表\@ref(tab:ANOVA-anova-eta-interpretation)のとおりです。



\begin{table}[H]

\caption{(\#tab:ANOVA-anova-eta-interpretation)$\eta^2$の解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
$\eta^2$の値 & 効果の大きさ\\
\midrule
0.14 & 大\\
0.06 & 中\\
0.01 & 小\\
\bottomrule
\end{tabular}
\end{table}


ただ，このようにして効果量を算出する場合，分析モデルにたくさんの主効果や交互作用が含まれていると，必然的に1つ1つの主効果や交互作用の全体に占める影響力は小さくなってしまいます。そこで，主効果または交互作用の偏差2乗和を，その主効果・交互作用の偏差2乗和と誤差（残差）の偏差2乗和の合計で割って求めた値が偏イータ2乗（$\eta^2_p$）です。

なお，1要因分散分析の場合，この$\eta^2_p$と$\eta^2$の値は同じになりますので，解釈の際にはそれを目安にすることができます。ですが，2要因以上ある場合には，$\eta^2_p$の値の大きさを解釈する際の目安となるような基準はありません。また，別の要因による主効果が大きい場合には，それによって分析モデルの残差は小さくなり，結果としてこの要因の効果量も大きくなってしまうというように，偏$\eta^2$の値では効果が過大視されやすい傾向にあります。

そこで，そうした影響を取り除くために，これら以外にもさまざまな効果量が考案されているのですが，その1つが$\omega^2$（オメガ2乗）です。$\omega^2$は，$\eta^2$と同様に主効果または交互作用の偏差2乗和をデータ全体の偏差2乗和で割って算出される値です。ただしその際，実験デザインなどが原因で効果量が小さくなりすぎたり大きくなりすぎたりすることがないように，分母と分子の値を主効果の自由度と残差の2乗平均で調整して計算を行います。この値の解釈の目安は，基本的には$\eta^2$と同じです。

どの値にも一長一短があり，これらの効果量のうちどれを使うかは判断がなかなか難しいところですが，現在のところもっとも一般的なのは$\eta^2_p$の値です。

### Model：モデル{#sub:ANOVA-anova-model}

分散分析の設定画面にある\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model}}（モデル）を展開すると，図\@ref(fig:ANOVA-anova-model)のような画面が表示されます。この画面では，分散分析の分析モデルについての設定を行います。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-model} 

}

\caption{分析モデルの設定}(\#fig:ANOVA-anova-model)
\end{figure}

#### Model Terms：モデル項{-}

今回のサンプルデータのように複数の要因（呈示条件と課題）を用いた分散分析を行う場合，基本設定では各要因の主効果と，それらの主効果によるすべての交互作用が分析に含まれます。この設定画面では，「Model Terms（モデル項）」の欄に呈示条件の主効果（「条件」），課題の主効果（「課題」），そして条件&times;課題の交互作用（「条件＊課題」）が入っているのがわかると思います。なお，このように，分析モデルに含める主効果や交互作用は*項*と呼ばれます。

さて，多くの場合はこれで問題ないのですが，分析に使用する要因が3つあるいは4つというように多くなると，分析モデルが非常に複雑になってしまいます。たとえば，A，B，Cという3つの要因を用いた場合には，A，B，Cのそれぞれの主効果，A&times;B，A&times;C，B&times;Cの交互作用，そしてA&times;B&times;Cの交互作用という，全部で7種類もの影響について見ることになるのです。

要因が3つの場合でこれですから，要因が4つ以上になれば交互作用の数が膨大になり，結果の解釈が困難になるのは容易に想像できます。そこで，そのような場合には，分析モデルを単純化するために，結果に直接影響しない要因，あるいは研究仮説において関心の対象とならない要因を分析から除外することがあります。

今回の分析ではとくに必要ないのですが，せっかくですのでこの画面における設定方法を見ておきましょう。この段階では，すでに分析に含めることのできる要素がすべて含まれていますので，一旦，これらすべてを分析モデルから削除します。「Model Terms」に含まれる項目を選択すると画面中央の「\infig{action-forward.pdf}」の向きが「\infig{action-back.pdf}」に変わりますので，それをクリックすると選択した項目がモデルから除外されます（図\@ref(fig:ANOVA-anova-model-2)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-model-2} 

}

\caption{分析モデルから項目を除外}(\#fig:ANOVA-anova-model-2)
\end{figure}

「Model Terms」が空っぽになったら，画面左側の「Components（要因）」にある「条件」と「課題」を選択し，今度は真ん中に2つあるボタンのうち下のほうのボタンをクリックしてください。すると，次の項目を含むポップアップが表示されます（図\@ref(fig:ANOVA-anova-model-popup)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-model-popup} 

}

\caption{項目追加用のポップアップメニュー}(\#fig:ANOVA-anova-model-popup)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Interaction（交互作用）　選択項目で構成される交互作用をモデルに投入します。
+ Main Effects（主効果）　選択した項目の主効果をモデルに投入します。
+ All 2 way（2要因の交互作用すべて）　選択項目のうち2つで構成される交互作用をすべてモデルに投入します。
+ All 3 way（3要因の交互作用すべて）　選択項目のうち3つで構成される交互作用をすべてモデルに投入します。
+ All 4 way（4要因の交互作用すべて）　選択項目のうち4つで構成される交互作用をすべてモデルに投入します。
+ All 5 way（5要因の交互作用すべて）　選択項目のうち5つで構成される交互作用をすべてモデルに投入します。
:::

試しに「Main Effects」を選択してみてください。すると，「条件」と「課題」という2つの主効果だけがモデルに投入されます。ここで「Interation」や「All 2 way」を選択した場合には，交互作用のみがモデルに投入されます。

なお，今回のデータでは要因は2つしかありませんので，「Interation」と「All 2 way」で動作は同じになります。しかし，分析に使用する要因が3つある場合には，「Components」で3つの要因すべてを選択して「Interaction（交互作用）」をクリックすると，その3つの要因で構成されるすべての交互作用が，「All 2 way」をクリックすると，そのうちの2つの要因で構成される交互作用の全組み合わせがモデルに投入されます。

分析に使用する要因が多い場合には，このようにして必要な要素だけをモデルに投入し，できるだけ単純なモデルにしたうえで分析結果を見ていくことになります。

#### Sum of squares：2乗和のタイプ{-}

複数の要因を用いた分散分析の場合，分析の際に注意すべき点が1つあります。それは，各条件の中に標本サイズ（測定値の個数）の異なるものが混じっている場合，主効果や交互作用の大きさを計算する方法が複数とおりあり，そのうちのどれを用いるかによって分析結果が異なるということです。

今回のサンプルデータでは，ちょっとしたアクシデントのために「写真・なし」条件の測定値が他の条件に比べて2人分少なくなっています。このような，条件間の標本サイズが均等でないデータの場合には，各測定条件で測定値の偏差2乗を求めて合計するという方法ではなく，帰無仮説となるモデルと分析モデルの間で残差の大きさを比較することによって，主効果や交互作用が有意かどうかを判断するという方法が取られます。そして，この際の比較の仕方に複数とおりの方法があるのです。

一般に，これらの方法の違いは「*タイプ1の2乗和*（*タイプ1 SS*）」や「*タイプ2の2乗和*」（*タイプ2 SS*）などのように，「タイプ○の2乗和」という名前で区別されています。その方法は全部で4つから5つほどあるのですが，そのうち統計ソフトなどで一般によく用いられているのは，タイプ1とタイプ3の方法です。なお，jamoviではこのタイプ1とタイプ3の2つに加え，タイプ2の方法を用いて結果を算出することもできます。

###### Type 1：タイプ1{-} 
さて，これらの「タイプ」は何が違うのでしょうか。まず，「タイプ1」と呼ばれる方法について見てみましょう。この方法では，次のような考え方で主効果と交互作用の影響について検定していきます。ここでは，サンプルデータの場合（2要因分散分析）を例に説明します。

1. まず，主効果や交互作用を1つも含まないモデル（帰無モデル）と「条件」の主効果を含む分析モデルの間でモデルの残差を比較します。帰無モデルの残差と分析モデルの残差の差が，「条件」の主効果です。

2. 次に，「条件」の主効果を含むモデルと，そこに「課題」の主効果を加えたモデルの間で比較を行います。最初のモデル（「条件」のみ）と新たなモデル（「条件」と「課題」）の残差の差が「課題」の主効果です。

3. 最後に，主効果のみを含むモデルと，そこに交互作用を加えたモデルの間で比較を行います。主効果のみのモデルと交互作用を含むモデルの残差の差が「条件＊課題」の交互作用です。

このようにして主効果や交互作用の値を求める場合，主効果や交互作用をどのような順番で分析モデルに投入したかが分析結果に大きく影響します。最初にモデルに投入した主効果の影響が大きいと，その主効果によって大部分の残差が説明されてしまうため，あとからモデルに投入する主効果の影響が，計算上は小さなものになってしまうのです。

主効果をモデルに投入する順番によって計算結果が異なるというのは，jamoviで簡単に確かめることができます。この設定画面の左下に「Sum of squares（2乗和）」という設定項目があるので，そこを「Type 1」に設定してください。このように設定すると，タイプ1の方法を用いた分散分析の結果が表示されます。

そしてその状態で，「Model Terms」の「条件」と「課題」の順番をマウスでドラッグして入れ替えてみてください。すると，「条件」を上にした場合と「課題」を上にした場合で，結果の「Sum of Squares」の値が変わるのがわかります（図\@ref(fig:ANOVA-anova-model-type1)）。統計検定量のFの値はこの2乗和をもとに算出されますので，当然ながらそれらの値も変わってきます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-model-type1} 

}

\caption{タイプ1の方法を用いた分析結果}(\#fig:ANOVA-anova-model-type1)
\end{figure}

今回のデータでは，順番を入れ替えることによる違いはそれほど大きくなく，最終的な分析結果への影響はありませんが，分析データによっては，こうした順番の影響によって，主効果が有意になったりならなかったりする場合があるのです。そのため，このタイプ1の方法は，主効果の投入順序について何らかの強い仮説があるような場合を除き，実際の分析場面で用いられることはほとんどありません。

###### Type 3：タイプ3{-} 

順番が前後しますが，先にタイプ3の方法について見ておきましょう。タイプ3の方法では，次のようにして主効果や交互作用の影響を算出します。ここでも，サンプルデータの場合を例に説明します。

1. まず，検討対象の主効果と交互作用をすべて含む分析モデル（完全モデル）を作成します。

2. 次に，そのモデルから「条件」の主効果を削除したモデルを作成し，すべての項目を含む完全モデルと呈示条件抜きのモデルで比較を行います。2つのモデルの残差の差が「条件」の主効果です。

3. 今度は，最初の完全モデルから「課題」のみを削除したモデルを作成し，このモデルと完全モデルの間で比較を行います。この2つのモデルの差が，「課題」の主効果です。

4. 最後に，最初の完全モデルから，交互作用を削除したモデルを作成し，このモデルと完全モデルの間で比較を行います。この結果が交互作用の値です。

このように，タイプ3はタイプ1とは逆で，すべての項目を含むモデルと，そこから特定の交互作用や主効果を取り除いたモデルとの間で比較を行います。このタイプ3の方法では，どのような順番で主効果をモデルに投入しても計算結果が同じになります。そのため，条件間で標本サイズが異なるデータの場合には，このタイプ3の方法が用いられるのが一般的です。

###### Type 2：タイプ2{-} 

最後に，タイプ2の方法についても見ておきましょう。タイプ2では，次のようにして主効果と交互作用の値を算出します。

1. まず，検討対象の主効果と交互作用をすべて含む分析モデル（完全モデル）を作成します。

2. 次に，そこから「条件」の影響を取り除いたモデルを作成します。このとき，「条件」の主効果だけでなく，「条件」が関係している交互作用（「条件＊課題」）についても分析モデルから除外します。そして，そのモデルと完全モデルの間で比較を行います。その結果が呈示条件の主効果です。

3. 今度は，最初の完全モデルから「課題」の影響をすべて取り除いたモデルを作成します。このときも，やはり主効果だけでなく交互作用についても削除します。そして，そのモデルと完全モデルの間で比較した結果が「課題」の主効果です。

4. 最後に，最初の完全モデルから，交互作用を削除したモデルを作成し，このモデルと完全モデルの間で比較を行います。この結果が交互作用の値です。

このタイプ2とタイプ3の違いは，各要因の主効果の影響を取り除く際に，その要因が関与している交互作用についても分析モデルから取り除くかどうかという部分です。タイプ2の方法でも，主効果の分析の順序によって結果が変わるようなことはありません。

タイプ2の方法では，たとえば「課題」の主効果の影響を削除する場合には，「課題」が関係する交互作用もモデルから削除します。この場合，残ったモデルには「課題」の影響は含まれていません。しかし，タイプ3の方法では，「課題」の主効果の影響を削除したモデルを作成する際も，交互作用についてはそのままですので，モデルの中には「課題」の影響が一部残ったままになっています。

これは考えてみるとちょっとおかしな状況で，実際，jamoviでは，交互作用を残したままで主効果だけを取り除いたモデルというのは作成できません。「Model Terms」から「課題」あるいは「条件」のいずれかの要因を選択し，その項目をモデルから除外してみてください。するとその要因が関係する交互作用も同時にモデルから外されるはずです。

このように，タイプ3の方法には少し奇妙な部分があり，その点ではタイプ2の方がスマートな方法のように思えるのですが，タイプ2の方法では要因数が増えると比較するモデルを作成するのが複雑になるためか，一般にはあまり用いられていません。

### Assumption Checks：前提チェック{#sub:ANOVA-anova-assumption-checks}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Assumption Checks}}（前提チェック）には，次の項目が含まれています（図\@ref(fig:ANOVA-anova-assumption-checks)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-assumption-checks} 

}

\caption{前提チェックの項目}(\#fig:ANOVA-anova-assumption-checks)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Homogeneity test（等質性検定）　分散の等質性の検定を行います。
+ Normality test（正規性検定）　分布の正規性についての検定を行います。
+ Q-Q Plot（Q-Qプロット）　正規Q-Qプロットを作成します。
:::

これらの設定については，「One-Way ANOVA」と同じですので，ここでの説明は省略します。

### Contrasts：対比{#sub:ANOVA-anova-contrasts}

前提チェックの下にある\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Contrasts}}（コントラスト）を展開すると，次のような画面が表示されます。この画面では，各主効果の*対比*の設定を行うことができます（図\@ref(fig:ANOVA-anova-contrasts)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrasts} 

}

\caption{対比の設定項目}(\#fig:ANOVA-anova-contrasts)
\end{figure}

さて，「対比」とは一体何なのでしょうか。

今回のサンプルデータでは，「課題」の要因には「文字」と「写真」の2つの水準しかありませんので，課題の主効果が有意であるということは，文字課題と写真課題で課題成績の平均値が異なるということだとわかります。しかし，「条件」には「なし」，「不一致」，「一致」の3つの水準が含まれていて，分散分析で主効果が有意であったという結果だけでは，これら3つの水準間のどこに差があるのかまではわかりません。その場合，「なし」と「不一致」，「なし」と「一致」，「不一致」と「一致」というように，3つ水準から2つずつを取り出して各水準間の平均値の差について検討する*多重比較*が行われるのが一般的です。

しかし，研究の目的によっては，このように2つずつ取り出して比較するのではなく，別の形で水準間の差を検討したい場合があります。たとえば，ある病気に対する新しい治療薬の効果を確かめるために，代表的な既存の治療薬2種との比較を行ったとします。この場合，知りたいのは新薬の効果が既存薬より優れているかどうかなので，既存薬同士の効果の比較にはほとんど意味がありません。この場合には，既存薬1と新薬，既存薬2と新薬の比較という形で新薬の効果について検討する方が目的にそっているといえるでしょう。このように，単純な多重比較を行うのではなく，研究目的にそった形で各水準の比較を行いたい場合に使用されるのが*対比*（*コントラスト*）です。

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Contrasts}}の画面には，分析に用いた2つの変数（「条件」と「課題」）が表示されており，その右側に「none」という表示のメニュー項目があります。そしてこの部分をクリックすると，「none（なし）」の他に選択肢として6つの対比が表示されます（図\@ref(fig:ANOVA-anova-contrasts-popup)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrasts-popup} 

}

\caption{対比のメニュー}(\#fig:ANOVA-anova-contrasts-popup)
\end{figure}

:::{.jmvsettings data-latex=""}
+ deviation（偏差対比）　
+ simple（単純対比）
+ difference（差分対比）
+ helmert（ヘルマート対比）
+ repeated（反復対比）
+ polynomial（多項式対比）
:::

この6つの対比について，それぞれ簡単に見ておきましょう。

###### deviation（偏差対比）{-}

「条件」の対比を「none」から「deviation」に変更すると，図\@ref(fig:ANOVA-anova-contrast-deviation)のような結果が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-deviation} 

}

\caption{偏差対比}(\#fig:ANOVA-anova-contrast-deviation)
\end{figure}

この表の「**Estimate**（推定値）」の部分はそれぞれの対比における差の値，その隣が差の標準誤差，そして表の右側2つはその差が有意といえるかどうかについての検定結果です。そしてこの有意確率pの値が有意水準を下回る場合に差が有意であると判断します。この結果では，どちらの差も有意です。なお，この欄の名前が「推定値」になっているのは，これらの平均値の差には，この分散分析のモデルから算出された値（*推定周辺平均*）が用いられているからです。

この*偏差対比*と呼ばれる方法は，各水準の平均値が全体に比べて高い（低い）といえるかどうか（ある条件が他から突出しているかどうか）に関心がある場合の対比方法です。この方法では，基準レベルを除く各水準の平均値と，全体の平均値の間で比較を行います。

「基準レベル」というのは，その要因の主効果の大きさを評価する際に基準として用いられる水準のことです。jamoviの「ANOVA」では，それぞれの主効果については各要因の最初の水準値を基準にして主効果の大きさを計算します。今回のサンプルデータ場合，課題では「文字」条件が，呈示条件では「なし」条件が，それぞれ主効果の大きさを計算する場合の基準として用いられているのです。

そのため，この偏差対比の結果の「**Estimate**（推定値）」の部分には，「なし」条件以外の各水準，つまり「不一致条件」と「一致条件」のそれぞれの平均値について，全体の平均値と比較した場合の差が示されています。この偏差対比で「なし条件」と全体の比較の値が欲しい場合，単に差を知りたいだけであれば後に説明する推定周辺平均の値を利用して自分で算出することもできますが，そうでなければ分析の際に基準レベルとして使用される水準を変更しなければなりません。

残念ながら，今のところ「ANOVA」の設定画面では各主効果の基準レベルを変更することができないため，これを変更したい場合には，変数そのものの設定で水準の順序を変更する必要があります。ここで，その方法についても見ておくことにしましょう。設定画面右上の\infig{action-back-circle.pdf}をクリックして，「ANOVA」の設定画面をいったん閉じてください。

スプレッドシート画面に戻ったら，「\infig{variable-nominal.pdf} 条件」の列名の部分をダブルクリックして，変数の設定画面を表示させます。そしてその画面の「Levels（水準）」の部分で，「なし」をクリックして選択した後に，「\infig{action-down.pdf}」をクリックして「なし」の順番を上から2番目に変更します（図\@ref(fig:ANOVA-anova-contrast-level-edit)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-level-edit} 

}

\caption{水準の基準レベルを変更}(\#fig:ANOVA-anova-contrast-level-edit)
\end{figure}

すると，分散分析結果の対比の表の部分にその変更が反映されて，「なし」の平均値と全体の平均値との対比の結果が表示されます。差の値を確認できたら，水準の順番は元に戻しておきましょう。

###### simple（単純対比）{-}

2つ目の*単純対比*は，それぞれの要因における基準レベルの平均値と，それ以外の水準の平均値との比較です。この対比は，各実験群の平均値が統制群と比べて高い（低い）といえるかどうかに関心がある場合などに使用される方法です（図\@ref(fig:ANOVA-anova-contrast-simple)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-simple} 

}

\caption{単純対比の結果}(\#fig:ANOVA-anova-contrast-simple)
\end{figure}

今回の分散分析では「なし」条件が基準レベルとして用いられているので，この結果の表でも，「不一致」と「なし」の差，「一致」と「なし」の差が示されています。この結果では，「不一致」と「なし」の間に有意な差（p=0.002）が見られています。

###### difference（差分対比）{-}

3つ目の*差分対比*は，基準レベル（1番目）の水準と2番目の水準について比較を行った後に，1番目と2番目の水準を平均した値と3番目の水準の比較，そしてその後に1〜3番目の水準の平均と4番目の水準というようにして水準間の対比を行う方法です。この方法は，その主効果の要因が順序型変数の場合で，その要因の値の変化とともに平均値が増大（減少）するような影響があるかどうかを見たい場合に使用されます（図\@ref(fig:ANOVA-anova-contrast-difference)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-difference} 

}

\caption{差分対比の結果}(\#fig:ANOVA-anova-contrast-difference)
\end{figure}


なお，この対比を用いる場合には，その主効果の各水準が適切な順序に並べられている必要があります。その変数の設定画面で，「levels（水準）」の部分が正しい順序になっているか確認しておきましょう。

###### helmert（ヘルマート対比）{-}

4つ目の*ヘルマート対比*は，各水準とそれ以降の水準の平均値で比較する方法です。まず基準レベル（1番目）と2番目以降の水準の平均値を比較し，次に2番目の水準と3番目以降の水準の平均値を比較するという形で水準間の対比を行います（図\@ref(fig:ANOVA-anova-contrast-helmert)）。対比の方法としては，ちょうど差分対比の逆の方法です。差分対比の場合と同様に，この方法でもその要因の各水準が適切な順序に並べられている必要があります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-helmert} 

}

\caption{ヘルマート対比の結果}(\#fig:ANOVA-anova-contrast-helmert)
\end{figure}

###### repeated（反復対比）{-}

5つ目の*反復対比*は，各水準の平均値と，その直後の水準の平均値で比較する方法です。「repated（反復された）」とあるように，この方法はその要因の各水準の値を1回目，2回目，3回目，というように繰り返し測定した場合などに用いられます（図\@ref(fig:ANOVA-anova-contrast-repeated)）。この対比でも，各水準の順序が適切に設定されていなければなりません。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-repeated} 

}

\caption{差分対比の結果}(\#fig:ANOVA-anova-contrast-repeated)
\end{figure}


###### polynomial（多項式対比）{-}

6つ目の*多項式対比*は，他の対比とは少し異なる対比方法です。この対比では，それぞれの水準の平均値を他の水準の平均値と比較するのではなく，その要因の各水準の平均値の変化に1次式や2次式などによって表せる傾向があるかどうかを検討します。その要因に含まれる水準が3つの場合には1次式（linear）と2次式（quadratic）に対するあてはめが，水準数が4の場合には1次から3次（cubic），5の場合には1次から4次（quartic）というように，その水準数\(-\textsf{1}\)の次数までの多項式に対するあてはめが行われます（図\@ref(fig:ANOVA-anova-contrast-polynomial)）。なお，この対比では，対比に用いる要因の各水準に決まった順序があるだけでなく，それらの水準が互いに等間隔であることが前提となります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-polynomial} 

}

\caption{多項式対比の結果}(\#fig:ANOVA-anova-contrast-polynomial)
\end{figure}

この対比では，有意性検定の結果の見方に注意が必要です。他の対比では，帰無仮説は「平均値の差は0である」ですので，検定が有意であった場合には，その対比において「平均値に差がある」という結論になります。ところが多項式対比では，「すべての条件で平均値が同じであるとするモデル（何も説明していないモデル）」と「多項式で各条件の平均値を説明しようとするモデル」の間で「説明力の差が0である」というのが帰無仮説になっています。そのため，この対比の検定で検定結果が有意であった場合には，「何も説明していないモデルよりも説明力が高い」ということであり，その多項式がうまくあてはまっているという意味になるのです。

今回のサンプルデータでは「条件」の各水準に順序関係はないため，この対比の結果に意味はありませんが，仮にこれらの水準に明確な順序性があり，そしてそれらが等間隔になっていたとしましょう。すると，この結果では1次（linear）は有意でなく，2次（quadratic）が有意になっていますので，各条件の平均値は直線的に変化するのではなく，2次関数的に変化する傾向を持っているということになります。このデータの各水準の平均値に1次の対比と2次の対比をあてはめた場合を図にすると図\@ref(fig:ANOVA-anova-contrast-polynomial-plot)のようになり，確かに2次の対比の方が各条件の平均値のばらつきをうまく説明できることがわかります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-contrast-polynomial-plot} 

}

\caption{各条件の平均値と多項式対比}(\#fig:ANOVA-anova-contrast-polynomial-plot)
\end{figure}


### Post Hoc Tests（事後検定）{#sub:ANOVA-anova-posthoc}

各水準間の平均値の差について何らかの仮説がある場合には，適切な対比を用いてそれらの差について見ていくことになりますが，そうではなく，総あたり式に各水準間の平均値の差を見たい場合には，事後検定として*多重比較*を用いることになります。

「ANOVA」の設定画面にある\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post Hoc Tests}}（事後検定）を展開すると，図\@ref(fig:ANOVA-anova-posthoc)のような画面が表示されます。「One-Way ANOVA」にも同名の設定項目グループがありますが，ここで表示される内容は，それとはかなり異なったものになっています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-posthoc} 

}

\caption{事後検定の設定項目}(\#fig:ANOVA-anova-posthoc)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Correction**（修正）　多重比較における検定統計量や有意水準の修正について設定します。
  + No correction（修正なし）　検定統計量や有意水準を修正せずに多重比較を実施します。
  + Tukey（テューキー）　テューキー法を用いて検定統計量の修正を行います。
  + Scheffe（シェフェ）　シェフェ法を用いて検定統計量の修正を行います。
  + Bonferroni（ボンフェロニ）　ボンフェロニ法を用いて有意水準の修正を行います。
  + Holm（ホルム）　ホルム法を用いて有意水準の修正を行います。
+ **Effect Size**（効果量）　多重比較における効果量の算出について設定します。
  + Cohen's d（コーエンのd）　コーエンのdを算出します。
    + Confidence interval（信頼区間）　効果量dの信頼区間を算出します。
:::

この画面左側の主効果・交互作用の一覧から，多重比較を行いたい主効果や交互作用を選択して画面右側の欄に移動すると，その項目についての多重比較結果が表示されます。ここでは，「条件」と「条件＊課題（条件&times;課題の交互作用）」について多重比較を行うことにしましょう。

なお，今回の分析では，「条件」と「課題」のそれぞれの主効果と，「条件&times;課題」の交互作用のすべてが有意でしたが，「課題」の主効果については事後検定の必要はありません。なぜなら，「課題」の要因には「文字」と「写真」の2水準しかないため，主効果が有意であれば，この2つの間に差があるということが明らかだからです。

「条件」と「条件＊課題」の2つを画面右側に移動すると，図\@ref(fig:ANOVA-anova-posthoc-results)のような形で主効果についての多重比較の結果と交互作用についての多重比較の結果が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-posthoc-results} 

}

\caption{多重比較の結果}(\#fig:ANOVA-anova-posthoc-results)
\end{figure}

交互作用の多重比較については組み合わせが多くなるので，どうしても大きな表になってしまいますが，表に含まれている項目は主効果の多重比較の場合と同じです。ここでは，主効果についての多重比較結果の表を中心に，結果の見方を見ておきましょう。

「ANOVA」の多重比較では，それぞれの比較結果が1行ずつ表示されていて，「One-Way ANOVA」の場合とは違った形になっています。この表の一番左には，比較したペアが示されています。同じ項目が連続する場合，繰り返しの部分は省略された形で表示されますのでその点に注意してください。たとえば，「条件」の主効果の結果では，「なし - 不一致」の次の行には「 - 一致」としか書いてありませんが，これは「なし」が1行目の繰り返しであるために省略されているのです。

表の左から2列目（**Mean Difference**：平均値の差）には，その比較における平均値の差が示されています。ただし，各水準でサンプルサイズが異なる場合には，この「平均値の差」は，実際の各条件の平均値の差とは完全には一致しません。平均値の差を算出する際に，分散分析の分析モデルから算出される各条件の平均値（推定周辺平均）が用いられているためです。

その隣の「**SE**（標準誤差）」は，この平均値の差の標準誤差です。それより右側には，平均値の差の検定における自由度（**df**），検定統計量（**t**）と，修正後の有意確率（**p**）が示されています。なお，最後の有意確率については，これがテューキー法による修正後の有意確率であることを示すために，「p」の部分に「tukey」という表示が加えられています。この表に示された結果から，呈示条件の各水準間では，「なし」と「不一致」の間，「不一致」と「一致」の間に有意な差があるということがわかります。

交互作用の部分の結果についても，表のサイズは大きいですが中身は主効果についての多重比較と同じです。なお，交互作用についての多重比較では1つ注意しておくべき点があります。それは，ここでの多重比較はすべての組み合わせについて総あたり式に行われているため，この表の中には解釈が不能なペアについての結果も含まれているという点です。

たとえば，交互作用についての表の上から3番目には，「なし 文字」の平均値と「不一致  写真」の平均値の差の検定結果が示されていますが，これは呈示条件と課題の両方が異なる組み合わせでの比較ですので，ここに有意な差があったとしても，それが呈示条件の違いによるものなのか，課題の違いによるものなのかが区別できません。交互作用についての多重比較結果を見る際には，このような解釈不能な比較の結果に惑わされないようにしてください。


#### Correction：修正{-}

結局のところ，多重比較というのは3つ以上ある水準の中から2つずつを取り出して，それぞれについてt検定を繰り返し行っているようなものです。そのため，そのままでは検定全体での*第1種の誤り率*（帰無仮説を誤って棄却してしまう確率：*危険率*）が，設定された有意水準を大幅に上回ってしまいます^[1/3が「あたり」のくじを何度も繰り返し引いたとき，1回ごとの「あたり」確率は1/3であっても，繰り返し全体での「あたり」確率は1/3を上回ります。たとえば，このくじを2回引いた場合，2回のうち少なくとも1回で「あたり」が出る確率は，2回とも「はずれ」である場合の確率を1（100%）から引いたもの（$1-2/3\times2/3=0.555\dots$）ですので，1/3を大きく上回ります。]。そこで多重比較においては，繰り返し検定を行った場合にも検定全体の危険率が有意水準未満になるように，さまざまな修正が加えられます。

多重比較における修正方法にはじつにさまざまなものがあるのですが，それらは検定全体での危険率を有意水準（5%など）未満に抑えるために検定統計量に修正を加える方法と，それぞれの比較における有意水準を修正して検定全体での危険率が有意水準を超えないようにする方法の2つに大別できます。

なお，多重比較にどの方法を用いるのが適切かについては，非常に難しい問題ですのでここでは触れません。これについては統計法のテキストなどを参考にしてください。

それでは，jamoviで使用できる修正方法について簡単に見ておきましょう。jamoviでは次の方法を使用できます。

:::{.jmvsettings data-latex=""}
+ No correction（修正なし）　検定統計量や有意水準を修正せずに多重比較を実施します。
+ Tukey（テューキー）　テューキー法を用いて検定統計量の修正を行います。
+ Scheffe（シェフェ）　シェフェ法を用いて検定統計量の修正を行います。
+ Bonferroni（ボンフェロニ）　ボンフェロニ法を用いて有意水準の修正を行います。
+ Holm（ホルム）　ホルム法を用いて有意水準の修正を行います。
:::

##### No correction：修正なし{-}

1つ目の「No correction」は，まったく修正を行わずに，そのままt検定を繰り返す方法です。先ほど説明したとおり，この方法では繰り返しの数が多くなるほど検定全体での危険率が高くなります。そのため，実際の分析場面でこの方法を用いて多重比較を行うことはほとんどないでしょう。この選択項目を使用する場合があるとしたら，指定した修正法による効果を見るために，修正前のp値が知りたいというような場面くらいではないでしょうか。

##### Tukey：テューキー法{-}

2つ目の「Tukey」は，一般に*テューキーのHSD法*や*テューキー=クレイマー法*^[テューキー=クレイマー法はテューキーの方法に対して各水準間の標本サイズが異なっていても使用可能なように拡張を加えたものです。]と呼ばれる手法による修正を行います。この方法は，検定統計量に修正を加えるタイプの方法です。この方法は，「One-Way ANOVA」の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post Hoc Tests}}（事後検定）にある「Tukey」と同じものです。jamoviの初期設定ではこの方法が選択されていることからも想像できるように，この方法は分散分析後の多重比較においてもっとも一般的に用いられている方法です。

##### Scheffe：シェフェ法{-}

3つ目の「Scheffe」は，分散分析における検定統計量Fを利用して，水準間の平均値の差が有意といえるかどうかを判断する方法です。他の方法で多重比較を行う場合，分散分析で主効果が有意であったのに，多重比較ではどのペアも差が有意でなかったといったことが起こりがちです。それは，分散分析と多重比較はそれぞれ別の考え方に基づく検定方法だからです。

しかし，シェフェ法ではそうしたことがなく，分散分析の結果と一貫したものになることが知られています。また，この方法では各水準のペアについて検定するだけでなく，ある水準と他の複数の水準のグループとの間で比較することも可能なのですが，jamoviではその方法には対応していません。

##### Bonferroni：ボンフェロニ法{-#subsub:ANOVA-anova-posthoc-bonferroni}

4つ目の「Bonferroni」は，1つ1つの検定の有意水準を修正することによって多重比較全体での危険率を有意水準未満に抑えようとする方法です。たとえば，サンプルデータの呈示条件のように3つの水準が含まれる要因の主効果が有意になった場合，この3つの水準から2つの水準を取り出す組み合わせは3とおりですので，多重比較は3回行うことになります。ボンフェロニ法の考え方は非常に単純で，このような場合には検定1回あたりの有意水準を全体の水準の1/3にして検定します。つまり，全体の有意水準を5%に保ちたければ，多重比較における1つ1つの検定の有意水準を5%/3=1.67%に設定するのです。

ただし，p値を用いて判断する場合には，0.05を3で割った値を基準とするよりも，算出されたp値を3倍し，その値が0.05未満かどうかという形で判断する方がわかりやすいでしょう。実際，統計ソフトで表示されるボンフェロニ修正後のp値は，元のp値に検定回数を掛けた値として算出されています。その場合には，修正後のp値が0.05未満であれば5%水準で有意という結論になります。

この方法は非常にシンプルでわかりやすく，また応用範囲も広いため，分散分析後の多重比較だけでなく，さまざまな場面で使用されています。

##### Holm：ホルム法{-#subsub:ANOVA-anova-posthoc-holm}

最後の「Holm」は，ボンフェロニ法と同じく検定1回あたりの有意水準に修正を加える方法です。ボンフェロニ法はシンプルでわかりやすい反面，比較する組み合わせの数が多くなると基準が厳しくなりすぎてしまうという問題があります。たとえば，水準数が5である要因の主効果についての多重比較では，5つの水準から2つずつのペアを作る組み合わせは全部で10とおりになります。すると，その場合のボンフェロニ法修正後のp値は元の値の10倍ということになって，ほとんどの場合に差が有意でなくなります。検定の基準は厳しい方がよい思う人もいるかもしれませんが，重要な差が検出されずに見過ごされてしまうというのは，それはそれで困るのです。



そこでホルム法では，多重比較におけるすべての検定で同じ有意水準を用いるのではなく，検定1回あたりの有意水準の値を段階的に変化させることでこの問題に対処しています。たとえば，多重比較において全部で6回の検定を行い，そして全体の有意水準を5%に抑えたいとします。

その場合，ホルム法ではまず，すべての多重比較で得られたp値を値の小さい順に並べます。そのうえで，一番小さなp値については，ボンフェロニ法と同じくp値に全体の検定回数を掛けた値が0.05未満かどうかで検定を行います。そして2番目に小さなp値については，p値に残りの検定回数（5）を掛けた値を求めます。このとき，計算結果が1回目の検定のp値より小さくなった場合には，1回目の検定のp値をそのまま使用します。


そして，3番目のp値についても残りの検定回数4を掛けた値，4番目のp値については3，5番目のp値には2を掛けた値，という形でp値を修正し，そしてその修正値とその1つ前のp値の大きいほうの値を用いて検定を行うのです。




たとえば，多重比較で得られたp値を小さい順に並べたとき，その値が「0.001, 0.009, 0.012, 0.026, 0.032, 0.086」というものだったとしましょう。この6つのp値をホルム法とボンフェロニ法で検定した場合の結果を比較する形で示すと表\@ref(tab:ANOVA-anova-posthoc-compare)のようになります。

\begin{table}[H]

\caption{(\#tab:ANOVA-anova-posthoc-compare)ボンフェロニ法とホルム法の比較}
\centering
\begin{tabular}[t]{ccccccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{ボンフェロニ法} & \multicolumn{1}{c}{ } & \multicolumn{3}{c}{ホルム法} \\
\cmidrule(l{3pt}r{3pt}){2-3} \cmidrule(l{3pt}r{3pt}){5-7}
p値 & 修正p値 & 判定 &   & p値×検定回数 & 修正p値 & 判定\\
\midrule
0.001 & 0.001×6 = 0.006 & p<.05 &  & 0.001×6 = 0.006 & 0.006 & p<.05\\
0.009 & 0.009×6 = 0.054 & n.s. &  & 0.009×5 = 0.045 & 0.045 & p<.05\\
0.012 & 0.012×6 = 0.072 & n.s. &  & 0.012×4 = 0.048 & 0.048 & p<.05\\
0.026 & 0.026×6 = 0.156 & n.s. &  & 0.026×3 = 0.078 & 0.078 & n.s.\\
0.032 & 0.032×6 = 0.192 & n.s. &  & 0.032×2 = 0.064 & 0.078 & n.s.\\
0.086 & 0.086×6 = 0.516 & n.s. &  & 0.086×1 = 0.086 & 0.086 & n.s.\\
\bottomrule
\multicolumn{7}{l}{\textsuperscript{a} p<.05：5％水準で有意　n.s.：有意でない}\\
\end{tabular}
\end{table}

ボンフェロニ法では1番小さなp値だけが有意という結果になるのに対し，ホルム法では3番目のp値までが有意となって，検定結果がかなり異なるのがわかりますね。なお，ホルム法による修正p値の5つ目（下から2つ目）の値は，掛け算の結果では0.064なのですが，この値はその直前の検定で用いられた修正p値より小さな値であるため，5つ目の検定における修正p値は，4番目のものと同じく0.078になります。

#### Effect Size：効果量{-}

「ANOVA」の事後検定では，多重比較についての効果量を算出することもできます。この場合，算出されるのはt検定の場合と同じ*コーエンのd*（Cohen's d）の値です。また，効果量については「Confidence Interval（信頼区間）」のチェックをオンにすることで信頼区間を算出することもできます。

### Estimated Marginal Means：推定周辺平均{#sub:ANOVA-anova-emm}

設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）には，次の項目が含まれています（図\@ref(fig:ANOVA-anova-emm)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-emm} 

}

\caption{推定周辺平均の設定}(\#fig:ANOVA-anova-emm)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Marginal Means（周辺平均値）　周辺平均値の算出対象を指定します。
+ **Output**（出力）
  - Marginal means plots（周辺平均値のグラフ）
  - Marginal means tables（周辺平均値の表）
+ **General Options**（全般オプション）
  - Equal cell weights（均等重みづけ）
  - Confidence interval（信頼区間）　周辺平均値の信頼区間を算出します。
+ **Plot**（作図）
  - Error bars（誤差線）
  - Observed scores（観測値）
:::

この設定項目では，*推定周辺平均値*についての設定を行います。「推定周辺平均値」とは，分散分析で使用した分析モデルに基づいて算出された，各条件の平均値のことです。

この推定周辺平均の設定では，各要因の主効果を「**Term**（項）」として指定します。このとき，「**Term**」に指定されている要因が1つだけの場合にはその要因の各水準の平均値が，1つの「**Term**」に複数の要因が指定されている場合には，それらの要因の交互作用について平均値が算出されます。

今回のサンプルデータの場合，「条件」と「課題」の2つの要因がありますが，それぞれの主効果について水準ごとの周辺平均値を算出したい場合には，\colorbox{ao}{\textcolor{white}{+Add New Term}}をクリックして「**Term**」を増やしたうえで，各「**Term**」に「条件」と「課題」を1つずつ設定するようにします。

また，交互作用の周辺平均値のグラフでは，グラフの横軸には最初に指定した要因の水準値が用いられます（図\@ref(fig:ANOVA-anova-emm-plots)）。平均値のグラフが思ったとおりの形で表示されない場合には，要因の指定順序を変更してみてください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-emm-plots} 

}

\caption{推定周辺平均値のプロット}(\#fig:ANOVA-anova-emm-plots)
\end{figure}

#### Output：出力{-}

この推定周辺平均値は，図または表，あるいはその両方で示すことができ，「**Output**（出力）」の「Marginal means plots（周辺平均値のグラフ）」にチェックを入れればグラフが，「Marginal means tables（周辺平均値の表）」にチェックを入れれば表が示されます（図\@ref(fig:ANOVA-anova-emm-table)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-emm-table} 

}

\caption{推定周辺平均値の表}(\#fig:ANOVA-anova-emm-table)
\end{figure}

#### General Options：全般オプション{-}

その下の「**General Options**（全般オプション）」では，周辺平均値を算出する際に，標本サイズが小さい水準の値を他の水準と同等に扱うかどうかを設定することができます。

##### Equal cell weights：均等重みづけ{-}

たとえば，今回のサンプルデータでは「なし・写真」条件の参加者数が他より2人少なくなっています。もし，データそのものから各水準の平均値を求めたとしたら，付加情報「なし」条件の平均値や「写真」課題の平均値は，こうした人数のばらつきによる影響を受けてしまうことになります。

しかし，「推定周辺平均値」は分析モデルに基づいて算出される値ですので，すべての条件で参加者数が等しい場合を想定して各条件の平均値を算出することもできるのです。そのようにして平均値を算出したい場合には，「Equal cell weights（均等重みづけ）」にチェックを入れます。ほとんどの場合，ここはチェックしたままでよいでしょう。

##### Confidence interval：信頼区間{-}

その下にある「Confidence interval（信頼区間）」の数値入力欄では，推定周辺平均値について算出する信頼区間の幅を変更することができます。

#### Plot：作図{-}

設定画面右側の「**Plot**（作図）」では，推定周辺平均値の図示の方法について設定することができます。

##### Error bars：誤差線{-}

まず，「Error bars（誤差線）」の部分では，グラフに示す*誤差線*にどの値を用いるかを設定します（図\@ref(fig:ANOVA-anova-emm-plot-error-bar)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-emm-plot-error-bar} 

}

\caption{誤差線の設定}(\#fig:ANOVA-anova-emm-plot-error-bar)
\end{figure}


「Error bars」の横のプルダウンメニューで「None（なし）」を選択すると，グラフには平均値の点だけが表示されます。この項目で「Confidence interval（信頼区間）」を選択すれば，「**General Options**」のところで指定した幅の信頼区間が誤差線として示されます。ここで「Standard Error」を選択した場合には，図に示される誤差線の値には標準誤差が使用されます。

##### Observed scores：観測値{-}

また，その下の「Observed scores（観測値）」にチェックを入れると，推定周辺平均値のグラフに実際のデータを重ねて示すことができます（図\@ref(fig:ANOVA-anova-emm-observed)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/anova-emm-observed} 

}

\caption{グラフに実際のデータを重ねて表示}(\#fig:ANOVA-anova-emm-observed)
\end{figure}

### Save：保存 {#sub:ANOVA-anova-save}

設定画面の一番下にある\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Save}}（保存）では，分析結果を新たな変数として保存する方法について設定をすることができます。「ANOVA」では，分析データのうち分析モデルで説明しきれなかった部分（残差）を新たな変数として保存することが可能です。分散分析の残差を変数として保存したい場合には，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Save}}にある「Residuals（残差）」にチェックを入れてください。



## Repeated Measures ANOVA：反復測定分散分析 {#sec:ANOVA-rm}



ここまでに見てきた分析例は，いずれも「対応なし」の場合のものでした。t検定と同様に，分散分析の場合にも対応なしの場合と対応ありの場合の分析方法があります。分散分析においては，対応ありのデータは「反復測定データ」や「繰り返しありのデータ」と呼ばれることが多いようです。

ところで，t検定では対応ありの方が対応なしの場合よりも単純でしたが，分散分析ではそうではありません。t検定の場合には比較する条件は2つだけですから，その2つの条件の測定値がそれぞれ別の対象者から得られたもの（対応なし）か，同じ対象者から得られたものか（対応あり）というような区別だけで済むでしょう。

しかし，分散分析の場合には，比較する条件（水準）が3つ以上である場合があります。その場合，前半5分，中盤5分，後半5分というように繰り返しの順序に意味があるような場合（*時系列データ*）と，単に3つの異なる条件（順不同）を同一参加者に対して実施した場合とでは「繰り返し」の意味が異なります。

また，2要因以上の分散分析では，分析に用いるすべての要因が繰り返しありの要因である場合と，そのうちの一部のみが繰り返しありの要因である場合とがあり得ます。このように，繰り返しあり（対応あり）のデータに対する分散分析は，「対応あり」と一言で済ませられないほどにさまざまなタイプのデータを扱うことになり，対応ありt検定の場合よりもずっと分析が複雑になるのです。

繰り返しありのデータ（反復測定データ）の分析方法は1つではなく，いくつかの方法があるのですが，jamoviには標準で「Repeated Measures ANOVA（反復測定分散分析）」という分析ツールが用意されていますので，ここではこの分析ツールを用いた場合の分析方法について見ていくことにします^[jamoviに拡張モジュール「GAMLj」を追加すると，これ以外の方法で分析することも可能になります。]。

### 考え方 {#sub:ANOVA-rm-basics}

先ほども説明したように，分散分析が扱う「繰り返しあり」データには非常にさまざまなタイプのものがありますので，それらのすべてについて説明しようとすると，それだけでも1冊の本になってしまうほどです。ですので，ここでは比較的シンプルな次のデータ（[anova_data03.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data03.omv)）の場合について考えることにしましょう（図\@ref(fig:ANOVA-data03)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data03} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data03)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　実験参加者のID
+ `タイプ`　参加者のタイプ（ネコ派，イヌ派）
+ `なし`　評価語を呈示しない場合の反応時間（単位：ms）
+ `否定`　「ネコ」と否定語をセットで呈示した場合の反応時間（単位：ms）
+ `肯定`　「ネコ」と肯定語をセットで呈示した場合の反応時間（単位：ms）
:::

これは，ネコ派（ネコが大好きでイヌは好きでない）とイヌ派（イヌが大好きでネコは好きでない）各30名の参加者を対象に行った実験のデータです。この実験では，画面の中央にイヌまたはネコの画像を，画面上部の左右に「ネコ」や「イヌ」などの文字を呈示して，画像と一致するほうの文字を選択してもらうという課題を行いました。この際，「ネコ」と「イヌ」の左右の位置は試行ごとにランダムとしました。

実験条件としては，画面に「ネコ・イヌ」という反応語を呈示する際に「かわいい・ぶさいく」，「よい・わるい」，「ふわふわ・ごわごわ」など，よい印象を含む語と悪い印象を含む語（評価語）をセットにする場合と，「ネコ・イヌ」の反応語のみを呈示する場合を用いました。また，反応語と評価語をセットにする条件では，「ネコ」と「ごわごわ」などの否定的な印象の評価語をセットにした場合（否定条件）と，「ネコ」と「ふわふわ」などの肯定的な印象の評価語をセットにした場合（肯定条件）で測定を行いました（図\@ref(fig:ANOVA-rm-experiment)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-experiment} 

}

\caption{実験における刺激呈示の例}(\#fig:ANOVA-rm-experiment)
\end{figure}

また，この実験では1人の参加者について，評価語なしの条件（なし条件）と肯定条件，否定条件の3つの条件すべてを実施し，これら3つの条件は順序をランダムにして複数回繰り返しました。データファイルに入力されている各参加者の測定値は，それぞれの条件における複数回の測定における反応時間の平均値をミリ秒（ms）で記録したものです。

実験についての説明が長くなりましたが，このデータから参加者のタイプ（ネコ派・イヌ派）によって各実験条件における反応時間に違いが見られるかどうかを知りたいとしましょう。この場合，ネコ派の参加者とイヌ派の参加者はそれぞれ別の人々で構成されていますので，参加者の「タイプ」の要因は繰り返しなし（対応なし）ということになりますが，各評価語条件（なし・否定・肯定）については1人の参加者で繰り返し測定を行っているので，これは繰り返しあり（対応あり）の要因です。

繰り返しのあり・なしは，データファイルではそれらが同じ行に入力されているか，それとも別の行に入力されているかという形で区別されます。繰り返し要因の測定値は，このサンプルデータファイルのように1人分の測定値が1行に入力された形になっている必要がありますので，その点は注意してください。このように，1人分のデータを1行に横並びに入力した形式のデータのことをとくに*ワイド形式*のデータと呼ぶことがあります。

これに対し，1人分のデータを条件ごとに複数行に分けて入力されたデータは*ロング形式*と呼ばれます。残念ながら，jamoviにはロング形式をワイド形式に変換する機能はありませんので，データがワイド形式になっていない場合には，ExcelやRなど，他のソフトで変換してから分析する必要があります。


さて，今回のデータでは，すべての参加者が評価語の3つの水準（なし・否定・肯定）すべてについて測定値を持っているため，この評価語の主効果を考える際には，各水準の平均値だけでなく，各参加者における3水準の平均値を求めることもできます。説明のために，今回のデータの最初の3行だけを使って表を作成すると表\@ref(tab:ANOVA-anova-first-three-lines)のようになります。

\begin{table}[H]

\caption{(\#tab:ANOVA-anova-first-three-lines)各条件の平均値のまとめ}
\centering
\begin{tabular}[t]{lcccc}
\toprule
  & なし & 否定 & 肯定 & 平均値\\
\midrule
参加者1 & 592.0 & 888.0 & 700.0 & 726.7\\
参加者2 & 590.0 & 885.0 & 705.0 & 726.7\\
参加者3 & 616.0 & 895.0 & 670.0 & 727.0\\
平均値 & 599.3 & 889.3 & 691.7 & 726.8\\
\bottomrule
\end{tabular}
\end{table}

この「各参加者における3水準の平均値」というのが重要な部分です。このようにして評価語3水準の平均値と参加者ごとの平均値を算出できるのであれば，「評価語」間，「参加者」間での平均値のばらつきを求めることもできるようになります。すると，これを「評価語」と「参加者」の2要因分散分析とみなして，ここから「評価語&times;参加者」の交互作用を算出できるのです。そしてこの「評価語&times;参加者」の交互作用は，評価語の影響（つまり評価語の主効果）が各参加者で異なる程度（個人差）を数値化したものです。つまりこれは，「評価語の主効果」における「個人差」の大きさを表します。

すると，評価語の主効果の検定では，主効果による平均値のばらつきと，この主効果の個人差によるばらつきの値が得られることになります。そして主効果の大きさと，その個人差の大きさがわかるのであれば，主効果の検定においては，「主効果の個人差」を誤差とみなす形で主効果の大きさを評価できるようになるというわけです。

これと同じことが参加者の「タイプ（ネコ派・イヌ派）&times;評価語」の交互作用においてもあてはまります。参加者ごとに交互作用の大きさを求めることができれば，その交互作用の個人差を算出することが可能になります。すると，交互作用の検定では，その交互作用の個人差を誤差とみなして交互作用の大きさを評価することができるのです。

```{=latex}
\clearpage
```

### 分析手順{#sub:ANOVA-rep-procedure}

それでは分析手順を見てみましょう。分析の実行には，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」から「Repeated Measures ANOVA（反復測定分散分析）」を選択します（図\@ref(fig:ANOVA-rm-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-menu} 

}

\caption{反復測定分散分析の実行}(\#fig:ANOVA-rm-menu)
\end{figure}

すると，図\@ref(fig:ANOVA-rm-setting)のようにたくさんの項目が含まれた設定画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-setting} 

}

\caption{反復測定分散分析の設定画面}(\#fig:ANOVA-rm-setting)
\end{figure}

ここではまず，分析の基本設定について見ていきましょう。反復測定分散分析では，繰り返しのある要因とそうでない要因の区別が重要です。設定画面右側の一番上にある「Repeated Measures Factors（反復測定要因）」には，繰り返しありの要因がいくつあり，そしてそれぞれの要因の中に水準がいくつ含まれているかを指定します（図\@ref(fig:ANOVA-rm-rmfactor)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-rmfactor} 

}

\caption{繰り返し要因の設定欄}(\#fig:ANOVA-rm-rmfactor)
\end{figure}


まず，太字の「**RM Factor 1**」の部分は繰り返し要因の名前で，これをクリックすると要因の名前を設定することができます。名前を設定しなくても計算上は問題ありませんが，そのままだと結果を見たときにそれが何の要因かがわかりにくいので，わかりやすい名前をつけておくのがよいでしょう。今回のサンプルデータでは，繰り返し要因は「評価語」ですので，名前を「評価語」に設定します。

その下にある「Level 1」や「Level 2」では，この繰り返し要因に含まれている水準についての設定を行います。この「Level 1」や「Level 2」も，「**RM Factor 1**」の部分と同じくクリックすると名前を変えられるので，データに合わせてわかりやすい名前に設定しておきましょう。

今回の実験では，刺激条件の1つ目の水準は評価語が「なし」の条件なので，「Level 1」の部分を「なし」に，2つ目の水準は「否定語」がセットになっている条件なので「否定」と設定します。

1つの要因に3つ以上の水準が含まれる場合には，グレーの文字の部分をクリックすることで新たな水準を追加することができます。
今回のデータでは，評価語の条件として「なし・否定・肯定」の3つの水準がありますので，グレーの文字になっている「Level 3」の部分をクリックして，そこに3つ目の水準の名前として「肯定」と入力しましょう。これで，1つ目の繰り返し要因に3つの水準を設定することができました。なお，この3つ目以降の水準については，その水準名の右側に表示される「**×**」の部分をクリックすることで削除することができます（図\@ref(fig:ANOVA-rm-rmfactor2)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-rmfactor2} 

}

\caption{繰り返し要因の設定}(\#fig:ANOVA-rm-rmfactor2)
\end{figure}


また，今回の分析では繰り返しありの要因は1つしかありませんが，繰り返し要因が複数ある場合には，その下のグレーの文字で書かれた「**RM FACTOR 2**」の部分をクリックして要因名を設定すると，繰り返し要因を追加することができます。

繰り返し要因の個数やその水準数についての設定が終わったら，次に「Repeated Measures Cells（反復測定セル）」の欄で，それぞれの水準の測定値が入力されている変数を指定します。

今回の分析では繰り返し要因は1つしかありませんので，この部分の設定は単純です。「**なし**」の「drag variable here（ここに変数をドラッグ）」欄に「なし」を，「**否定**」の行に「否定」を，「**肯定**」の行に「肯定」をドラッグして移動します（図\@ref(fig:ANOVA-rm-rmcells)）。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-rmcells} 

}

\caption{繰り返し要因の各水準に変数を設定}(\#fig:ANOVA-rm-rmcells)
\end{figure}

そして最後に繰り返しなし要因の設定です。ネコ派・イヌ派の「タイプ」の変数を，先ほどの「Repeated Measures Cells」の下にある「Between Subject Factors（参加者間要因）」へ移動します（図\@ref(fig:ANOVA-rm-between-subject-factors)）。これで分析の基本設定はおしまいです。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-between-subject-factors} 

}

\caption{繰り返しなし要因を設定}(\#fig:ANOVA-rm-between-subject-factors)
\end{figure}

なお，その下にもう1つ「Covariates（共変量）」という欄がありますが，今回の分析ではここは使用しません。これは分析に*共変量*を用いる場合の設定項目です。共変量については，この次の「[ANCOVA（共分散分析）](#sec:ANOVA-ancova)」のところで説明します。


### 分析結果{#sub:ANOVA-rm-results}

それでは結果を見てみましょう。反復測定分散分析では，結果は図\@ref(fig:ANOVA-rm-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-results} 

}

\caption{反復測定分散分析の結果}(\#fig:ANOVA-rm-results)
\end{figure}

分析結果には，まず繰り返しありの要因が関係する主効果や交互作用についての表（Whithin Subjects Effects：参加者内効果）が，その下に繰り返しなしの要因の主効果や交互作用についての結果の表（Between Subjects Effects：参加者間効果）が示されます。

結果の表の見方は基本的には「ANOVA」の場合と同じなのですが，上の表と下の表のそれぞれに「Residual（残差）」があるのがわかるでしょうか。上の表の残差は，「評価語」の主効果についての個人差や「評価語&times;タイプ」の交互作用における個人差を集約した値で，繰り返し要因である「評価語」が関係する主効果や交互作用は，この残差を基準に検定が行われます。この場合，論文などで分析結果を報告するとしたら，統計値の部分は「F(2, 116) = 1260.64」のようになります。この場合の残差（誤差）の自由度は，参加者内効果の「Residual」のものを使用します。

なお，ここでは上の表には「Residual」は1つしかありませんが，繰り返し要因が2つ以上ある場合には，それぞれの繰り返し要因の主効果における個人差，そしてそれら繰り返し要因同士の交互作用における個人差が算出されますので，1つの表に「Residual（残差）」が複数表示されることになります。その場合，それぞれの主効果や交互作用のすぐ下にある「Residual」の値がそれらの主効果や交互作用の検定で用いられる残差（誤差）になります。


また，下の表の「Residual」は，「評価語」全体（3水準の平均値）における各参加者のばらつきを集約した値で，これは実験条件とは無関係な個人間のばらつきです。繰り返しなしの要因のみで構成される主効果や交互作用の場合には，こちらの残差を基準に検定が行われます。こちらの検定結果を論文などで示す場合には，統計値の部分は「F(1, 58) = 741.15」となります。この検定での誤差（残差）の自由度は，この参加者間効果の表にある値を使用してください。

この分析の結果，「評価語」，「タイプ」の主効果と，「評価語&times;タイプ」の交互作用のいずれも有意確率「p&lt;.001」で有意であることが示されました。

### 分析の詳細設定{#sub:ANOVA-rm-details}

ここからは，反復分散分析における設定項目について説明します。まず，設定画面の変数一覧の下にある項目から見ていきましょう（図\@ref(fig:ANOVA-rm-effect-size)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-effect-size} 

}

\caption{反復測定分散分析の詳細設定項目}(\#fig:ANOVA-rm-effect-size)
\end{figure}


#### Effect Size：効果量 {-}

設定画面の**Effect Size**では，効果量について設定します。反復測定分散分析では，効果量として「Generalised $\eta^2$（*一般化イータ2乗*，$\eta^2_G$）」，「$\eta^2$（*イータ2乗*）」，「Partial $\eta^2$（*偏イータ2乗*，$\eta^2_p$）」の3種類を算出できます。

##### η²：イータ2乗{-}

順番が前後しますが，まずは$\eta^2$（イータ2乗）から見ていきましょう。$\eta^2$の値は「ANOVA」の場合と同じで，これは各主効果，交互作用の2乗和をデータ全体の2乗和で割った値，つまり，そのデータ全体に占める各主効果，交互作用の比率です。

##### Partial η²：偏イータ2乗{-}

$\eta^2_p$（偏イータ2乗）の値も基本的に「ANOVA」での値と同じで，主効果，交互作用の2乗和をそれ自体と残差の2乗和の合計で割った値です。ただし，反復測定分散分析では複数種類の残差が算出されるため，$\eta^2_p$はそれぞれの主効果，交互作用と，それに関係する残差の2乗和を用いて算出されます。

##### Generalised η²：一般化イータ2乗{-}

ただ，その場合，$\eta^2_p$では繰り返しなしの要因と繰り返しありの要因で効果量の算出基準が異なることになるため，効果の大きさを比較することが困難になります。そこで，そのような問題を解決するために考案された指標が$\eta^2_G$（一般化イータ2乗）です。この値は，繰り返しありの要因となしの要因の両方の残差を用いて各主効果や交互作用の効果量を算出します。

なお，この$\eta^2_G$を算出する場合には，それぞれの要因が*操作要因*であるのか*測定要因*であるのかを区別する必要があります。操作要因とは，実験者が設定した実験条件などが含まれる要因を指し，測定要因は参加者が持っている特性（性別，年齢など）によって分類される要因を指します。たとえば，今回の例における評価語要因（なし・否定・肯定）は，実験者が操作して設定したものですから「操作要因」ということになります。なお，繰り返し要因は実験者が操作して設定するものなので，つねに操作要因として扱われます。

それに対し，参加者のタイプ（ネコ派・イヌ派）は実験者が操作したものではなく，これはそれぞれの参加者が持っている特性です。ですので，この要因は「測定要因」ということになります。また，測定要因との交互作用は，すべて測定要因とみなされます。このようにして考えると，今回のサンプルデータでは，評価語の要因が操作要因，タイプの主効果と評価語&times;タイプの交互作用が測定要因ということになります。

このように，操作要因と測定要因の区別はその内容によって判断されるので，これは統計ソフトが自動で判断できるようなものではなく，分析者が自分判断して指定しなければなりません。しかし，少なくとも現時点において，jamoviにはこれらの区別を指定する設定項目がなく，この設定項目における$\eta^2_G$の値は，すべての要因を操作要因とみなして算出されたものになっています。そのため，ここで算出される$\eta^2_G$は，操作要因（今回の場合は評価語の主効果）については適切な値といえるのですが，測定要因（タイプの主効果，評価語&times;タイプの交互作用）にはついて適切な値ではありません。その点には注意が必要です。

#### Dependent Variable Label：従属変数ラベル{-}

反復測定分散分析の設定画面にある「**Dependent Variable Label**（従属変数ラベル）」は，推定周辺平均値をグラフに示す際に使用する従属変数名を設定します。繰り返しなしの場合，分析に使用される従属変数はデータファイルでも1列に入力されているため，その変数の名前をそのまま従属変数の名前としてグラフの縦軸に使用することができます。しかし反復測定分散分析の場合，従属変数が複数列に入力されているために，単純に分析に使用されている変数の名前を用いるといったことができません。

そこで，jamoviでは，この**Dependent Variable Label**に入力された名前をグラフの縦軸ラベルとして使用します。この設定部分は分析結果には影響しませんからそのままでもよいですが，今回の分析の場合は「反応時間 (ms)」としておくのがわかりやすいでしょう（図\@ref(fig:ANOVA-rm-dv-label)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-dv-label} 

}

\caption{グラフ用の縦軸ラベルの設定}(\#fig:ANOVA-rm-dv-label)
\end{figure}



### Model：モデル {#sub:ANOVA-rm-model}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model}}（モデル）の部分は，繰り返しありの要因とそうでない要因で設定欄が分かれているのが異なるくらいで「ANOVA」の場合と基本的な設定方法は同じですので，ここでは説明を省略します（図\@ref(fig:ANOVA-rm-model)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-model} 

}

\caption{分析モデルの設定}(\#fig:ANOVA-rm-model)
\end{figure}

なお，「ANOVA」では「Sum of squares（2乗和）」の部分でタイプ1からタイプ3までの方法を選択することができましたが，反復測定分散分析の場合には，分析に使用できるのはタイプ2と3のみです。

### Assumption Checks：前提チェック {#sub:ANOVA-rm-assumption}

反復測定分散分析の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Assumption Checks}}（前提チェック）には次の項目が含まれています（図\@ref(fig:ANOVA-rm-assumptions)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-assumptions} 

}

\caption{反復測定分散分析の前提チェック}(\#fig:ANOVA-rm-assumptions)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Sphericity tests（球面性検定）　球面性検定を行います。
+ **Sphericity corrections**（球面性補正）　球面性の前提が満たされない場合における補正方法を指定します。
  - None（なし）　補正は行いません
  - Greenhouse-Geisser（グリーンハウス=ガイザー推定）　グリーンハウス=ガイザー推定による補正を行います。
  - Huynh-Feldt（ヒューン=フェルト推定）　ヒューン=フェルト推定による補正を行います。
+ Homogeneity test（等質性検定）　分散の等質性の検定を行います。
+ Q-Q Plot（Q-Qプロット）　正規Q-Qプロットを作成します。
:::

「ANOVA」の設定画面にはなかった項目がいくつかありますので，これらについて簡単に見ておきましょう。

##### Sphericity tests：球面性検定{-}

繰り返しなしの分散分析で各水準の分散が等質であることが分析の前提としてあったように，反復測定分散分析では繰り返し要因の各水準間で「差の分散が等しい」ことが必要とされます。このような前提は*球面性の仮定*と呼ばれ，*球面性検定*ではこの前提が満たされているといえるかどうかについて検定します。球面性検定は，*モークリー検定*とも呼ばれます。

この項目にチェックを入れると，図\@ref(fig:ANOVA-rm-sphericity-tests)のような形で検定結果が表示されます。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-sphericity-tests} 

}

\caption{球面性検定の結果}(\#fig:ANOVA-rm-sphericity-tests)
\end{figure}


結果の表の1番左にある「**Mauchly's W**（モークリーのW）」が球面性仮説の検定における統計量で，その隣のpの値が有意確率です。このpの値が有意水準を下回る場合には，球面性の前提が満たされていないと判断され，これを修正するための補正が行われます。また，pの隣にある「Greenhouse-Geisser $\varepsilon$（グリーンハウス=ガイザーの$\varepsilon$）」と「Huynh-Feldt $\varepsilon$（ヒューン=フェルトの$\varepsilon$）」は，球面性の前提が満たされない場合の修正に使用される値です。

今回の分析結果では，p=0.589で検定結果は有意ではありませんので，球面性仮説に関する補正を行う必要はありません。

#### Sphericity corrections：球面性補正{-}

今回の分析結果のように球面性検定の結果が有意でない場合には，繰り返し要因についての分析結果をそのまま採用することができるのですが，球面性検定の結果が有意だった場合には，球面性検定の結果の表にある$\varepsilon$（イプシロン）という値を用いて自由度を修正し，p値を算出するという方法がとられます。

$\varepsilon$の算出の仕方にはいくつかの方法がありますが，jamoviでは以下の方法を利用することができます。

##### None（なし）{-}

この項目がオンになっている場合には，球面性補正なしのp値が算出されます。反復測定分散分析の初期設定では，この項目がオンになっています。球面性の前提が満たされている場合など，球面性に関する補正が必要ない場合にはこの値を使用します。

##### Greenhouse-Geisser（グリーンハウス=ガイザー補正）{-}

この項目にチェックを入れると，グリーンハウス=ガイザーの$\varepsilon$を用いて修正した自由度と，それを元にした2乗平均やF，p値などが算出されます（図\@ref(fig:ANOVA-rm-greenhouse)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-greenhouse} 

}

\caption{球面性補正後の結果}(\#fig:ANOVA-rm-greenhouse)
\end{figure}


このグリーンハウス=ガイザーの$\varepsilon$による修正は，球面性の前提が満たされない場合の補正方法としてもっとも一般的なものです。

##### Huynh-Feldt（ヒューン=フェルト補正）{-}

球面性の補正方法としてはグリーンハウス=ガイザーの$\varepsilon$を用いるのが一般的だといいましたが，この方法は，$\varepsilon$の値が大きい場合（球面性からのずれが小さい場合）には調整が強くなりすぎるといわれています。そしてその問題を修正したものがヒューン=フェルトの$\varepsilon$です。ヒューン=フェルトの$\varepsilon$は，グリーンハウス=ガイザーの$\varepsilon$に対して修正を加えることによって得られる値です。

この項目にチェックを入れると，ヒューン=フェルトの$\varepsilon$で修正した自由度に基づく検定結果が表示されます。なお，今回の分析結果ではヒューン=フェルトの$\varepsilon$は1.00ですので，表示される結果は補正を行わない場合と同じになります。

##### Homogeneity test（等質性検定）{-}

この「Homogeneity test（等質性検定）」の項目にチェックを入れると，繰り返しなしの要因に関する分散の等質性の検定結果（ルビーン検定の結果）が表示されます（図\@ref(fig:ANOVA-rm-homogeneity)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-homogeneity} 

}

\caption{分散の等質性検定の結果}(\#fig:ANOVA-rm-homogeneity)
\end{figure}

結果の表を見ると「なし」や「否定」など，繰り返し要因である評価語の各水準名が並んでいますが，これは評価語の要因について分散の等質性の検定をしているのではなく，評価語の各水準において，繰り返しなし要因である「タイプ（ネコ派・イヌ派）」について，分散の等質性の検定を行った結果が表示されているのです。

分析に含まれている要因に繰り返しなしの要因が1つもない場合には，この項目にチェックを入れても結果は「NaN」となって数値は表示されません。

今回の分析結果では，どの水準においても参加者のタイプで有意に分散が異なるということはありませんでした。

##### Q-Q Plot：Q-Qプロット{-}

「Q-Q Plot（Q-Qプロット）」の項目にチェックを入れると，分析モデルの残差について正規Q-Qプロットが作成されます。Q-Qプロットの見方については，記述統計やt検定における説明を参照してください^[なお，jamovi 1.8.0.0では，このQ-Qプロットの縦軸の縮尺がおかしくなっています。そのため，本来斜め45度に表示されるはずの直線の傾きがそうなっていませんが，データ点自体は正しく表示されているので，データ点が45度の傾きで直線上に並んでいれば，正規性の前提が満たされていると考えて問題ありません。]。

### Post Hoc Tests：事後検定{#sub:ANOVA-rm-posthoc}
この\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post Hoc Tests}}（事後検定）の設定項目は「ANOVA」の場合とまったく同じですので，ここでは説明を省略します。詳細については「ANOVA」の「[Post Hoc Tests：事後検定](#sub:ANOVA-anova-posthoc)」の部分を見てください。

### Estimated Marginal Means：推定周辺平均{#sub:ANOVA-rm-marginal}

この\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）の項目も，設定項目自体は「ANOVA」の場合と同じです。ただし，推定周辺平均のグラフを作成した場合には，縦軸（数値軸）のラベルとして「**Dependent Variable Label**（従属変数ラベル）」に設定した名前が使用されます（図\@ref(fig:ANOVA-rm-emm-plot)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-emm-plot} 

}

\caption{推定周辺平均のグラフと縦軸ラベル}(\#fig:ANOVA-rm-emm-plot)
\end{figure}



### Options：オプション{#sub:ANOVA-rm-options}

設定画面の一番下にある\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Options}}には「Group summary（グループの要約）」という設定項目が含まれています。この項目にチェックを入れると，繰り返しなし要因の各水準における標本サイズや分析から除外された測定値の個数などの情報が表示されます（図\@ref(fig:ANOVA-rm-options)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/rm-options} 

}

\caption{グループの要約}(\#fig:ANOVA-rm-options)
\end{figure}


## ANCOVA：共分散分析{#sec:ANOVA-ancova}



たとえば記憶課題を用いた実験を行う場合，その記憶課題の成績は，実験で操作される条件以外に各参加者の記憶力の違いによっても影響を受けるかもしれません。あるいは，食行動に関する研究では，観察対象である食行動がそれぞれの参加者の体格によって異なるかもしれません。一般に，このような場合には，実験の各条件で参加者の特性に偏りが生じないように，あらかじめ測定した記憶力や，体格指標などにもとづいて参加者を各条件に振り分けるといった方法が用いられます。

ただ，たとえばもともと記憶力のいい人ほど課題成績がよく，そうでない人ほど課題成績が低いというような関係があった場合，それぞれの条件に参加者を均等に振り分けるというような方法では，参加者個人の記憶力の差や体格の差を十分にコントロールすることはできません。そのままでは，参加者個人の記憶力の違いによって，各実験条件における課題成績のばらつきが大きくなり，実際には実験条件の効果があるにもかかわらず，それを検出できないということが起こり得ます。

*共分散分析*（*ANCOVA*）は，この各参加者の記憶力の違いのように，本来測定したい値に対して系統的に影響を与えるような変数がある場合に，その変数の影響を取り除いたうえで，実験要因の影響について検討したい場合に用いられる分析手法です。

### 考え方{#sub:ANOVA-ancova-basics}

ここでは次の実験データについて考えてみましょう。勉強中のBGMが勉強効率にどのように影響するのかを調べるため，参加者75名をBGMなし，音楽のみのBGM，歌詞ありのBGMの3つの条件に25名ずつに振り分けて記憶課題を実施しました。記憶課題は，無意味つづり30個が記載されたリストを記憶し，その後，それらの無意味つづりを再生するというものです。なお，参加者を3つの条件に振り分ける際には，作業記憶容量の測定課題を実施し，各条件でその点数ができるだけ均等になるようにしました。次のサンプルデータ（[anova_data04.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data04.omv)）には，この実験の結果が入力されています（図\@ref(fig:ANOVA-data04)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data04} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data04)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　参加者のID 
+ `作業記憶`　参加者の作業記憶の容量 
+ `BGM`　学習時のBGM（なし，音楽のみ，歌詞あり） 
+ `再生数`　無意味つづりの再生数
:::

まず，3つの条件で参加者の作業記憶の容量に偏りがないかどうかを確認してみましょう。Analysesタブの「\infig{analysis-descriptives.pdf} Exploration（探索）」から「Descriptives（記述統計）」を選択し，「作業記憶」のBGM条件ごとの平均値と標準偏差を算出してみます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-descriptives} 

}

\caption{作業記憶容量の記述統計}(\#fig:ANOVA-ancova-descriptives)
\end{figure}

すると，図\@ref(fig:ANOVA-ancova-means)のような結果になりました。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-means} 

}

\caption{作業記憶容量の平均値と標準偏差}(\#fig:ANOVA-ancova-means)
\end{figure}

どの条件も作業記憶容量の平均値は約7.0，標準偏差は1.7から1.8で，だいたい同じような値になっています。各条件への参加者の振り分けは，狙いどおりに均等になっているようです。

次に，作業記憶の容量と記憶課題における再生数の間に相関関係があるかどうかを見てみましょう。ここで両者に相関がないようであれば，共分散分析を用いても意味がありません。

「\infig{analysis-regression.pdf} Regression（回帰）」から「Correlation Matrix（相関行列）」を選択し，「作業記憶」と「再生数」の2つを指定してこの2つの間の相関係数を算出します（図\@ref(fig:ANOVA-ancova-correlation)）。「\infig{analysis-regression.pdf} Regression（回帰）」ツールや相関係数の算出方法についての詳細は，第\@ref(ch:regression)章の「[回帰分析](#ch:regression)」を参照してください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-correlation} 

}

\caption{相関係数の算出}(\#fig:ANOVA-ancova-correlation)
\end{figure}

結果を見てみると，「作業記憶」と「再生数」の間の相関係数は0.62で，やや強めの正の相関があります（図\@ref(fig:ANOVA-ancova-cor-results)）。つまりこれは，作業記憶の容量が多い人ほど，再生数が多いという関係があるということです。このように，分析における従属変数（再生数）に対して系統的な影響を与える変数（作業記憶の容量）のことを*共変量*と呼びます。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-cor-results} 

}

\caption{「作業記憶」と「再生数」の相関係数}(\#fig:ANOVA-ancova-cor-results)
\end{figure}

さて，作業記憶の容量が無意味つづりの再生数に影響するということは，各条件における無意味つづりの再生数には作業記憶容量の個人差によるばらつきが生じるということになります。参加者個人の特性の違いによって測定値にばらつきが生じるのはどんな実験の場合でも同じでしょうが，今回の実験ではそのばらつきの主な原因である作業記憶の容量についての測定値がありますので，これを利用しない手はありません。

このとき，共分散分析では，まず「[線形回帰](#sec:regression-LR)（第\@ref(ch:regression)章）」を用いて，共変量（作業記憶容量）から従属変数（再生数）のばらつきを説明するモデルを作成します。そして，このモデルによる予測値とのずれ（*残差*）を用いて分散分析を行うのです。このようにすると，「作業記憶」と「再生数」の相関関係による影響を取り除いた形で分析を行うことができます。

この考え方を図で示すと図\@ref(fig:ANOVA-ancova-residual-plot)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-residual-plot} 

}

\caption{「作業記憶」による「再生数」への影響の除去}(\#fig:ANOVA-ancova-residual-plot)
\end{figure}

図\@ref(fig:ANOVA-ancova-residual-plot)の左側の図は，作業記憶の容量を横軸に，再生数を縦軸にとって作成した散布図です。この散布図では，全体が右肩上がりになっており，正の相関があるということが視覚的にもよくわかります。そして，この散布図の中央にある斜めの線が，作業記憶の容量と再生数の関係を表したモデルです。

これに対し，右側の図は横軸に作業記憶の容量を，縦軸には左の図に直線で示したモデルからのずれ（残差）をとって作成した散布図です。こちらの図では，モデルで示される関係が水平な直線になっていることからもわかるように，作業記憶の容量と残差の間に相関関係は見られません。

このように，実験条件以外で従属変数に影響を与えていると考えられる共変量がある場合，その共変量で従属変数を説明するモデルを作成し，そこからのずれを求めるという方法をとると，その共変量による従属変数への影響を取り去ることができるのです。共分散分析では，このようにして従属変数の値から共変量による影響を取り除き，そのうえで実験条件の主効果や交互作用があるといえるかどうかについて検定を行うのです。

### 分析手順 {#sub:ANOVA-ancova-procedure}

共分散分析は，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」から「ANCOVA（共分散分析）」を選択して実施します（図\@ref(fig:ANOVA-ancova-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-menu} 

}

\caption{共分散分析の実行}(\#fig:ANOVA-ancova-menu)
\end{figure}

すると，次のように「ANOVA」と非常によく似た設定画面が表示されます（図\@ref(fig:ANOVA-ancova-settings)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-settings} 

}

\caption{共分散分析の設定画面}(\#fig:ANOVA-ancova-settings)
\end{figure}

実際，「ANOVA」の設定画面との違いは，「Fixed Factors（固定要因）」の下に「Covariates（共変量）」の指定欄があるかどうかだけです。

そして，分析手順もほぼ「ANOVA」と同じです。「Dependent Variable（従属変数）」に「再生数」を，「Fixed Factors（固定要因）」に「BGM」を入れます。ここまでは「ANOVA」の場合と同じです。違うのは，「Covariates（共変量）」に「作業記憶」を指定することだけです（図\@ref(fig:ANOVA-ancova-set-var1)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-set-var1} 

}

\caption{共分散分析の分析設定}(\#fig:ANOVA-ancova-set-var1)
\end{figure}

これで基本の分析設定はおしまいです。

### 分析結果 {#sub:ANOVA-ancova-results}

共分散分析の結果は，図\@ref(fig:ANOVA-ancova-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-results} 

}

\caption{共分散分析の結果}(\#fig:ANOVA-ancova-results)
\end{figure}

分析方法だけでなく，結果の表示も「ANOVA」の場合とほとんど同じです。この結果の表の「BGM」の行がBGMの主効果についての検定結果です。この分析結果ではp=0.017ですので，5%水準の検定であればBGMの主効果は有意ということになります。

結果の表の2行目にある「作業記憶」の部分は，作業記憶の容量という共変量による再生数への影響についての検定結果です。この検定結果では，作業記憶の容量による影響も有意になっています。では，もし今回のデータで共変量を用いずに分析した場合，結果はどのようになるのでしょうか。

それを確かめるために，設定画面で「Covariates（共変量）」から「作業記憶」を外してみてください。すると，結果は図\@ref(fig:ANOVA-ancova-result2)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-result2} 

}

\caption{共変量を用いない場合の分析結果}(\#fig:ANOVA-ancova-result2)
\end{figure}

「BGM」の有意確率がp=0.088となり，主効果が有意でなくなりました。なお，この結果は，共変量を用いない共分散分析，つまり分散分析の結果と同じです。実際，この結果は，「ANOVA」で「再生数」を従属変数，「BGM」を固定要因に設定して分析した場合と同一です。

つまり，今回の実験の場合，もし参加者の作業記憶の容量が測定されておらず，BGMの違いだけを用いて分析していたとしたら，BGMの違いによる記憶再生量への影響は見過ごされてしまっていた可能性があるのです。


さて，先ほどから何度も繰り返しているように，この「ANCOVA」の設定項目は，共変量の設定欄がある以外は「ANOVA」のものと同一です。そのため，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model}}や\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Assumption Checks}}などの設定についての個別の説明はここでは省略します。それらについては「[ANOVA](#sec:ANOVA-anova)」の該当箇所を参照してください。

なお，「[Repeated Measures ANOVA](#sec:ANOVA-rm)（反復測定分散分析）」の分析設定画面にも「Covariates（共変量）」という設定欄があったのを覚えているでしょうか。じつは，「Repeated Measures ANOVA」では共変量を用いた分析も可能で，その際の共変量についての考え方は，この共分散分析の場合と同じなのです。つまり，「Repeated Measures ANOVA」のメニューでは，反復測定分散分析と反復測定共分散分析の両方が可能ということです。

最後に，せっかくですのでBGMの主効果について多重比較と推定周辺平均の算出を行っておきましょう。図\@ref(fig:ANOVA-ancova-tukey)は，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Post Hoc Tests}}（事後検定）で「BGM」の各水準間の差について「Tukey」法による多重比較を行った結果です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-tukey} 

}

\caption{BGMの主効果についての多重比較}(\#fig:ANOVA-ancova-tukey)
\end{figure}

多重比較の結果では，いずれの水準間にも有意な差は認められませんでした。主効果は有意ではあったものの，水準間の差はあまり明確ではないようです。また，BGM要因の各水準における推定周辺平均値をグラフに示したものが図\@ref(fig:ANOVA-ancova-emm)です。この図を作成するには，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）で「BGM」を「Term（項）」に設定してください。

```{=latex}
\clearpage
```
多重比較では統計的に有意な差は見られませんでしたが，この図を見る限りでは，「歌詞あり」のBGMを聴きながら記憶した条件では，テストにおける再生数が他の2条件に比べてやや低いようです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/ancova-emm} 

}

\caption{BGMの各水準における推定周辺平均値と95％信頼区間}(\#fig:ANOVA-ancova-emm)
\end{figure}

## MANCOVA：多変量共分散分析 {#sec:ANOVA-macnova}



たとえばストレスの測定などにおいては，血圧と筋電図など，同時に複数の指標を用いることがあります。それらの指標に対し，実験条件の主効果や交互作用があるといえるかどうかを確かめたい場合，分散分析では一度に1つの指標しか分析に用いることができません。

この場合，それぞれの指標が互いにまったく無関係（独立）なものであれば，それぞれの指標について個別に分散分析を行うといった方法でよいでしょう。しかし，それら複数の指標の間に関連性があり，そしてそれらをひとまとまりとして分析したい場合には，分散分析は使えません。

そのような場合の分析手法の1つとして，分散分析を多変量に拡張した*多変量分散分析*（*MANOVA*）があります。通常の分散分析が従属変数を1つしか扱えないのに対し，多変量分散分析では複数の従属変数を一度に分析することが可能です。また，共変量の影響を取り除いたうえで主効果や交互作用について分析する分散分析は*共分散分析*と呼ばれますが，多変量分散分析でもこれと同様のことが可能です。多変量分散分析で共変量を用いる場合の分析は，*多変量分散分析*（*MANOVA*）と呼ばれます。

ここでは，この多変量（共）分散分析の考え方について簡単に見ておくことにしましょう。なお，多変量共分散分析でも交互作用の分析は可能ですが，話が複雑になるのでここでは主効果のみを考えることにします。

### 考え方 {#sub:ANOVA-mancova-basics}

履修者数が100人を超えるような大規模な講義科目において，通常の教室での講義とオンラインでの講義の間で学生の満足度や理解度に違いがあるかどうかを調べたいとします。そこで，教室で実施されている授業とオンラインでリアルタイムに実施するライブ形式の授業，オンデマンドで動画配信を行う形式の授業のそれぞれから無作為に30科目を選び，それらの科目で満足度と理解度を測定しました。その結果がこのサンプルデータ（[anova-data05.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data05.omv)）です（図\@ref(fig:ANOVA-data05)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data05} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data05)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　授業のID
+ `タイプ`　授業のタイプ（教室，ライブ，オンデマンド）
+ `満足度`　その授業に対する受講生の満足度評価（1〜5）の平均値
+ `理解度`　その授業に対する受講生の理解度（1〜5）の平均値
:::

このデータでは，各授業について満足度と理解度の2種類の測定値（いずれもその授業の受講者による評価の平均値）があります。そして，この2種類の測定値が，授業のタイプ（教室，ライブ，オンデマンド）によって異なるかどうかを知りたいわけです。この場合，授業の満足度と理解度の評価がまったく無関係ということはおそらくないでしょう。

ですので，できれば満足度と理解度で別々に分析するのではなく，これら2つの評価値をひとまとめにして，3つの授業タイプの間に全体的な違いがあるかどうかを見たいと思います。さて，その場合にはどうすればよいのでしょうか。

これについて，まずはもっと単純化した形で考えてみましょう。正規分布した母集団が1つあるとします。その母集団の分布を，横軸に変数値，縦軸に度数をとって表すと，図\@ref(fig:ANOVA-mancova-normdist)のようなおなじみの形になります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-normdist} 

}

\caption{正規分布の母集団}(\#fig:ANOVA-mancova-normdist)
\end{figure}

今度は，相関関係がある2つの母集団の分布を見てみましょう。正規分布する2つの母集団の間に明確な正の相関があるとき，1つ目の変数値を横軸，2つ目の変数値を縦軸にとって散布図の形に示すと図\@ref(fig:ANOVA-mancova-correlation)のようになります。これもおなじみの形です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-correlation} 

}

\caption{相関のある母集団の散布図}(\#fig:ANOVA-mancova-correlation)
\end{figure}

さて，この散布図には，それぞれの値の度数は示されていません。そこで，このように相関がある母集団の分布について，度数を高さとする形で図示してみます。すると，その形は図\@ref(fig:ANOVA-mancova-multivariate)のようになります。先ほどの散布図は，この立体的な山を真上から眺めたものといえます。また，このような正規分布する複数の変数で構成された分布は*多変量正規分布*と呼ばれます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-multivariate} 

}

\caption{相関関係のある母集団の度数の分布}(\#fig:ANOVA-mancova-multivariate)
\end{figure}

ここで，サンプルデータのように2つの変数で構成される多変量正規分布が3つあったとしましょう。そして，それらを1つの散布図に示したところ，図\@ref(fig:ANOVA-mancova-multivariate2)のようになったとします。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-multivariate2} 

}

\caption{3つの多変量正規分布の散布図}(\#fig:ANOVA-mancova-multivariate2)
\end{figure}

この3つの分布の山を，変数1，変数2の軸からそれぞれ眺めた場合，その分布の形は図\@ref(fig:ANOVA-mancova-multivariate3)のようになります。このように，同じ分布であっても，それらをどの方向から見るかによって，その見え方が大きく異なるのがわかります。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-multivariate3} 

}

\caption{3つの多変量正規分布の視点による違い}(\#fig:ANOVA-mancova-multivariate3)
\end{figure}

この変数1から見た場合の分布は，3つの母集団における変数1の分布と同じものです。たとえばこのデータで，変数1の平均値に3つの母集団で差があるといえるかどうかを分散分析で確かめたとすると，この図におけるA，B，Cそれぞれの平均値のばらつきが主効果，それぞれの母集団の中での値のばらつきを総合したものが残差（誤差）ということになります。

先ほどの変数1からの視点，変数2からの視点の分布をもう一度よく見てみると，変数1の視点では，Aの分布がBとCに比べてやや離れているように見えますが，変数2の分布では，A，Bの分布とCの分布の間に差がありそうに見えます。また，変数2の分布はそれぞれの母集団内でのばらつきの幅が小さい（山の幅が狭い）のに対し，変数1の分布では，変数2に比べてそれぞれの母集団におけるばらつきの幅が少し広くなっています。このように，同じ3つの分布であっても，見る視点が異なれば，その平均値やばらつきの幅の見え方は異なってくるのです。

母集団A，B，Cの違いの見え方がその分布を眺める角度によって異なるのであれば，この3つの分布の違いがわかりやすくなるような視点があるかもしれません。たとえば，図\@ref(fig:ANOVA-mancova-multivariate4)のような斜めの視点からこれらの分布を眺めてみるとどうでしょう。すると，A，B，Cの3つでそれぞれに平均値（山の頂上）の位置が異なり，また，各分布における値のばらつき幅は非常に狭くなっていて，この3つの分布の違いがとてもよくわかるようになりました。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-multivariate4} 

}

\caption{3つの分布を別の視点から眺めた場合}(\#fig:ANOVA-mancova-multivariate4)
\end{figure}


このようにして，多変量（共）分散分析では，分布の違いがもっとも明確になる視点からこれら多変量の分布を眺め，そしてその視点における各条件の平均値のばらつき（主効果）と，それぞれの分布内での値のばらつき（残差）を算出します。あとは分散分析の考え方と同じで，主効果のばらつきが残差（誤差）のばらつきに比べてどの程度大きいかをもとに，帰無仮説（すべての条件で分布は同じ）を棄却すべきかどうかについて判断します。

### 分析手順 {#sub:ANOVA-mancova-procedure}

多変量（共）分散分析は，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」から「MANCOVA（多変量共分散分析）」を選択して実施します（図\@ref(fig:ANOVA-mancova-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-menu} 

}

\caption{多変量共分散分析の実行}(\#fig:ANOVA-mancova-menu)
\end{figure}

すると，図\@ref(fig:ANOVA-mancova-settings)のような設定画面が表示されます。「ANOVA」などに比べると，かなりシンプルな設定画面です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-settings} 

}

\caption{多変量共分散分析の設定画面}(\#fig:ANOVA-mancova-settings)
\end{figure}

ここで，「満足度」と「理解度」の2つの従属変数を「Dependent Variables（従属変数）」に，授業の「タイプ」を「Factors（要因）」に移動します。今回の分析では「Factors」として用いるのは授業タイプの1つのみですが，複数の要因を用いた分析の場合には，それらをすべてここに移動します（図\@ref(fig:ANOVA-mancova-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-set-var} 

}

\caption{多変量分散分析の分析設定}(\#fig:ANOVA-mancova-set-var)
\end{figure}


また，今回のデータには共変量は含まれていませんので，「Covariates（共変量）」の部分は空欄のままです。つまりこのデータの場合の分析は，多変量共分散分析の「共」がないタイプ，すなわち多変量分散分析ということになります。

分析の基本設定はこれだけで，これで分析の結果が出力されます。


### 分析結果 {#sub:ANOVA-mancova-results}

多変量分散分析の結果は，図\@ref(fig:ANOVA-mancova-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-results} 

}

\caption{多変量分散分析の分析結果}(\#fig:ANOVA-mancova-results)
\end{figure}

結果の1つ目の表が，多変量分散分析の結果です。表には，多変量統計量の値（**value**）とそれらの値を元に算出した「**F**」，主効果と残差それぞれの自由度（**df1**，**df2**），そして有意確率（**p**）が示されています。主効果は1つなのに4つもpの値が表示されていますが，これは多変量分散分析における統計量の算出方法に複数の考え方があるためです。

これら4つの値のうち，一般には「Wilks' Lambda（ウィルクスのラムダ）」と呼ばれる値に基づく結果で判断することが多いようですので，ここでもそうすることにしましょう。すると，統計量Fの値は4.41で，このFの有意確率はp=0.002ですので主効果は有意です。つまり，授業タイプによって，満足度や理解度に違いがあるということになります。

結果の2つ目の表は，それぞれの従属変数ごとに分散分析を実施した結果が示されています。多変量（共）分散分析の場合，複数の従属変数を総合した形で分析しているので，そこで主効果が有意であったとしても，それがどのような差を表しているのかがわかりません。そこで，一般的には，多変量（共）分散分析が有意であった場合には，その次の段階として，複数の従属変数のそれぞれについて，個別に分析を行うという方法がとられます。

なお，多変量で主効果結果が有意でなくても，単変量（個別の分析）の分析結果に主効果が有意なものが含まれている場合があるかもしれませんが，多変量での検定結果が有意でない場合には，それらの個別の分析結果は使用しません。これは，分散分析で主効果が有意でない場合には多重比較を行わないのと同じ理由です。

この単変量の分散分析結果からは，3つの授業タイプの間では，理解度と満足度のうち，満足度の方に何か違いがありそうだということがわかります。

### 分析の詳細設定 {#sub:ANOVA-mancova-details}

jamoviの「MANCOVA」で提供されている機能はごく基本的もののみなので，設定できる項目は多くありません。設定可能なのは，算出される多変量統計量の種類の選択と，分析の前提に関するチェックのみです。

#### Multivariate Statistics：多変量統計量 {-}

設定画面の**Multivariate Statistics**（多変量統計量）には，次の4つの項目が含まれています。

:::{.jmvsettings data-latex=""}
+ Pillai's Trace（ピライのトレース）
+ Wilks's Lambda（ウィルクスのラムダ）
+ Hotelling's Trace（ホテリングのトレース）
+ Roy's Largest Root（ロイの最大根）
:::

多変量（共）分散分析でも，分散分析の場合と同様に，主効果のばらつきが残差のばらつきに比べてどの程度大きいかを元に結果の判断を行うのですが，分散分析における主効果や残差の値は，多変量の分析ではすべて*行列*^[行列は*線形代数*と呼ばれる数学領域で用いられるもので，関連のある複数の値を「行（各参加者など）」と「列（各変数など）」に並べてひとまとめにしたものです。線形代数では，この行列をを用いてさまざまな計算を行います。こうして複数の値を1まとめにすることによって複雑な計算を大幅に簡素化できるため，多変量解析において行列は不可欠といえるものです。ただ，その説明のためにはかなりのページが必要になるので，ここでは行列については詳しく触れません。詳しくは線形代数の教科書や参考書などを参照してください。]の形で扱われます。その場合，主効果が残差に比べてどれだけ大きいかを評価する方法には複数の考え方があり，その代表的なものがこれら4つの値なのです。

なお，多変量（共）分散分析では，これらの統計量を分散分析で使用する統計量Fに近似したうえで検定を行うのが一般的です。そのため，jamoviの分析結果でも，それぞれの値をFに変換したものが結果の表に記載されています。

##### Pillai's Trace：ピライのトレース{-}

*ピライのトレース*は，主効果の2乗和の行列にデータ全体の（偏差の）2乗和の行列の逆行列を掛け合わせた結果に基づく統計量です。「逆行列」というのは，ある数値（x）に対する逆数（1/x）に相当するもので，逆行列を掛けるということは，通常の計算における割り算のような処理を行っていることになります。つまり，非常におおざっぱにいえば，この処理は主効果の2乗和をデータ全体の偏差2乗和で割っているようなものといえます。

ピライのトレースの「トレース」とは，行列における対角成分（相関行列だとつねに1.00になる部分）の値のことです。ピライのトレースは，先ほど述べたような形で計算した結果行列の対角成分に含まれる値を合計した値です。この値は0から1までの範囲をとり，値が1に近いほど主効果が残差に比べて大きいことを意味します。

##### Wilks's Lambda：ウィルクスのラムダ{-}

*ウィルクスのラムダ*（$\Lambda$）は，多変量（共）分散分析においてもっとも一般的に用いられる統計量です。この値は，残差2乗和行列の行列式^[行数と列数が同じ行列において算出される，その行列における固有の値です。その行列を用いて空間座標の変換を行った場合に，変換後の空間が元の空間の何倍の大きさになるかを示す値というような形で説明されます。非常におおざっぱにいえば，その行列が持つ影響力の大きさのようなものです。]をデータ全体の偏差2乗和の行列の行列式で割って算出されます。ピライのトレースでは主効果を全体で割るような形で計算するのに対し，ウィルクスのラムダは残差を全体で割るような形での計算が行われます。そのため，このウィルクスのラムダの値は0に近いほど残差が少ない，つまり主効果が残差に比べて大きいことを意味します。

なお，jamoviでは多変量（共）分散分析で効果量を算出できませんが，多変量（共）分散分析において一般的に用いられる効果量である「*多変量イータ2乗*（多変量$\eta^2$）」は，「1 &minus; ウィルクスのラムダ」という計算によって簡単に算出することができます。

##### Hotelling's Trace：ホテリングのトレース{-}
*ホテリングのトレース*も，ピライのトレースと同様に，計算の結果得られた行列のトレース（対角成分の合計）を用いて主効果の大きさを評価します。ホテリングのトレースでは，主効果の2乗和の行列に残差2乗和行列の逆行列を掛け合わせる形で計算を行います。つまり，主効果の2乗和を残差の2乗和で割るような形で主効果の大きさを評価するわけです。そのため，この値が大きいほど主効果が残差に比べて大きいということになります。なお，ピライのトレースやウィルクスのラムダは0から1の範囲の値になるのに対し，ホテリングのトレースの値は1より大きくなる場合もあります。

##### Roy's Largest Root：ロイの最大根{-}
*ロイの最大根*と呼ばれる統計量の計算手順は，結果の行列を算出するところまではホテリングのトレースと同じで，主効果の2乗和行列に残差2乗和行列の逆行列を掛ける形で計算を行います。そしてロイの最大根では，その行列の*固有値*を計算し，その固有値の中で最大の値を統計量として用います^[「固有値」というのは主成分分析や因子分析でも頻繁に出てくる言葉ですが，行列についてのある程度の知識がないと説明が難しい概念です。非常におおざっぱにいえば，行列式と同様に，この値もその行列が持つ影響力の大きさを表しているといえます。ただし，行列式とは異なり，固有値は列数と同じ個数だけ算出されます。]。

#### Assumption Checks：前提チェック{-}
「MANCOVA」の**Assumption Checks**（前提チェック）には，次の3つの項目が含まれています。

:::{.jmvsettings data-latex=""}
+ Box's M test（ボックスのM検定）
+ Shapiro-Wilk test（シャピロ=ウィルク検定）
+ Q-Q plot of multivariate normality（多変量正規Q-Qプロット）
:::

##### Box's M test：ボックスのM検定{-}

*ボックスのM検定*は，「すべてのグループにおいて分散共分散行列が等しい」という帰無仮説について検定を行います。この検定は，通常の分散分析における分散の等質性検定に相当するものです。多変量（共）分散分析の場合には，このようにグループ（水準）間で分散共分散行列が等質であるということが前提条件の1つになります。

「Box's M test」のチェックをオンにすると，図\@ref(fig:ANOVA-mancova-box)のような形で検定結果が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-box} 

}

\caption{ボックスのM検定の結果}(\#fig:ANOVA-mancova-box)
\end{figure}

結果の表には，$\chi^2$（カイ二乗）統計量と自由度，そして有意確率pが示されています。この検定では「すべてのグループで分散共分散行列が同じ」が帰無仮説ですので，この検定の結果が有意である場合には，分析のための前提が満たされていないということになります。今回のこの結果では，ボックスのM検定の結果は有意ではありませんので，前提が満たされていないということはなさそうです。

##### Shapiro-Wilk test：シャピロ=ウィルク検定{-}

このシャピロ=ウィルク検定は，多変量に拡張されている以外はANOVAの場合のものと基本的に同じです。この検定では，「データが多変量正規分布である」が帰無仮説なので，この検定結果が有意な場合には，データが多変量正規分布でない，つまり分析のための前提が満たされていないことを意味します。

##### Q-Q plot of multivariate normality：多変量正規Q-Qプロット{-}

この多変量正規Q-Qプロットも，通常の正規Q-Qプロットを多変量に拡張したもので，その使い方については基本的に正規Q-Qプロットと同じです。このプロットでデータ点が直線上に並んでいれば，そのデータは多変量正規分布であると見なすことができます。

### 多変量の多重比較 {#sub:ANOVA-mancova-posthoc}

「MANCOVA」の設定項目はこれですべてですが，最後に多変量（共）分散分析で主効果が有意であった場合の事後検定について少しだけ見ておきましょう。jamoviの「MANOVA」では，多変量（共）分散分析の結果と合わせて単変量，つまり各従属変数ごとの（共）分散分析の結果が表示されます。これはこれでよいのでしょうが，研究の目的によっては，従属変数ごとに個別に分析するのではなく，多変量のままで多重比較を行いたい場合もあるでしょう。そこで，そのような場合を想定した分析方法をここで見ておこうと思います。

jamoviの「MANCOVA」のメニューには多変量の多重比較の設定項目はありませんが，これはjamoviが標準で備えている「フィルタ」機能を用いることで実現可能です。それでは，今回のデータで多変量の多重比較を行ってみましょう。

まず，分析の設定画面を閉じ，Dataタブから「Filters（フィルタ）」を選択します（図\@ref(fig:ANOVA-mancova-posthoc)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-posthoc} 

}

\caption{フィルタを選択}(\#fig:ANOVA-mancova-posthoc)
\end{figure}

ここで多重比較のためのフィルタ作成します。まずは「教室」の授業と「ライブ」授業の組み合わせについてのフィルタを作成しましょう。「Filter 1」の条件式の部分に，次のとおりに入力します。

:::{.jmvformula data-latex=""}
= タイプ == 1 or タイプ == 2
:::

式の途中の「イコール」は，「`=`」でなく「`==`」と2つ続ける必要があるので注意してください。また，変数名は，関数ボタン（\infig{filters-formula.pdf}）を使って入力するのが確実ですが，キーボードから入力しても問題ありません。

なお，ここでは授業のタイプをデータ値（1，2，3）で指定しましたが，これをラベル（教室，ライブ，オンデマンド）で指定したい場合や，あるいは変数値が文字で入力されている場合には，「"教室"」や「'ライブ'」のように，それらの値を引用符（"または'）で囲む必要がありますので，この点にも注意してください。

それから，後でこれが何のためのものかわからなくならないように，「Description（説明）」の部分には「教室 - ライブの比較」のようにして説明を記入しておくとよいでしょう（図\@ref(fig:ANOVA-mancova-filters1)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-filters1} 

}

\caption{フィルタの設定}(\#fig:ANOVA-mancova-filters1)
\end{figure}

```{=latex}
\clearpage
```

これでこのペアについての比較は可能ですが，ついでなので他の組み合わせについてもここでフィルタを作成しておきます。「教室」と「オンデマンド」の比較用フィルタを作成するには，「\infig{filters-visible.pdf}」の上にあるほうの「\infig{filters-add.pdf}」をクリックしてください（図\@ref(fig:ANOVA-mancova-filters2)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-filters2} 

}

\caption{フィルタの追加}(\#fig:ANOVA-mancova-filters2)
\end{figure}


そして，条件式に次の内容を入力します（図\@ref(fig:ANOVA-mancova-filters3)）。

:::{.jmvformula data-latex=""}
= タイプ == 1 or タイプ == 3
:::

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-filters3} 

}

\caption{「教室」と「オンデマンド」の比較用フィルタ}(\#fig:ANOVA-mancova-filters3)
\end{figure}

```{=latex}
\clearpage
```

同様にして，「ライブ（2）」と「オンデマンド（3）」の比較用のフィルタも作成しましょう（図\@ref(fig:ANOVA-mancova-filters4)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-filters4} 

}

\caption{「ライブ」と「オンデマンド」の比較用フィルタ}(\#fig:ANOVA-mancova-filters4)
\end{figure}

3つのフィルタが完成したら，そのうちの1つのみを「active（オン）」にして，残りは「inactive（オフ）」にします。ここではまず，1つ目のフィルタのみを「active」に，それ以外を「inactive」にします（図\@ref(fig:ANOVA-mancova-filters5)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-filters4} 

}

\caption{1つ目のフィルタだけを「オン」に設定}(\#fig:ANOVA-mancova-filters5)
\end{figure}

ここまでの設定が終わったら，フィルタの設定画面を閉じて，先ほどの「MANCOVA」の結果のうち，多変量の検定の部分を見てください。今，ここに表示されているのは授業のタイプが「教室」と「ライブ」の場合のデータのみを用いて行った多変量分散分析の結果です（図\@ref(fig:ANOVA-mancova-posthoc-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-posthoc-results} 

}

\caption{「教室」と「ライブ」の比較}(\#fig:ANOVA-mancova-posthoc-results)
\end{figure}

この分析結果では，どの多変量統計量を用いた場合もFの値は同じになり，そして検定結果も同じになります。そして，この検定の有意確率はp=0.536ですので，この水準間では学生の評価の間に有意な差はないということになります。

今度は「教室」授業と「オンデマンド」授業で比較してみます。フィルタの設定で「Filter 1」は「inactive（オフ）」に，「Filter 2」を「active（オン）」にして，再度先ほどの結果を見てみると，今度は「教室」と「オンデマンド」のデータのみを用いた計算結果が表示されています（図\@ref(fig:ANOVA-mancova-posthoc-results2)）。この結果から，「教室」と「オンデマンド」授業の間では有意確率はp=0.004であることがわかります。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-posthoc-results2} 

}

\caption{「教室」と「オンデマンド」の比較}(\#fig:ANOVA-mancova-posthoc-results2)
\end{figure}

なお，結果を慎重に判断するためには，[ボンフェロニ法](#subsub:ANOVA-anova-posthoc-bonferroni)あるいは[ホルム法](#subsub:ANOVA-anova-posthoc-holm)によって，この有意確率を修正したほうがよいでしょう。今回は全部で3回の多重比較を行うので，ボンフェロニ法であれば，このp=0.004を3倍して判断することになります。すると，p=0.004&times;3=0.012で，この水準間の差は有意ということになります。

最後に，「ライブ」と「オンデマンド」の比較です。「Filter 3」を「active（オン）」にして，それ以外は「inactive（オフ）」にしましょう（図\@ref(fig:ANOVA-mancova-posthoc-results3)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/mancova-posthoc-results3} 

}

\caption{「ライブ」と「オンデマンド」の比較}(\#fig:ANOVA-mancova-posthoc-results3)
\end{figure}

この結果から，「ライブ」と「オンデマンド」の比較ではp=0.002です。このp値をボンフェロニ法で修正すると，p=0.002&times;3=0.006となり，この差についても結果は有意です。

これらの結果から，多変量での多重比較の結果，「教室」と「ライブ」の授業の間には有意な差は見られず，「オンデマンド」授業だけが他の2つと異なる傾向を持っているということがわかります。

## One-Way ANOVA [Kruskal-Wallis]：クラスカル=ウォリス検定{#sec:ANOVA-kw}

ここからはノンパラメトリックな分析について見ていきましょう。分散分析はt検定と同様にデータが正規分布であることが前提となるため，正規分布からかけ離れたデータには適用できません。その場合に用いられる方法の1つが*ノンパラメトリック検定*ですが，ノンパラメトリック検定にも分散分析に相当する分析手法があります。

そのうち，繰り返しなしの1要因分散分析に相当するのが*クラスカル=ウォリス検定*です。

### 考え方 {#sub:ANOVA-kw-basics}

ここでは，[1要因分散分析](#sec:ANOVA-oneway)で用いたのと同じデータ（[anova_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data01.omv)）を用いてクラスカル=ウォリス検定の考え方について見ていくことにしましょう（図\@ref(fig:ANOVA-data01-kw)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data01} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data01-kw)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　実験参加者のID
+ `条件`　文字条件（なし，不一致，一致）
+ `得点`　課題の成績（最低0&ndash;最高50）
:::

クラスカル=ウォリス検定の考え方は1要因分散分析とよく似ており，主効果（「条件」の違い）によるばらつきの大きさを，基準となるばらつきの大きさと比較する形で検定を行います。ただし，主効果のばらつきや基準となるばらつきの大きさを，測定値の「順位」をもとに算出する点が異なります。

1要因分散分析では，各条件の平均値と全体平均値の差の2乗和を主効果の2乗和として求め，ここから主効果の分散（2乗平均）を算出しました。クラスカル=ウォリス検定では，各条件に含まれる測定値の順位の平均値と全体の順位平均値の差の2乗和を主効果の2乗和として算出します。

今回のデータを例に考えてみましょう。このデータには，各条件に25人分の測定値が含まれていますので，これらの測定値に小さい順に順位をつけると，その値は1から75の範囲になります^[同順位（タイ）のものが含まれている場合は話が少し複雑になるので，ここでは同順位の測定値は考えないことにします。]。すると，このデータ全体での順位の平均値は，1から75までの数値の合計を75で割って38と求まります。これが，1要因分散分析におけるデータ全体の平均値に相当します。

そして，このデータ全体における各測定値の順位を3つの条件それぞれで求めると，「なし」条件では34.38，「不一致」条件では25.14，「一致」条件では54.48というように，各条件の順位の平均値にばらつきがあるのがわかります。この各条件の平均値と，先ほどのデータ全体の順位平均値の差の2乗和が，クラスカル＝ウォリス検定における主効果の2乗和になるのです。

なお，1要因分散分析では，主効果（条件の違い）で説明しきれない部分（残差）を基準にして主効果が有意といえるかどうかを判断しますが，クラスカル=ウォリス検定では，全体の順位平均値と各測定値の順位の差の2乗和を基準にして判断を行います。このように，クラスカル=ウォリス検定では，とにかく各測定値の「順位」の情報を利用しながら，条件間に差があるといえるかどうかを判断していくのです。

### 分析手順 {#sub:ANOVA-kw-procedure}

では早速，分析してみましょう。クラスカル=ウォリス検定の実行には，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」で，「Non-Parametric（ノンパラメトリック検定）」の下にある「One-Way ANOVA [Kruskal-Wallis]（クラスカル=ウォリス検定）」を選択します。分析メニューに「One-Way ANOVA」とあるのは，この分析が1要因分散分析のノンパラメトリック版に相当するものだからです図\@ref(fig:ANOVA-kw-menu)。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/kw-menu} 

}

\caption{クラスカル=ウォリス検定の実行}(\#fig:ANOVA-kw-menu)
\end{figure}

すると，図\@ref(fig:ANOVA-kw-settings)のようなシンプルな画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/kw-settings} 

}

\caption{クラスカル=ウォリス検定の設定画面}(\#fig:ANOVA-kw-settings)
\end{figure}

この画面で，「得点」を「Dependent Variables（従属変数）」に，「条件」を「Grouping Variable（グループ変数）」に指定すれば，これで分析終了です（図\@ref(fig:ANOVA-kw-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/kw-set-var} 

}

\caption{クラスカル=ウォリス検定の分析設定}(\#fig:ANOVA-kw-set-var)
\end{figure}

### 分析結果 {#sub:ANOVA-kw-results}

それでは結果を見てみましょう。クラスカル=ウォリス検定の結果は図\@ref(fig:ANOVA-kw-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/kw-results} 

}

\caption{クラスカル=ウォリス検定の結果}(\#fig:ANOVA-kw-results)
\end{figure}

クラスカル=ウォリス検定では，検定統計量として$\chi^2$の近似値が算出されるため，結果の表には$\chi^2$（カイ2乗）の値と自由度，そして有意確率が示されています。この検定の帰無仮説は「すべての条件で分布が同じ」であるため，この検定結果におけるpの値が有意水準を下回る場合に，条件間で分布が異なる（差がある）ということになります。そして今回の分析では，検定結果は有意でした。つまり，実験条件によって得点が異なるということです。

### 効果量と多重比較 {#sub:ANOVA-kw-others}

クラスカル＝ウォリス検定では，基本の分析以外の設定項目は効果量と多重比較の2つだけです。

##### Effect size：効果量 {-}

まず効果量についてですが，設定画面の「Effect size」にチェックを入れると，図\@ref(fig:ANOVA-kw-es)のように結果の表の右端に効果量$\varepsilon^2$（イプシロン2乗）の値が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/kw-es} 

}

\caption{クラスカル=ウォリス検定の効果量}(\#fig:ANOVA-kw-es)
\end{figure}

この$\varepsilon^2$の値は，各条件の順位の差の2乗和（主効果の2乗和）の値を全体の2乗和で割ったもので，1要因分散分析の場合の$\eta^2$（イータ2乗）と同じ考え方で算出される値です。そして，この$\varepsilon^2$の大きさの目安は，$\eta^2$の場合と同様です（表\@ref(tab:ANOVA-kw-epsilon)）。ですので，今回の分析結果から，条件の違いによる主効果はかなり大きなものだといえます。

\begin{table}[H]

\caption{(\#tab:ANOVA-kw-epsilon)$\varepsilon^2$の解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
$\varepsilon^2$の値 & 効果の大きさ\\
\midrule
0.14 & 大\\
0.06 & 中\\
0.01 & 小\\
\bottomrule
\end{tabular}
\end{table}

##### DSCF pairwise comparisons：多重比較 {-}

設定画面の「DSCF pairwise comparisons」にチェックを入れると，すべての条件間での多重比較の結果が表示されます（図\@ref(fig:ANOVA-kw-pairwise)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/kw-pairwise} 

}

\caption{ノンパラメトリックな多重比較}(\#fig:ANOVA-kw-pairwise)
\end{figure}

その際に使用される検定方法は*ドゥワス=スティール=クリッチロウ=フリグナー法*（*DSCF法*）と呼ばれるもので，これはテューキー法による多重比較のノンパラメトリック版です。クラスカル＝ウォリス検定と同じく，この方法でも測定値の順位に基づく検定が行われます。また，この方法では，テューキー法による多重比較の場合と同様に調整済みの検定統計量が算出されますので，結果のp値を調整する必要はありません。


図\@ref(fig:ANOVA-kw-pairwise)の結果の表にはWという値が示されていますが，これがこの検定の検定統計量です。そしてこの多重比較の結果から，「なし」条件と「一致」条件，「不一致」条件と「一致」条件の間に有意な差があることがわかります。

## Repeated Measures ANOVA [Friedman]：フリードマン検定 {#sec:ANOVA-friedman}



繰り返しなし（対応なし）の場合の1要因分散分析に対応するノンパラメトリック検定としてはクラスカル=ウォリス検定がありますが，1要因の反復測定分散分析に対応するノンパラメトリック検定には*フリードマン検定*があります。

### 考え方{#sub:ANOVA-friedman-basics}

ここでは，次のサンプルデータ（[anova_data06.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/anova_data06.omv)）を用いて，フリードマン検定の基本的な考え方を見ておきましょう。このデータには，空間についての記憶実験の成績が記録されています。この実験では，模型の観察（模型条件），VRによるインタラクティブな空間体験（VR条件），あらかじめ録画された動画視聴による空間体験（動画条件）の3つの条件それぞれで架空の都市空間を体験してもらい，その後，その空間にあった建物の位置や形などについての記憶テストを行いました（図\@ref(fig:ANOVA-data06)）。記憶課題の成績は，数値が大きいほど好成績であることを意味します。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/data06} 

}

\caption{サンプルデータ}(\#fig:ANOVA-data06)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　実験参加者のID
+ `模型`　模型観察条件の課題成績
+ `VR`　VR条件の課題成績
+ `動画`　動画条件の課題成績
:::


フリードマン検定では，クラスカル=ウォリス検定の場合と同様に，測定値の順位を利用して条件間に差があるかどうかを検定します。ただし，クラスカル=ウォリス検定では各測定値にデータ全体での順位をつけ，それを各条件で平均するという方法を取りましたが，フリードマン検定の場合には，参加者ごとに各条件の測定値の順位づけを行います。



たとえば，今回のデータでは，1人目の参加者の課題成績は，「模型」条件が「25」，「VR」条件が「28」，「動画」条件が「24」ですので，この3つで順位をつけると，「模型：2，VR：3，動画：1」となります。このような形での順位づけをすべての参加者に対して行ったとき，3つの条件の間に明確な差がある（明確な順序がある）のであれば，この順位づけの値はどの参加者でも同じになるはずです。そしてもし，そのように参加者間で順位が一致しているのであれば，3つの条件それぞれで全参加者の順位づけの値を合計したとき，その合計値は3つの条件で大きく異なる値になるでしょう。

しかし，この3つの条件に差がなく，順序がはっきりしなければ，それぞれの参加者における順位づけの値は，参加者ごとにまちまちになります。すると，3つの条件それぞれで全参加者の順位づけの値を合計したとき，3つの条件の順位の合計値に違いは見られなくなります。

このような考え方から，フリードマン検定では，各参加者における測定値の順位を測定条件ごとに集計することで，各参加者の測定値の順位が一致している程度を調べ，その情報をもとに，条件間に差があるかどうかの判断を行います。

### 分析手順{#sub:ANOVA-friedman-procedure}

フリードマン検定の実行には，Analysesタブの「\infig{analysis-anova.pdf} ANOVA」で，「Non-Parametric（ノンパラメトリック検定）」の部分にある「Repeated Measures ANOVA [Friedman]（フリードマン検定）」を選択します（図\@ref(fig:ANOVA-friedman-menu)）。分析メニューに「Repeated Measures ANOVA」とあるのは，この分析が反復測定1要因分散分析のノンパラメトリック版に相当するものだからです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-menu} 

}

\caption{フリードマン検定の実行}(\#fig:ANOVA-friedman-menu)
\end{figure}

このメニューを選択して実行すると，図\@ref(fig:ANOVA-friedman-settings)のような設定画面が表示されます。こちらも非常にシンプルなものです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-settings} 

}

\caption{フリードマン検定の設定画面}(\#fig:ANOVA-friedman-settings)
\end{figure}

フリードマン検定の基本設定は，この設定画面で分析対象の変数すべてを「Measures（測定値）」のところへ移動するだけで完了です（図\@ref(fig:ANOVA-friedman-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-set-var} 

}

\caption{フリードマン検定の分析設定}(\#fig:ANOVA-friedman-set-var)
\end{figure}

### 分析結果{#sub:ANOVA-friedman-results}

それでは結果を見てみましょう。フリードマン検定の結果は図\@ref(fig:ANOVA-friedman-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-results} 

}

\caption{フリードマン検定の結果}(\#fig:ANOVA-friedman-results)
\end{figure}

結果の表に表示される項目はクラスカル=ウォリス検定の場合と同じで，$\chi^2$統計量と自由度，そしてp値です。この検定でも$\chi^2$の値を用いて検定を行います。この検定の帰無仮説は「すべての条件で分布が同じ」なので，この検定結果の有意確率が有意水準を下回る場合に「すべての条件で分布が同じでない（分布に差がある）」ということになります。今回の分析結果ではp=0.001なので，条件間の差は有意です。

### 多重比較と記述統計量{#sub:ANOVA-friedman-pairwise}

フリードマン検定では，基本設定以外の設定項目は多重比較と記述統計量の算出に関するものだけです。

##### Pairwise comparisons (Durbin-Conover)：多重比較 {-}

jamoviのフリードマン検定には，多重比較の方法として*ダービン=コノバー法*と呼ばれる手法が用意されています。設定画面の「Pairwise comparisons (Durbin-Conover)」にチェックを入れると，図\@ref(fig:ANOVA-friedman-pairwise)のような形で多重比較の結果が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-pairwise} 

}

\caption{フリードマン検定後の多重比較}(\#fig:ANOVA-friedman-pairwise)
\end{figure}


結果の表には「**Statistic**（統計量）」としか書かれていませんが，この値はスチューデントのtの推定値で，その隣の「**p**」の欄はこのtの有意確率です。なお，DSCF法の場合とは異なり，このp値には多重比較の際の調整が加えられていませんので，実際の検定場面では，このp値を[ボンフェロニ法](#subsub:ANOVA-anova-posthoc-bonferroni)や[ホルム法](#subsub:ANOVA-anova-posthoc-holm)で修正してから判断したほうがよいでしょう。

この結果のp値をボンフェロニ法で修正する場合，今回は多重比較を全部で3回行っていますので，p値をすべて3倍して判断することになります。すると，「模型」条件と「動画」条件（p&lt;.001 &times; 3 &lt;0.003），「VR」条件と「動画」条件（p=0.004 &times; 3 =0.012）の間の差が有意ということになります。

##### Descriptives：記述統計量{-}

2つ目の「Descriptives」の項目は，その名のとおり各条件における記述統計量を算出するための設定項目です。ここにチェックを入れると，各条件における測定値の平均値と中央値が表示されます（図\@ref(fig:ANOVA-friedman-descriptives)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-descriptives} 

}

\caption{各条件の平均値と中央値}(\#fig:ANOVA-friedman-descriptives)
\end{figure}

##### Descriptive plot：記述統計量のグラフ{-}

3つ目の「Descriptive plot」にチェックを入れると，各条件の記述統計量をグラフに示すことができます。その際，下のラジオボタンで「Means（平均値）」を選択すると平均値のグラフが，「Medians（中央値）」を選択すると中央値のグラフが作成されます（図\@ref(fig:ANOVA-friedman-descriptive-plot)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/ANOVA/friedman-descriptive-plot} 

}

\caption{記述統計量のグラフ}(\#fig:ANOVA-friedman-descriptive-plot)
\end{figure}



<!--chapter:end:06-ANOVA.Rmd-->



# Regression：回帰分析 {#ch:regression}

この章では「\infig{analysis-regression.pdf} Regression（回帰分析）」ツールについて見ていきます。jamoviの基本構成では，ここには次の分析メニューが含まれています（図\@ref(fig:regression-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/menu} 

}

\caption{Regression（回帰分析）のメニュー}(\#fig:regression-menu)
\end{figure}

:::{.jmvmenu data-latex=""}
+ Correlation Matrix（相関行列） 変数間の相関係数を算出します。
+ Partial Correlation（偏相関） 変数間の偏相関・部分相関係数を算出します。
+ Linear Regression（線形回帰） 線形回帰分析を行います。
+ **Logistic Regression**（ロジスティック回帰） 
  - 2 Outcomes [Binomial]（2値：2項ロジスティック）　目的変数が2値変数である場合の回帰分析を行います。
  - N Outcomes [Multinomial]（多値：多項ロジスティック） 　目的変数が複数カテゴリの名義尺度変数である場合の回帰分析を行います。
  - Ordinal Outcomes [Multinomial]（順序ロジスティック） 　目的変数が順序尺度変数である場合の回帰分析を行います。
:::

たくさんの分析メニューが含まれていますが，これらは大きく*相関分析*と*回帰分析*の2つに分けることができます。最初の2つ「Correlation Matrix」と「Partial Correlation」が相関分析で，それ以外が回帰分析です。

## Correlation Matrix：相関行列{#sec:regression-cormat}

「Correlation Matrix（相関行列）」の分析メニューでは，変数間の*相関係数*を算出することができます。相関係数は，2つの変数の間の関係を\(-\textsf{1}\)〜1の間で数値化した値です。2つの変数のうち一方の値が大きいほどもう一方の変数値も大きくなるというように，2つの変数の間に似た関係がある場合を*正の相関*といい，このような関係が強く見られるほど相関係数は1に近づきます。

これに対し，一方の変数の値が大きくなるほどもう一方の変数の値は小さくなるというような反対の関係が見られる場合を*負の相関*と呼び，このような関係が強く見られるほど相関係数は\(-\textsf{1}\)に近づきます。

また，2つの変数の間に正の相関も負相関も見られない場合には，相関係数は0になります。つまり相関係数は，数値の符号（\(+\cdot -\)）で変数間の関係の向き（正・負）を，絶対値で関係の強度を示すのです（図\@ref(fig:regression-cor-fig)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cor-fig} 

}

\caption{相関係数}(\#fig:regression-cor-fig)
\end{figure}


相関係数の大きさについての解釈の目安としては，一般には表\@ref(tab:regression-correlation-pearson)のような基準がよく示されていますが，これらはあくまでも目安であり，相関係数がどの程度であれば相関が強いといえるかは研究対象などによっても異なります。

\begin{table}[H]

\caption{(\#tab:regression-correlation-pearson)相関係数の解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
相関係数の絶対値 & 相関の強さ\\
\midrule
0.7 〜 1.0 & 強い相関\\
0.4 〜 0.7 & 中程度の相関\\
0.2 〜 0.4 & 弱い相関\\
0.0 〜 0.2 & ほぼ相関なし\\
\bottomrule
\end{tabular}
\end{table}


なお，この分析メニューの名前にある*相関行列*というのは，さまざまな変数ペアについて算出した相関係数を1つの表にまとめたもののことです。




### 分析手順 {#sub:regression-correlation-analysis}

ここではまず，次のサンプルデータ（[regression_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data01.omv)）を用いて相関分析の方法について見ていきましょう。このデータファイルには，100家族分の父親・母親・娘の身長データが格納されています（図\@ref(fig:regression-data01)）。




\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/data01} 

}

\caption{サンプルデータ}(\#fig:regression-data01)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象家族のID
* `父身長`　父親の身長（単位：cm）
* `母身長`　母親の身長（単位：cm）
* `娘身長`　娘の身長（単位：cm）
:::

まずは基本的な分析手順からです。Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Correlation Matrix（相関行列）」を選択してください（図\@ref(fig:regression-correlation-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/correlation-menu} 

}

\caption{相関係数の算出}(\#fig:regression-correlation-menu)
\end{figure}

すると，図\@ref(fig:regression-correlation)のような画面が表示されます。ここでは，大まかな項目について見ておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/correlation} 

}

\caption{相関行列の設定画面}(\#fig:regression-correlation)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Correlation Coefficients**（相関係数）　算出する相関係数の種類を指定します。
+ **Hypothesis**（仮説）　有意性検定における仮説を指定します。
+ **Additional Options**（追加オプション）　結果の表示方法についてのオプション設定です。
+ **Plot**（作図）　結果の図を作成します。
:::

相関係数を算出するには，分析対象の変数を設定画面右側の「分析変数」欄に指定するだけです。ここでは，「ID」以外の3つの変数すべてを設定画面右側に移動してください（図\@ref(fig:regression-correlation-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/correlation-var} 

}

\caption{分析対象の変数を指定}(\#fig:regression-correlation-var)
\end{figure}


すると，図\@ref(fig:regression-cormat)のような形で結果が表示されます。とくに設定しない限り，相関係数として*ピアソンの相関係数*（*ピアソンの積率相関係数*，r）が算出されます（図\@ref(fig:regression-cormat)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cormat} 

}

\caption{相関係数の算出結果}(\#fig:regression-cormat)
\end{figure}

この表の「Pearson's r」という行に書かれている数値が相関係数です。ここでは，「父身長」と「母身長」の相関係数，「父身長」と「娘身長」の相関係数，「母身長」と「娘身長」の相関係数の3つの相関係数が1つの表にまとめられています。このように，複数の相関係数を1つの表にまとめたものが*相関行列*です。

なお，とくに分析設定を変更しないで相関係数を算出した場合，相関係数の下にその相関係数についての有意性検定の結果が示されます。このp値が有意水準より小さい場合に相関係数が統計的に有意であるとみなします。

### 分析設定{#sub:regression-correlation-setting}

相関係数の算出は上記の手順だけで十分なことがほとんどでしょうが，ピアソンの相関係数以外の相関係数を算出したい場合や，結果の表示方法を変更したい場合などもあるでしょう。そこで，相関分析の各設定項目についても簡単に見ておくことにします。

#### Correlation Coefficients：相関係数{-}

「**Correlation Coefficients**（相関係数）」には以下の項目が含まれています（図\@ref(fig:regression-cor-coeff)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cor-coeff} 

}

\caption{相関係数の設定項目}(\#fig:regression-cor-coeff)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Pearson（ピアソン）　ピアソンの積率相関係数を算出します。
+ Spearman（スピアマン）　スピアマンの順位相関係数を算出します。
+ Kendall's tau-b（ケンドール）　ケンドールの順位相関係数（タウ-b）を算出します。
:::

ピアソンの積率相関係数についてはすでに説明しましたので，ここでは残りの2つについて簡単に説明しておきます。

##### Spearman：スピアマンの順位相関係数 {-}

ピアソンの相関係数は，正規分布する連続変数でないと適切な値が算出できません。そのような前提を満たさないデータで相関係数を求めたい場合，ピアソンの相関係数の代わりに*順位相関係数*と呼ばれる値が用いられることがあります。

*スピアマンの順位相関係数*はそうした順位相関係数の1つで，各変数値の順位情報を用いて相関係数を算出します。このスピアマンの順位相関係数では，ペアになる値の順位が完全に一致する場合に1，完全に逆になる場合に\(-\textsf{1}\)になります。相関係数の大きさの目安は，基本的にピアソンの相関係数の場合と同じです。

##### Kendall's tau-b：ケンドールの順位相関係数 {-}

*ケンドールの順位相関係数*（タウ-b）は，スピアマンの順位相関係数とは異なる考え方で，2つの変数の間の順序の類似度を算出します。スピアマンの順位相関係数ではペアになる値の順位の差をもとに相関係数の算出が行われるのですが，ケンドールの順位相関係数では，ペアになる値の大小関係のみを用いて相関係数を算出します。なお，ケンドールの順位相関係数も，値のとりうる範囲は\(-\textsf{1}\)から1までで，ピアソンの相関係数やスピアマンの相関係数と同じです。


#### Hypothesis：仮説{-}

「**Hypothesis**（仮説）」には以下の項目が含まれています（図\@ref(fig:regression-cor-hypothesis)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cor-hypothesis} 

}

\caption{有意性検定の設定項目}(\#fig:regression-cor-hypothesis)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Correlated（相関あり）　相関係数が0でない場合に検定結果が有意になります（両側検定）
+ Correlated positively（正の相関あり）　相関係数が0より大きい場合に検定結果が有意になります（片側検定）
+ Correlated negatively（負の相関あり）　相関係数が0より小さい場合に検定結果が有意になります（片側検定）
:::

ここでは，相関係数の有意性検定において，両側検定を用いるか片側検定を用いるかの設定を行います。

#### Additional Options：追加オプション{-}

「**Additional Options**（追加オプション）」には以下の項目が含まれています（図\@ref(fig:regression-cor-option)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cor-option} 

}

\caption{追加オプションの設定}(\#fig:regression-cor-option)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Report significance（有意性を報告）　相関係数の下に，「p-value（有意性検定のp値）」を表示します。
+ Flag significant correlations（有意な相関をマーク）　統計的に有意な相関係数の右肩に「\*」などの印をつけて示します。
+ N（標本サイズ）　相関係数の算出対象となった標本サイズ（データペアの数）を示します。
+ Confidence intervals（信頼区間）　相関係数の信頼区間を算出して示します。
:::

##### Report significance：有意性を報告 {-}

この項目のチェックがオンになっていると，相関係数の下に「相関係数が0である」という帰無仮説についての検定結果（p値）が表示されます。jamoviの初期設定では，この項目のチェックはオンになっています。

##### Flag significant correlations：有意な相関をマーク{-}

研究論文で相関行列を示す際には，すべての相関係数について有意性検定のp値を示すのではなく，5%や1%などの有意水準で統計的に有意な相関に「\*」や「\*\*」などの印をつけて示すのが一般的です。

このような，論文スタイルの相関行列を作成したい場合には，「Report significance」のチェックを外し，代わりに「Flag significant correlations」にチェックを入れるとよいでしょう。すると，相関行列は図\@ref(fig:regression-paper-cormat)のように論文でよく見かけるスタイルになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/paper-cormat} 

}

\caption{相関行列の見た目の変更}(\#fig:regression-paper-cormat)
\end{figure}

##### N：標本サイズ{-}

「N」にチェックを入れると，相関係数を算出する際に使用した標本サイズが相関行列に表示されます。欠損値を含むデータで，変数ペアごとに標本サイズが異なるような場合には，相関行列に標本サイズの情報を含めたほうがよいでしょう。

##### Confidence intervals：信頼区間{-}

「Confidence intervals」は，ピアソンの相関係数について信頼区間を出力するオプションです。スピアマンの順位相関係数やケンドールの順位相関係数では，このオプションの設定は無視されます。

信頼区間の幅は，その下の「Interval [　　]%」の数値で設定します。初期値では，95%信頼区間を算出するように設定されています。

#### Plot：作図{-}

「**Plot**（作図）」には以下の項目が含まれています（図\@ref(fig:regression-cor-plot)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cor-plot} 

}

\caption{作図設定}(\#fig:regression-cor-plot)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Correlation matrix（相関行列）　変数ペアごとの散布図を作成します。
  - Densities for variables（変数の密度曲線）　各変数について密度曲線（第\@ref(ch:exploration)章の[ヒストグラム](#subsubsub:exp-plots-histograms)を参照）を作成します。
  - Statistics（統計量）　図の中に相関係数の値を示します。
:::

##### Correlation matrix：相関行列 {-}

ここで「Correlation matrix（相関行列）」のチェックをオンにすると，各変数ペアの散布図が表示されます。この散布図には，*回帰直線*（「[回帰分析](sec:linear)」の項を参照）とその*標準誤差*も合わせて示されます。

##### Densities for variables：変数の密度曲線{-}

さらに，「Densities for variables」の項目にチェックを入れると，それぞれの変数について密度曲線が作成されます。

##### Statistics：統計量{-}

最後の「Statistics」は，図の中に相関係数を表示させるオプションです。このとき，図の中に示される相関係数は1種類のみで，複数の相関係数を算出するオプションが選択されている場合には，**Correlation Coefficients**（相関係数）の設定項目で上にある相関係数が優先されます。

サンプルデータでピアソンの相関係数を算出し，作図のオプションをすべてオンにすると，結果は図\@ref(fig:regression-cor-plot-sample)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/cor-plot-sample} 

}

\caption{作図の例}(\#fig:regression-cor-plot-sample)
\end{figure}

## Partial Correlation：偏相関{#sec:regression-partial}

相関行列に示されているそれぞれの相関係数は，あくまでも特定の2つの変数間での関係の強さを示す値で，他の変数による影響は一切考慮していません。たとえば，相関行列のところで使用したサンプルデータの相関行列（ピアソンの相関係数）をもう一度見てみましょう（図\@ref(fig:regression-partial-cormat)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/paper-cormat} 

}

\caption{父，母，娘の身長の相関行列}(\#fig:regression-partial-cormat)
\end{figure}

この結果では，父-娘の身長の相関係数は0.56，母-娘の身長の相関係数は0.48で，娘の身長は父親の身長とも母親の身長とも正の相関関係にあります。この結果ではまた，父親の身長と母親の身長の間にも有意な正の相関（0.31）があります。つまり，父親の身長が高い場合，母親の身長も高い傾向にあるわけで，そうなると，たとえば母-娘の身長の相関係数には，父-娘の相関係数による影響も混じってしまっていることになるのです（図\@ref(fig:regression-partial-basic)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/partial-basic} 

}

\caption{父，母，娘の身長の関係と相関係数，部分相関係数，偏相関係数}(\#fig:regression-partial-basic)
\end{figure}

このように，お互いに相関がある複数の変数間で関係の強さを見る場合，通常の相関係数では他の変数による影響が混在した形になるため，ときとして変数間の関係の解釈が困難になってしまうことがあります。そのような場合，関連する他の変数の影響を取り除いた後の，より純粋な変数間関係を捉えるための指標として，*部分相関係数*や*偏相関係数*が用いられます。

*部分相関係数*とは，たとえば父親の身長データと，母-娘間の相関の影響を取り除いた後の娘の身長データの間で算出した相関係数のことをいいます。これに対し，*偏相関係数*は，父と娘の身長データの両方から母親の身長による影響を取り除き，そのうえで父-娘間の身長の相関を算出した値です。

部分相関係数は，*重回帰分析*においてその変数を分析モデルに含めるべきかどうかを判断する際などに，偏相関係数は他の変数の影響を取り除いた後の2変数間の関係について知りたい場合などに用いられます。

### 分析手順 {#sub:regression-partial-analysis}

ここでは，相関行列のところで用いたのと同じサンプルデータ（[regression_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data01.omv)）を用いて，部分相関係数・偏相関係数を算出してみましょう。部分相関係数や偏相関係数の算出には，Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Partial Correlation（偏相関）」を選択します（図\@ref(fig:regression-partial-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/partial-menu} 

}

\caption{部分相関係数・偏相関係数の算出}(\#fig:regression-partial-menu)
\end{figure}

すると，図\@ref(fig:regression-partial-setting)のような設定画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/partial-setting} 

}

\caption{部分相関係数・偏相関係数の設定画面}(\#fig:regression-partial-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Variables（変数）　相関係数を算出したい変数を指定します。
+ Control Variables（統制変数）　相関係数から影響を取り除きたい変数を指定します。
+ **Correlation Coefficients**（相関係数）　算出する相関係数の種類を指定します。
+ **Hypothesis**（仮説）　有意性検定における仮説を指定します。
+ **Correlation Type**（相関タイプ）　部分相関係数・偏相関係数の指定を行います。
  - Partial（偏相関）　偏相関係数を算出します。
  - Semipartial（部分相関）　部分相関係数を算出します。
+ **Additional Options**（追加オプション）　結果の表示方法についてのオプション設定です。
:::

画面構成は相関行列の設定画面とよく似ていますが，設定画面右側の部分が2段に分かれているところ，「**Correlation Type**（相関タイプ）」という設定項目があるところが異なります。また，追加オプションには，信頼区間に関する設定がありません。さらに，この分析メニューには「**Plot**（作図）」機能はありません。

なお，「**Hypothesis**（仮説）」や「**Additional Options**（追加オプション）」などの設定項目の動作は「Correlation Matrix（相関行列）」と同じですので，ここでは説明を省略します。

#### Correlation Type：相関タイプ {-}

「**Correlation Type**（相関タイプ）」では，偏相関係数を算出するか，部分相関係数を算出するかを設定します。

###### Partial：偏相関 {-}

ここでは，母親の身長と娘の身長について，父親の身長の影響を取り除いた偏相関係数を算出することにしましょう。

その場合，まず「母身長」と「娘身長」を「Variables」欄に移動します（図\@ref(fig:regression-partial-variables)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/partial-variables} 

}

\caption{分析対象の変数を設定}(\#fig:regression-partial-variables)
\end{figure}

次に，影響を取り除きたい変数（ここでは「父身長」）を「Control Variables」欄に移動します（図\@ref(fig:regression-partial-control)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/partial-control} 

}

\caption{コントロール変数を設定}(\#fig:regression-partial-control)
\end{figure}

このとき，「**Correlation Type**」で「Partial（偏相関）」が選択されていることを確認してください。すると，図\@ref(fig:regression-partial-results)のような結果が表示されます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/partial-results} 

}

\caption{偏相関係数の結果}(\#fig:regression-partial-results)
\end{figure}


結果の表の下の部分に「controlling for '父身長'」という注釈がついていますね。これは「父身長」の影響を取り除いているという意味です。最初の相関行列では母親と娘の相関係数は0.48でしたが，このように父親の影響を取り除いた母-娘の身長の偏相関係数は0.38とやや値が小さくなります。

###### Semipartial：部分相関 {-}

今度は母親の身長と娘の身長について，父親の身長の影響を取り除いた部分相関係数を算出してみましょう。

先ほどと同様に，「母身長」と「娘身長」を「Variables」欄に，「父身長」を「Control Variables」欄に移動したら，「**Correlation Type**」で「Semipartial（部分相関）」を選択します（図\@ref(fig:regression-semipartial-setting)）。


<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/semipartial-setting} 

}

\caption{部分関係数の算出}(\#fig:regression-semipartial-setting)
\end{figure}

すると，図\@ref(fig:regression-semipartial-results)のような結果が得られます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/semipartial-results} 

}

\caption{部分相関係数の結果}(\#fig:regression-semipartial-results)
\end{figure}


偏相関係数の場合と違い，係数が2つ表示されていますね。偏相関係数の場合，母親の身長と娘の身長の両方から父親の身長の影響を取り除いて相関係数を求めますが，部分相関係数の場合には，父親の身長の影響を取り除くのは母親の身長と娘の身長のどちらか一方だけであるため，母・娘のどちらの身長から父親の身長の影響を取り除いたかによって値が異なるためです。

表の注釈にあるように，この結果では統制変数（「父身長」）の影響は列（columns）にある変数からのみ取り除かれています。つまり，右上の0.32という値は母身長から「父身長」の影響を取り除いたものと「娘身長」の部分相関係数，左下の0.36という値は娘身長から「父身長」の影響を取り除いたものと「母身長」の部分相関係数です。

## Linear Regression：線形回帰{#sec:regression-LR}

相関係数というのは，ペアになる2つの変数のうち，一方の値が大きくなればもう一方の値も大きくなるといった，変数間の関係についての指標です。変数間にこうした関係が見られるのであれば，一方の値からもう一方の値の大きさについて，ある程度の推測ができるはずです。このような考え方に基づいて，関心のある変数を他の変数からどの程度推測（説明）できるかを見るのが*回帰分析*です。

### 考え方 {#sub:regression-LR-basic}

まず，回帰分析の基本的な考え方を見ておきましょう。

次の例について考えてみてください。

> Ａさんは，健康上の理由からダイエットを始めました。ダイエットのためにＡさんがしていることは運動（ウォーキング）です。ダイエット開始前のＡさんの体重は80kgでした。

この場合，運動量と体重の間には「運動量が増えるほど体重が減る」という関係があることでしょう。これは*負の相関*です。このような関係がある場合，次のようにして1日あたりの運動量からＡさんの1ヶ月後の体重を大まかに予想することが可能になります。

まず，ウォーキングによる消費カロリーは1時間で「250kcal」程度になるそうです。ここで，今後1ヶ月間に毎日1時間のウォーキングを行ったとしましょう。その場合，1ヶ月間のウォーキングによる「250 &times; 30 = 7500kcal」を追加で消費することになります。また，人間の脂肪「1kg」のエネルギー量はだいたい「7200kcal」に相当するのだそうで，ということは，毎日1時間のウォーキングを1ヶ月間続けた場合の消費カロリーは，「7500 &divide; 7200 = 1.04...」でおおよそ脂肪1.04kg分ということになります。

もちろん，実際には食事量などの影響もありますのでここまで単純ではありませんが，上記のような関係があるのであれば，毎日1時間のウォーキングを1ヶ月続けると1ヶ月後には体重が1.04kg減，毎日2時間のウォーキングなら体重が2.08kg減になると予測できます。

このことをごく単純な関係式の形で表すと，次のような形になります。

\begin{align*}
\text{1ヶ月後の体重} &= \text{現在の体重} - \text{運動で消費される脂肪の量} \\
&= 80\text{kg} - 1.04 \times \text{毎日のウォーキング時間}
\end{align*}

この式が「毎日のウォーキング時間」から「1ヶ月後の体重」を予測（説明）する形になっているのがわかるでしょうか。つまり，「現在の体重」に加えて「毎日のウォーキング時間」さえわかれば，1ヶ月後の体重をおおよそ知ることができるようになるわけです。このような，ある変数（1ヶ月後の体重）の値を別の変数から予測（説明）する式のことを*回帰式*や*回帰モデル*と呼びます。

この式において，式の左辺にある変数（1ヶ月後の体重）は*目的変数*，この目的変数を予測，説明するために用いられる変数（毎日のウォーキング時間）は*説明変数*と呼ばれます^[他の呼び方もありますが，話がややこしくなるのでここでは省略します。]。回帰分析においては，説明される側の変数（目的変数）は1つ，説明する側の変数（説明変数）は1つまたは複数です。説明変数が1つの場合を*単回帰分析*，複数ある場合を*重回帰分析*と呼んで区別することもあります。

なお，先ほどの回帰モデルは，一見すると説明変数が2つあって重回帰分析のモデルのように見えるかもしれません。しかし，この式で毎日のウォーキング時間を長くしたり短くしたりしてその影響を見た場合，ウォーキング時間はそのつど値が変化しますが，現在（ダイエット開始時）の体重はすでに決まっていて変わることがありません（*定数*）。そのため，このモデルの説明変数は「毎日のウォーキング時間」のみであり，これは単回帰分析のモデルということになるのです。

この回帰式を，もう少し一般化した形で書くと次のようになります。

\[
目的変数 = b_0 + b_1 \times 説明変数
\]

この\(b_0\)の部分は*切片*，\(b_1\)の部分は*回帰係数*と呼ばれます。先ほどの式の「現在の体重」は，この切片に相当する部分です。回帰分析でとくに重要なのは「回帰係数」で，これが目的変数に対する説明変数の影響力の強さや向きを表します。

また，説明変数が複数ある重回帰分析の場合には，回帰式は次のような形になります。

$$
目的変数 = b_0 + b_1 \times 説明変数_{1} + b_2 \times 説明変数_{2}+ \cdots + b_n \times 説明変数_{n}
$$

この式の場合，\(b_1\)から\(b_n\)の部分はとくに*偏回帰係数*と呼ばれます。これらの値は[偏相関係数](#sec:regression-partial)と同様に他の変数の影響を除外して算出されており，それぞれの説明変数が単独で持っている影響力の強さや向きを示しています。

なお，回帰分析にはいくつかの手法があり，目的変数と説明変数の間にピアソンの相関係数で捉えることができるような直線的な関係（*線形関係*）があることを想定したものをとくに*線形回帰*と呼びます。

### 基本手順 {#sub:regression-LR-howto}

それでは回帰分析の手順を見ておきましょう。ここでも，サンプルデータは[相関行列](#sec:regression-cormat)のところで用いたのと同じデータ（[regression_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data01.omv)）を用います。（線形）回帰分析を実行するには，Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Linear Regression（線形回帰）」を選択してください（図\@ref(fig:regression-LR-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-menu} 

}

\caption{線形回帰}(\#fig:regression-LR-menu)
\end{figure}

すると，図\@ref(fig:regression-LR-menu)のような画面が表示されます。非常にたくさんの項目がありますので，まずは大まかな項目について見ておきましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-setting} 

}

\caption{線形回帰の設定画面}(\#fig:regression-LR)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Dependent Variable（従属変数）　回帰分析に使用する目的変数を指定します。
+ Covariates（共変量）　回帰分析に使用する説明変数のうち，連続型のものを指定します。
+ Factors（要因）　回帰分析に使用する説明変数のうち，名義型のものを指定します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Builder}}（モデルビルダー）　交互作用を含むモデルの作成や複数モデルの比較を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}（基準レベル）　比較基準として用いる水準値を指定します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Assumption Checks}}（前提チェック）　正規性の検定など，分析の前提条件をチェックします。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）　モデル適合度に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}（モデル係数）　モデル係数に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）　各主効果の周辺平均値（回帰モデルによる推定値）に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Save}}（保存）　モデル予測値や残差などを新たな変数として保存します。
:::

#### 単回帰 {-#lr-uni}

ここでは，「父身長」から「娘身長」をどの程度説明できるのかについて分析してみます。その場合，分析の「目的変数」は「娘身長」，「説明変数」は「父身長」です。線形回帰分析では，分析の目的変数にあたる変数を「Dependent Variable（従属変数）」に，そして説明変数として用いる変数は「Covariates（共変量）」または「Factors（要因）」に設定します。

「Covariates」と「Factors」の違いは，その説明変数が「連続型（\infig{variable-continuous.pdf} Continuous）」の変数であるか，「名義型（\infig{variable-nominal.pdf} Nominal）」の変数であるかです。そのことは，変数指定欄の右下のアイコンからもわかります。回帰分析に用いる説明変数は連続型（比率尺度や間隔尺度）である場合が一般的ですが，性別などの名義変数を説明変数として用いることもできるのです。

今回の分析では説明変数は父親の身長で，これは連続型変数ですから，「父身長」は「Covariates」の欄に移動します（図\@ref(fig:regression-LR-analysis)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-analysis} 

}

\caption{線形回帰の分析設定}(\#fig:regression-LR-analysis)
\end{figure}


これで基本的な分析は終了です。出力ウィンドウの結果は図\@ref(fig:regression-LR-results)のようになっているはずです。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-result} 

}

\caption{線形回帰の分析結果}(\#fig:regression-LR-results)
\end{figure}

結果の表のうち，最初の「Model Fit Measures（モデル適合指標）」の部分には，分析に使用した回帰モデルが従属変数をどの程度うまく説明できているかについての情報が示されています。「**Model**」の部分の数値（「1」）はモデルの番号です。複数のモデルを作成して比較する場合にはそれぞれのモデルを区別するために番号が用いられますが，ここではモデルを1つしか用いませんので，この数字は無視して構いません。

この表の「**R**」の部分は，このモデルによる予測値と実際の測定値（「娘身長」）の間の相関係数で，これは*重相関係数*と呼ばれています。今回の分析モデルのように，説明変数が1つしかない場合には，この重相関係数は「娘身長」と「父身長」の相関係数に一致します。その右の「**R²**」は*決定係数*と呼ばれ，これは0から1までの値をとります。この値は，「娘身長」の分散のうち，この回帰モデルで説明可能なものの割合，つまりこのモデルの「娘身長」に対する*説明率*を示しており，R²が0.31であるということは，このモデルで「娘身長」の分散の31%を説明できるということを意味しています。当然ながら，この値はできるだけ大きいことが望まれます。

この決定係数（R²）の値は，一般には次の式によって算出されます。

\[
R^2 = \displaystyle\frac{\text{予測値の平方和}}{\text{目的変数の平方和}}
\]

このようにして算出する場合，決定係数の値は重回帰係数を2乗した値に一致します。

2つ目の表には，切片や説明変数に関する情報が示されています。この表の「**Estimate**」の列が切片の値と説明変数の回帰係数の値です。この分析結果から，切片の値は44.71，「父身長」の回帰係数は0.56であることがわかります。これを回帰式の形にすると，次のようになります。

\[
\text{娘身長}= 44.71 + 0.56 \times \text{父身長}
\]

この回帰係数の値は，父親の身長が1cm変化した場合に娘の身長がどの程度変化するかを意味します。つまり，この分析結果から，父親の身長が1cm高くなれば，娘の身長は0.56cm高くなるということがいえます。

その右隣の「**SE**」の列には，これらの推定値の*標準誤差*が示されています。先ほどの切片の値や回帰係数はあくまでも推定値ですから，そこにはある程度の誤差のあることが考えられます。そしてその誤差の大きさについての指標がこの標準誤差です。さらに，この標準誤差に基づいて，それぞれの値が実際には0である可能性がないかどうかを検定した結果が「**t**」および「**p**」の部分です。この表の「**t**」の部分には，「母集団における実際の値は0である」という帰無仮説に対する検定統計量tの値が示されています。そして，このtの値に対する有意確率pがその隣の「**p**」の欄です。このpの値が有意水準を下回る場合に，回帰係数が有意である（0でない）と判断します。

なお，この場合の回帰モデルにおいては，切片の値は帳尻合わせのような役目しかありませんので，この値が0であるかどうかは分析の関心とはなりません。この場合，重要なのは父親の身長による影響力の部分です。この分析結果では，「父身長」の回帰係数についての検定結果は「p<.001」ですので，娘の身長に対する父親の身長の影響力は有意であるといえます。ただし，この検定はあくまでも回帰係数が「0でない」かどうかについてのものですので，この検定結果が有意であったからといって，「影響力が大きい」というわけではないという点には注意してください。影響力の大きさは，回帰係数の推定値で判断する必要があります。

#### 重回帰 {-#lr-multi}

今度は父親の身長だけでなく，父親と母親の両方の身長による影響について見てみましょう。分析手順は，基本的に先ほどの場合と同じです。Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Linear Regression（線形回帰）」を選択し，表示された設定画面の「Dependent Variable（従属変数）」に「娘身長」，「Covariates（共変量）」に「父身長」と「母身長」を指定します（図\@ref(fig:regression-lr-multireg-analysis)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-multireg-analysis} 

}

\caption{複数の説明変数を用いた分析}(\#fig:regression-lr-multireg-analysis)
\end{figure}


すると，「父身長」と「母身長」のそれぞれについて回帰係数が算出されます（図\@ref(fig:regression-lr-multireg-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-multireg-resutls} 

}

\caption{重回帰分析の分析結果}(\#fig:regression-lr-multireg-results)
\end{figure}

先ほどの「父身長」のみを説明変数とする単回帰分析の結果に比べ，決定係数（R²）は0.41と若干ですが大きくなっています。複数の説明変数を用いたことでモデルの複雑性が増し，「娘身長」の分散をより多く説明できるようになったのです。

重回帰分析における各説明変数の回帰係数は，とくに*偏回帰係数*と呼ばれます。この分析結果では，「父身長」の回帰係数は0.46で，単回帰の場合の回帰係数の0.56よりも少し小さくなっています。この場合の「父身長」の回帰係数は偏回帰係数で，これは「父身長」以外（ここでは「母身長」）の値を固定した場合の「父身長」の影響力を表しています。つまり，母親の身長が同じ家族の中では，父親の身長が1cm高くなると娘の身長が0.46cm高くなるということです。「母身長」の回帰係数についても同じで，父親の身長が同じ家族だけをみた場合に，母親の身長が1cm高くなれば，娘の身長は0.16cmだけ高くなるということになります。

### Model Builder：モデルビルダー{#sub:regression-LR-modelbuilder}

一般に，説明変数が複数ある重回帰モデルは，説明変数が1つしかない単回帰モデルに比べ，目的変数の分散についてより多くを説明することができます。しかし，それなら説明変数を増やせるだけ増やしたほうがいいかというと，そうではありません。説明変数が多くなればなるほどモデルは複雑化し，変数間の影響関係を理解することが困難になってしまうからです。つまり，重回帰分析を行う場合には，できるだけ説明変数が少なくシンプルで，かつ目的変数の分散をできるだけ多く説明できるモデルが好ましいのです。

先ほどの分析では，「母身長」の回帰係数は「父身長」の回帰係数に比べて小さな値でした。ということは，もしかしたら娘の身長を説明するには父親の身長がわかっていれば十分で，母親の身長を説明変数として用いる必要はなかったかもしれません。だとすると，父親と母親の両方の身長を説明変数として用いた回帰モデルは不必要に複雑なものだということになってしまいます。

ではこの場合，父親の身長のみを用いたモデルと，父親と母親の身長の両方を用いたモデルのどちらを採用するのがよいのでしょうか。jamoviに搭載されている「モデルビルダー」は，そうした判断を行う場合に便利な機能です。モデルビルダーでは，複数のモデルの間で比較を行い，モデルに使用する説明変数の選択を行うことができます。

それでは，モデルビルダーを用い，父親の身長のみの回帰モデルと父親と母親の身長を用いた回帰モデルの間で比較を行ってみましょう。先ほどの「父身長」と「母身長」を説明変数として用いた回帰分析の結果をクリックし，分析設定画面を再度開いてください。そして，その設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Builder}}（モデルビルダー）の部分を展開すると，次のような画面が現れます（図\@ref(fig:regression-lr-model-builder)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder} 

}

\caption{モデルビルダー}(\#fig:regression-lr-model-builder)
\end{figure}

画面左側の「Predictors（予測変数）」には，この回帰分析で用いられている説明変数の一覧が表示されています。そして右側の「Blocks（ブロック）」の部分にも，先ほど分析に使用した説明変数が表示されています。


ここでまず，「**Block 1**」のところにある「母身長」を選択し，「\infig{action-back.pdf}」をクリックしてBlock 1の部分から「母身長」を削除します（図\@ref(fig:regression-lr-model-builder-mother)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-mother} 

}

\caption{motherをBlock 1から削除}(\#fig:regression-lr-model-builder-mother)
\end{figure}


<!-- -->

次に，\colorbox{ao}{\textcolor{white}{+Add New Block}}をクリックして，新たなブロックを作成します（図\@ref(fig:regression-lr-model-builder-newblock)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-newblock} 

}

\caption{新たなブロックを作成}(\#fig:regression-lr-model-builder-newblock)
\end{figure}


そして，先ほどBlock 1から削除した「母身長」を，新しく作成した「**Block 2**」にマウスでドラッグして移動します（図\@ref(fig:regression-lr-model-builder-add-mother)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-add-mother} 

}

\caption{motherをBlock 2に追加}(\#fig:regression-lr-model-builder-add-mother)
\end{figure}

ここまでの設定を行ったら，分析結果を見てみましょう。分析結果は図\@ref(fig:regression-lr-model-builder-results)のようになっているはずです。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-results} 

}

\caption{モデルビルダーの出力結果}(\#fig:regression-lr-model-builder-results)
\end{figure}

<!-- -->

1つ目の「Model Fit Measures（モデル適合度）」の表には，モデルビルダーの「Block 1」に指定した説明変数のみを用いたモデル（Model 1）の適合度（重相関係数Rおよび決定係数R²）と，そこに「Block 2」に指定した説明変数を加えた場合（Model 2）の適合度が示されています。つまり，このModel 1は「父身長」のみを説明変数とする回帰モデル，Model 2は「父身長」と「母身長」を説明変数とする回帰モデルの分析結果です。

ですから，これらの数値はそれぞれ，「父身長」のみを説明変数として行った単回帰分析の結果（[単回帰](#lr-uni)参照）や，「父身長」と「母身長」を説明変数として行った重回帰分析の結果（[重回帰](#lr-multi)参照）と同じ値です。

2つ目の「Model Comparisons（モデル比較）」の表は，この2つの回帰モデルの精度を比較した結果です。この表の「Comparison」の部分には，比較対象となっているモデル（ここではModel 1とModel 2）が，「ΔR²」の部分には2つのモデルで決定係数がどれだけ異なるかが示されています。そしてこの結果から，説明変数が「父身長」のみのModel 1に比べ，説明変数として「父身長」と「父身長」の2つを用いたモデルのほうが，決定係数が0.10だけ大きいということがわかります。

その横の「F」から「p」までの部分は，この決定係数の増加分が「0でない」かどうかについての検定結果です。表の中のFの値は，Model 1では説明しきれずModel 2によって新たに説明される部分の分散を，Model 2の残差の分散で割って求められます。「df1」はModel 2とModel 1の説明変数の個数の差，「df2」はModel 2の残差自由度です。

そして，表の一番右端の有意確率pの値が有意水準を下回っている場合には，Model 1とModel 2の説明率の差が0ではない（「母身長」を説明変数に追加することが無駄ではない）ということになります。この分析結果では有意確率はp<.001ですので，「母身長」を説明変数に加えることによって回帰モデルの説明率が有意に向上したということができます。


この表の下の「**Model Specific Results**」の部分にある表は，比較したモデルのうちの1つについての分析結果です。このタイトル部分の横にあるプルダウンメニューで，どのモデルの結果を表示させるかを選択することができます。この画面では「Model 2」の結果，つまり「父身長」と「母身長」の両方を説明変数とする重回帰分析の結果が表示されています。


#### 交互作用を用いた回帰分析 {-}

重回帰分析では，それぞれの変数を個別に説明変数として用いるだけでなく，分散分析の場合と同様に，いくつかの説明変数間の交互作用を説明変数として用いることもできます。複数の説明変数による交互作用を回帰モデルに含める場合には，モデルビルダーで設定を行います。

先ほどの回帰モデルに，さらに「父身長」と「母身長」の交互作用を追加してみましょう。分析結果をクリックし，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Builder}}の「Blocks」に3つ目のブロックを追加してください（図\@ref(fig:regression-lr-model-builder-interaction)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-interaction} 

}

\caption{モデルビルダーで3つ目のブロックを作成}(\#fig:regression-lr-model-builder-interaction)
\end{figure}


そして，画面左側の「Predictors」の部分で「父身長」と「母身長」の2つを選択します^[複数の変数を同時に選択するには，いずれかの変数をクリックして選択したのち，「SHIFT(⇧)」キーを押しながらもう一方の変数名をクリックしてください。]。そして「Predictors」と「Blocks」の間にある2つの「\infig{action-forward.pdf}」ボタンのうち，下にあるほうをクリックすると，図\@ref(fig:regression-lr-model-builder-interaction-add)のように選択メニューが表示されますので，そこから「Interaction（交互作用）」を選択してください。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-interaction-add} 

}

\caption{モデルビルダーで3つ目のブロックを作成}(\#fig:regression-lr-model-builder-interaction-add)
\end{figure}


すると，次のように「Block 3」の部分に「父身長＊母身長」という項目が追加されます（図\@ref(fig:regression-lr-model-builder-interaction-setting2)）。これが交互作用項です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-interaction-setting2} 

}

\caption{3つ目のブロックに交互作用を設定}(\#fig:regression-lr-model-builder-interaction-setting2)
\end{figure}



なお，「Predictors」と「Blocks」の間に似たような「\infig{action-forward.pdf}」ボタンが上下に2つ並んでいますが，下にあるほう（右側に小さな三角があるもの）は，このように選択した変数の主効果（つまり交互作用なし）や交互作用を個別に指定してモデルに追加するためのボタンです。これに対し，上にあるほうの「\infig{action-forward.pdf}」ボタン（小さな三角がないもの）は，選択された変数の主効果とすべての交互作用の組み合わせをモデルに追加します（図\@ref(fig:regression-lr-model-builder-arrow-buttons)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-arrow-buttons} 

}

\caption{ボタンの役割の違い}(\#fig:regression-lr-model-builder-arrow-buttons)
\end{figure}


<!-- -->
ただし，すでに先のブロックでモデルに追加されている変数や交互作用項を後のブロックで重ねて追加することはできませんので，そのような変数や交互作用がある場合には，それらは新しいブロックには追加されません。


では結果を見てみましょう。基本的な結果の見方は先ほどと同じですので，ここではとくに，2つ目の表（Model Comparisons）に注目して見ておきます（図\@ref(fig:regression-lr-model-builder-result2)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-builder-result2} 

}

\caption{モデルの比較}(\#fig:regression-lr-model-builder-result2)
\end{figure}


この表には，Model 1とModel 2の比較，そしてModel 2とModel 3の比較が示されています。この分析結果では，Model 1とModel 2の説明率の差は有意，つまり説明変数が「父身長」のみのモデルに「母身長」を加えればモデルが有意に向上しますが，Model 2とModel 3の間では差は有意ではありません。ということは，Model 2にさらに「父身長」と「母身長」の交互作用を加えてもモデルの説明率は有意には向上しない，つまり「娘身長」の値を説明する上で，「父身長」と「母身長」の交互作用は必要ないということになるのです。このようにして，関心のある変数や交互作用項を段階的に回帰分析モデルに投入していき，モデルの説明率が有意に増加するかどうかを確認して最適なモデルを選択する方法は，*階層的重回帰分析*とも呼ばれます。

なお，先ほどの分析結果では「父身長＊母身長」は有意ではありませんでしたが，もしこの交互作用の回帰係数が\(-\textsf{2.15}\)のような値で有意になっていたとすると，それは「父親の身長が高ければ高いほど（低ければ低いほど），娘の身長に対する母親の身長の影響力が小さくなる（大きくなる）」という関係があることを意味します。

このような2変数間の交互作用であれば解釈可能かもしれませんが，これが3変数間，4変数間の交互作用になったらどうでしょうか。おそらくほとんど解釈できなくなってしまうでしょう。交互作用を解釈できなければ，当然ながら交互作用が有意であった場合の分析結果を理解することもできません。このように，回帰分析における交互作用項は一般に解釈が困難になりがちですので，回帰モデルに交互作用を含めるかどうかはよく考えてから判断するようにしましょう。

### Reference Levels：基準レベル{#sub:regression-LR-reflevels}

今度は別のデータで回帰分析を行ってみましょう。次のサンプルデータ（[regression_data02.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data02.omv)）をダウンロードして開いてください。このデータファイルは，先ほどと同じく100家族分の身長データなのですが，父母の身長と子供の身長，そしてその子供の性別が記録されています（図\@ref(fig:regression-data02)）。




\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/data02} 

}

\caption{サンプルデータ2}(\#fig:regression-data02)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象家族のID
* `父身長`　父親の身長（単位：cm）
* `母身長`　母親の身長（単位：cm）
* `子身長`　子供の身長（単位：cm）
* `性別`　子供の性別（男・女）
:::

このデータを用いて，子供の身長が父親・母親の身長と子供の性別という3つの変数からどのように説明できるかを見てみたいと思います。

まず，Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Linear Regression（線形回帰）」を選択し，表示された設定画面の「Dependent Variable（従属変数）」に「子身長」，「Covariates（共変量）」に「父身長」と「母身長」を指定します（図\@ref(fig:regression-lr-reference01)）。ここまでは，従属変数の名前が違うこと以外は，先ほどの分析とまったく同じです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-reference01} 

}

\caption{連続型説明変数の設定}(\#fig:regression-lr-reference01)
\end{figure}


次に，「性別」変数ですが，この変数は名義尺度変数ですので，これは「Factors（要因）」へ移動します（図\@ref(fig:regression-lr-reference02)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-reference02} 

}

\caption{名義型説明変数の設定}(\#fig:regression-lr-reference02)
\end{figure}

```{=latex}
\clearpage
```

すると，図\@ref(fig:regression-lr-reference-results)のような結果が得られます。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-reference-results} 

}

\caption{名義型説明変数を含む回帰分析の結果}(\#fig:regression-lr-reference-results)
\end{figure}

この結果は基本的にはこれまでの重回帰分析のものと同じなのですが，最後の「性別:」の行が少し特殊な形になっています。この「性別: 女 - 男」の行は，子供の性別が「女」の場合に身長が平均的にどの程度変化するかを示しています。つまり，子供が女の子の場合には，平均して男の子よりも身長が0.96cm高くなるということなのです。

このような名義型の説明変数の場合には，男の子の身長を基準にするか，女の子の身長を基準にするかによって，表現の仕方が異なってきます。男の子の身長を基準に考えれば，女の子のほうが0.96cm背が「高い」ということになりますが，女の子の身長を基準に考えると，男の子のほうが女の子より0.96cm背が「低い」ということになるからです。

今回の分析ではどちらの表現であっても構わないと思いますが，もし「男の子の身長」のほうに関心があって，それに対する説明変数の影響を知りたい場合には，この結果のような「女の子の場合，男の子に比べて身長が平均で0.96cm高くなる」という形よりも，「男の子の場合，女の子に比べて……」という表現のほうがわかりやすいでしょう。そのような場合には，分析設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}（基準レベル）の項目で，基準となる変数値を指定することができます。

先ほどの回帰分析の結果をクリックし，分析設定画面を再度開いてください。そして，その設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}を展開すると，図\@ref(fig:regression-lr-reference-levels-setting)のような画面が現れます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-reference-levels-setting} 

}

\caption{名義型説明変数の基準レベルの設定}(\#fig:regression-lr-reference-levels-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Variable**（変数）　名義型説明変数の一覧です。
+ **Reference Level**（基準レベル）　回帰係数を算出する際の基準レベルを指定します。
+ **Intercept**（切片）　切片の計算方法を指定します。
  - Reference level (dummy coding)　基準レベルを0，それ以外を1の形に数値化します。
  - Grand mean (simple coding)　変数値の平均が0になるように数値化します。
:::


この画面の「Variable（変数）」欄には，この分析に用いられている名義型の説明変数が一覧表示されます。そして，その右側の「Reference Level（基準レベル）」で，それぞれの名義型変数について，どの値を基準に値を算出するかを指定することができます。

ここでは「男」が基準となっていますが，ここを「女」に変更すると，女児の身長が比較の基準となり，結果の表示は「男の子の場合，女の子に比べて……」という形になります。「Reference Level」の部分を「女」に設定してみましょう。すると，結果は図\@ref(fig:regression-lr-reference-levels-F)のようになります。


<!--  -->


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-reference-levels-F} 

}

\caption{女児の身長を基準とした回帰分析の結果}(\#fig:regression-lr-reference-levels-F)
\end{figure}

 
「性別」の回帰係数の符号（\(+/-\)）が逆になっているのがわかるでしょうか。この場合，「女の子の身長」という基準に対し，「男の子の身長」はそれよりも平均して0.96cmだけ低くなるという意味になります。

#### Intercept：切片 {-}

なお，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}の下のほうにある「**Intercept**（切片）」の部分では，名義型変数を回帰分析に用いる際の処理方法についての設定が可能です。，一般に，回帰モデルの説明変数に「性別」のような名義型の変数が含まれている場合には，基準とする値を「0」，比較する側の値を「1」に置き換える*ダミーコード化*（*ダミーコーディング*）という方法がとられます。たとえば，係数を算出する際の基準が「男」であれば，性別の値が「男」の場合を「0」，「女」の場合を「1」と置き換えたうえで計算を行うのです^[3種類以上の値が含まれる名義型変数の場合には少し複雑になりますが，基本的な考え方はこれと同じです。]。

###### Reference level (dummy coding)：ダミーコード{-}

この「**Intercept**」が「Reference level (dummy coding)」に設定されている場合には，基準となる値を「0」，それと比較する側の値を「1」として回帰係数の算出を行います。この方法では，どちらを基準とするかによって，名義型変数に対する回帰係数の符号が変わるだけでなく，切片の値も変化します。先ほどの分析結果で，「男」を基準にした場合と「女」を基準にした場合の結果を見比べてみてください。「女」を基準とした場合のほうが，切片の値が0.96だけ大きくなっているはずです。

###### Grand mean (simple coding)：シンプルコード{-}

これに対し，「**Intercept**」が「Grand mean (simple coding)」に設定されている場合には，基準となる値を「\(-\textsf{0.5}\)」，それと比較する側の値を「0.5」などとして，2つの変数値の平均値が0になるように数値化したうえで回帰係数の算出を行います。この方法では，どちらを基準にした場合にも切片の値は変化しません。変わるのは，名義型変数に対する回帰係数の符号だけです。なお，この場合の切片の値は，ダミーコード化して算出される2種類の切片の平均値と同じ値になります。

先ほどの分析結果の表の下に「ª Represents reference level」や「ª Represents reference level」という注釈があったのはこのためです。説明変数に名義型変数が含まれる回帰分析では，このように計算方法によって切片の値が異なってきますので，その点には注意してください。

### Assumption Checks：前提チェック{#sub:regression-LR-assumption}

t検定や分散分析のように，回帰分析にも分析における前提条件がいくつかあります。それらの前提条件が満たされているかどうかは，分析設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Assumption Checks}}（前提チェック）の部分にある項目を用いて確認できます（図\@ref(fig:regression-lr-assumption)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption} 

}

\caption{回帰分析の前提チェック}(\#fig:regression-lr-assumption)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Assumption Checks**（前提チェック）　回帰分析の前提条件が満たされているかどうかをチェックするための項目です。
  - Autocorrelation test（自己相関検定）　自己相関の有無について検定します。
  - Collinearity statistics（共線性統計量）　多重共線性の問題が生じていないかどうかを確かめます。
  - Normality test（正規性検定）　残差の正規性について検定を行います。
  - Q-Q plot of residuals（残差Ｑ-Ｑプロット）　残差のＱ-Ｑプロットを作成します。
  - Residual plots（残差プロット）　残差のプロットを作成します。
+ **Data Summary**（データ要約）
  - Cook's distance（クックの距離）　各測定値についてクックの距離を算出します。
:::

t検定や分散分析では，分析の前提条件として，分析対象となる従属変数の分布が正規分布からかけ離れていないか，グループ間で分散が極端に異なっていないかなどが問題となりました。回帰分析の場合，回帰モデルによる予測値と目的変数の間の「残差」や，分析に使用する説明変数について，いくつかの前提条件が存在します。

##### Autocorrelation test：自己相関検定 {-}

回帰分析には，「残差が互いに独立である」という前提があります。「残差が独立」であるとは，各測定値の残差が不規則な値をとっており，そこに特定のパターンが見られないということです。そして，この残差の分布の仕方に特定のパターンが見られないかどうかを確認する方法の1つに，残差の*自己相関検定*があります。

たとえば時系列データ^[一定間隔ごとに測定された値など，時間的な順序が意味をもつデータのことです。]の場合，ある時点における測定値は，その直前・直後の測定値と似通った値になりがちです。このように，変数値の並びによって測定値間に相互に関連が見られるような状態を*自己相関*あるいは*系列相関*といいます。残差に自己相関が見られる場合，決定係数R²が実際より大きな値になってしまうといった問題が生じます。

残差の間に自己相関が見られないかどうかを確かめる方法としてよく用いられるのが*ダービン・ワトソン検定*です。回帰分析の前提チェックで「Autocorrelation test（ 自己相関検定）」のチェックをオンにすると，自己相関の検定としてこのダービン・ワトソン検定の結果が表示されます（図\@ref(fig:regression-lr-assumption-dw)）。

<!-- durbin-watson test -->


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-dw} 

}

\caption{自己相関検定の結果}(\#fig:regression-lr-assumption-dw)
\end{figure}


結果の表の**Autocorrelation**の部分が自己相関係数，**DW Static**の部分が*ダービン・ワトソン比*と呼ばれる値です。この値が2に近づくほど自己相関が弱く，2より大きい，あるいは小さいほど自己相関が強いことを意味します。表の一番右端のpは，このダービン・ワトソン比についての有意確率で，この値が有意水準より小さい場合に残差に自己相関があると判断されます。

##### Collinearity statistics：共線性統計量 {-}

重回帰分析に用いられる説明変数は，多くの場合，お互いにある程度の相関関係にあるものです。しかし，その関係が強すぎる場合，つまり分析に使用される説明変数の中に強い相関関係にある変数が含まれている場合には，回帰係数が本来の関係とは逆の符号になってしまったり，決定係数の値が適切に算出できなくなったりなど，回帰分析の結果が不安定になることが知られています。このような，複数の説明変数の間に強い相関関係がある状態を*多重共線性*といい，多重共線性の問題がある場合には，回帰分析の結果は信頼できないものになってしまうのです。

こうした問題が生じていないかどうかを確かめるには，回帰分析の前提チェックで「Collinearity statistics（共線性統計量）」のチェックをオンにします。すると，図\@ref(fig:regression-lr-assumption-colin)のような形で多重共線性の指標が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-colin} 

}

\caption{分散拡大係数とトレランス}(\#fig:regression-lr-assumption-colin)
\end{figure}


<!-- multico -->

この表の「VIF」の値は，*分散拡大係数*と呼ばれるもので，多重共線性の強さを示す指標としてよく用いられています。このVIFの値が大きいほど多重共線性が強く見られることを意味しており，この値が5を超えるような説明変数^[VIFの値が10以上の場合に問題があるとする考え方もあります。]は，分析から除外するなどの何らかの対策をとる必要があります。

また，その隣の「Tolerance（*トレランス*）」は，VIFの逆数（1/VIF）です。トレランスは，小さければ小さいほどその説明変数の多重共線性が強いことを意味します。


##### Normality test：正規性検定 {-}

回帰分析における主要な前提条件の1つに，残差が正規分布であることというものがあります。回帰分析の残差は単に独立であるだけでなく，正規分布に近いものでなければならないのです。

回帰分析において残差の正規性を確認するための方法にはいくつかのものがありますが，そのうちの1つが*シャピロ=ウィルク検定*です。回帰分析の前提チェックで「Normality test（正規性検定）」のチェックをオンにすると，回帰モデルの残差についてのシャピロ=ウィルク検定の結果が表示されます（図\@ref(fig:regression-lr-assumption-sw)）。

<!-- shapiro-wilk -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-sw} 

}

\caption{シャピロ=ウィルク検定}(\#fig:regression-lr-assumption-sw)
\end{figure}


シャピロ=ウィルク検定の値の見方は第\@ref(ch:exploration)章で見たのと同じです。検定統計量が1に近いほど正規分布からのずれが小さく，0に近いほど正規分布からのずれが大きいことを意味します。表の右側に示されている有意確率pの値が有意水準を下回る場合に残差が正規分布していないと判断されます。

##### Q-Q plot of residuals：残差Q-Qプロット{-}

残差の正規性については，グラフを用いて視覚的に判断する方法もあります。回帰分析の前提チェックで「Q-Q plot of residuals（残差Q-Qプロット）」にチェックを入れると，出力ウィンドウに残差の*Q-Qプロット*が表示されます（図\@ref(fig:regression-lr-assumption-qq)）。こちらも第\@ref(ch:exploration)章で説明したように，各データ点が直線上に並んでいれば残差が正規分布しており，そうでなければ正規分布でないと判断されます。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-qq} 

}

\caption{残差Q-Qプロット}(\#fig:regression-lr-assumption-qq)
\end{figure}


##### Residual plots：残差プロット {-}

回帰分析の残差は，互いに独立であること，正規分布からかけ離れていないことの他に，その分布の幅が予測値にかかわらず一定であることが必要とされます。残差の分布に何らかの特徴的な傾向が見られる場合，回帰分析の結果が妥当でない可能性があります（図\@ref(fig:regression-lr-assumption-residual)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-residual} 

}

\caption{残差の傾向の有無}(\#fig:regression-lr-assumption-residual)
\end{figure}


残差に何らかのこうした特徴的な傾向が存在しないかどうかを確認するためには，回帰分析の前提チェックで「Residual plots（残差プロット）」のチェックをオンにします。こうすることで，残差のばらつきをさまざまな形で視覚化して確認することができます。

<!-- 残差プロット1 -->


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-resplot1} 

}

\caption{予測値と残差の散布図}(\#fig:regression-lr-assumption-resplot1)
\end{figure}

残差プロットの1つ目のグラフ（図\@ref(fig:regression-lr-assumption-resplot1)）は，回帰モデルによる予測値と残差の関係を示したものです。このグラフ上の点が，グラフの左側から右側まで，縦軸の0の値を中心に同じような幅で上下に散らばっていれば，予測値に関係なく残差の分散に偏りはないといえます。グラフを見る限り，予測値と残差の間に特別な関係はなさそうです。


<!-- 残差プロット2 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-resplot2} 

}

\caption{目的変数と残差の散布図}(\#fig:regression-lr-assumption-resplot2)
\end{figure}

残差プロットの2つ目のグラフ（図\@ref(fig:regression-lr-assumption-resplot2)）は，回帰モデルの目的変数と残差の関係を示したものです。このグラフ上の点が全体に円状に散らばっていれば，目的変数と残差の間に特定の関係は見られないといえます。なお，このグラフでは目的変数と残差の間にはっきりとした正の相関関係が見られますが，モデルの決定係数が0.9を超えるようなものでもない限り，目的変数と残差の間にこうした相関関係が見られるのは問題ではありません。

<!-- 残差プロット3 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-resplot3} 

}

\caption{各説明変数と残差の散布図}(\#fig:regression-lr-assumption-resplot3)
\end{figure}

残差プロットの3つ目以降のグラフ（図\@ref(fig:regression-lr-assumption-resplot3)）は，各説明変数と残差の関係を示したものです。このグラフ上の点が全体に円状に散らばっていれば，それらの説明変数と残差の間に特別な関係は見られないということがいえます。このグラフを見る限り，これらの説明変数と残差の間には特別な関係は見られません。

#### Data Summary：データ要約 {-}

ピアソンの相関係数が*外れ値*の存在によって影響を受けやすいのと同様に，回帰分析においても外れ値による影響によって結果が歪められてしまう場合があります。回帰分析において外れ値による影響が見られないかどうかを確認する方法は，1つには先ほどのように残差プロットを作成し，残差のグラフの中に他からかけ離れた点がないかどうかを視覚的に確認することです。

##### Cook's distance：クックの距離{-}

回帰分析の結果を歪めるような外れ値の存在を視覚的にではなく数量的に確かめたい場合には，*クックの距離*と呼ばれるものがよく用いられます。クックの距離は，データ全体を用いた回帰分析の結果と，そのデータの中から特定の測定値を除外して行った回帰分析結果の間のずれを数値化したもので，クックの距離が大きい測定値がデータに含まれている場合には，その測定値が回帰分析の結果を歪めてしまっている可能性があります。一般に，クックの距離が0.5を超えるような値は影響が「大きい」とみなされ，この値が1を超えるような場合には，その影響が「特に大きい」とみなされます。

クックの距離を算出するには，回帰分析の前提チェックで「**Data Summary**（データ要約）」の部分にある「Cook's distance」にチェックを入れます。すると，図\@ref(fig:regression-lr-assumption-cook)のような形で結果が表示されます。

<!-- cook's distance  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-assumption-cook} 

}

\caption{クックの距離}(\#fig:regression-lr-assumption-cook)
\end{figure}


表として結果に示されるのは，各測定値についてのクックの距離の記述統計量（平均値，中央値と標準偏差，および最小値・最大値）のみですが，この後に触れる\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Save}}（[保存](#sub:regression-LR-save)）で設定を行うことによって，各測定値についてのクックの距離を新たな変数として保存することができます。クックの距離を新たな変数として保存すれば，分析結果に悪影響を及ぼしているデータ行がどれであるかを特定することもできるようになります。


### Model Fit：モデル適合度{#sub:regression-LR-modelfit}

作成した回帰モデルの精度に関する指標としては「重相関係数（R）」や「決定係数（R²）」がよく用いられていますが，回帰モデルの精度（データへの適合度）に関する指標はこれ以外にも複数存在します。

回帰分析の設定画面で\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）の部分を展開すると図\@ref(fig:regression-lr-modelfit)のような画面が表示され，適合度に関する指標の設定を行うことができます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-modelfit} 

}

\caption{モデル適合度}(\#fig:regression-lr-modelfit)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Fit Measures**　モデル適合度の指標を指定します。
  - R　重相関係数（R）を算出します。
  - R²　決定係数（R²）を算出します。
  - Adjusted R²　調整済み決定係数（R²）を算出します。
  - AIC　赤池情報量規準（AIC）を算出します。
  - BIC　ベイズ情報量規準（BIC）を算出します。
  - RMSE　誤差2乗平均平方根（RMSE）を算出します。

+ **Overall Model Test**（モデル全体の検定）　全体的なモデル適合度についての検定を行います。
  - F test（Ｆ検定）　説明変数を含まない帰無モデルと分析モデルに有意な差があるといえるかどうかについて検定を行います。
:::


このモデル適合度の項目は，適合度指標に関する設定と，適合度の検定に関する設定の大きく2つの内容で構成されています。

#### Fit Measures：適合度指標 {-}

回帰係数の適合度指標の1つである決定係数（R²）は，作成した回帰モデルによって目的変数の分散をどれだけ説明できるかを比率で表したものと解釈できます。つまり，決定係数が0.60であれば，その回帰モデルで目的変数の分散のうちの60%を説明できるということです。そのため，決定係数が高ければ，それだけ説明力のある，よいモデルということになります。また，重相関係数はモデルによる予測値と目的変数の実測値との間の相関係数であり，この重相関係数が1に近いほど，モデルが目的変数をよく説明できているということになります。また，一般に重相関係数を2乗した値は決定係数に一致します。

このように重相関係数や決定係数は非常に解釈の容易な指標なのですが，重回帰分析の場合，説明変数の個数が多くなるほど決定係数も大きくなる傾向にあるのです。そのため，これらの指標だけでモデルの良し悪しを判断すると，たくさんの説明変数が用いられた複雑なモデルのほうがよいモデルと判断されてしまうことになってしまいます。

しかし，これでは困ります。多変量解析を行うのは，多数の変数間の関係をできるだけ単純な形にしてわかりやすくすることが目的なわけですから，説明変数の個数が多く複雑なモデルほどよいということにはならないのです。回帰分析に求められているのは，できるだけシンプルで，かつ，できるだけ多くの情報を説明できるモデルだからです。

##### Adjusted R²：調整済決定係数{-}

そこで重回帰分析の場合，モデルの良し悪しを判断する材料として，決定係数の大きさを説明変数の個数で調節した*調節済決定係数*（調整済みR²）あるいは*自由度調整済決定係数*と呼ばれる値がよく用いられています（図\@ref(fig:regression-lr-modelfit-adjrsq)）。この値は，説明変数の個数が多くなるほど決定係数に対して「ペナルティ」を与え，決定係数が大きくなりすぎないようにします。こうすることによって，不必要に多くの説明変数を含んだモデルのほうが適合度が高くなるということを防いでいるのです。心理学の研究論文では，重回帰分析の結果の報告の際には決定係数の代わりに調整済決定係数を用いることが多いようです。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-modelfit-adjrsq} 

}

\caption{調整済決定係数}(\#fig:regression-lr-modelfit-adjrsq)
\end{figure}

調整済決定係数は説明変数の個数によって調整された値であるため，調整されていない決定係数よりもわずかに小さな値になります。もし，調整されていない決定係数と調整済決定係数の値が大幅に異なるようであれば，不必要な説明変数がモデルに多数含まれている可能性が考えられます。

また，調整済決定係数では「目的変数の分散を○○%説明できる」というような解釈はできません。そうした解釈を行う場合には，調整されていないほうの決定係数を見る必要があります。

##### AIC，BIC，RMSE：モデル選択の指標 {-#subsub:regression-modelselection}

モデルの適合度を相対的に評価するための指標としてしばしば用いられるものに，*赤池情報量規準*（AIC）や*ベイズ情報量規準*（BIC），があります。これらの値の算出方法についてはここでは触れませんが，これらの値は良好なモデル（少ない変数で多くを説明できる）ほど小さくなる性質があるため，複数モデルの中から良好なモデルを選択したい場合には，これらの指標が最小になるモデルを選択するようにします。


また，*誤差2乗平均平方根*（RMSE）も同様の指標で，この値は予測値と実測値の偏差2乗の平均値（つまり残差の分散）の平方根（つまり「残差の標準偏差」）です。モデルの予測精度が高いということは，それだけモデルの残差は小さくなるはずですから，この値が小さいほど，モデルの精度がよいということになります。なお，AICとBICは説明変数の個数を考慮して算出された値になっていますが，RMSEはそうでない点には注意が必要です。

なお，これらは相対的な比較のための指標であり，それ単独ではモデルの適合度がどの程度高いのかということまではわかりません。そのため，実際の分析場面では，これらの指標はモデルビルダーと組み合わせて使用するか，個別に作成したモデルの間で値の大小を比較したり変化量を見たりするかといった使い方が主になるでしょう（図\@ref(fig:regression-lr-modelfit-aic)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-modelfit-aic} 

}

\caption{モデル選択の指標}(\#fig:regression-lr-modelfit-aic)
\end{figure}


これらの適合度指標は，同じデータについて作成した複数のモデル間で適合度を比較することはできても，異なるデータについて作成されたモデル間で比較することはできません。また，AICやBIC，RMSEは，いずれか1つのみを用いることもありますが，複数の指標を用いて総合的にモデル評価を行うこともあります。

<!-- -->



#### Overall Model Test：モデル全体の検定 {-}

モデルの適合度について，指標という形ではなく，十分適合しているといえるかどうかという形で判断したい場合もあるでしょう。その場合は，「**Overall Model Test**（モデル全体の検定）」のところにある「F test（Ｆ検定）」のチェックをオンにします。


すると，図\@ref(fig:regression-lr-modelfit-anova)のような結果がモデル適合度指標の横に表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-modelfit-anova} 

}

\caption{モデル適合度の検定}(\#fig:regression-lr-modelfit-anova)
\end{figure}

モデルビルダーでは説明変数を追加することによる説明率の変化について検定を行いますが，ここでは切片のみのモデルと分析モデルの間で説明率が有意に向上したといえるかどうかについての検定を行います。したがって，表中のFの値は，切片だけでは説明しきれず，説明変数を用いることによって説明されるようになる分散を，分析モデルの残差の分散で割って求めた値です。「df1」は分析モデルにおける説明変数の個数（交互作用項を含むモデルの場合，交互作用項も含みます），「df2」は分析モデルの残差の自由度です。

この結果の有意確率pの値が有意水準を下回る場合にモデルの適合度が有意と判断されますが，この検定結果が有意であっても，それは「切片のみのモデルよりはましである」という意味でしかない点には注意が必要です。

### Model Coefficients：モデル係数{#sub:regression-LR-modelcoeff}

回帰分析の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}（モデル係数）には以下の項目が含まれています。ここでは，各説明変数の係数に関する設定を行います（図\@ref(fig:regression-lr-model-coeff)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-coeff} 

}

\caption{モデル係数の設定}(\#fig:regression-lr-model-coeff)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Omnibus Test**（オムニバス検定）　各説明変数についてオムニバス検定を行います。
  - ANOVA Test（ANOVA検定）　各説明変数の説明力が0でないかどうかを検定します。
+ **Estimate**（推定値）　回帰係数の推定に関する設定を行います。
  - Confidence interval（信頼区間）　回帰係数の信頼区間を算出します。
+ **Standardized Estimate**（標準化推定値）　回帰係数の標準化に関する設定を行います。
  - Standardized estimate（標準化推定値）　標準化回帰係数を算出します。
  - Confidence interval（信頼区間）　標準化回帰係数の信頼区間を算出します。
:::


#### Omnibus Test：オムニバス検定 {-}

「**Omnibus Test**（オムニバス検定）」では，各説明変数の説明力が0でないかどうかについての検定を行うことができます。*オムニバス検定*というのは，分散分析のように「他と値の異なるものが少なくとも1つ含まれていることはわかっても，具体的にそれがどの値かまではわからない」タイプの検定のことです。

この「ANOVA test」の部分にチェックを入れると，分析モデルから各説明変数を除外した場合とそうでない場合で，モデルの説明力に有意な差があるといえるかどうかについての検定結果が出力されます（図\@ref(fig:regression-lr-model-coeff-anova)）。
<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-coeff-anova} 

}

\caption{オムニバス検定の結果}(\#fig:regression-lr-model-coeff-anova)
\end{figure}

この検定の結果が有意でない説明変数は，目的変数の説明に貢献していないということですので分析から除外したほうがいいかもしれません。今回の分析では，「性別」の検定結果が有意ではありませんでした。

なお，回帰分析結果の「Model Coefficients」の表にも各係数についてのt検定の結果が出力されますが，これは「係数が0でない」，つまり影響力が0かどうかについての検定結果です。これに対し，このANOVA Testの結果は「その説明変数によって説明される分散が0でない」，つまりこの説明変数を用いる意味があるかどうかについての検定結果です。両者で検定仮説が異なる点に注意してください。

#### Estimate：推定値 {-}

分析結果の表にもそう書かれているように，回帰分析で算出される回帰係数はあくまでも「estimate（推定値）」であり，それが実際の関係を正確に示しているというわけではありません。そのため，回帰係数についても信頼区間を算出して検討することがあります。「**Estimates**」にある「Confidence Interval（信頼区間）」にチェックを入れると，回帰係数について指定した幅で信頼区間の上限と下限を算出することができます（図\@ref(fig:regression-lr-model-coeff-ci)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-coeff-ci} 

}

\caption{回帰係数の信頼区間}(\#fig:regression-lr-model-coeff-ci)
\end{figure}


#### Standardized Estimate：標準化推定値 {-}

重回帰分析における偏回帰係数の大きさは，説明変数の測定単位や大きさによる影響を受けます。たとえば，課題作業にかかった時間を分の単位で記録したもの（1.5分，0.75分など）を説明変数として用いた場合と，秒の単位で記録したもの（90秒，45秒など）を説明変数として用いた場合とでは，偏回帰係数の大きさが異なるのです。また，説明変数に「秒」を単位とする測定値と「mm」を単位とする測定値が含まれていた場合，それらの偏回帰係数の大きさを直接比較することはできません。1.2秒と0.7mmのどちらが大きいかというような判断はできないからです。

また，説明変数の単位がすべて同じである場合も，分散が大きな説明変数と小さな変数とでは，「1」のもつ意味合いが異なってきます。たとえば，長距離走のタイムにおける「1秒」の違いはごくわずかといえても50m走では「1秒」の差は非常に大きいといえるでしょう。これは，長距離走では分単位で測定値がばらつくのに対し，短距離走では測定値のばらつきの幅が数秒しかないためです。このように，測定値の分散の違いによって測定値における「1」の差の意味が大きく異なる場合もあります。

このような場合，偏回帰係数の大きさを見るだけでは，目的変数に対してどの説明変数がより強い影響を与えているのかを解釈することが困難です。そこでこのような場合には，各説明変数間の相対的な影響力を比較判断しやすくするために，それぞれの説明変数の値を*標準化*した場合の回帰係数を求めるという方法がとられます。このような，説明変数の値を標準化した場合の回帰係数のことを*標準化回帰係数*あるいは*標準化偏回帰係数*と呼びます。

jamoviで標準化回帰係数を算出する場合，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}の画面の右側にある「Standardized Estimate（標準化推定値）」のところにチェックを入れます。また，標準化回帰係数についても信頼区間を算出することができます。標準化回帰係数の信頼区間を算出するには，その下にある「Confidence Interval（信頼区間）」にチェックを入れます（図\@ref(fig:regression-lr-model-coeff-stb)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-model-coeff-stb} 

}

\caption{標準化回帰係数とその信頼区間}(\#fig:regression-lr-model-coeff-stb)
\end{figure}


なお，各説明変数の値を標準化した場合，回帰式の切片の値はつねに0になります。そのため，jamoviでは切片の標準化推定値は空欄で表示されます。


### Estimated Marginal Means：推定周辺平均{#sub:regression-LR-marginalmeans}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）の設定項目では，*推定周辺平均値*の算出や表示に関する設定を行います（図\@ref(fig:regression-lr-emm)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-emm} 

}

\caption{推定周辺平均}(\#fig:regression-lr-emm)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Marginal Means（周辺平均値）　周辺平均値の算出対象を指定します。
+ **General Options**（全般オプション）
  - Equal cell weights（均等重みづけ）
  - Confidence interval（信頼区間）　周辺平均値の信頼区間を算出します。
+ **Output**（出力）
  - Marginal means plots（周辺平均値のグラフ）
  - Marginal means tables（周辺平均値の表）
:::

推定周辺平均値とは，回帰モデルに基づく予測値のことです。ここで簡単にその考え方を見ておくことにしましょう。たとえば次の回帰モデルを用い，子供の身長の推定周辺平均値を算出してみます。なお，「性別」は男児が「1」，女児が「2」と入力されているものとします。

\[
\text{子身長} = 38.03 + 0.48 \times \text{父身長} + 0.16 \times \text{母身長} + 0.96 \times \text{性別}
\]

この場合，回帰式の「母身長」の値には，母親の身長の平均値（148.12）を代入します。また，「性別」の値はここでは「1」と「2」の中間である「1.5」を代入することにしましょう。すると，この回帰式は次のようになります。


\begin{eqnarray*}
\text{子身長} &=& 38.03 + 0.48 \times \text{父身長} + 0.16 \times 148.12 + 0.96 \times 1.5 \\
                        &=& 38.03 + 0.48 \times \text{父身長} + 23.6992 + 1.44 \\
                        &=& 62.4792 + 0.48 \times \text{父身長}
\end{eqnarray*}

すると，たとえば父親の身長が170cmであった場合，子供の身長は次のようになります。

\begin{eqnarray*}
\text{子身長} &=& 62.4792 + 0.48 \times 170 \\
                        &=& 144.0792
\end{eqnarray*}

このような考え方で算出されたものが推定周辺平均値です。


この推定周辺平均の設定では，目的変数との関係を示す説明変数を「Term（項）」として指定します。このとき，「Term」に指定されている変数が1つだけの場合にはその変数の主効果（その変数との単純な影響関係）について，複数ある場合にはそこに指定された変数間の交互作用についての推定周辺平均値が算出されます。


#### General Options：全般オプション{-}

「**General Options**（全般オプション）」では，推定周辺平均値の算出方法と，信頼区間についての設定が可能です。

##### Equal cell weights：均等重みづけ{-}

先ほどの計算例では，「性別」の値は「1」と「2」の中間の値をとって「1.5」で計算しました。男女の人数が同じ場合，この変数の平均値は1.5になりますが，そうでない場合には1.5からは少しずれた値になります。この場合，単純に男女（1と2）の中間点の値（1.5）を用いるか，それとも男女の人数を考慮した中間点（平均値）を用いるかによって結果が異なってきますので，どちらを用いて計算を行うかについては「Equal cell weights（均等重みづけ）」の部分で設定します。

ここにチェックが入っている場合は単純な中間点の値を用いた結果が，そうでない場合には両群の度数を考慮した中間点を用いて計算が行われます。なお，両群で度数が同じ場合や，名義尺度変数を説明変数に含まない場合には，このチェックのオン・オフは結果に影響しません。

##### Confidence Interval：信頼区間{-}

「Confidence interval（信頼区間）」のチェックをオンにすると，推定周辺平均値を図示する際に，その信頼区間についても合わせて示すことができます。


#### Output：出力{-}

推定周辺平均値は，図または表，あるいはその両方で示すことができます。「**Output**（出力）」のところで「Marginal means plots（周辺平均値のグラフ）」にチェックを入れればグラフが，「Marginal means tables（周辺平均値の表）」にチェックを入れれば表が示されます（図\@ref(fig:regression-lr-emm-plots)）。表の場合，その説明変数が平均値の場合と，平均値±1SDの場合のそれぞれの推定周辺平均値が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-emm-plots} 

}

\caption{推定周辺平均のプロットの例}(\#fig:regression-lr-emm-plots)
\end{figure}


### Save：保存{#sub:regression-LR-save}

バージョン1.8からは，分析で算出した各種の値を新たな変数として保存できるようになりました。回帰分析の「**Save**（保存）」には，次の項目が含まれています（図\@ref(fig:regression-lr-save)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-save} 

}

\caption{算出結果の保存}(\#fig:regression-lr-save)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Predicted values（予測値）　回帰モデルによる予測値を変数として保存します。
+ Residuals（残差）　回帰モデルの残差を変数として保存します。
+ Cook's distance（クックの距離）　クックの距離を変数として保存します。
:::

このように，jamoviの「Linear Regression（線形回帰）」では，回帰モデルの予測値，残差，そして各測定値についてのクックの距離を新たな変数として保存することができます。変数として使用したい項目にチェックを入れて設定画面を閉じ，スプレッドシートを見てみると，データの一番最後の列にこれらの値が新たな変数として格納されているのがわかります。このようにして残差やクックの距離を新たな変数として保存することで，これらの値についてさらに詳しい分析を行ったり，これらの値を別の分析に用いたりすることができるようになります（図\@ref(fig:regression-lr-save-residuals)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/lr-save-residuals} 

}

\caption{回帰分析の残差を保存した場合の例}(\#fig:regression-lr-save-residuals)
\end{figure}

なお，残念ながら，このようにして保存された変数に対してはデータフィルタ（第\@ref(ch:basics)章の\@ref(sec:data-filter)を参照）を適用することができません。データフィルタによって表示されるデータ行が変わると，それによって分析結果も変化してしまい，そしてこれらの変数の値も変化してしまうからです。

そのため，たとえばクックの距離が5を超えるデータ行を特定したいというような場合には，データファイルを表計算ソフトなどに書き出して処理をするか，その変数の値を別のデータ変数に貼り付けてからデータフィルタを適用するといった工夫が必要になります。

## 2 Outcomes [Binomial]：2項ロジスティック回帰{#sec:regression-binomial}

ある症状の有無に喫煙や飲酒といった生活習慣がどの程度影響を与えているのか，ある課題の成功・失敗に対象児の月齢や発達指数がどのように影響しているか，災害に対して備えをする・しないを規定する要因にはどのようなものがあるのか，など，何らかの出来事の「成功・失敗」や「あり・なし」と，その影響要因について検討したいということもあるでしょう。

その場合，関心対象となる出来事の有無（成功・失敗）を「1・0」などとダミーコード化して目的変数とし，原因として考えうる要因を説明変数とした回帰分析を行えばよさそうに思えます。しかし，一般的な線形回帰分析では，「1・0」のような*2値変数*を目的変数として用いることはできません。線形回帰分析では，回帰モデルの残差が正規分布であることが前提となっていますが，目的変数の値が1と0の2種類しかない場合，残差が正規分布であるということがまず考えられないからです。

そこでこのような場合には，*ロジスティック回帰分析*と呼ばれる手法がよく用いられます。この手法は，目的変数が名義型や順序型の変数である場合にも適切な結果が得られるように，線形回帰分析の考え方を拡張したものです。ロジスティック回帰分析には，目的変数が2値変数の場合に用いられる*2項ロジスティック回帰分析*，目的変数が複数のカテゴリをもつ名義型変数である場合に用いられる*多項ロジスティック回帰分析*，目的変数が順序型変数である場合に用いられる*順序ロジスティック回帰分析*など，いくつかの種類が存在します。

ここではまず，次のサンプルデータ（[regression_data03.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data03.omv)）を用いて，2項ロジスティック回帰分析についての基本的な考え方と分析方法を見ていくことにしましょう。

このデータファイルには，ある災害を体験した成人100名について，PTSD（心的外傷後ストレス障害）の有無とその人の性別と年齢，神経症傾向の強さ，そして体験した出来事の主観的強度が記録されています（図\@ref(fig:regression-data03)）。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/data03} 

}

\caption{サンプルデータ}(\#fig:regression-data03)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象者のID
* `PTSD`　PTSDの有無（あり，なし）
* `性別`　対象者の性別（男，女）
* `年齢`　対象者の年齢
* `神経症傾向`　対象者の神経症傾向の強さ
* `主観的強度`　体験の主観的強度（1-10）
:::

このデータを用いて，PTSDの有無にどの要因がどのような影響を与えているのかを分析することにしましょう。


### 考え方 {#sub:regression-binomial}

PTSDの有無に性別や年齢などがどのように影響を与えているかを見たい場合，その分析モデルを回帰式の形で表すと次のようになります。なお，分析においてはPTSDの有無は「あり」を「1」，「なし」を「0」としてダミーコード化するものとします。また，説明変数に含まれる性別についてもダミーコード化されているものとします。


\[
\text{PTSDの有無} = b_0 + b_1 \times \text{性別} + b_2 \times \text{年齢}+ b_3 \times \text{神経症傾向}+ b_4 \times \text{体験強度}
\]


通常の回帰分析では，目的変数は連続型変数である必要がありますが，このモデルでは目的変数に相当する「PTSD」には「`1`（あり）」か「`0`（なし）」かのいずれかの値しかありません。そのため，適切な分析結果を得るには，目的変数である「PTSDの有無」を何らかの形で連続的な数値に変換する必要があります。

ではたとえば，目的変数にPTSDの有無そのものではなく，PTSDが「あり」である確率を用いたらどうでしょうか。これならば，目的変数の値は0から1までの連続的な値をとり得ますし，そして算出された確率値が0.5以上なら「あり」，そうでなければ「なし」のように判断すれば，目的変数が2値データであってもうまく扱えそうです（図\@ref(fig:regression-binomial-probability)）。

<!-- 2値と確率 -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-probability} 

}

\caption{2値データと確率}(\#fig:regression-binomial-probability)
\end{figure}


一見するとこれで問題が解決したかのように見えるのですが，残念ながらこれでもまだ不十分です。というのも，確率の値がとるのは0から1までの範囲に限られていて，回帰式ではそのような範囲を限定した予測はできないからです。そのため，回帰式による予測値がマイナスの値になったり1を超えるような値になったりした場合には，その結果を解釈することができなくなってしまいます。

そこでその対策として，まず目的変数の値を確率から*オッズ*へと変換します。オッズというのは，ある出来事が起きる場合と起きない場合のそれぞれの確率の比のことで，たとえば「PTSDあり」の場合のオッズは次のようにして求められます。

\[
\text{PTSDありのオッズ} = \frac{\text{PTSDありの確率}}{\text{PTSDなしの確率}} = \frac{\text{PTSDありの確率}}{1-\text{PTSDありの確率}}
\]

もし「PTSDあり」が20人に1人の割合だったとすると，無作為に選ばれたある個人が「PTSDあり」である確率は「1/20 = 0.05」ですから，この場合の「PTSDあり」のオッズは次のようになります。

\[ 
\text{PTSDありのオッズ} = \frac{0.05}{1-0.05} = 0.0526\dots 
\]

また，「PTSDなし」であるオッズを算出したいなら次のようになります。

\begin{eqnarray*}
\textsf{PTSDなしのオッズ} &=& \frac{\text{PTSDなしの確率}}{\text{PTSDありの確率}} = \frac{\text{PTSDなしの確率}}{1-\text{PTSDなしの確率}}\\
  &=& \frac{0.95}{1-0.95} = 19 
\end{eqnarray*}


このようにして確率をオッズに変換することにより，目的変数の値は0から無限大の範囲をとることができるようになります。

ただし，PTSDありの確率がPTSDなしの確率よりも低い場合，PTSDありのオッズは0〜1の値しかとらないのに対し，PTSDなしのオッズは1から無限大となって，PTSDありの場合となしの場合で数値のとりうる幅が大きく異なってしまいます。また，もし回帰分析の予測値がマイナスの値になってしまう場合には，確率を用いる場合と同様に，結果を解釈できなくなってしまいます。

そこで，このオッズの値をさらに*対数変換*します。この「オッズの対数」のことを*対数オッズ*あるいは*ロジット*といい，「PTSDあり」の確率をpとしたときに，この確率pを次のようにして対数変換する式のことを*ロジット関数*と呼びます。

\[
\text{PTSDあり(}p\text{)のロジット} = \log \left( \frac{p}{1-p}\right)
\]

先ほどのPTSDありとなしの場合のそれぞれのオッズを対数変換すると，次のようになります。なお，この場合の対数には，一般に*ネイピア数e*^[ネイピア数eは円周率πなどと同じ数学定数の1つで，その値はおおよそ2.72です。]を底とする*自然対数*が用いられます。

\begin{eqnarray*}
\text{PTSDありのロジット} &=& \log \left( \frac{0.05}{1-0.05}\right) = -2.944\dots\\
\text{PTSDなしのロジット} &=& \log \left( \frac{0.95}{1-0.95}\right) = 2.944\dots
\end{eqnarray*}

対数変換前のオッズの値では，同じ1/20の確率の現象について「あり」のほうに注目した場合と「なし」のほうに注目した場合とでまったく異なる値になりましたが，ロジットに変換すると，このように「あり」の場合と「なし」の場合で数値の符号が逆になるだけで絶対値は同じ，つまり，どちらの場合も値の幅は同じになるのです。

確率をオッズに，そしてオッズをロジットに変換することで，これでようやくPTSDの有無という2値変数を回帰分析の目的変数として用いることができるようになりました。ここから先は，通常の回帰分析の場合と同様です。説明変数から目的変数をできるだけうまく説明できるようにして，切片や回帰係数の値を算出します。

このように，2項ロジスティック回帰では，関心とする事象が生起する確率についてのロジットを目的変数に使用します。このことは結果の解釈においても重要な意味を持ちますが，それについては分析結果の見方のところで説明します。

### 分析手順{#sub:regression-binomial-analysis}

それではサンプルデータをロジスティック回帰で分析してみましょう。2項ロジスティック回帰を実行するには，Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Logistic Regression（ロジスティック回帰）」の下にある「2 Outcomes [Binomial]」を選択します（図\@ref(fig:regression-binomial-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-menu} 

}

\caption{2項ロジスティック回帰の実行}(\#fig:regression-binomial-menu)
\end{figure}

すると，線形回帰分析の場合とよく似た設定画面が表示されます。最後から2つ目に\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Prediction}}（予測）という項目がある以外は線形回帰分析の設定画面と同じです（図\@ref(fig:regression-binomial-setting)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-setting} 

}

\caption{2項ロジスティック回帰の設定画面}(\#fig:regression-binomial-setting)
\end{figure}

表示された設定画面の「Dependent Variable（従属変数）」に「PTSD」を，「Covariates（共変量）」に「年齢」，「神経症傾向」，「主観的強度」を，「Factors（要因）」に「性別」を指定します（図\@ref(fig:regression-binomial-variable-settings)）。説明変数のうち連続型のものを「Covariates」に，名義型のものを「Factors」に設定するなど，変数の指定方法も線形回帰分析の場合と基本的に同じです。違うのは，従属変数（目的変数）に名義型変数（\infig{variable-nominal.pdf}）しか指定できないという点だけです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-variable-settings} 

}

\caption{目的変数と説明変数の設定}(\#fig:regression-binomial-variable-settings)
\end{figure}

これで基本的な設定は終わりですが，結果を見る前に1つだけ確認しておいたほうがよい部分があります。それは`\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference levels}}の部分です（図\@ref(fig:regression-binomial-reference-levels)）。2項ロジスティック回帰では目的変数は「あり・なし」や「はい・いいえ」などの2値変数ですので，分析ではそれらのうちいずれか一方の値を基準とした結果が算出されます。2つの値のうちどちらが基準になっているのかによって結果の意味が逆になりますので，ここは必ず確認しておくようにしましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-reference-levels} 

}

\caption{基準レベルの設定}(\#fig:regression-binomial-reference-levels)
\end{figure}

またこのとき，2つの値のうちのどちらを基準として設定するかによって，結果のわかりやすさが大きく変わってきますので，その点にも注意してください。もし，分析によって各説明変数がPTSDの「なりやすさ」にどのような影響を与えているかを見たいのであれば，基準レベルには「なし」の値を設定するようにします。基準レベルが「あり」になっていると，分析結果にはPTSDの「なりにくさ」についての値が表示されてしまい，解釈が困難になってしまいます。

これは，説明変数に含まれる名義型変数についても同様です。線形回帰分析の場合，2つの値のどちらを基準にするかは，回帰係数の符号が逆になる程度でそれほど大きな違いはありません。しかし2項ロジスティック回帰では，目的変数の値は実際の測定値ではなく「はい」または「いいえ」が生じる確率の「ロジット」ですので，回帰係数の符号が逆になると解釈が非常に困難になってしまうのです。ですので，たとえば「『男性に比べて』女性のほうがどの程度PTSDになりやすいか」を見たいのであれば，性別の説明変数については「男性」を基準に，「『女性に比べて』男性がどの程度PTSDになりやすいか」を見たいのであれば，性別の説明変数は「女性」に設定しておいたほうがよいのです。ここでは，目的変数（PTSD）については「なし」を基準に，性別については「男性」を基準とした結果を算出することにします。

ここまでの設定が終わったら，分析結果を見てみましょう。図\@ref(fig:regression-binomial-results)のような結果が表示されているはずです。

### 分析結果{#sub:regression-binomial-results}


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-results} 

}

\caption{分析結果}(\#fig:regression-binomial-results)
\end{figure}

1つ目（図\@ref(fig:regression-binomial-results)の左側）の表は，この回帰モデルの適合度指標（Model Fit Measures）に関する情報です。2項ロジスティック回帰では，初期設定では適合度の指標として**Deviance**（*逸脱度*），**AIC**，**\(\textsf{R}^{\textsf{2}}_{\textsf{McF}}\)**（マクファデンのR²）の3つの値が表示されます。逸脱度およびAICは小さい値であるほど，R²の値は1に近い値ほど分析モデルのあてはまりがよいことを意味します。これらの適合度指標については，この後の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）の部分で説明します。


2つ目（図\@ref(fig:regression-binomial-results)の右側）の表は回帰係数に関する結果です。この部分は線形回帰分析の結果と基本的に同じで，「**Estimate**（推定値）」の部分が回帰係数，「**SE**（標準誤差）」が回帰係数の標準誤差です（図\@ref(fig:regression-binomial-coeff)）。ただし，2項ロジスティック回帰では，回帰係数の有意性についての検定にはtではなく「**Z**」が用いられます。そして，Zの隣の「**p**」の値が有意水準を下回っている場合に，回帰係数が有意である（0でない）と判断します。

この分析結果では，体験の主観的強度と対象者の性別の影響が有意で，それぞれの回帰係数は主観的強度が1.98，性別が5.92といずれもプラスの値です。つまり，体験の主観的強度が大きな値の人のほうが，また，男性よりも女性のほうが「PTSDあり」になりやすいということです。

このように，2項ロジスティック回帰の結果は線形回帰分析の場合と非常によく似ているのですが，注意すべき点が1つあります。それは，2項ロジスティック回帰の回帰式は，目的変数そのものについてではなく，目的変数の「ロジット」について説明する形になっているという点です。つまり，ここに示されている回帰係数は，説明変数の値が1変化した場合の，目的変数のロジットの変化量を表しているのです。

たとえば，この結果では性別（基準レベル=男性）の回帰係数が5.92ですが，これは女性のほうが男性に比べて5.92倍PTSDになりやすい，あるいは5.92倍オッズが高いという意味ではなく，女性のほうが男性に比べて「PTSDあり」のロジットが5.92だけ増加するという意味になります。

ロジットはオッズを対数変換した値ですので，ロジットに対して対数変換の逆変換，つまり*指数変換*を行うことで，次のようにしてこの変化量をオッズに変換することができます。

\[
 e^{5.92} = 372.4117\dots
\]

この372.41という値は，男性を基準とした場合の女性のオッズの高さ，つまり男性のオッズと女性のオッズの比を表しており，女性の場合，男性に比べて「PTSDあり」であるオッズが372倍になるということを意味します^[これはあくまでも「オッズの倍率」である点に注意してください。女性のPTSD率が男性の372倍になるというわけではありません。]。この「女性のオッズ／男性のオッズ」のような，2つのオッズの比のことを*オッズ比*と呼びます。

先ほどは係数の値を指数変換することでオッズ比を求めましたが，実際にはこのような計算を自分でやる必要はありません。\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}の設定画面で「**Odds Ratio**（オッズ比）」の部分にチェックを入れれば，各回帰係数のオッズ比とその信頼区間を算出することができます。

なお，説明変数が連続型変数の場合，たとえばここでの分析結果では「主観的強度」は回帰係数が1.98で，これをオッズ比にすると7.21になります。これは，体験の主観的強度の値が1増えるとPTSDありのオッズが7.21場合になるということですが，ではもし，この体験の強度の値が2増えた場合，オッズ比はどうなるでしょうか。7.21 &times; 2 = 14.42倍でしょうか。そうではなく，この場合には\(7.21^2\) = 51.9841倍になります。

なぜそうなるのでしょうか。他の説明変数の値がすべて同じで，体験強度の値だけ異なる対象者が複数いたとしましょう。そのうちの1人（対象者A）は，体験の主観的強度の値が5で，もう1人（対象者B）は6だったとします。この場合，対象者AとBの体験強度の差は1ですから，先ほど見たように，対象者Bの「PTSDあり」のオッズは対象者Aの7.21倍になります。

さらに，体験強度が7の対象者（対象者C）がいたとしましょう。この対象者Cと先ほどの対象者Bの体験強度の差も1ですから，やはり対象者Cの「PTSDあり」のオッズは対象者Bの7.21倍になります。

するとこの場合，対象者Aと対象者Cの間には，体験の主観的強度の差が2だけあるわけですが，対象者Cは対象者Bの7.21倍のオッズで，そして対象者Bは対象者Aの7.21倍のオッズですから，対象者Cは対象者Aの7.21倍&times;7.21倍で51.9841倍になるのです。

実際の分析場面では，このようにして説明変数の値がいくつ増えたからオッズ比がどう，という形で結果を見ていくことはほとんどないかもしれませんが，結果の見方が線形回帰分析とまったく同じだと考えていると結果の解釈を誤ってしまう可能性もありますので，その点は注意しておきましょう。

少し長くなりましたが，これで結果の見方についての説明はおしまいです。ここからは，ロジスティック回帰分析の設定項目について見ていきましょう。なお，2項ロジスティック回帰の設定は大部分が線形回帰の場合と同じですので，ここでは2項ロジスティック回帰に特有の部分を中心に見ていくことにします。それ以外の部分については，線形回帰についての説明を参照してください。


### Assumption Checks：前提チェック {#sub:regression-binomial-assumption}

2項ロジスティック回帰では，前提チェックの項目は「Collinearity statistics（共線性統計量）」の1つだけしかありません（図\@ref(fig:regression-binomial-assumption-checks)）。線形回帰分析の場合にはいろいろあったのと対照的です。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-assumption-checks} 

}

\caption{前提チェック}(\#fig:regression-binomial-assumption-checks)
\end{figure}

ただし，では2項ロジスティック回帰は線形回帰よりも手軽に実行できるのかというと，そういうわけでもありません。今回のサンプルデータではそうではありませんが，実際のデータでは，「PTSDあり」の比率が「PTSDなし」に比べて非常に低いという場合もあるでしょう。そのような場合，「PTSDあり」の行がデータに十分に含まれていないと回帰係数をうまく推定できないのです。そのため，2項ロジスティック回帰には，一般に線形回帰分析よりも大きなサイズの標本が必要になります。


### Model Fit：モデル適合度{#sub:regression-binomial-model-fit}

分析結果のモデル適合度（Model Fit Measures）の表にどのような値を表示させるかは，分析設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）で設定できます（図\@ref(fig:regression-binomial-model-fit)）。

<!-- 設定画面 -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-model-fit} 

}

\caption{適合度指標の設定}(\#fig:regression-binomial-model-fit)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Fit Measures**（適合度指標）
  - Deviance（逸脱度）　モデルの残差逸脱度を算出します。
  - AIC（赤池情報量規準）　赤池情報量規準を算出します。
  - BIC（ベイズ情報量規準）　ベイズ情報量規準を算出します。
  - Overall model test（モデル全体の検定）　$\chi^{2}$を用いてモデル全体の有意性検定を行います。
+ **Pseudo R²**（擬似決定係数）　モデルのあてはまりの程度を標準化した値を算出します。
  - McFadden's R²（マクファデンのR²）　マクファデンの擬似決定係数を算出します。
  - Cox & Snell's R²（コックス=スネルのR²）　コックス＝スネルの擬似決定係数を算出します。
  - Nagelkerke's R²（ナゲルケルケのR²）　ナゲルケルケの擬似決定係数を算出します。
:::

適合度の指標に関する設定は，大きく「**Fit Measures**（適合度指標）」と「**Pseudo R² **（擬似決定係数）」の2つに分かれています。ここでは，これらについて簡単に見ておきましょう。

#### Fit Measures：適合度指標 {-}

「**Fit Measures**（適合度指標）」はその名のとおり，モデルの適合度（あてはまり）についての指標です。jamoviの2項ロジスティック回帰では，次の適合度指標を算出することができます。

##### Deviance：逸脱度{-}
1つ目の「Deviance（逸脱度）」にチェックを入れると，*残差逸脱度*が算出されます。残差逸脱度はモデルの*尤度*に基づいて算出される指標で，これは線形回帰分析における残差の2乗和に相当します。なお，線形回帰分析の係数は残差2乗和が最小になるようにして算出されますが，2項ロジスティック回帰ではこの逸脱度が最小になるようにして係数が算出されます。

なお，「尤度」とは，この分析モデルから手元のデータが得られる確率がどの程度あるか（モデルの尤もらしさ）を示した値です。残差逸脱度は，次のように分析モデルの尤度と完全モデル（実際のデータを完全に説明したモデル）の尤度の比を対数変換する形で求められます。

\[
\text{逸脱度} = -2\times\log \left(\frac{\text{分析モデルの尤度}}{\text{完全モデルの尤度}}\right)
\]

この残差逸脱度の値が小さいほど，モデルと分析データのずれが小さい（モデルのあてはまりがよい）ことを意味します。ただし，逸脱度の大きさは分析に使用するデータによって異なるため，この値がいくつ以下であればよいというような一般的な基準はありません。

##### AIC, BIC{-}

線形回帰分析における（調整されていない）決定係数が複雑なモデルほど大きくなるのと同様に，逸脱度の値は説明変数の数が多くなればなるほど小さくなる性質を持ちます。そこで，残差逸脱度に対し，モデルに含まれる説明変数の個数（交互作用を含むならその個数も含む）による調整を行った値がAICとBICです。このAICとBICは，線形回帰（Linear Regression）におけるモデル適合度指標のAIC，BICと同じものです。

AICとBICについても値が小さいほどあてはまりがよいことを示しますが，残差逸脱度と同様に，これらがいくつ以下であればよいという一般的な基準はありません。

##### Overall model test：モデル全体の検定 {-}

ここまで見てきたように，逸脱度やAIC，BICといった指標には，モデルがデータに十分あてはまっているといえるのかどうかの明確な基準がありません。そこで，モデルがデータにあてはまっているかどうかについての検定を行うのが「Overall model test（モデル全体の検定）」です。

この「Overall model test」にチェックを入れると，$\chi^{2}$（カイ2乗）を用いたモデル適合度の検定を行うことができます（図\@ref(fig:regression-binomial-overall)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-overall} 

}

\caption{適合度指標とモデル適合度の検定}(\#fig:regression-binomial-overall)
\end{figure}

線形回帰モデルの場合，モデル全体の適合度の検定にはFが用いられますが，2項ロジスティック回帰ではモデルの逸脱度に基づいて算出された$\chi^{2}$を用いた検定が行われます。この$\chi^{2}$は，切片のみのモデルの残差逸脱度から分析モデルの残差逸脱度を引いた値で，この値が有意である場合（pが有意水準を下回っている場合）は，分析モデルが切片のみのモデルよりもデータをうまく説明できている（残差逸脱度が有意に小さい）ということを意味します。

今回の分析結果ではp<.001で有意ですので，この分析モデルがデータをまったく説明できていないということはなさそうです。ただし，線形回帰モデルのF検定の場合と同様に，この検定が有意であっても，それは説明力0のモデルよりはましであるという意味でしかありませんので，その点には注意が必要です。


#### Pseudo R²：擬似決定係数{-}

逸脱度やAICは，モデルの適合度を相対的に評価するには便利な指標ですが，これらの値だけでは分析モデルがどの程度データをうまく説明できているのかの判断は困難です。そこで，モデルのあてはまりのよさを0から1の範囲の値として示すようにしたものが*擬似決定係数*です。この擬似決定係数の値は，線形回帰分析における決定係数R²に相当するもので，値が1に近いほどデータをうまく説明できていることを意味します。

##### McFadden's R²：マクファデンのR²{-}

jamoviでは，擬似決定係数として，マクファデン，コックス=スネル，ナゲルケルケの3種類の値を算出することができます。この3つのうち，一般にもっともよく知られているのはマクファデンの擬似決定係数で，これは分析モデルの尤度の対数（*対数尤度*）を切片のみのモデル（帰無モデル）の対数尤度で割り，その値を1から引くことによって求められます。

対数尤度はつねに負の値になり，かつモデルとデータのあてはまりがよいほど0に近い値になるため，このように計算することで，分析モデルのあてはまりがよいほど対数尤度の割り算の部分が0に近い値になり，マクファデンの擬似決定係数は1に近づきます。

##### Cox & Snell's R²：コックス=スネルのR²{-}

マクファデンの擬似決定係数はモデルのあてはまりの良さを0から1の範囲の数値で示すことができるのですが，この値は線形回帰分析における決定係数よりもかなり小さな値になることが知られています。そこで，その点を修正した値がコックス=スネルの擬似決定係数です。


##### Nagelkerke's R²：ナゲルケルケのR²{-}

ただし，コックス=スネルの擬似決定係数は，最大値が1にならないことが知られています。そのため，擬似決定係数の最大値が1になるように，コックス=スネルの擬似決定係数にさらに調整を加えたものがナゲルケルケの擬似決定係数です。


<!-- -->



### Model Coefficients：モデル係数 {#sub:regression-binomial-model-coeff}

ここでは，各説明変数の係数に関する以下の項目の設定を行います（図\@ref(fig:regression-binomial-model-coefficients)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-model-coefficients} 

}

\caption{回帰係数の信頼区間}(\#fig:regression-binomial-model-coefficients)
\end{figure}


:::{.jmvsettings data-latex=""}
+ **Omnibus Test**（オムニバス検定）　各説明変数についてオムニバス検定を行います。
  - Likelihood ratio tests（尤度比検定）　各説明変数の説明力が0でないかどうかを検定します。
+ **Estimate (Log Odds Ratio)**（推定値：対数オッズ比）　回帰係数の推定に関する設定を行います。
  - Confidence interval（信頼区間）　回帰係数の信頼区間を算出します。
+ **Odds Ratio**（オッズ比）　各説明変数のオッズ比に関する設定を行います。
  - Odds ratio（オッズ比）　オッズ比を算出します。
  - Confidence interval（信頼区間）　オッズ比の信頼区間を算出します。
:::


#### Omnibus Tests：オムニバス検定{-}

各説明変数が目的変数の説明において貢献しているといえるかどうかを確かめたい場合には，「**Omnibus Tests**（オムニバス検定）」の「Likelihood ratio tests」（尤度比検定）にチェックを入れてください。すると，各説明線変数の有効性についての検定結果が表示されます（図\@ref(fig:regression-binomial-model-coefficients)）。


<!-- 設定画面 -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-omnibus} 

}

\caption{説明変数についての尤度比検定}(\#fig:regression-binomial-omnibus)
\end{figure}

2項ロジスティック回帰の場合には，各説明変数についての検定はANOVA（分散分析）ではなく*尤度比検定*と呼ばれる手法が用いられます。これは，分析に使用したモデルと，そこからその説明変数を除いたモデルの尤度の比率（*尤度比*）に基づく検定で，検定統計量には$\chi^{2}$が用いられます。そして，その隣のp値が有意水準を下回る場合に，「その説明変数の説明力が0でない」とみなされます。

#### Estimate (Log Odds Ratio)：推定値（対数オッズ比）{-}

線形回帰分析の場合と同様に，2項ロジスティック回帰でも各説明変数の回帰係数について信頼区間を算出することができます。回帰係数の信頼区間を算出するには，「**Estimate (Log Odds Ratio)**（推定値：対数オッズ比）」の「Confidence interval（信頼区間）」にチェックを入れてください（図\@ref(fig:regression-binomial-ci)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-ci} 

}

\caption{回帰係数の信頼区間}(\#fig:regression-binomial-ci)
\end{figure}

なお，この設定項目の名前には「Log Odds Ratio（*対数オッズ比*）」とありますが，これは分析結果のところでも説明したように，2項ロジスティック回帰の回帰係数は*ロジット*の変化量を表しており，そしてそれは*オッズ比*を対数変換したのと同じ値だからです。

#### Odds Ratio：オッズ比{-}

繰り返しになりますが，2項ロジスティック回帰の回帰係数は，説明変数の値が1変化した場合における目的変数の*ロジット*の変化量を表しています。そしてロジットというのはオッズを対数変換したものなので，2項ロジスティック回帰の回帰係数から説明変数の影響の強さを解釈するのは困難です。そこで多くの場合，回帰係数を*指数変換*してオッズに戻したうえで解釈が行われます。このとき，回帰係数を指数変換した値は，説明変数の値が1増えるとオッズが何倍に変化するかを表す値（*オッズ比*）になります。

ほとんどの統計ソフトでは，2項ロジスティック回帰の回帰係数をオッズ比に変換してくれる機能があります。そして，それはjamoviでも同じです。jamoviでは，「**Odds Ratio**（オッズ比）」の1つ目の項目である「Odds ratio」にチェックを入れることで，回帰係数をオッズ比に変換した値が表示されます（図\@ref(fig:regression-binomial-oddsratio)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-oddsratio} 

}

\caption{オッズ比}(\#fig:regression-binomial-oddsratio)
\end{figure}

また，このオッズ比に対しても信頼区間を算出することができます。オッズ比の信頼区間を算出するには，「**Odds Ratio**（オッズ比）」の2つ目の項目である「Confidence interval（信頼区間）」にチェックを入れてください。

### Prediction：予測 {#sub:regression-binomial-prediction}

2項ロジスティック回帰では，モデルの適合度として逸脱度や擬似決定係数などの値が算出されますが，そうした複雑な数値を使わなくても，もっと単純にモデルの精度を判断する方法があります。それは，このモデルを使って目的変数の値（PTSDあり・なし）を正しく判別できるかどうかを見るという方法です。

2項ロジスティック回帰の場合，目的変数の本来の値は「はい・いいえ」や「あり・なし」のように2種類の値のうちのいずれかしかありません。そのため，モデルよる予測値に基づく判定結果が各対象者の目的変数の値と一致しているかどうかの判断は，線形回帰分析の場合よりもずっと単純だからです。

なお，その際，モデルによる判定結果と実際の目的変数の値の組み合わせのパターンには，表\@ref(tab:regression-binomial-crosstable)に示した4とおりが考えられます。

\begin{table}[H]

\caption{(\#tab:regression-binomial-crosstable)判定結果のパターン}
\centering
\begin{tabular}[t]{lcc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{判定結果} \\
\cmidrule(l{3pt}r{3pt}){2-3}
  & PTSD Y & PTSD N\\
\midrule
\addlinespace[0.3em]
\multicolumn{3}{l}{\textbf{実際の値}}\\
\hspace{1em}PTSD Y & 正解（真陽性） & 誤り（偽陰性）\\
\hspace{1em}PTSD N & 誤り（偽陽性） & 正解（真陰性）\\
\bottomrule
\end{tabular}
\end{table}

このとき，実際のデータにおける「PTSD」の値（「あり」または「なし」）と回帰モデルの判定結果が一致する場合を*真陽性*，*真陰性*といい，実際のデータでは「PTSD」の値が「あり」なのに回帰モデルに基づく判定結果が「なし」となってしまうことを*偽陰性*，その逆に，データでは「PTSD」の値が「なし」なのにモデルの判定結果が「あり」になってしまうことを*偽陽性*といいます。

また，「PTSD」の実際の値が「あり」であるデータのうち，回帰モデルによって正しく「あり」と判定された割合を*感度*，PTSDの実際の値が「なし」であるデータのうち，回帰モデルによって正しく「なし」と判定された割合を*特異度*と呼びます。また，データ全体のうちで正しく判断できた割合，つまり全体に占める真陽性と真陰性の合計の割合のことを*精度*と呼びます（図\@ref(fig:regression-binomial-signal)）。

<!-- 感度，特異度，精度 -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-signal} 

}

\caption{感度，特異度と精度}(\#fig:regression-binomial-signal)
\end{figure}


この感度，特異度，精度はすべてで高いことが望ましいわけですが，実際はなかなかそううまくはいきません。多くの場合，感度を高くしようとすると特異度が下がり，特異度を高くしようとすると感度が下がることになるのです。この関係は，感染症の検査を例に考えてみるとわかりやすいでしょう。絶対に感染者を見逃さないようにしようとして検査の感度を上げる（わずかな兆候でも検査が陽性になるようにする）と，実際には感染していない人に対しても検査結果が陽性になってしまう（偽陽性になる）可能性が高くなります。すると，その検査では「病気に感染していない人」を正しく見分けられないということになり，特異度は低くなります。

この逆に，感染していない人に対して検査が陽性になるのを極力避けようと，よほどはっきりした兆候がない限り結果が陽性にならないようにする（特異度を高くする）と，今度は感染しているのに検査が陽性にならない（偽陰性になる）人が出てきてしまいます。このような性質から，実際の検査では，感染の可能性が少しでもありそうな人を選別するスクリーニング検査（感度を高く設定）と，確実に診断を行うための確定診断検査（特異度を高く設定）を用途に応じて使い分けるといったことが行われているのです。


さて，2項ロジスティック回帰での設定に話を戻しましょう。こうした感度，特異度，精度といった視点からモデルの適合度を評価したい場合には，設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Prediction}}（予測）にある設定項目を使用します。ここには，次の項目が含まれています（図\@ref(fig:regression-binomial-prediction)）。


<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-prediction} 

}

\caption{予測の設定項目}(\#fig:regression-binomial-prediction)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Cut-Off**（カットオフ）
  - Cut-off plot（カットオフ・プロット）　カットオフ値を変化させた場合の感度と特異値の関係を図示します
  - Cut-off value（カットオフ値）　カットオフ値を指定します
+ **Predictive Measures**（予測指標）
  - Classification table（分類表）　回帰モデルによる分類結果をクロス表に示します
  - Accuracy（精度）　モデルの精度を算出します
  - Specificity（特異度）　モデルの特異度を算出します
  - Sensitivity（感度）　モデルの感度を算出します
+ **ROC**
  - ROC curve（ROC曲線）　ROC曲線を図示します
  - AUC　ROC曲線の下の面積（AUC）を算出します
:::

#### Cut-Off：カットオフ {-}

まず，左側にある「**Cut-Off**（カットオフ）」の部分では，回帰モデルの*カットオフ値*と，感度，特異値の関係を見ることができます。ここにある「Cut-off plot（カットオフ・プロット）」にチェックを入れると，その回帰モデルのカットオフ値と感度，特異度が図に示されます。なお，カットオフ値というのは，「あり」・「なし」の判定基準となる境目の値のことです。

このカットオフ値（Cut-off value）は初期設定では0.5（つまりPTSDが「あり」の確率が0.5（50%）以上であれば「あり」と判定）に設定されています。この分析結果では，カットオフ値が0.5の場合，感度に比べて特異度がやや低いことがわかります。もし特異度を上げたければ，このカットオフ値を0.5より大きな値に設定すればよいわけですが，そうすると感度はカットオフ値が0.5の場合よりもやや下がってしまいます（図\@ref(fig:regression-binomial-cutoff)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-cutoff} 

}

\caption{カットオフ値と感度・特異度の変化}(\#fig:regression-binomial-cutoff)
\end{figure}


このカットオフ値をいくつに設定するかは，最終的には感度と特異度のバランスを見ながら分析者が判断することになります。

#### Predictive Measures：予測指標 {-}

その分析モデルにおける実際の判定結果や感度や特異度について詳しく知りたい場合には，**Predictive Measures**（予測指標）の項目を使用します（図\@ref(fig:regression-binomial-predictive)）。

<!---->
<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-predictive} 

}

\caption{判定結果と予測精度の指標}(\#fig:regression-binomial-predictive)
\end{figure}

##### Classification table：分類表{-}
1番上の「Classification table（分類表）」にチェックを入れると，分析データに含まれる各対象者がどのように判定されたのかがクロス表の形で表示されます（図\@ref(fig:regression-binomial-predictive)）。この表の数値は，設定したカットオフ値を用いて判定した結果です。なお，この表の「Observed（実測値）」の「N」の行にある「% Correct（正判定率）」の値は，PTSDの値が「なし」の人が「なし」と判定された割合（つまり特異度），「Y」の行にある「% Correct」の値はPTSD「あり」の人が「あり」と判定された割合（つまり感度）を示しています。

##### Accuracy, Specificity, Sensitivity：精度，特異度，感度{-}

その下にある「Accuracy」，「Specificity」，「Sensitivity」にチェックを入れると，それぞれ精度，特異度，感度の値が表示されます。

#### ROC {-}

この設定画面の右側にある「**ROC**」では，*ROC曲線*（*受信者操作特性曲線*）と呼ばれる曲線とその関連指標を用いてモデルの適合度を見ることができます。

##### ROC curve：ROC曲線{-}

ROC曲線は，回帰モデルのカットオフ値をさまざまに変化させた場合の感度と偽陽性率（\(\mathsf 1 -\)特異度）を図示したものです。設定画面の「ROC curve（ROC曲線）」にチェックを入れると，この図が表示されます（図\@ref(fig:regression-binomial-auc)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-auc} 

}

\caption{ROC曲線とAUC}(\#fig:regression-binomial-auc)
\end{figure}


このグラフが図の中央にある斜め線より上側にある場合には，そのモデルによってPTSDのあり・なしをある程度うまく判定できることを，斜め線と完全に一致する場合には，そのモデルではPTSDのあり・なしをでたらめにしか判定できないことを意味します。

##### AUC {-}
また，その下にある「AUC」の項目は，このROC曲線の下側の面積（Area Under Curve）がグラフ全体にしめる割合を表したものです。この値は，判定精度の高い回帰モデルほど1に近くなり，まったくでたらめなモデルの場合には0.5になります。このAUC値の解釈については，一般に表\@ref(tab:regression-binomial-auc-interpretation)のような目安が用いられます。

\begin{table}[H]

\caption{(\#tab:regression-binomial-auc-interpretation)AUCの解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
AUCの値 & 判定精度\\
\midrule
0.9 〜 1.0 & 高\\
0.7 〜 0.9 & 中\\
0.5 〜 0.7 & 低\\
\bottomrule
\end{tabular}
\end{table}


サンプルデータの分析結果ではAUCは0.99ですので，作成した回帰モデルはPTSDの有無を高精度で判定できていることがわかります。



## N Outcomes [Multinomial]：多項ロジスティック回帰{#sec:regression-multinomial}





次のサンプルデータ（[regression_data04.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data04.omv)）を見てください。このデータには，成人200名分の，その人がもつ愛着スタイル（安定型，不安型，回避型）と，性格検査による性格主要5因子の測定値が記録されています（図\@ref(fig:regression-data04)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/data04} 

}

\caption{サンプルデータ}(\#fig:regression-data04)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象家族のID
* `愛着`　愛着スタイル（安定，不安，回避）
* `神経症傾向`　神経症傾向の得点
* `外向性`　外向性の得点
* `開放性`　開放性の得点
* `調和性`　調和性の得点
* `誠実性`　誠実性の得点
:::

ここで，成人の愛着スタイルに性格の主要5因子（神経症傾向，外向性，開放性，調和性，誠実性）がどのように影響しているかを回帰分析を使って分析したいとしましょう。さて，どのようにすればよいのでしょうか。

この場合，愛着スタイルを目的変数とし，性格の主要5因子を説明変数とする回帰分析を行うことになりますが，この場合の目的変数は，「安定・不安・回避」の3種類の値をもつ名義型変数です。このように，目的変数が名義尺度による測定値で，その値に3つ以上のカテゴリが含まれる場合には，*多項ロジスティック回帰分析*と呼ばれる分析手法が用いられます。

### 考え方{#sub:regression-multinomial}

多項ロジスティック回帰は，2項ロジスティック回帰を拡張して2値変数以外にも適用できるようにしたもので，その基本的な考え方は2項ロジスティック回帰と同じです。多項ロジスティック回帰では，3種類以上ある目的変数の値のうちの1つを基準としたロジスティック回帰モデルを，目的変数の種類（カテゴリ）より1つ少ない数だけ作成します。

たとえば，今回のサンプルデータの場合，目的変数は「安定」，「不安」，「回避」の3種類ですので，たとえば「安定」を基準として考えた場合，次の2とおりの回帰モデルを作成することになります。

:::{.jmvgray data-latex=""}

目的変数の値が「安定・不安」のロジスティック回帰分析モデル

\[
\log\left(\displaystyle\frac{p(\text{不安})}{p(\text{安定})}\right) = b_{10} + b_{11} \times N+ b_{12} \times E+ b_{13} \times O+ b_{14} \times A+ b_{15} \times C
\]
:::


:::{.jmvgray data-latex=""}
目的変数の値が「安定・回避」のロジスティック回帰分析モデル

\[
\log\left(\displaystyle\frac{p(\text{回避})}{p(\text{安定})}\right) = b_{20} + b_{21} \times N+ b_{22} \times E+ b_{23} \times O+ b_{24} \times A+ b_{25} \times C
\]
:::

そして，これら2つのロジスティック回帰モデルについて同時に係数を推定するのです。

### 分析手順 {#sub:regression-multinomial-analysis}
<!-- -->
基本的な考え方は2項ロジスティック回帰と大きく変わりませんので，まずは分析してみることにしましょう。多項ロジスティック回帰を行うには，Analysesタブの「\infig{analysis-regression.pdf}  Regression」から「Logistic Regression（ロジスティック回帰）」の下にある「N Outcomes [Multinomial]」を選択します（図\@ref(fig:regression-multinomial-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/multinomial-menu} 

}

\caption{多項ロジスティック回帰分析の実行}(\#fig:regression-multinomial-menu)
\end{figure}

すると，図\@ref(fig:regression-multinomial-setting)のような分析設定画面が表示されます。分析設定画面の構成や項目は，ロジスティック回帰分析の場合とほとんど同じです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/multinomial-setting} 

}

\caption{多項ロジスティック回帰分析の設定画面}(\#fig:regression-multinomial-setting)
\end{figure}

まず，「Dependent Variable（従属変数）」に目的変数である「愛着」を，「Covariates（共変量）」に連続型説明変数である性格5因子の得点（「神経症傾向」，「外向性」，「開放性」，「調和性」，「誠実性」）を設定します（図\@ref(fig:regression-multinomial-set-variables)）。今回のサンプルデータにはありませんが，説明変数に名義型変数が含まれている場合には，それらは「Factor（要因）」に設定してください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/multinomial-set-variables} 

}

\caption{多項ロジスティック回帰分析の変数設定}(\#fig:regression-multinomial-set-variables)
\end{figure}

これで基本的な分析の設定はおしまいです。ただし，2項ロジスティック回帰の場合と同様に，多項ロジスティック回帰の場合にも目的変数のどの値を基準として結果が計算されているのかによって数値の意味が変わってきますので，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}（基準レベル）でそれらを確認しておいたほうがよいでしょう（図\@ref(fig:regression-multinomial-reference-levels)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/multinomial-reference-levels} 

}

\caption{目的変数の基準レベルの確認}(\#fig:regression-multinomial-reference-levels)
\end{figure}

ここでは「安定」を基準に分析することにします。もし基準レベルが違う値になっていたら，「安定」を選択して設定してください。これで分析はおしまいです。モデルの適合度指標や係数の信頼区間，検定などは2項ロジスティック回帰の場合と同じですので，ここでは説明を省略します。また，多項ロジスティック回帰の場合には，前提条件のチェック，予測，計算結果の保存の設定項目は（今のところ）ありません。

### 分析結果 {#sub:regression-multinomial-results}

結果は図\@ref(fig:regression-multinomial-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/multinomial-results} 

}

\caption{多項ロジスティック分析の結果}(\#fig:regression-multinomial-results)
\end{figure}

モデルの適合度指標として逸脱度やAIC，擬似決定係数などが算出される点は2項ロジスティック回帰の場合と同じです。また，モデル係数の表についても，基本は2項ロジスティック回帰の場合と同じです。ただし，多項ロジスティック回帰では複数のモデルについて同時に係数の推定を行いますので，係数の推定値についてはそれらのモデルごとに表示されるという点が異なります。

分析結果を見てみると，「不安型／安定型」のモデルでは「外向性」と「調和性」がそれぞれ有意に負の影響を持っていることがわかります（Eの回帰係数は\(-\textsf{0.05}\)，Aは\(-\textsf{0.09}\)）。このことから，外向性が低い人，調和性が低い人ほど不安型の愛着スタイルである可能性が高いといえそうです。

また，「回避型／安定型」のモデルでは「神経症傾向」と「外向性」の係数が有意で，Nはプラスの係数（0.08），Eはマイナスの係数（\(-\textsf{0.06}\)）ですから，神経症傾向が強く外向性が低い人ほど回避型の愛着スタイルになりやすいと考えられます。

なお，この分析では「安定」型の愛着スタイルを基準として計算を行っているため，「不安」型と「回避」型の違いについてはわかりません。その違いを見たい場合には，不安型か回避型のいずれかを基準レベルとして再度分析する必要があります。


## Ordinal Outcomes：順序ロジスティック回帰{#sec:regression-ordinal}

今度は次のサンプルデータ（[regression_data05.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/regression_data05.omv)）について考えてみましょう。このデータには，起床時の気分，睡眠時間，日中ストレス，日中の歩数が200件分記録されています（図\@ref(fig:regression-multinomial-results)）。






\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/data05} 

}

\caption{サンプルデータ}(\#fig:regression-data05)
\end{figure}

:::{.jmvvar data-latex=""}
* `ID`　対象者ID
* `気分`　起床時の気分（Bad：悪い，Moderate：普通，Good：良い）
* `睡眠時間`　前日の睡眠時間（単位：時間）
* `ストレス`　日中ストレス度（1：弱〜10：強）
* `歩数`　1日の歩数（単位：千歩）
:::

このデータから，起床時の気分（目覚めの良さ）に影響する要因について次の回帰モデルで分析したいとしましょう。

\[
\text{気分} = b_0 + b_1 \times \text{睡眠時間} + b_2 \times \text{ストレス} + b_3 \times \text{歩数}
\]

先ほど多項ロジスティック回帰分析で使用したデータと同様に，今回も目的変数である「気分」の値は「悪い」，「普通」，「良い」の3種類です。ですので，先ほどと同様にして多項ロジスティック回帰分析を用いてもよいかもしれません。その場合，分析においては起床時の気分を名義型変数として扱うことになります。ですが，起床時の気分の「悪い」，「普通」，「良い」の3つ値にははっきりした順序性があり，これは順序型変数といえますので，ここではその順序性を損なわいよう，*順序ロジスティック回帰分析*と呼ばれる手法を用いて分析したいと思います。

### 考え方{#sub:regression-ordinal}

多項ロジスティック回帰では，目的変数の値のうち1つを基準レベルとし，それに対して他の値との間でロジスティック回帰モデルを作成して分析を行いました。順序ロジスティック回帰分析もそれとよく似た形で分析を行うのですが，目的変数の値がもつ順序性を考慮して，次のような形でモデルを作成します。

:::{.jmvgray data-latex=""}
目的変数の値が「悪い」または「普通・良い」のロジスティック回帰モデル

\[
\log\left(\displaystyle\frac{p(\text{普通・良い})}{p(\text{悪い})}\right) = b_{10} + b_1 \times \text{睡眠時間} + b_2 \times \text{ストレス} + b_3 \times \text{運動}
\]
:::

:::{.jmvgray data-latex=""}
目的変数の値が「悪い・普通」または「良い」のロジスティック回帰モデル

\[
\log\left(\displaystyle\frac{p(\text{良い})}{p(\text{悪い・普通})}\right) = b_{20} + b_1 \times \text{睡眠時間} + b_2 \times \text{ストレス} + b_3 \times \text{運動}
\]
:::

つまり，「悪い(1)」，「普通(2)」，「良い(3)」の3段階を，「1 vs. 2・3」，「1・2 vs. 3」のように，ある順序未満とそれ以上という形に2分してロジスティック回帰モデルを作成するのです。もし目的変数の値が3段階でなく4段階であれば，その場合のロジスティック回帰モデルは「1 vs. 2・3・4」，「1・2 vs. 3・4」，「1・2・3 vs. 4」というように，3つのロジスティック回帰モデルを用いて分析することになります。

このとき，順序ロジスティックモデルでは，偏回帰係数（\(b_1\)，\(b_2\)，\(b_3\)）はすべてのモデルで同じであり，それぞれのモデルで異なるのは切片（\(b_{10}\)，\(b_{20}\)）と残差のみであるという仮定のもとで回帰係数の算出を行います。このような形で計算を行うロジスティック回帰モデルは*累積ロジスティック回帰モデル*とも呼ばれます。

### 分析手順 {#sub:regression-ordinal-analysis}

順序ロジスティック回帰は，「\infig{analysis-regression.pdf}  Regression」の一番下にある「Ordinal Outcomes」を選択して実行します（図\@ref(fig:regression-ordinal-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/ordinal-menu} 

}

\caption{順序ロジスティック回帰分析の実行}(\#fig:regression-ordinal-menu)
\end{figure}

順序ロジスティック回帰の設定画面は図\@ref(fig:regression-ordinal-setting)のようになっています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/ordinal-setting} 

}

\caption{順序ロジスティック回帰分析の設定画面}(\#fig:regression-ordinal-setting)
\end{figure}

見てわかるように，設定画面の構成や項目は他のロジスティック回帰とほとんど同じです。そのため，ここでは順序ロジスティック回帰に固有の部分を中心に説明していくことにします。それ以外の設定項目については，2項ロジスティック回帰や多項ロジスティック回帰のところを参照してください。

設定画面の「Dependent Variable（従属変数）」に目的変数（「気分」）を，「Covariates（共変量）」に連続型の説明変数を設定すれば分析の基本設定は終了です（図\@ref(fig:regression-ordinal-set-vars)）。名義型の説明変数がある場合は，それらは「Factors（要因）」に設定してください。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/ordinal-set-vars} 

}

\caption{順序ロジスティック回帰分析の分析設定}(\#fig:regression-ordinal-set-vars)
\end{figure}

### 分析結果 {#sub:regression-ordinal-results}

順序ロジスティック回帰の結果は，図\@ref(fig:regression-ordinal-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/ordinal-results} 

}

\caption{順序ロジスティック回帰分析の結果}(\#fig:regression-ordinal-results)
\end{figure}

図\@ref(fig:regression-ordinal-results)を見てわかるように，モデル適合度の表とモデル係数の表の形式や内容も，2項ロジスティック回帰や多項ロジスティック回帰の場合とほぼ同じです。モデル適合度の表には逸脱度や擬似決定係数が，モデル係数の表には各説明変数の回帰係数の推定値や，その係数が0でないかどうかのz検定の結果が示されます。この結果をみると，起床時の気分に有意に影響を与えているのは「歩数」のみです。「歩数」の回帰係数はプラスの値ですので，日中たくさん歩いた場合ほど起床時の気分が良くなるといえそうです。

#### モデルの閾値 {-}

順序ロジスティック回帰では，多項ロジスティック回帰の場合と同様に複数のロジスティック回帰モデルを用いて分析を行っていますが，多項ロジスティック回帰のように複数の回帰係数が表示されることはありません。考え方のところでも説明したように，順序ロジスティック回帰では，すべてのモデルで偏回帰係数が共通であるという前提で分析を行うからです。

また，順序ロジスティック回帰のモデル係数の表には切片の推定値が含まれていません。この分析における切片の推定値を表示させるには，分析設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}（モデル係数）の「**Thresholds**（閾値）」ところで「Model thresholds（モデルの閾値）」にチェックを入れます（図\@ref(fig:regression-ordinal-thresholds)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/ordinal-thresholds} 

}

\caption{モデルの切片を表示させる}(\#fig:regression-ordinal-thresholds)
\end{figure}

すると，図\@ref(fig:regression-ordinal-thresholds-table)のように各モデルの切片の値のみをまとめた表が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/ordinal-thresholds-table} 

}

\caption{順序ロジスティック回帰モデルの切片}(\#fig:regression-ordinal-thresholds-table)
\end{figure}

これらの結果を元にして，最初に示した回帰モデルに切片と係数の値を示すと次のようになります。


\begin{eqnarray*}
\small{\log\left(\displaystyle\frac{p(\text{普通・良い})}{p(\text{悪い})}\right)} &=& \small{0.28 + 0.16 \times \text{睡眠時間} + (-0.17) \times \text{ストレス} + 0.21 \times \text{歩数}}\\
\small{\log\left(\displaystyle\frac{p(\text{良い})}{p(\text{悪い・普通})}\right)} &=& \small{2.64 + 0.16 \times \text{睡眠時間} + (-0.17) \times \text{ストレス} + 0.21 \times \text{歩数}}
\end{eqnarray*}


また，各モデルの閾値（切片）の推定値についての検定では，「普通 | 良い」は有意ですが「悪い | 普通」は有意ではありませんでした。これは，「普通 | 良い」つまり「普通以下（悪い・普通）」と「良い」の区別はできていても，「悪い」と「普通以上（普通・良い）」の区別はできていないということです。

これらの結果を総合すると，日中にたくさん歩くことは起床時の気分の良さにつながるけれども，歩かなかったからといって起床時の気分が悪くなるわけではないということになります。

<!--chapter:end:07-Regression.Rmd-->



# Frequencies：度数分析 {#ch:frequencies}


この章では，「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」ツールについて見ていきます。jamoviの基本構成では，ここには次の分析メニューが含まれています（図\@ref(fig:frequencies-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/menu} 

}

\caption{Frequencies（度数分析）のメニュー}(\#fig:frequencies-menu)
\end{figure}

:::{.jmvmenu data-latex=""}
+ **One Sample Proportion Tests**（1標本比率検定）
  - 2 Outcomes [Binomial test]（2値：2項検定）
  - N Outcomes [$\chi^{2}$ Goodness of fit]（多値：カイ2乗適合度検定）
+ **Contingency Tables**（分割表）
  - Independent Samples [$\chi^{2}$ test of association]（対応なし標本の独立性検定）
  - Paired Samples [McNemar test]（対応あり標本のマクニマー検定）
+ その他
  - Log-Linear Regression（対数線形回帰）
:::
  
これらの分析メニューは，いずれも観測データの度数や比率について分析を行うものです。分析メニューは，1標本の検定と*クロス集計表*（*分割表*）の検定に分けられています。また，それらとは別に「Log-Linear Regression（対数線形回帰）」のメニューも用意されています。「回帰」という名前がついていますが，これも度数に関する分析手法の1つです。

## 2 Outcomes [Binomial test]：2項検定 {#sec:frequencies-binomial}

とりうる値が「はい・いいえ」のように2種類しか存在しない*2値変数*について，その値の「はい・いいえ」の比率が基準の比率，または想定される比率と同じかどうかを確かめたい場合には，*2項検定*と呼ばれる検定方法が用いられます。

jamoviでは，従来型の一般的な方法による2項検定の他に，ベイズ統計の考え方を用いた検定を実施することも可能です。


### 考え方 {#sub:frequencies-binomial-basics}

次の例について考えてみましょう。同月齢の80人の幼児を対象としてある認知課題を実施しました。この課題は，この月齢の幼児では通過率70%といわれてきたのですが，今回の実施で課題を通過したのは80人中46人（通過率57.5%）でした（表\@ref(tab:frequencies-table-pf)）。この課題の通過率は，本当に70%なのでしょうか。


\begin{table}[H]

\caption{(\#tab:frequencies-table-pf)認知課題の通過率}
\centering
\begin{tabular}[t]{lcc}
\toprule
  & 人数 & \%\\
\midrule
\addlinespace[0.3em]
\multicolumn{3}{l}{\textbf{結果}}\\
\hspace{1em}通過 & 46 & 57.5\%\\
\hspace{1em}非通過 & 34 & 42.5\%\\
計 & 80 & 100\%\\
\bottomrule
\end{tabular}
\end{table}


この例のように，測定値のとりうる値が「通過」または「非通過」の2とおりしかない場合，そのデータにおける「通過」または「非通過」の比率がどのように分布するかは，*2項分布*と呼ばれる確率分布を用いて確率的に求めることができます。

たとえば，この課題の通過率が実際に70%だったとしたとき，無作為に選んだ80人を対象とした調査で80人のうちの70%，つまり56人が課題に通過する確率は，2項分布を用いて計算すると0.0969...で，約9.7%の確率です^[2項分布の計算式やその具体的な計算方法については本書では省略します。統計法の教科書などを参照してください。]。これは一見すると低いようにも感じられますが，全体（母集団）における比率が70%だからといって，そこから抽出した標本で毎回70%ちょうどになるわけではありません。それより1人少ない55人の場合や1人多い57人の場合を含めて考えてみると，80人中55人が通過する確率は0.093（9.3%），80人中57人なら0.095（9.5%）ですので，課題の通過者が80人中55〜57人になる場合であれば28%程度の確率で生じうるわけです。

先ほどは説明のために70%ちょうどの56人から前後1人の幅で考えましたが，実際の場面ではこれよりもっとばらつくことは普通にあるでしょう。極端な話，80人全員が課題に通過する場合や，その逆に全員が通過できない場合というのも，非常にまれなことには違いないですが，確率的には0ではありません。

そこで，母集団における通過率が70%である場合に，80人の標本で通過者が0人である場合から80人である場合までのすべての場合について確率を算出し，それを図示したのが図\@ref(tab:frequencies-binomial-distribution)です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-distribution} 

}

\caption{母集団における通過率が70％の場合の確率の分布}(\#fig:frequencies-binomial-distribution)
\end{figure}

さすがに通過者が0人の場合や80人の場合というのは確率的には数値が小さすぎてグラフ上では0になってしまいますが，こうしてみると，母集団における通過率が70%の場合に，今回の結果のように通過者が46人になるというケースはそれなりにありうることだというのがわかります。とはいえ，今回の結果と同じか，あるいはそれよりも極端な結果になる確率というのはかなり小さく，確率的に見てまれな出来事であることには違いありません。

このように，2項検定では想定される比率をもつ母集団から標本データで得られた比率（およびそれより極端な比率）が得られる確率がどの程度であるかを算出します。そして，その確率が有意水準よりも小さい場合に，想定される母集団における比率と標本データの母集団の比率が有意に異なると判断します。

### 分析手順 {#sub:frequencies-binomial-procedure}

分析に入る前に，先ほどの調査結果を次のようにスプレッドシートに入力しましょう（図\@ref(tab:frequencies-data01)）。なお，人数は実際には連続変数ですが，分析の都合上，ここでは「名義型（\infig{variable-nominal.pdf} Nominal）」として設定してください。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/data01} 

}

\caption{サンプルデータ}(\#fig:frequencies-data01)
\end{figure}

:::{.jmvvar data-latex=""}
+ `結果`　課題の結果（通過，非通過）
+ `人数`　通過・非通過の人数（通過：46人，非通過：34人）
:::


それでは分析です。2項検定は，Analysesタブの「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」で「One Sample Proportion Tests（1標本比率検定）」のところにある「2 Outcomes [Binomial test]（2値：2項検定）」を選択して実行します（図\@ref(fig:frequencies-binomial-menu)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth,]{images/frequencies/binomial-menu} 

}

\caption{2項検定の実行}(\#fig:frequencies-binomial-menu)
\end{figure}

すると，図\@ref(fig:frequencies-binomial-setting)のような画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-setting} 

}

\caption{2項検定の設定画面}(\#fig:frequencies-binomial-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Values are counts（値を度数として処理）　度数が入力されている変数で分析を行う場合に使用します。
+ Test value（検定値）　比較対象に使用する比率を指定します。
+ **Hypothesis**（仮説）　検定の対立仮説に関する設定を行います。
  - ≠ Test value　比率が検定値と異なるかどうかを検定します（両側検定）
  - &gt; Test value　比率が検定値より大きいかどうかを検定します（片側検定）
  - &lt; Test value　比率が検定値より小さいかどうかを検定します（片側検定）
+ **Additinal Statistics**（追加の統計量）　追加の統計量に関する設定を行います。
  - Confidence intervals（信頼区間）　比率の信頼区間を算出します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Bayesian Statistics}}（ベイズ統計量）　ベイズ統計の手法を用いて検定する場合の設定項目です。
:::


ここで，図\@ref(fig:frequencies-binomial-set-var)のように設定を行います。まず，「人数」を選択して右側に移動してください。下のアイコンを見てもらえばわかるように，この欄には，名義型（\infig{variable-nominal.pdf}）か順序型（\infig{variable-ordinal.pdf}）の変数でなければ移動することができません。先ほど「人数」を名義型に設定したのはこのためです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-set-var} 

}

\caption{2項検定の分析設定}(\#fig:frequencies-binomial-set-var)
\end{figure}

また，今回の分析データでは，課題通過者，非通過者の人数（度数）をデータとして入力してありますので，「Values are counts（値を度数として処理）」にチェックを入れます。各対象者の「通過・非通過」の結果が1行ずつ入力されている場合には，このチェックは必要ありません。

それから，今回の仮説では，「この課題の通過率は70%（0.7）である」というのが正しいといえるかどうかを確かめたいので，「Test value（検定値）」の値は「0.7」に設定します。

基本の設定はこれで終了ですが，それ以外の設定項目についてもここで見ておきましょう。

#### Hypothesis：仮説 {-}

「**Hypothesis**（仮説）」では，検定に使用する対立仮説の設定を行います。

:::{.jmvsettings data-latex=""}
+ ≠ Test value　比率が検定値と異なるかどうかを検定します（両側検定）
+ &gt; Test value　比率が検定値より大きいかどうかを検定します（片側検定）
+ &lt; Test value　比率が検定値より小さいかどうかを検定します（片側検定）
:::

今回のデータでは，想定される母集団の比率どおりであれば80&times;0.7 = 56，課題通過者は46人なので，仮説は「&lt; Test value」にすべきではないかと思う人もいるかもしれません。ですが，統計的仮説検定の仮説はデータを見る前に設定するものなので，その場合，観測データで通過率が0.7より高いか低いかは見当がつきません。そこで，ここでの検定における対立仮説は「≠ Test value」で両側検定とします。

#### Additional Statistics：追加の統計量{-}

また，「**Additional Statistics**（追加の統計量）」の部分では，信頼区間を算出するかどうかの設定を行います。今回はこの設定は使用しませんが，信頼区間を算出したい場合は「Confidence intervals（信頼区間）」の部分にチェックを入れてください。

### 分析結果 {#sub:frequencies-binomial-results}

それでは結果を見てみましょう。分析結果は，図\@ref(fig:frequencies-binomial-results)のような形で示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-results} 

}

\caption{2項検定の分析結果}(\#fig:frequencies-binomial-results)
\end{figure}

課題通過者の人数，非通過者の人数という集計結果をデータとして分析を行った場合，結果にはどちらが「通過」でどちらが「非通過」なのかは示されませんので，結果を見る際には注意してください。結果には，スプレッドシートに入力した順に**Level**（水準）欄に「1」，「2」として表示されます。分析に使用したデータでは1行目に通過者の人数，2行目に非通過者の人数を入力しましたので，この結果では水準が「1」の方が通過者です。

分析結果には，通過者の比率と非通過者の比率のそれぞれについての分析結果が示されますが，ここで見る必要があるのは通過者の比率（**Level**が「1」の行）の結果のみです。

この分析結果ではp=0.020ですので，80人中46人が通過（通過率57.5%）という比率は，想定される通過率70%とは有意に異なるということがいえます。

### ベイズ統計量 {#sub:frequencies-binomial-bayes}

すでに分析結果は得られましたが，jamoviの2項検定では*ベイズ統計*の考え方を用いた検定も可能ですので，その方法についても見ておくことにしましょう。

まず，先ほどの分析結果をクリックして，2項検定の分析設定画面を開いてください。設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Baysian Statistics}}（ベイズ統計量）を展開すると，以下の設定項目が表示されます（図\@ref(fig:frequencies-binomial-bayes-setting)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-bayes-setting} 

}

\caption{ベイズ統計量の設定画面}(\#fig:frequencies-binomial-bayes-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Prior**（事前分布）
  - a parameter（パラメータa）　ベータ分布のaを設定します。
  - b parameter（パラメータb）　ベータ分布のbを設定します。
+ **Plots**（作図）
  - Posterior plot（事後分布プロット）　事後分布を図示します。
+ **Statistics**（統計量）
  - Bayes factor（ベイズ因子）　ベイズ因子を算出します。
  - Credible intervals（信用区間）　ベイズ信用区間（確信区間）を算出します。
:::

#### Prior：事前分布{-#subsub:frequencies-binomial-bayes-prior}

ベイズ統計の詳細についてはベイズ統計の教科書を参照して欲しいと思いますが，ベイズ統計では，分析対象についての確率分布をあらかじめ設定し，その分布に対して観測データを与えて分析結果を得るという手順で分析を実施します。この際，分析対象についてあらかじめ設定する分布のことを*事前分布*と呼びます。\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Baysian Statistics}}の「**Prior**（事前分布）」の部分は，この事前分布についての設定です。

jamoviの2項検定では，分析の事前分布として*ベータ分布*と呼ばれる確率分布を使用することができます。このベータ分布は，aとb（またはαとβ）という2つの*パラメータ*^[分布の形状を決める値のことです。2項分布では試行数nと確率pが，正規分布では平均値と分散（または標準偏差）がパラメータとなります。]をもち，この2つの値の設定の仕方によって，じつにさまざまな形状の分布を表現することが可能です。そして，このベータ分布のパラメータaの値を「a parameter」の入力欄に，パラメータbの値を「b parameter」の入力欄に入力します。

しかし，パラメータの値を2つ入力してください，といわれても，どんな値を入力したらよいのか検討もつきませんね。すでに先行研究や予備調査などで分析対象のおおよその分布がわかっている場合には，事前分布がその形状になるようにaとbを設定することになりますが，そうでない場合，一般には特別な情報をもたない分布を事前分布として使用するという方法が用いられます。そしてその場合，もっとも一般に用いられる分布が*一様分布*と呼ばれる分布です。

この一様分布は，「サイコロの1から6の目が出る確率はすべて1/6で等しい」というように，どのような結果になる確率もすべて同率で等しいとする分布です。ベータ分布では，「a = b = 1」の場合にこの一様分布が得られます。jamoviの分析画面では，「a parameter」も「b parameter」も初期設定値は「1」になっていますが，それはこのような理由からです。ここでは「実際の課題通過率」に関して特別な仮説は持ち合わせていませんので，初期設定値どおり，aもbも「1」のままにしておきましょう。

#### Statistics：統計量{-#subsub:frequencies-binomial-bayes-statistics}

次に設定するのは「**Statistics**（統計量）」の部分です。ここの「Bayes factor（ベイズ因子）」の部分にチェックを入れない限り，ベイズ統計による分析結果は表示されません。ですので，「Bayes factor」にチェックを入れておきましょう。

その下の「Credible intervals（信用区間）」は，*ベイズ信用区間*あるいは*確信区間*と呼ばれる，ベイズ統計の考え方にそった区間推定値を算出するための設定です。名前はよく似ていますが，従来型の推測統計における「信頼区間」とは別物ですので注意してください。ここでは，この設定はオフのままにしておきます。

ここまでの設定が終わったところで分析結果を見てみると，先ほどの結果の表の右端に，「**Bayes factor$_{10}$**」という欄が追加されているはずです（図\@ref(fig:frequencies-binomial-bayes-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-bayes-results} 

}

\caption{ベイズ因子の計算結果}(\#fig:frequencies-binomial-bayes-results)
\end{figure}

ベイズ統計の場合も，分析結果の表で見る必要があるのは課題通過者についての行（**Level**が1の行）だけです。この行のベイズ因子の値は2.24で，これは対立仮説が正しい場合の確率が，帰無仮説が正しい場合の確率に比べて2.24倍大きいということを意味しています。

このベイズ因子の大きさの解釈については，複数の研究者によってさまざまな目安が提供されていますが，そのうちの1つ，[Kass &amp; Raftery (1995)](https://www.tandfonline.com/doi/abs/10.1080/01621459.1995.10476572)^[
Kass, R. E. &amp; Raftery, A. E. (1995). Bayes Factors. <i>Journal of the American Statistical Association, 90</i>, 773&ndash;795. doi:10.1080/01621459.1995.10476572]では，表\@ref(tab:frequencies-binomial-bayes-factor-interpretation)のように示されています。一般には，この値（\(\textsf{Bayes factor}_{10}\)）が3を超える場合に，対立仮説を支持する証拠があるとみなされることが多いようです。



\begin{table}[H]

\caption{(\#tab:frequencies-binomial-bayes-factor-interpretation)ベイズ因子の解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
ベイズ因子 & 根拠としての強さ\\
\midrule
150〜 & 非常に強い\\
20〜150 & 強い\\
3〜20 & 肯定的\\
1〜3 & 取るに足りない\\
\bottomrule
\end{tabular}
\end{table}

今回の分析結果ではベイズ因子は2.24でしたので，対立仮説を支持する証拠としては弱いものです。つまり，この分析結果からは，「課題の通過率は70％ではない」とはまではいえないことになります。

#### Plots：作図{-#subsub:frequencies-binomial-bayes-plots}

最後に，「**Plots**（作図）」の設定についても見ておきましょう。この「Posterior plot（事後分布プロット）」にチェックを入れると，課題通過と非通過のそれぞれについて，事前分布，尤度，事後分布を示したグラフが表示されます（図\@ref(fig:frequencies-binomial-bayes-posterior)）。ここでは，課題通過の場合についてのプロットを見てみましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/binomial-bayes-posterior} 

}

\caption{課題通過率についての事前・事後分布のグラフ}(\#fig:frequencies-binomial-bayes-posterior)
\end{figure}

このグラフの横軸には通過率，縦軸には*確率密度*が示されています。確率密度というのは確率とはまた別物なのですが，ここでは大まかに確率の高さを表していると考えてもらって構いません。少し見づらいですが，グラフ中の青の点線が事前分布（一様分布）で，黄色の曲線が事後分布です。

このグラフを見ると，0.575周辺での確率がもっとも高く，そこから離れるにつれて確率が低くなっていくのがわかります。これは，80人中46人が課題通過というデータが得られた場合に，その母集団における通過率（母比率）は0.575周辺である可能性がもっとも高く，それより離れた値である可能性は低いということを示しているのです。

この事後分布のグラフでは，母集団における通過率が0.7である可能性というのは実際にはかなり低いことがわかります。ただし，先ほど分析結果でみたベイズ因子の値が示す限りでは，この程度であっても「この標本の母集団における通過率は70%ではない」というには証拠としてまだ弱いのです。

## N Outcomes [χ² Goodness of fit]：カイ2乗適合度検定{#sec:frequencies-n-outomes}

変数のとりうる値が「はい・いいえ」や「あり・なし」のような2値でなく，3つ以上ある場合で，各変数値（カテゴリ）の比率について検定したい場合には，*カイ2乗適合度検定*と呼ばれる手法が用いられます。

### 考え方{#sub:frequencies-n-outomes-basics}

次の例について考えてみましょう。

人の学習スタイルを大きく「視覚型（映像やイメージを利用した学習を好むスタイル）」，「聴覚型（音声を利用した学習を好むスタイル）」，「運動感覚型（運動や動作を用いた学習を好むスタイル）」の3とおりに分類したとすると，その一般的な比率は視覚型が65%，聴覚型が30%，運動感覚型が5%程度なのだそうです。

ここで，ある地域で小学生児童150人を無作為に選び，その児童の学習スタイルの判定を行ったところ，表\@ref(tab:frequencies-chisq-table1)の結果が得られました。この地域の小学生における学習スタイルの比率は，一般的な比率とは異なっているのでしょうか。


\begin{table}[H]

\caption{(\#tab:frequencies-chisq-table1)学習スタイルの度数分布}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{3}{c}{学習スタイル} \\
\cmidrule(l{3pt}r{3pt}){2-4}
  & 視覚型 & 聴覚型 & 運動感覚型\\
\midrule
人数 & 89 & 48 & 13\\
\% & 59.3\% & 32.0\% & 8.7\%\\
\bottomrule
\end{tabular}
\end{table}


まず，この結果が想定される比率と異なるかどうかを見るためには，想定される比率の場合にどのような人数配分になるのかを知る必要があります。そこで，測定結果が想定される比率どおりであった場合に，それぞれのタイプの児童が何人ずつになると考えられるのかを考えてみましょう。一般的な比率が視覚型が65%，聴覚型が30%，運動感覚型が5%であるとした場合，150人の児童をこの比率に割り振ると表\@ref(tab:frequencies-chisq-table2)のようになります。


\begin{table}[H]

\caption{(\#tab:frequencies-chisq-table2)学習スタイルの期待度数}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{3}{c}{学習スタイル} \\
\cmidrule(l{3pt}r{3pt}){2-4}
  & 視覚型 & 聴覚型 & 運動感覚型\\
\midrule
人数 & 97.5 & 45 & 7.5\\
\% & 65\% & 30\% & 5\%\\
\bottomrule
\end{tabular}
\end{table}


このような，想定される比率どおりに全体の人数を割り振った値は*期待度数*と呼ばれます。人数なのに「97.5人」と小数点を含む値になっているのは変だと思うかもしれませんが，これはあくまでも理論上の数値ですので，これで問題ありません。

そして，この状態と実際の観測データにおける人数（これを*観測度数*といいます）が異なるかどうかを知りたいわけですから，この期待度数と観測度数がどれだけずれているか，両者の差を求めてみます（表\@ref(tab:frequencies-chisq-table3)）。

\begin{table}[H]

\caption{(\#tab:frequencies-chisq-table3)期待度数と観測度数のずれ}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{3}{c}{学習スタイル} \\
\cmidrule(l{3pt}r{3pt}){2-4}
  & 視覚型 & 聴覚型 & 運動感覚型\\
\midrule
観測度数 & 89 & 48 & 13\\
期待度数 & 97.5 & 45 & 7.5\\
差：観測 − 期待 & -8.5 & 3 & 5.5\\
\bottomrule
\end{tabular}
\end{table}

こうしてみると，それぞれのスタイルで観測度数と期待度数にずれがあることがわかります。なお，観測度数も期待度数も合計人数は150人で同じですから，期待度数と観測度数のずれがあるということは，この2つの間で3つのスタイルの比率が異なっているということです。

そこで，このようにして求めた各スタイルにおける観測度数と期待度数のずれの大きさを1つの値にまとめ，その値を用いて観察された結果と想定される比率の間に差があるといえるかどうかを判断しようとするのがカイ2乗適合度検定の考え方です。

なお，それぞれのスタイルにおけるずれの大きさを1つの値にまとめる際，「ずれの大きさ」の値がマイナスというのは扱いづらいですので，ずれの値は2乗してマイナスが取り除かれます。また，97.5人いることが期待される視覚型と7.5人しかいないことが期待される運動感覚型とでは「1人のずれ」の大きさがもつ意味合いが同じとはいえません。そこで，これら2乗したずれの値をさらに期待度数の大きさで調整してから合計することによって，全体的なずれの大きさが求められます。このようにして求めた値は，$\chi^2$（カイ2乗）と呼ばれる値の分布に近似的に従うことがわかっています。

そこで，$\chi^2$分布を利用して，帰無仮説（母集団の比率と想定される比率の差は0である）のもとでその大きさのずれが生じる確率を計算します。そして，その確率が有意水準未満であった場合に，「母集団の比率と想定される比率は有意に異なる」と判断するのです。

### 分析手順{#sub:frequencies-n-outcomes-procedure}

2項検定の場合と同様に，まずは分析用のデータを作成しましょう。先ほどの調査結果を，スプレッドシートに次のように入力してください（図\@ref(fig:frequencies-data02)）。


<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/data02} 

}

\caption{サンプルデータ}(\#fig:frequencies-data02)
\end{figure}

:::{.jmvvar data-latex=""}
+ `スタイル`　学習スタイル（視覚型：`視覚`，聴覚型：`聴覚`，運動感覚型：`運動`）
+ `人数`　各スタイルの人数（視覚：89，聴覚：48，運動：13）
:::

データの入力が終わったら早速分析しましょう。カイ2乗適合度検定を実施するには，Analysesタブの「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」で「One Sample Proportion Tests（1標本比率検定）」のところにある「N Outcomes [$\chi^2$ Goodness of fit]（多値：カイ2乗適合度検定）」を選択します（図\@ref(fig:frequencies-n-outcomes-goodness)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/n-outcomes-goodness} 

}

\caption{適合度検定の実行}(\#fig:frequencies-n-outcomes-goodness)
\end{figure}

すると，図\@ref(fig:frequencies-n-outcomes-goodness-setting)のような設定画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/n-outcomes-goodness-setting} 

}

\caption{適合度検定の設定画面}(\#fig:frequencies-n-outcomes-goodness-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Variable（変数）　分析対象の変数を設定します。
+ Counts (optional)（度数）　データが度数として入力されている場合に設定します。
+ Expected counts（期待度数）　期待度数を算出します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Expected Proportions}}（期待比率）　比較対象となる比率を設定します。
:::


この画面で，「スタイル」を「Variable（変数）」に移動します（図\@ref(fig:frequencies-n-outcomes-goodness-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/n-outcomes-goodness-set-var} 

}

\caption{分析対象の変数を設定}(\#fig:frequencies-n-outcomes-goodness-set-var)
\end{figure}

なお今回のデータは，2項検定のサンプルデータと同じく，すでに集計済みの度数が入力されています。「スタイル」には，視覚型，聴覚型，運動感覚型の値は1つずつしか含まれていませんので，このままではうまく分析できません。

そこで，各スタイルの度数が入った変数（「人数」）を「Counts (optional)（度数）」のところへ移動して，jamoviがそれぞれのスタイルの人数を認識できるようにします（図\@ref(fig:frequencies-n-outcomes-goodness-set-count)）。この操作は，集計済みでないデータ（各個人の値が1行ずつ入力されているデータ）の場合には必要ありません。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/n-outcomes-goodness-set-count} 

}

\caption{各スタイルの度数を設定}(\#fig:frequencies-n-outcomes-goodness-set-count)
\end{figure}

これで分析の設定は終わりですといいたいところですが，このままではどのような比率とデータを比較するのかがわかりません。そのままでは適切な分析結果が得られませんので，比較対象となる比率を設定してやる必要があります。


### Expected Proportions：期待比率 {#sub:frequencies-n-outcomes-expected-proportions}

比較対象となる比率を設定するには，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Expected Prportions}}（期待比率）を展開し，各変数値の「Ratio（比）」のところに適切な数値を入力します（図\@ref(fig:frequencies-n-outcomes-goodness-proportion)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/n-outcomes-goodness-set-proportion} 

}

\caption{各スタイルの度数を設定}(\#fig:frequencies-n-outcomes-goodness-set-proportion)
\end{figure}

今回の例では，期待される割合は視覚型が65%，聴覚型が30%，運動型が5%ですので，「視覚」のRatioに「65」，「聴覚」に「30」，「運動」に「5」を入力します。すると，その右の「Proportion（比率）」欄に，それぞれの型の比率が表示されます。入力の際には「Level（水準）」欄をよく確認し，入力する行を間違えないように注意しましょう。

なお，今回は使用しませんが，この設定を行ったあとに，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Expected Prportions}}のすぐ上にある「Expected counts（期待度数）」にチェックを入れると，指定した比率における期待度数を結果に表示させることができます。


これで分析の設定は終了です。

### 分析結果{#sub:frequencies-n-outcomes-results}

カイ2乗適合度検定の結果は次のような形で表示されます（図\@ref(fig:frequencies-n-outcomes-goodness-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/n-outcomes-goodness-results} 

}

\caption{適合度検定の分析結果}(\#fig:frequencies-n-outcomes-goodness-results)
\end{figure}

結果の1つ目の表は，観測データについての度数分布表です。今回は集計された度数をデータとして入力しましたが，1人1人の値が入力されているデータで分析を行う場合には，この度数分布表で各水準（変数値）の度数をよく確認しておきましょう。

その下の2つ目の表が適合度検定の結果です。適合度検定の結果の表には，検定統計量（$\chi^2$）と自由度（**df**），そして有意確率（**p**）の値が示されています。この表のpの値が有意水準を下回る場合に，このデータの母集団の比率が想定される比率と有意に異なると判断します。

今回の分析結果ではp=0.083ですので，このデータ（小学生児童150人）の母集団における比率は，想定されている比率と有意に異なるとはいえません。

## Independent Samples [χ² test of association]：対応なし標本（独立性検定）{#sec:frequencies-chisq}

ここからは**クロス集計表**（分割表）の分析についてみていきましょう。クロス集計表とは，行と列にそれぞれ異なる変数をとり，次のようにして複数の変数の値を組み合わせた形で集計をした表のことをいいます（表\@ref(tab:frequencies-chisq-salad-table)）。

<!-- -->
\begin{table}[H]

\caption{(\#tab:frequencies-chisq-salad-table)性別とサラダの好き嫌いについてのクロス集計表}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{サラダ} & \multicolumn{1}{c}{ } \\
\cmidrule(l{3pt}r{3pt}){2-3}
  & 好き & 嫌い & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{4}{l}{\textbf{性別}}\\
\hspace{1em}男 & 70 & 30 & 100\\
\hspace{1em}女 & 90 & 10 & 100\\
計 & 160 & 40 & 200\\
\bottomrule
\end{tabular}
\end{table}




このようなクロス集計表を用いた分析では，表の列に位置する変数と行に位置する変数が互いに「独立」であるかどうかを確かめる*独立性検定*がよく用いられます。2つの変数が「互いに独立」であるとは，お互に無関係であるということです。

たとえば，先ほどの表\@ref(tab:frequencies-chisq-salad-table)はサラダの好き嫌いと性別（男女）のクロス集計表ですが，この表を見ると，サラダが嫌いという回答の比率は，女性よりも男性の方が高くなっています。この場合，サラダを嫌いと答えたのは男性で100人中30人，女性では100人中10人というように，性別によってサラダの好き嫌いに違いが見られるので，サラダの好き嫌いと性別には関連があるということになります。

これに対し，次の表\@ref(tab:frequencies-chisq-hamburg-table)では，男性と女性でハンバーグを好きだと答えた人と嫌いだと答えた人の比率は同じです。この場合には，ハンバーグの好き嫌いが性別によって異なるということはなく，ハンバーグの好き嫌いと性別は無関係（独立）であるといえます。

\begin{table}[H]

\caption{(\#tab:frequencies-chisq-hamburg-table)性別とハンバーグの好き嫌いについてのクロス集計表}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{ハンバーグ} & \multicolumn{1}{c}{ } \\
\cmidrule(l{3pt}r{3pt}){2-3}
  & 好き & 嫌い & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{4}{l}{\textbf{性別}}\\
\hspace{1em}男 & 70 & 30 & 100\\
\hspace{1em}女 & 90 & 10 & 100\\
計 & 160 & 40 & 200\\
\bottomrule
\end{tabular}
\end{table}


### 考え方 {#sub:frequencies-chisq-basics}

ここでは，次の例を用いて独立性検定の考え方を見ていきましょう。

成人男女各100人を対象に，「ショートケーキ」，「チーズケーキ」，「チョコレートケーキ」の中でどれが一番好きかを選んでもらいました。その結果をまとめたものがこのサンプルデータ（[frequencies_data03.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/frequencies_data03.omv)）です（図\@ref(fig:frequencies-data03)）。




<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/data03} 

}

\caption{サンプルデータ}(\#fig:frequencies-data03)
\end{figure}


:::{.jmvvar data-latex=""}
+ `性別`　性別（男，女）
+ `ケーキ`　ケーキの種類
  - ショートケーキ：`ショート`
  - チーズケーキ：`チーズ`
  - チョコレートケーキ：`チョコ`
+ `人数`　そのケーキを選んだ人数
:::

この結果から，好きなケーキに男女で違いがあるといえるかどうか（独立でないといえるかどうか）を見たいとします。

まず，サンプルデータを選択したケーキと性別のクロス集計表の形にすると表\@ref(tab:frequencies-cake-table1)のようになります。


\begin{table}[H]

\caption{(\#tab:frequencies-cake-table1)性別とケーキの選択についてのクロス集計表}
\centering
\begin{tabular}[t]{lcccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{3}{c}{ケーキの種類} & \multicolumn{1}{c}{ } \\
\cmidrule(l{3pt}r{3pt}){2-4}
  & ショートケーキ & チーズケーキ & チョコレートケーキ & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{性別}}\\
\hspace{1em}男 & 49 & 37 & 14 & 100\\
\hspace{1em}女 & 31 & 48 & 21 & 100\\
計 & 80 & 85 & 35 & 200\\
\bottomrule
\end{tabular}
\end{table}



さて，この結果から，ケーキの好み（どのケーキを選択したか）に男女による違いがあるかどうかをみるにはどうすればよいのでしょうか。統計的仮説検定の常として，そのような場合には，まず男女による違いが「ない」場合にどのようになるかを考えます。

ケーキの好みに男女による違いがない場合というのは，男性も女性も各ケーキの選択率が同じということです。もしそうだったとすると，男女ともに全体におけるケーキの選択率と同じ比率でそれぞれのケーキが選択されるはずです。つまり，表\@ref(tab:frequencies-cake-table2)のような人数配分になるはずです。

\begin{table}[H]

\caption{(\#tab:frequencies-cake-table2)性別とケーキの選択の期待度数}
\centering
\begin{tabular}[t]{lcccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{3}{c}{ケーキの種類} & \multicolumn{1}{c}{ } \\
\cmidrule(l{3pt}r{3pt}){2-4}
  & ショートケーキ & チーズケーキ & チョコレートケーキ & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{性別}}\\
\hspace{1em}男 & 40 & 42.5 & 17.5 & 100\\
\hspace{1em}女 & 40 & 42.5 & 17.5 & 100\\
計 & 80 & 85.0 & 35.0 & 200\\
\bottomrule
\end{tabular}
\end{table}

そしてこれが，ケーキの選択と性別が独立（無関係）である場合の「期待度数」ということになります。

ここから先は，カイ2乗適合度検定の場合と考え方は同じです。この期待度数と，実際の観測データ（観測度数）の間で差を求め，その差の大きさを1つの値にまとめたうえで，そのようなずれの生じる確率がどの程度であるかを算出します。

この場合の帰無仮説は「ケーキの選択と性別は独立である」で，検定結果が有意であった場合には，「ケーキの選択と性別には関連がある（独立でない）」ということになります。

### 分析手順 {#sub:frequencies-chisq-procedure}

独立性検定を実施するには，Analysesタブの「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」で「Contingency Tables（クロス集計表）」のところにある「Independent Samples [$\chi^2$ test of association]（対応なし標本：カイ2乗独立性検定）」を選択します（図\@ref(fig:frequencies-chisq-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-menu} 

}

\caption{独立性検定の実行}(\#fig:frequencies-chisq-menu)
\end{figure}

すると，図\@ref(fig:frequencies-chisq-setting)のような画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-setting} 

}

\caption{独立性検定の設定画面}(\#fig:frequencies-chisq-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Rows（行）　クロス集計表の行に配置する変数を指定します。
+ Columns（列）　クロス集計表の列に配置する変数を指定します。
+ Counts (optional)（度数）　度数が含まれている変数を指定します（オプション）
+ Layers（階層）　クロス集計表を分割する変数を指定します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Statistics}}（統計量）　統計量に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Cells}}（セル）　クロス集計表の各セルに関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Plots}}（作図）　結果をグラフに示します。
:::

たくさんの設定項目があるのですが，基本的な分析はそれらを使用しなくても可能です。

分析では，クロス集計表の行と列に配置する変数を指定します。今回は，行（Rows）に「性別」を，列（Columns）に「ケーキ」を配置することにしましょう。

また，今回のデータもこれまでと同様に度数を集計済みのものですので，度数が入った変数（「人数」）を「Counts (optional)（度数）」のところに指定します。各個人の回答が1行ずつ入力されているデータの場合，この部分の設定は不要です。

設定後の画面は図\@ref(fig:frequencies-chisq-setvar)のようになります。これで基本の分析設定は終了です。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-setvar} 

}

\caption{分析する変数を設定}(\#fig:frequencies-chisq-setvar)
\end{figure}

### 分析結果 {#sub:frequencies-chisq-results}

それでは結果を見てみましょう。分析結果は図\@ref(fig:frequencies-chisq-results)のような形で得られます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-results} 

}

\caption{独立性検定の分析結果}(\#fig:frequencies-chisq-results)
\end{figure}

1つ目の表は，観測データについての度数分布表です。行と列が正しく設定されているか確認しましょう。また，集計済みのデータではなく，1人1人の回答が入力されているデータで分析を行う場合には，この度数分布表でそれぞれの度数をよく確認しておきましょう。

その下の2つ目の表が独立性検定の結果です。独立性検定の結果の表には，適合度検定の場合と同じで検定統計量（$\chi^2$）と自由度（**df**），そして有意確率（**p**）の値が示されています。また，独立性検定の場合には，総度数（N）についても示されています。この表のpの値が有意水準を下回る場合に，このデータの母集団の比率が想定される比率と有意に異なると判断します。

今回の分析結果ではp=0.032ですので，ケーキの選択と性別には関連がある（独立でない）ということになります。

### 層別分析 {#sub:frequencies-chisq-layered}

ここで，もう1つ別のデータをみてみましょう。次のサンプルデータ（[frequencies_data04.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/frequencies_data04.omv)）を開いてください。このデータは先ほどのデータとよく似ていますが，これは先ほどのデータに子供を対象に調査した結果を加えたものになっています（図\@ref(fig:frequencies-data04)）。



<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/data04} 

}

\caption{サンプルデータ}(\#fig:frequencies-data04)
\end{figure}

:::{.jmvvar data-latex=""}
+ `性別`　性別（男，女）
+ `年齢`　年齢（大人，子供）
+ `ケーキ`　ケーキの種類
  - ショートケーキ：`ショート`
  - チーズケーキ：`チーズ`
  - チョコレートケーキ：`チョコ`
+ `人数`　そのケーキを選んだ人数
:::

先ほどと同様に，今回もケーキの選択と性別に関連があるか（独立でないか）について検討したいと思います。ただし，ここで気をつけなくてはならないのが，このデータには大人を対象とした調査結果と子供を対象とした調査結果が混在しているということです。大人と子供でケーキの好みに違いがなければ大人と子供のデータを一まとめにして分析しても良いでしょうが，大人と子供でケーキの好みに大きな違いがあるのであれば，正しい分析結果が得られない可能性が高くなります。

このようなデータの場合，ケーキの選択と性別の関連を適切に把握するために，分析対象のクロス集計表を大人と子供にグループ分けしたうえで分析するという方法がとられます。このようにしてクロス集計表を別のグループ変数で分割して分析する方法は，*層別分析*と呼ばれます。jamoviでは，この層別分析についても簡単に実行できるようになっています。

#### 分析手順 {-#subsub:frequencies-chisq-layer}

層別分析を実施するためには，「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」から「Independent Samples [$\chi^2$ test of association]（対応なし標本：カイ2乗独立性検定）」を選択し，先ほどと同様に「Rows」に「性別」，「Columns」に「ケーキ」，そして「Counts (optional)」に「人数」を指定します。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-layer-set-var1} 

}

\caption{層別分析の設定（その1）}(\#fig:frequencies-chisq-layer-set-var1)
\end{figure}

なお，「Counts (optional)」の設定は，各個人の回答が1行ずつ入力されているデータの場合には不要です。

そしてそのうえで，グループ変数である「年齢」を，設定画面の「Layers（階層）」に設定します。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-layer-set-var2} 

}

\caption{層別分析の設定（その2）}(\#fig:frequencies-chisq-layer-set-var2)
\end{figure}

層別分析の設定はこれで終わりです。結果を見てみましょう。

#### 分析結果{-#subsub:frequencies-chisq-layer-results}

分析の設定画面でグループ変数を「Layers」に設定すると，分析結果は図\@ref(fig:frequencies-chisq-layer-results)のような形になります。全体としての構成は大きく変わりませんが，度数分布表と独立性検定の結果には，データ全体での結果と，大人と子供というグループごとの結果（層別の分析結果）の両方が含まれています。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-layer-results} 

}

\caption{層別分析の結果}(\#fig:frequencies-chisq-layer-results)
\end{figure}

この結果を見ると，大人ではケーキの選択と性別に有意な関連が見られますが，子供では有意な関連は見られません。つまり，大人か子供かによって，ケーキの選択の仕方と性別の関連は異なるということになります。

なお，全体での結果はp=0.048で有意ですが，このデータでは大人は男女各100人であるのに対し，子供は男女各50人ですので，データ全体においては子供よりも大人の結果の影響が強く反映されているためと考えられます。したがって，この場合には全体の検定結果はあまり意味がありません。

```{=latex}
\clearpage
```

### Statistics：統計量{#sub:frequencies-chisq-statistics}

ここからは分析設定の詳細について見ていきましょう。\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Statistics}}を展開すると，次の項目が表示されます（図\@ref(fig:frequencies-chisq-statistics)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-statistics} 

}

\caption{統計量の設定}(\#fig:frequencies-chisq-statistics)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Tests**（検定）　検定統計量に関する設定を行います。
+ **Hypothesis**（仮説）　対立仮説に関する設定を行います。
+ **Comparative Measures (2×2 only)**（比較指標：2行2列のみ）
+ **Nominal**（名義尺度）　名義尺度の関連についての指標を設定します。
+ **Ordinal**（順序尺度）　順序尺度の関連についての指標を設定します。
:::

非常にたくさんの項目が含まれていますが，ただ項目が多いだけでなく，この中には2行2列のクロス集計表の場合のみ適用可能な項目や，層別分析の場合のみ適用可能な項目などがあり，少し複雑です。ここでは，これらを1つ1つ順番に見ていくことにしましょう。

#### Tests：検定{-#subsub:frequencies-chisq-statistics-tests}

「**Tests**」の部分では，クロス集計表の検定に用いる検定手法についての設定を行うことができます（図\@ref(fig:frequencies-chisq-statistics-tests)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-statistics-tests} 

}

\caption{検定の設定項目}(\#fig:frequencies-chisq-statistics-tests)
\end{figure}

:::{.jmvsettings data-latex=""}
  - $\chi^2$　$\chi^2$統計量を算出します。
  - $\chi^2$ continuity correction（連続性の修正）　$\chi^2$値に対して連続性の修正を行います。
  - Likelihood ratio（尤度比）　尤度比カイ2乗検定を行います。
  - Fisher's exact test（フィッシャーの正確確率検定）　フィッシャーの正確確率検定を行います。
  - z test for difference in 2 proportions（比率の差のz検定）　比率の差に対してz検定を実施します。
:::


一番最初の$\chi^2$については説明の必要はないと思いますので，2つ目以降の項目について簡単に見ていきます。

##### $\chi^2$ continuity correction：連続性の修正{-}

独立性の検定や適合度検定に用いられる検定統計量は$\chi^2$と呼ばれますが，実際には$\chi^2$の近似値であって，$\chi^2$の値そのものではありません。そのため，クロス集計表の特徴によっては，この近似の程度が低くなる場合があるのです。そしてそのような場合に，算出した検定統計量を$\chi^2$分布にできるだけ近づけるように，*イェーツの修正*，あるいは*イェーツの連続性の修正*と呼ばれる修正を加えることがあります。このイェーツの修正は，一般にはクロス集計表が2行2列である場合，標本サイズが小さく，クロス集計表に期待度数が5未満のセルが1つ以上ある場合に用いられます。

この「$\chi^2$ continuity correction（連続性の修正）」の項目にチェックを入れると，イェーツの修正を行った後の$\chi^2$の値が算出されます（図\@ref(fig:frequencies-chisq-continuity)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-continuity} 

}

\caption{連続性の修正}(\#fig:frequencies-chisq-continuity)
\end{figure}

この結果は大人のみのデータを使ったクロス集計表の分析結果に連続性の修正を適用したものですが，このデータでは連続性の修正をしてもしなくても同じ結果になっています。

なお，イェーツの修正については，値を「修正しすぎる」傾向があることが知られています。そのため，このような修正を行うべきかどうかについては専門家の間でも意見が分かれるところです。

##### Likelihood ratio：尤度比{-}

「カイ2乗検定」というのは，検定統計量として$\chi^2$を用いるものの総称です。そして，独立性の検定として一般に用いられるカイ2乗検定は，*ピアソンのカイ2乗検定*とも呼ばれます。このように呼ばれるということは，それ以外のカイ2乗検定があるということです。

そして，その1つが*尤度比カイ2乗検定*です。ピアソンのカイ2乗検定では，$\chi^2$の値は期待度数と観測度数の差の2乗を元に算出されますが，尤度比カイ2乗検定では，$\chi^2$の値を期待度数と観測度数の比を用いて算出します。ほとんどの場合，この尤度比カイ2乗検定の結果はピアソンのカイ2乗検定の結果とよく似たものになります。また，結果の見方はピアソンのカイ2乗検定の場合と同じです（図\@ref(fig:frequencies-chisq-lr)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-lr} 

}

\caption{尤度比}(\#fig:frequencies-chisq-lr)
\end{figure}


##### Fisher's exact test：フィッシャーの正確確率検定{-}

カイ2乗検定で算出される検定統計量は近似値であるため，標本サイズが小さいデータでは正確な結果が得られないといわれています。その場合，一般には*正確確率検定*と呼ばれる手法を用いて，今回の観測データと同じ結果になる確率がどの程度あるのかを直接的に計算して検定するという方法がとられます。その正確確率検定の中で，もっとも代表的なのが*フィッシャーの正確確率検定*，あるいは*フィッシャーの直接確率検定*と呼ばれる検定手法です。

この「Fisher's exact test（フィッシャーの正確確率検定）」にチェックを入れると，*フィッシャーの正確確率検定*による検定結果を表示することができます。なお，この方法では直接的に確率を計算するため，検定統計量は算出されません（図\@ref(fig:frequencies-chisq-fisher)）。そのため，結果の表にはpの値だけが表示されます。このpの値が有意水準を下回る場合に，2つの変数の間に関連がある（独立でない）と判断します。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-fisher} 

}

\caption{フィッシャーの正確確率検定}(\#fig:frequencies-chisq-fisher)
\end{figure}


##### z test for difference in 2 proportions：比率の差のz検定{-}

この項目は，クロス集計表が2行2列の場合にのみ適用可能なオプションです。

独立性検定の最初のところで用いたハンバーグへの好みと性別のクロス集計表のように，クロス集計表の行と列に関連がなく，互いに独立である場合には，男女でハンバーグの好き・嫌いの比率は同じになり，また，ハンバーグの好き・嫌いで男女比は同じになります。ということは，このようにして行ごと，列ごとで見た比率が同じでなければ，行に置かれた変数と列に置かれた変数は独立でないということになります。

「z test for difference in 2 proportions（比率の差のz検定）」の項目では，このような考え方から，各行および各列で度数の比率が同じといえるかどうかの検定を行います。度数の比率が等しければ，それは行と列が互いに独立であるということを意味し，そうでなければ行と列には関連があるということを意味するわけです。

たとえば，男女各100人にイヌとネコのどちらが好きかをたずねた結果をまとめたクロス集計表があるとしましょう（表\@ref(tab:frequencies-chisq-cats-and-dogs)）。

\begin{table}[H]

\caption{(\#tab:frequencies-chisq-cats-and-dogs)性別とイヌ派・ネコ派についてのクロス集計表}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & イヌ & ネコ & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{4}{l}{\textbf{性別}}\\
\hspace{1em}男 & 70 & 30 & 100\\
\hspace{1em}女 & 55 & 45 & 100\\
計 & 125 & 75 & 200\\
\bottomrule
\end{tabular}
\end{table}



この表では，自分がイヌ派（ネコよりイヌが好き）と答えたのは男性では100人中70人（比率0.7），女性では100人中55人（比率0.55）ですので，男女の間でイヌ派の比率には0.15の差があります。この検定では，このようにして求めた比率の差を，全体におけるイヌ派の比率と男女それぞれの人数を用いてzに変換し，このzの値を用いて検定を行います。検定の結果が有意であった場合，2つの比率に差があるとみなします（図\@ref(fig:frequencies-chisq-ztest)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-ztest} 

}

\caption{比率の差のz検定}(\#fig:frequencies-chisq-ztest)
\end{figure}

イヌ派・ネコ派のデータについて比率の差の検定を行ったところ，p=0.028で検定結果は有意となりました。この結果から，男女でイヌ派・ネコ派の比率に有意な差があるということになります。

#### Hypothesis：仮説{-}

「**Hypothesis（仮説）**」では，「z test for difference in 2 proportions（比率の差のz検定）」における対立仮説を設定します（図\@ref(fig:frequencies-chisq-statistics)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-statistics-hypothesis} 

}

\caption{仮説の設定項目}(\#fig:frequencies-chisq-statistics-hypothesis)
\end{figure}

:::{.jmvsettings data-latex=""}
- Group 1 ≠ Group 2　グループ1と2で比率が異なるかどうかを検定します（両側検定）
- Group 1 &gt; Group 2　グループ1の比率がグループ2より大きいかどうかを検定します（片側検定）
- Group 1 &lt; Group 2　グループ1の比率がグループ2より小さいかどうかを検定します（片側検定）
:::

この設定項目が結果に影響するのは，「z test for difference in 2 proportions」にチェックが入っている場合のみです。なお，片側検定を使用する際には，結果の「$\chi^2$ Tests（カイ2乗検定）」の表の下にある注釈で，比較の向きが正しいかどうかをよく確認してください。また，この「**Hypothesis**」の右側にある「Compare（比較）」の部分を「rows（行）」に設定すると行ごとの比率の差の検定，「columns（列）」にすると列ごとの比率の差の検定になります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-hypothesis} 

}

\caption{片側検定の場合は比較の向きに注意}(\#fig:frequencies-chisq-hypothesis)
\end{figure}


#### Comparative Measures：比較指標{-}

ここに含まれている設定項目は，2行2列（2×2）のクロス集計表の場合のみ有効なものです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-comparative} 

}

\caption{2行2列のクロス集計表における比較指標}(\#fig:frequencies-chisq-comparative)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Odds ratio（オッズ比）
+ Log odds ratio（対数オッズ比）
+ Relative risk（リスク比）
+ Difference in proportion（比率の差）
+ Confidence intervals（信頼区間）
+ Compare（比較方法）
:::

ここでは，オッズや比率を2つのグループ間で比較する際に用いられる指標の設定を行いますが，その際，行での比較を行うか，列での比較を行うかは，各指標の下にある「Compare（比較方法）」で設定します。

この「Compare」を「rows（行）」に設定すると，オッズや比率が行ごとに算出され，それらの間で比較が行われます。先ほどのイヌ派とネコ派のクロス集計表でいうと，男性におけるイヌ派の比率と，女性におけるイヌ派の比率の間で比較が行われます（図\@ref(fig:frequencies-chisq-compare-setting)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-compare-setting} 

}

\caption{比較方法の設定}(\#fig:frequencies-chisq-compare-setting)
\end{figure}

これに対して，「Compare」を「columns（列）」に設定すると，ネコ派における男女比と，イヌ派における男女比の間での比較になります。この「Compare」の設定は，「z test for difference in 2 proportions（比率の差のz検定）」にも反映されます。

では，ここで設定できる各種指標について簡単にみておきましょう。

##### Odds ratio：オッズ比{-}

「あり・なし」や「はい・いいえ」などの2値変数において，「あり」である確率と「なし」である確率の比をとったものを*オッズ*と呼びます。先ほどの「イヌ派」と「ネコ派」の例でいえば，「イヌ派率」と「ネコ派率」を「イヌ派率/ネコ派率」の形で表したものが「イヌ派のオッズ」です。

そして，さらにそのオッズ2種類を比の形にして表したものが*オッズ比*です。先ほどの例では，男性ではイヌ派のオッズは「0.7/0.3 = 2.33」，女性ではイヌ派のオッズは「0.55/0.45 = 1.22」ですので，イヌ派についての男女のオッズ比は「2.33/1.22 = 1.91」となります。


##### Log odds ratio：対数オッズ比{-}

2つの確率の比であるオッズは，2つの確率のうちの小さな値を基準（分母）におくか，大きな値を基準におくかで値のとりうる範囲が大きく異なります。たとえば，男性のイヌ派のオッズは「70/30 = 2.33」ですが，これは男性の場合，イヌ派である確率の方がネコ派である確率の2.33倍であることを意味します。このように小さい方の値を基準とした場合には，オッズは1から無限大までの範囲をとりうる値になります。

これに対し，男性のネコ派のオッズは「0.3/0.7 = 0.43」で，これはネコ派の確率がイヌ派の確率の0.43倍であるということになるのですが，このように大きい方の値を基準としてオッズを算出した場合，オッズの値は0から1までの範囲にしかなりません。

また，イヌ派のオッズとネコ派のオッズは，0.7/0.3と0.3/0.7というように分数の上下を入れ替えただけの違いであるのに，その値は2.33と0.43というようにまったく異なる数値になっていて，とくに関連があるようには見えません。

ところが，これらのオッズを対数変換すると，「log(0.7/0.3) = 0.85」，「log(0.3/0.7) = \(-\textsf{0.85}\)」となって，両者が方向を逆転させた関係にあることがわかりやすくなります。また，この場合には，プラスの値は0から無限大まで，マイナスの値もマイナス無限大の値をとることができるようになるのです。このように，オッズを用いる場合には，それを対数変換した方が関係を理解しやすくなることが多いのです。

これはオッズ比の場合も同様で，そしてオッズ比を対数に変換したものが*対数オッズ比*です。先ほどの例の，イヌ派についての男女のオッズ比を対数オッズ比に直すと，「log 1.91 = 0.65」になります。

##### Relative risk：リスク比{-}

オッズ比が2グループのオッズの比であるのに対して，2グループの確率をそのまま比の形で表したものが*リスク比*です。先ほどのイヌ派・ネコ派の例でいうと，イヌ派の割合は男性では0.7（70%），女性では0.55（55％）ですので，「0.7/0.55 = 1.27」というのがイヌ派についての男女のリスク比ということになります。

##### Difference in proportions：比率の差{-}

これは，2つのグループにおける比率の差です。「**Tests**」の設定項目にある「z test for difference in 2 proportions（比率の差のz検定）」は，この2グループの比率の差をzに変換して検定を行っています。

イヌ派・ネコ派の例では，イヌ派の割合は男性で0.7，女性で0.55ですので，比率の差の値は「\(\textsf{0.7}-\textsf{0.55} = \textsf{0.15}\)」になります。

ここまでの指標の関係をまとめると図\@ref(fig:frequencies-chisq-comparative-measures)のようになります。

<!--  -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-comparative-measures} 

}

\caption{比較指標の関係と一覧}(\#fig:frequencies-chisq-comparative-measures)
\end{figure}


##### Confidence intervals：信頼区間{-}

「Confidence intervals」の項目にチェックを入れると，オッズ比や対数オッズ比，リスク比などの各指標について，指定した幅の信頼区間が算出されます。

#### Nominal：名義尺度{-}

「**Nominal**（名義尺度）」では，分析対象のデータが名義型変数（\infig{variable-nominal.pdf} Nominal）である場合の**連関係数**に関する設定を行います。連関係数とは，クロス集計表における行の要素と列の要素の間の関連の強さを表す指標のことです。

ここには，次の2つの設定項目が含まれています（図\@ref(fig:frequencies-chisq-contingency)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-contingency} 

}

\caption{名義尺度の連関係数}(\#fig:frequencies-chisq-contingency)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Contingency coefficient（コンティンジェンシー係数）
+ Phi and Cramer's V（ファイおよびクラメールのV）
:::

##### Contingency coefficient：コンティンジェンシー係数{-}

*コンティンジェンシー係数*は，$\chi^2$の値を「$\chi^2$+総度数」で割った値の平方根で，これはクロス集計表の行要素と列要素の関連の強さを示します。この値は*ピアソンの連関係数C*とも呼ばれます。この値は，行と列の連関が0である（行と列が独立である）場合に0となり，連関が強いほど1に近い値になります。


##### Phi and Cramer's V：ファイとクラメールのV{-}

この項目にチェックを入れると，*ファイ係数*と*クラメールの連関係数V*の2種類の値が算出されます。

ファイ（$\varphi$）係数と呼ばれるものには，$\chi^2$の値を総度数で割ったものの平方根として求められるものと，ピアソンの積率相関係数を2行2列のクロス集計表に適用したもの（これは*四分点相関係数*とも呼ばれます）の2種類が存在しますが，jamoviで算出されるのは後者です。このファイ係数は，2行2列のクロス集計表でのみ算出されます。

もう1つのクラメールの連関係数Vは，$\chi^2$の値を行数と列数の小さい方の値で割って平方根を求めたもので，こちらは2行2列よりも大きなサイズのクロス集計表に対しても算出されます。なお，2行2列のクロス集計表では，ファイ係数とクラメールのVは同じ値になります。

これらの値も，コンティンジェンシー係数と同様に，行と列の連関が0である（行と列が独立である）場合に0となり，連関が強いほど1に近い値になります。


#### Ordinal：順序尺度{-}

「**Ordinal**（順序尺度）」では，分析対象のデータが順序型変数（\infig{variable-ordinal.pdf} Ordinal）である場合の関連度指標に関する設定を行います。

ここには，次の3つの項目が含まれています（図\@ref(fig:frequencies-chisq-ordinal)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-ordinal} 

}

\caption{順序尺度の関連度}(\#fig:frequencies-chisq-ordinal)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Gamma（グッドマン=クラスカルのガンマ）
+ Kendall's tau-b（ケンドールの順位相関係数）
+ Mantel-Haenszel（マンテル=ヘンツェルの傾向性検定）
:::

##### Gamma：グッドマン=クラスカルのガンマ{-}

*グッドマン=クラスカルのガンマ*は，順位相関係数の一種です。2行2列のクロス集計表の場合には，このガンマの値は*ユールのQ*と呼ばれることもあります。グッドマン=クラスカルのガンマは，スピアマンの順位相関係数などと同様に\(-\textsf{1}\)から1までの範囲をとります。

この設定は，クロス集計表の行と列の両方が順序型変数である場合に有効です。それ以外の場合にも計算計算は表示されますが，それらの値は適切ではない可能性があります。


##### Kendall's tau-b：ケンドールの順位相関係数{-}

この項目にチェックを入れると，ケンドールの順位相関係数が算出されます。

この設定は，クロス集計表の行と列の両方が順序型変数である場合に有効です。それ以外の場合にも計算計算は表示されますが，それらの値は適切ではない可能性があります。



##### Mantel-Haenszel：マンテル=ヘンツェルの傾向性検定{-}

*マンテル=ヘンツェルの傾向性検定*は，行数または列数が2で，もう一方が順序型変数である場合のクロス集計表に使用可能な検定です。

たとえば表\@ref(tab:frequencies-chisq-feature-table)のようなクロス集計表があったとします。この表には，行方向にはある特徴のあり・なしが，列方向には学年が置かれています。このようなクロス集計表で，その特徴のあり・なしと学年の間に関連が見られるかどうかを確かめるのがマンテル=ヘンツェルの傾向性検定です。よく似た名前をもつ検定にコクラン=マンテル=ヘンツェル検定がありますが，これとは別物ですので注意してください。


\begin{table}[H]

\caption{(\#tab:frequencies-chisq-feature-table)特徴の有無と学年についてのクロス集計表}
\centering
\begin{tabular}[t]{lcccc}
\toprule
  & 低学年 & 中学年 & 高学年 & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{5}{l}{\textbf{特徴}}\\
\hspace{1em}あり & 10 & 20 & 40 & 70\\
\hspace{1em}なし & 90 & 80 & 60 & 230\\
計 & 100 & 100 & 100 & 300\\
\bottomrule
\end{tabular}
\end{table}


この検定では，順序型変数（低学年・中学年・高学年）を「1，2，3」という数値に置き換え，名義型変数（あり・なし）を「1，2」に置き換えて，2つの変数の間のピアソンの積率相関係数を算出します。そしてその相関係数の2乗値に「総度数&minus;1」をかけた値が$\chi^2$として算出されます。この検定の結果，有意確率pの値が有意水準を下回る場合に，2つの変数の間に関連があると判断します。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-mantel} 

}

\caption{マンテル=ヘンツェルの傾向検定}(\#fig:frequencies-chisq-mantel)
\end{figure}


### Cells：セル{#sub:frequencies-chisq-cells}

ここでは，クロス集計表のセル（1つ1つのマス目）に表示する値についての設定を行います（図\@ref(fig:frequencies-chisq-cells)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-cells} 

}

\caption{セルの設定}(\#fig:frequencies-chisq-cells)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Counts**（度数）
  - Observed counts（観測度数）　観測度数を表示します。
  - Expected counts（期待度数）　期待度数を表示します。
+ **Percentages**（パーセント）
  - Row（行）　それぞれの行における各セルのパーセントを示します。
  - Column（列）　それぞれの列における各セルのパーセントを示します。
  - Total（全体）　各セルの度数が総度数に占めるパーセントを示します。
:::

「**Counts**（度数）」にある「Observed counts（観測度数）」と「Expected counts（期待度数）」は，それぞれ観測度数と期待度数を表示に関する設定項目です。これらの項目にチェックを入れると，チェックした項目の値がクロス集計表に表示されます（図\@ref(fig:frequencies-chisq-cells-expected)）。


<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-cells-expected} 

}

\caption{期待度数の表示}(\#fig:frequencies-chisq-cells-expected)
\end{figure}

また，「**Percentages**（パーセント）」にある設定項目は，各セルのパーセント値の表示・非表示についての設定です。「Row（行）」にチェックを入れると，それぞれの行ごとに各列の値の占める割合がその行の度数の何%であるかが表示されます。同様に，「Column（列）」にチェックを入れると，それぞれの列ごとに各行の値がその列に占める割合が何%であるかが表示されます（図\@ref(fig:frequencies-chisq-cells-percentage)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-cells-percentage} 

}

\caption{パーセントの表示}(\#fig:frequencies-chisq-cells-percentage)
\end{figure}

「Total（全体）」も同様で，この項目にチェックを入れると各セルの度数が総度数の何%を占めるかがクロス集計表に表示されます。

### Plots：作図{#sub:frequencies-chisq-plots}

ここでは，クロス集計表の値を用いたグラフの作成に関する設定を行います（図\@ref(fig:frequencies-chisq-plots)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-plots} 

}

\caption{グラフの設定}(\#fig:frequencies-chisq-plots)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Plots**（作図）
  - Bar Plot（棒グラフ）　棒グラフを作成します。
+ **Bar Type**（棒グラフのタイプ）
  - Side by side（横並び）　グループ別に，棒を横並びにして表示します。
  - Stacked（積み上げ）　各グループの度数を縦に積み上げて表示します。
+ **Y-Axis**（縦軸）
  - Counts（度数）　グラフの縦軸に度数を示します。
  - Percentages（パーセント）　グラフの縦軸に度数のパーセントを示します。
+ **X-Axis**（横軸）
  - Rows（行）　クロス集計表の行にある変数の値を横軸に配置します。
  - Columns（列）　クロス集計表の列にある変数の値を横軸に配置します。
:::

ここの「**Plots**（作図）」にある「Bar Plot（棒グラフ）」にチェックを入れると，クロス集計表の値を棒グラフとして示すことができます（図\@ref(fig:frequencies-chisq-plots-bar)）。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-plots-bar} 

}

\caption{棒グラフの表示}(\#fig:frequencies-chisq-plots-bar)
\end{figure}

ここで作成できる棒グラフは，グループ別に値を横に並べて表示するスタイルと，それぞれのグループの度数を縦に積み上げて表示するスタイルの2種類のスタイルを選択することができます。「**Bar Type**（棒グラフのタイプ）」で「Side by side（横並び）」を選択すると，異なるグループの度数が横並びの形で棒グラフに表示されます。これに対し，「Stacked（積み上げ）」を選択すると，異なるグループの度数が縦に積み上げられる形の棒グラフ（積み上げ棒グラフ）が表示されます（図\@ref(fig:frequencies-chisq-plots-bar-stack)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-plots-bar-stack} 

}

\caption{棒グラフのスタイル}(\#fig:frequencies-chisq-plots-bar-stack)
\end{figure}

「**Y-Axis**（縦軸）」に含まれているのは，グラフの縦軸（数値軸）に示す値についての設定項目です。ここで「Counts（度数）」を選択すると，グラフの縦軸には度数が示されます。これに対し，「Percentages（パーセント）」を選択した場合には，グラフの縦軸にはその度数が全体または行・列に占めるパーセントの値が縦軸に示されます（図\@ref(fig:frequencies-chisq-plots-bar-percentage)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-plots-bar-percentage} 

}

\caption{グラフの縦軸の設定}(\#fig:frequencies-chisq-plots-bar-percentage)
\end{figure}

また，全体，行，列のいずれに対するパーセント値を表示させるかは，「Percentages」の横のプルダウンメニューから選択して設定します。ここが「of total」になっている場合には全体におけるパーセント，「within rows」になっている場合には各行におけるパーセント，「within columns」になっている場合には各列におけるパーセントになります。

「**X-Axis**（横軸）」に含まれているのは，グラフの横軸（項目軸）に用いる値についての設定項目です。ここで「Rows（行）」を選択すると，グラフの横軸にはクロス集計表の行にある変数の値が用いられます。これに対し，「Columns（列）」を選択した場合には，グラフの横軸にはクロス集計表の列にある変数の値が用いられます（図\@ref(fig:frequencies-chisq-plots-bar-xaxis)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/chisq-plots-bar-xaxis} 

}

\caption{グラフの横軸の設定}(\#fig:frequencies-chisq-plots-bar-xaxis)
\end{figure}

## Paired Samples [McNemar test]：対応あり標本（マクニマー検定）{#sec:frequencies-mcnemar}

無作為に選抜した生徒100人を対象に，本試験用の問題と追試験用の問題の両方を解いてもらい，それぞれ何人が合格基準に達するかを調べたところ表\@ref(tab:frequencies-mcnemar-table)の結果が得られたとしましょう。

\begin{table}[H]

\caption{(\#tab:frequencies-mcnemar-table)本試験と追試験での合否の結果}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & 本試験 & 追試験 & 計\\
\midrule
合格 & 68 & 79 & 147\\
不合格 & 32 & 21 & 53\\
計 & 100 & 100 & 200\\
\bottomrule
\end{tabular}
\end{table}


そしてこの結果から，試験問題の違いによって合格・不合格の程度が異ならない（どちらも難易度が同程度になっている）かどうかを確かめたいとします。この場合，どのように分析すれば良いでしょうか。

このデータは，一見すると独立性の検定で分析できそうに見えるのですが，残念ながらそうではありません。なぜなら，このデータでは「本試験」と「追試験」の両方に同じ人のデータが含まれているからです。これはいわゆる「対応あり」のデータで，データ収集方法にそもそも対応があるわけですから，それに対して「独立」かどうかという検定を行っても適切な結果が得られないのです。

このような場合，次にとりあげる*マクニマー検定*と呼ばれる検定が用いられます。

### 考え方{#sub:frequencies-mcnemar-basics}

先ほどのクロス集計表は，残念ながらそのままでは分析ができません。このようなデータの場合には，クロス集計表は本試験の合否を行に，追試験の合否を列に配置するような形で作成する必要があります。

そこで，もう一度全員の結果を調べ直し，分析に適した形でクロス集計表を作成し直したところ，表\@ref(tab:frequencies-mcnemar-table2)のようになったとします。



\begin{table}[H]

\caption{(\#tab:frequencies-mcnemar-table2)本試験と追試験での合否結果のクロス集計表}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{追試験} & \multicolumn{1}{c}{ } \\
\cmidrule(l{3pt}r{3pt}){2-3}
  & 合格 & 不合格 & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{4}{l}{\textbf{本試験}}\\
\hspace{1em}合格 & 58 & 10 & 68\\
\hspace{1em}不合格 & 21 & 11 & 32\\
計 & 79 & 21 & 100\\
\bottomrule
\end{tabular}
\end{table}



この表は先ほどの表と似ていますが，先ほどの表は総度数が200だったのに対し，この表は総度数が100で，調査対象の人数と同じになっています。つまり，先ほどの表はデータの対応がまったく考慮されていなかったのに対し，こちらはデータの対応をきちんと考慮した形で集計表が作成されているのです。

次に，本試験と追試験で難易度が同じである場合の期待度数について考えてみましょう。ここでは，考え方についてみるために，それぞれのセルの度数をa〜dで表しています（表\@ref(tab:frequencies-mcnemar-table3)）。


\begin{table}[H]

\caption{(\#tab:frequencies-mcnemar-table3)本試験と追試験での合否結果のクロス集計表}
\centering
\begin{tabular}[t]{lccc}
\toprule
\multicolumn{1}{c}{ } & \multicolumn{2}{c}{追試験} & \multicolumn{1}{c}{ } \\
\cmidrule(l{3pt}r{3pt}){2-3}
  & 合格 & 不合格 & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{4}{l}{\textbf{本試験}}\\
\hspace{1em}合格 & a & b & a+b\\
\hspace{1em}不合格 & c & d & c+d\\
計 & a+c & b+d & 100\\
\bottomrule
\end{tabular}
\end{table}

2つの試験の難易度が同じであれば，本試験で合格できた人は追試験でも合格するはずです。つまり，「a+b」の人数と「a+c」の人数は同じになるはずです。同様に，本試験で合格できなかった人は追試験でも合格できないはずで，その場合には「c+d」と「b+d」の人数も同じになります。

そして，これらの関係を整理すると，合格の度数についての「a+b = a+c」という関係は，結局は「b=c」ということですし，また，不合格の度数についての「c+d = b+d」というのも，結局は「b=c」ということになって，2つの試験で難易度が同じである場合に期待されるのは，「b=c」の状態ということになります。

そこで，マクニマー検定では，観測データにおける右上のセルと左下のセルの値が互いにどれだけずれているかを検定統計量として算出し，そこから2つの試験の難易度に違いがあるといえるかどうかを判断します。

### 分析手順{sub:frequencies-mcnemar-procedure}

ここでは，次のサンプルデータ（[frequencies_data05.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/frequencies_data05.omv)）を用いて分析を行いましょう。このデータファイルには以下の変数が含まれています（図\@ref(fig:frequencies-data05)）。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/data05} 

}

\caption{サンプルデータ}(\#fig:frequencies-data05)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　生徒のID
+ `本試験`　本試験の合否（合格，不合格）
+ `追試験`　追試験の合否（合格，不合格）
:::

ここでは，各生徒の本試験と追試験の結果が入力されたデータファイルを使用しますが，すでに集計済みのデータで分析を行う場合，スプレッドシートには図\@ref(fig:frequencies-data06)のような形でデータが入力されている必要があります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/data06} 

}

\caption{集計済みデータの入力方法}(\#fig:frequencies-data06)
\end{figure}


マクニマー検定を実施するには，Analysesタブの「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」で「Contingency Tables（クロス集計表）」のところにある「Paired Samples [McNemar test]（対応あり標本：マクニマー検定）」を選択します（図\@ref(fig:frequencies-mcnemar-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/mcnemar-menu} 

}

\caption{マクニマー検定の実行}(\#fig:frequencies-mcnemar-menu)
\end{figure}

すると，図\@ref(fig:frequencies-mcnemar-settings)のような画面が表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/mcnemar-settings} 

}

\caption{マクニマー検定の設定画面}(\#fig:frequencies-mcnemar-settings)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Rows（行）　クロス集計表の行に配置する変数を指定します。
+ Columns（列）　クロス集計表の列に配置する変数を指定します。
+ Counts (optional)（度数）　度数が含まれている変数を指定します（オプション）
+ $\chi^2$　$\chi^2$値を算出します。
+ $\chi^2$ continuity correction（連続性の修正）　連続性の修正を行った$\chi^2$値を算出します。
+ Log odds ratio exact（対数オッズ比正確確率検定）　対数オッズ比と正確確率検定の結果を表示します。
+ **Percentages**（パーセント）
  - Row（行）　各行におけるパーセント値を算出します。
  - Column（列）　各列におけるパーセント値を算出します。
:::

ここでは，「本試験」を「Rows（行）」に，「追試験」を「Columns（列）」に設定しましょう。このデータファイルには一人一人の結果が入力されているので，分析の基本設定はこれで終わりです。「Counts (optional)（度数）」の設定は必要ありません。集計済みデータで分析をする場合には，度数が入力されている変数を「Counts (optional)」に指定してください（図\@ref(fig:frequencies-mcnemar-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/mcnemar-set-var} 

}

\caption{マクニマー検定の分析設定}(\#fig:frequencies-mcnemar-set-var)
\end{figure}

### 分析結果{#sub:frequencies-mcnemar-results}

それでは結果を見てみましょう（図\@ref(fig:frequencies-mcnemar-results)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/mcnemar-results} 

}

\caption{マクニマー検定の結果}(\#fig:frequencies-mcnemar-results)
\end{figure}

結果の表示，および見方は，独立性検定の場合とほぼ同じです。1つ目の表はクロス集計表，2つ目の表が検定結果です。$\chi^2$値の有意確率は5%の有意水準を下回っているので（p=0.048），検定結果は有意です。つまり，本試験と追試験で難易度（合格・不合格の比率）が異なるということになります。

### 分析オプション{#sub:frequencies-mcnemar-options}

マクニマー検定では利用可能な分析オプションは多くありません。分析に関する設定項目は，検定統計量としてイェーツの修正を行った$\chi^2$を算出する項目と，対数オッズ比を算出するための項目だけです。連続性の修正を行った$\chi^2$は，独立性検定の場合と同じですので説明は省略します。

検定オプションの「Log odds ratio exact（対数オッズ比正確確率検定）」は，正確確率を用いた検定結果を表示します（図\@ref(fig:frequencies-mcnemar-logodds)）。この方法を用いて分析した場合に表示される「Log odds ratio exact」の値は，クロス集計表の右上および左下のセルの度数について帰無仮説どおりの場合の比率と観測データにおける比率から算出したオッズ比の対数です。

<!-- --> 

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/mcnemar-logodds} 

}

\caption{対数オッズ比と正確確率検定の結果}(\#fig:frequencies-mcnemar-logodds)
\end{figure}

マクニマー検定では，右上のセルと左下のセルの度数だけを考え，そしてこの2つのセルの度数は同じというのが帰無仮説ですので，右上のセルの左下のセルに対するオッズは「1/1 = 1」となります。そして，今回のデータでは，右上のセルは31人中10人（10/31 = 0.32），左下のセルは31人中21人（21/31 = 0.68）なので，右上のセルのオッズは「0.32/0.68 = 0.47」となります。

この場合，帰無仮説のオッズを基準（分母）としたオッズ比は「0.47/1 = 0.47」で，これを対数変換すると「log 0.47 = \(-\textsf{0.76}\)」となります。途中で四捨五入しながら計算しているので結果の表に表示されている値と完全には一致しませんが，このように計算するとほぼ同じ値になるのがわかります。

また，マクニマー検定はクロス集計表の右上のセルと左下のセルの度数が同じかどうかを検定していますので，考え方としては，この2つのセルの出現比率が1:1になっているかどうかを2項検定するのと同じことになります。この検定における有意確率pの値は，「31人中10人」という結果について2項検定を行った場合の値に一致します。

設定画面右側の「**Percentages**（パーセント）」の項目は，クロス集計表にパーセントを表示するかどうかの設定です。「Row（行）」をチェックすれば行ごとのパーセント値が，「Column（列）」をチェックすれば列ごとのパーセント値が表示されます。

## Log-Linear Regression：対数線形回帰{#sec:frequencies-loglin}

カイ2乗適合度検定は1つの変数についての比率の分析，カイ2乗独立性検定は2つの変数を組み合わせた場合の比率の分析でした。では，3つ以上の場合はどうすればよいでしょうか。jamoviのカイ2乗独立性検定では，3つ目の変数値をグループ変数として層別分析を行うことも可能ですが，その場合，グループ変数と他の変数との関連については見ることができません。

このような，より複雑なデータの場合に使用可能な分析の1つに*対数線形回帰分析*があります。

### 考え方{#sub:frequencies-loglin-basics}

話を単純にするために，ここでは表\@ref(tab:frequencies-loglin-table1)のクロス集計表を例にこの分析の考え方について見てみましょう。これは，独立性検定のところで用いた性別とイヌ派・ネコ派のクロス集計表です。

\begin{table}[H]

\caption{(\#tab:frequencies-loglin-table1)性別とイヌ派・ネコ派についてのクロス集計表}
\centering
\begin{tabular}[t]{lccc}
\toprule
  & イヌ & ネコ & 計\\
\midrule
\addlinespace[0.3em]
\multicolumn{4}{l}{\textbf{性別}}\\
\hspace{1em}男 & 70 & 30 & 100\\
\hspace{1em}女 & 55 & 45 & 100\\
計 & 125 & 75 & 200\\
\bottomrule
\end{tabular}
\end{table}

このようなクロス集計表では，各セルの期待度数は，行の度数と列の度数，クロス集計表全体の総度数を用いて次のように求めることができます。

\[
 \text{期待度数} = \frac{\text{行の度数}\times\text{列の度数}}{\text{総度数}}
\]

たとえば，男性でイヌ派のセルの期待度数は，「(100&times;125)/200 = 62.5」となります。

このとき，この期待度数の式を対数変換すると，この式は次のように表すことができます^[掛け算の式を対数変換した場合，その式は元の項目の対数同士の足し算として，割り算の式を対数変換した場合，その式は元の項目の対数同士の引き算として表すこができます。多変量解析の中でしばしば対数変換が行われるのは，このように掛け算を足し算に，割り算を引き算にできることで計算が単純になるということが理由の1つにあるのです。]。

\begin{eqnarray*}
 \log(\text{期待度数}) %
 & =& \log\left(\frac{\text{行の度数}\times\text{列の度数}}{\text{総度数}}\right)\\
 &=&  \log(\text{行の度数})+\log(\text{列の度数}) - \log(\text{総度数}) \\
 &=&  - \log(\text{総度数}) + \log(\text{行の度数})+\log(\text{列の度数})
\end{eqnarray*}

各セルの期待度数について考えたとき，この式の「log(行の度数)」と「log(列の度数)」はセルごとに変化しますが，「\(-\log(\textsf{総度数})\)」の部分は，どのセルにおいても共通ですので，これは回帰式における切片のような役割を担っています。このように考えると，この式はさらに次のような回帰式として表せることになります。

\[
\log(\text{期待度数}) = b_0 + b_1\times \text{行の要素} + b_2\times \text{列の要素}
\]

一般に，クロス集計表の検定では，行と列が独立であるかどうかについての検定を行いますが，これは行と列の組み合わせによって比率が異なるかどうかを検定しているのと同じです。先ほどの式には行の影響と列の影響しか含まれていませんが，ここに行と列の組み合わせの影響，つまり交互作用による影響を加えると，この式は次のようになります。

\[
\log(\text{期待度数}) = b_0 + b_1\times \text{行の要素} + b_2\times \text{列の要素} + b_3\times\text{行と列の交互作用}
\]

対数線形回帰分析では，このように対数変換を用いて期待度数（の対数）を目的変数，行・列とその交互作用（の対数）を説明変数とする回帰式を作成し，そしてそれぞれの係数を算出するという形で複雑なクロス集計表についての分析を行います。

### 基本手順{#sub:frequencies-loglin-procedure}

ここでは，独立性検定の層別分析のところで用いたデータ（[frequencies_data04.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/frequencies_data04.omv)）で対数線形回帰分析の実施方法を見ていくことにしましょう。念のため，データファイルに含まれている変数の一覧を示しておきます。

:::{.jmvvar data-latex=""}
+ `性別`　性別（男，女）
+ `年齢`　年齢（大人，子供）
+ `ケーキ`　ケーキの種類
  - ショートケーキ：`ショート`
  - チーズケーキ：`チーズ`
  - チョコレートケーキ：`チョコ`
+ `人数`　そのケーキを選んだ人数
:::

このデータを用いて，ケーキの選択に性別と年齢がどのように影響しているかをこれから分析していきます。

まず，Analysesタブの「\infig{analysis-frequencies.pdf} Frequencies（度数分析）」から「Log-Linear Regression（対数線形回帰）」を選択してください（図\@ref(fig:frequencies-loglin-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-menu} 

}

\caption{対数線形回帰分析の実行}(\#fig:frequencies-loglin-menu)
\end{figure}


すると，図\@ref(fig:frequencies-loglin-settings)のような画面が表示されます。画面の構成は，回帰分析（第\@ref(ch:regression)章）のものとよく似ています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-settings} 

}

\caption{対数線形回帰分析の設定画面}(\#fig:frequencies-loglin-settings)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Factors（要因）　分析に使用する変数を指定します。
+ Counts (optional)（度数）　度数が入力されている変数を指定します（オプション）
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Builder}}（モデルビルダー）　交互作用を含むモデルの作成や複数モデルの比較を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}（基準レベル）　比較基準として用いる水準値を指定します。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）　モデル適合度に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}（モデル係数）　モデル係数に関する設定を行います。
+ \colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）　各主効果の周辺平均値（回帰モデルによる推定値）に関する設定を行います。
:::

基本的な分析は，分析に使用する変数をすべて「Factors（要因）」の部分に移動するだけです。また，今回のデータファイルのように度数集計済みのデータで分析する場合には，度数が入力されている変数（ここでは「人数」）を「Counts (optional)（度数）」の欄に指定します（図\@ref(fig:frequencies-loglin-setvar)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-setvar} 

}

\caption{対数線形回帰分析の設定}(\#fig:frequencies-loglin-setvar)
\end{figure}

実際にはもう少し色々と設定が必要なのですが，ひとまずこれで分析の基本設定はおしまいです。それでは結果を見てみましょう。

### 分析結果{#sub:frequencies-loglin-results}

対数線形モデルの結果は，図\@ref(fig:frequencies-loglin-results)のような形で表示されます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-results} 

}

\caption{対数線形回帰分析の結果}(\#fig:frequencies-loglin-results)
\end{figure}

分析の手順が簡単だった割に，随分と複雑な結果に見えます。この結果の表について，1つ1つみていきましょう。

まず，結果の1つ目の表は，モデルの適合度に関する指標です。この表には，ロジスティック回帰分析の場合と同様に逸脱度とAIC，擬似決定係数が示されています。ただ，この分析結果では，じつはデータは完全に説明されていて，モデルとデータの残差はありません。このように実際の観測データを完全に説明したモデルは*飽和モデル*と呼ばれます。そのため，逸脱度は「\(-\textsf{2.38e-14}\)（\(-\textsf{2.38}\times \textsf{10}^{-\textsf{14}}\)）」と，限りなく0に近くなっています。また，マクファデンの擬似決定係数も1.00になっています。

そしてその下の表が回帰係数の推定値ですが，この表はとても複雑です。対数線形モデルでは，分析で説明変数として使用する変数はすべて名義型変数であるため，それらはすべて*ダミーコード化*されています。そして，その変数値の1つを基準として比較した結果がここにまとめられているために，このように複雑な表になっているのです。

また，今回のデータにおける「ケーキ」のように，3つ以上のカテゴリがある変数が含まれている場合，このダミーコード化の際にどの変数値を基準としたかによって，この表に示される係数やその係数が有意かどうかが大きく変化します。

そのため，実際にはこのままこの分析結果を解釈することはできません。データに含まれる関係の理解のためには，ここからもう少し分析モデルに修正を加えていく必要があります。

### Model Builder：モデルビルダー{#sub:frequencies-loglin-modelbuilder}

ここからは分析モデルの修正についてみていきましょう。この分析のモデルを修正するには，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Builder}}（モデルビルダー）を使用します（図\@ref(fig:frequencies-loglin-modelbuilder)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder} 

}

\caption{モデルビルダー}(\#fig:frequencies-loglin-modelbuilder)
\end{figure}

分析の初期設定では，このモデルビルダーの「Blocks（ブロック）」には分析に使用する3つの変数（「性別」，「年齢」，「ケーキ」）の主効果と，これらの1次の交互作用，2次の交互作用のすべてが含まれています。これは先ほど結果の見方のところで説明したように「飽和モデル」と呼ばれるモデルで，このモデルでは観測データを完全に説明することが可能です。

飽和モデルはデータを完全に説明できる反面，構造が複雑になってしまうため，理解することが困難になりがちです。データ解析の目的は，そのデータに含まれる変数間の関係を解き明かし，理解することにあるわけですから，それでは困ります。そこで，この飽和モデルから結果に大きな影響を与えていない主効果や交互作用を取り除き，モデルを単純化していくことにします。

まずは，\colorbox{ao}{\textcolor{white}{+ Add New Block}}をクリックして，新たなブロックを作成しましょう。そして，その新しく作成したブロックに，飽和モデルに含まれる項目のうち，もっとも複雑な項目である3変数の交互作用（2次の交互作用）「性別＊年齢＊ケーキ」を「**Block 1**」から「**Block 2**」にドラッグして移動します（図\@ref(fig:frequencies-loglin-modelbuilder-2way-interaction)）。

<!--  -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder-2way-interaction} 

}

\caption{2次の交互作用をBlock 2に移動}(\#fig:frequencies-loglin-modelbuilder-2way-interaction)
\end{figure}

この状態で一度結果を見てみましょう。見る必要があるのは，「Model Fit Measures（モデル適合度指標）」と「Model Comparisons（モデルの比較）」の部分です（図\@ref(fig:frequencies-loglin-modelbuilder-comparison)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder-comparison} 

}

\caption{モデルの比較}(\#fig:frequencies-loglin-modelbuilder-comparison)
\end{figure}

この結果を見てみると，すべての項目を含む飽和モデル（Model 2）と，そこから2次の交互作用を取り除いたモデル（Model 1）では，飽和モデルの方がAICの値が大きく，また，この2つのモデルで適合度に有意な差はないことがわかります。これはつまり，2次の交互作用はこのデータを説明するうえで余分というか過剰な項目であるということです。そこで，この交互作用は分析モデルから除外してしまいましょう。

モデルビルダーの「**Block 2**」にある「性別＊年齢＊ケーキ」を選択し，「\infig{action-back.pdf}」をクリックして分析モデルから除外します（図\@ref(fig:frequencies-loglin-modelbuilder-2way-removed)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder-2way-removed} 

}

\caption{分析モデルから交互作用を除外}(\#fig:frequencies-loglin-modelbuilder-2way-removed)
\end{figure}

今度は1次の交互作用（2つの変数間の交互作用）についても見ていきましょう。1次の交互作用は，「性別＊年齢」，「性別＊ケーキ」，「年齢＊ケーキ」の3つですが，このうち，「性別＊ケーキ」と「年齢＊ケーキ」の交互作用は，それぞれ「性別によってケーキの選択比率が違う」，「大人か子供かによってケーキの選択比率が違う」という意味ですが，「性別＊年齢」の交互作用は「性別によって大人と子供の比率が違う」という意味で，これは今回の分析における関心とは関連がありません。また，今回のデータは大人も子供も男女同数ですので，この分析においては意味がない項目です。

そこで，今度はこの「性別＊年齢」を「**Block 2**」に入れて，これを除外した場合とそうでない場合とでモデルの適合度がどう変化するかを見てみましょう（図\@ref(fig:frequencies-loglin-modelbuilder-compare2)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder-compare2} 

}

\caption{再度モデルを比較}(\#fig:frequencies-loglin-modelbuilder-compare2)
\end{figure}

すると，この場合も「性別＊年齢」を除外したモデルの方がAICの値が小さく，相対的な適合度が高いことが示されました。また，2つのモデルで適合度に有意な差はありません。そこで，この交互作用もモデルから除外してしまいましょう。

1次の交互作用はあと2つ残っています。この2つはどちらも分析の関心と関連があるものですが，念のためモデルへの影響度を見ておきましょう。まずは「年齢＊ケーキ」について，先ほどと同様にして結果を見てみましょう。すると，この場合の結果は図\@ref(fig:frequencies-loglin-modelbuilder-comparison3)のようになります。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder-comparison3} 

}

\caption{年齢とケーキの交互作用についての検討}(\#fig:frequencies-loglin-modelbuilder-comparison3)
\end{figure}

この結果では，モデルに「年齢＊ケーキ」の交互作用を加えることによって大きくAICの値が減少しており，また，これを入れたモデルと除外したモデルでは，適合度に有意な差があることがわかります。つまり，この交互作用はモデルから除外すべきではありません。

同様に，「性別＊ケーキ」についても見てみましょう。この場合は図\@ref(fig:frequencies-loglin-modelbuilder-comparison4)の結果が得られます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-modelbuilder-comparison4} 

}

\caption{性別とケーキの交互作用についての検討}(\#fig:frequencies-loglin-modelbuilder-comparison4)
\end{figure}

この結果から，「性別＊ケーキ」の交互作用もモデルから除外しない方が良さそうです。

さて，次は「性別」，「年齢」，「ケーキ」それぞれの主効果についてですが，ここまでの結果では「性別＊ケーキ」と「年齢＊ケーキ」がモデルに含まれており，そしてこの3つの変数はこの交互作用の少なくとも1つに関係していますので，これらはモデルから除外することができません。そのため，ここでモデルの修正はおしまいということになります。

このようなモデル修正の結果，性別，年齢，ケーキの選択の各主効果と，性別&times;ケーキ，年齢&times;ケーキの交互作用から結果を説明できそうだということがわかりました。なお，ここでの分析の関心は，性別によって選択するケーキの比率に違いがあるか，年齢によって選択するケーキの比率に違いがあるかということでしょうから，これらのうち，とくに交互作用について中心的に見ていくことになります。

### Reference Levels：基準レベル{#sub:frequencies-loglin-referencelevels}

モデルの修正によって分析結果は単純化されたのですが，それでもまだ，「Model Coeffcients（モデル係数）」の結果の表の解釈には注意が必要です。基本設定のみの分析結果のところでも説明したように，この係数の値は，各変数のどの値を基準に考えるかによって大きく変わるからです。そのため，分析結果について検討するには，各変数における基準値をよく確認し，必要に応じて基準値を変更しなくてはなりません。

設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}（基準レベル）を展開すると，初期状態では図\@ref(fig:frequencies-loglin-referencelevels)のようになっているはずです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-referencelevels} 

}

\caption{基準レベルの設定}(\#fig:frequencies-loglin-referencelevels)
\end{figure}

そして，この状態での「Model Coefficients（モデル係数）」の表は，図\@ref(fig:frequencies-loglin-referencelevels-result1)のようになっています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-referencelevels-result1} 

}

\caption{対数線形回帰分析の結果}(\#fig:frequencies-loglin-referencelevels-result1)
\end{figure}


この場合，結果の表では，「男」の「子供」で「ショート（ケーキ）」を選択した度数が入力されているセルが基準となっており，切片の値は，その基準セルについてこの分析モデルから推定される度数の対数値になっています。つまり，切片の値「2.58」を指数変換したもの（\(e^{\textsf{2.58}}=\textsf{13.2}\)）が，「男性・子供・ショートケーキ」のセルの推定度数ということです。

そして，その下の「性別:」の部分には「女 - 男（男性と比較した場合の女性の値）」についての推定値（**Estimate**）があり，そしてこの値のpは0.049で有意になっていますが，これは，男性に比べて女性の度数が有意に小さいという意味ではなく，「**男性**・子供・ショートケーキ」のセルに比べて「**女性**・子供・ショートケーキ」のセルの度数が有意に小さいという意味です。この場合，「女性・子供・ショートケーキ」の推定度数は，切片の2.58に\(-\textsf{0.40}\)を加えた値を指数変換したもの（\(e^{\textsf{2.58}+(-\textsf{0.40})}=\textsf{8.85}\)）になります。

同様に，その下の「年齢:」の部分にある「大人 - 子供」は，子供に比べて大人の度数が大きいということではなく，「男性・**子供**・ショートケーキ」のセルに比べて「男性・**大人**・ショートケーキ」の度数が有意に大きいという意味です。そしてこの係数から推定されるのは「男性・大人・ショートケーキ」の度数です。もし，「**女**・**大人**・ショートケーキ」の度数について推定したければ，そのセルは切片（男性・子供・ショートケーキ）から男性を女性に，子供を大人に変更した場合ということになるので，「女 - 男」の係数と「大人 - 子供」の係数の両方を切片に加えたもの（2.58 + (\(-\textsf{0.40}\)) + 1.29 = 3.47）を指数変換した値（\(e^{\textsf{3.47}}=\textsf{32.14}\)）がその推定値ということになるのです。

その下の交互作用の部分はさらに複雑です。「性別＊ケーキ:」の部分にある「(女 - 男)＊(チーズ - ショート)」は，「大人・女性・チーズケーキ」のセルに関する推定値なのですが，この係数はあくまでも交互作用の影響のみについてのものであるため，このセルの推定値を算出したい場合には，切片の値に「女 - 男」の係数と「チーズ - ショート」の係数を加え，さらにそこにこの係数の値を加えたうえで指数変換する必要があります。

つまり，この結果の表に示されている主効果や交互作用の係数は，図\@ref(fig:frequencies-loglin-results-interpretation)の関係について示したものなのです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-results-interpretation} 

}

\caption{対数線形回帰分析の係数とクロス集計表の関係}(\#fig:frequencies-loglin-results-interpretation)
\end{figure}

そして，これらの結果からいえるのは以下の点ということになります。以下には検定結果が有意であったもののみを示します。

+ ショートケーキを選ぶのは，男児より女児の方が少ない（推定値 = \(-\textsf{0.40}\), p = 0.049）
+ ショートケーキを選ぶのは，男児より男性の大人の方が多い（推定値 = 1.29, p < 0.001）
+ 男児ではショートケーキを選ぶよりチョコレートケーキを選ぶ方が多い（推定値 = 0.59, p < 0.001）
+ 女児でチーズケーキを選ぶのは，「女+子供＋チーズケーキ」の組み合わせから想定される数よりも多い（推定値 = 0.65, p = 0.019）
+ 大人の男性でチョコレートケーキを選ぶ人は，「男+大人＋チョコレートケーキ」の組み合わせから想定される数よりも少ない（推定値 = \(-\textsf{1.67}\), p < 0.001）

このうち，「ショートケーキを選ぶ人では，大人の男性より男児の方が人数が少ない」の部分については注意が必要です。今回のデータファイルでは子供の人数は大人の半分であり，これはあたりまえの結果だからです。ですので，この部分に何か特別な意味があると勘違いしないようにしましょう。

また，ここに挙げた結果に検討したい部分が含まれていない場合には，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Reference Levels}}で基準レベルを適切に変更し，そこで得られた結果を確認しなくてはなりません。

このように，対数線形回帰分析は結果の解釈が非常に複雑になってしまうのが難点です。

### Model Fit：モデル適合度{#sub:frequencies-loglin-modelfit}

設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）には，図\@ref(fig:frequencies-loglin-model-fit)の項目が含まれています。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/regression/binomial-model-fit} 

}

\caption{適合度指標の設定}(\#fig:frequencies-loglin-model-fit)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Fit Measures**（適合度指標）
  - Deviance（逸脱度）　モデルの残差逸脱度を算出します。
  - AIC（赤池情報量規準）　赤池情報量規準を算出します。
  - BIC（ベイズ情報量規準）　ベイズ情報量規準を算出します。
  - Overall model test（モデル全体の検定）　$\chi^{2}$を用いてモデル全体の有意性検定を行います。
+ **Pseudo R²**（擬似決定係数）　モデルのあてはまりの程度を標準化した値を算出します。
  - McFadden's R²（マクファデンのR²）　マクファデンの擬似決定係数を算出します。
  - Cox & Snell's R²（コックス=スネルのR²）　コックス＝スネルの擬似決定係数を算出します。
  - Nagelkerke's R²（ナゲルケルケのR²）　ナゲルケルケの擬似決定係数を算出します。
:::

これらの項目は2項ロジスティック回帰（第\@ref(ch:regression)章 \@ref(sec:regression-binomial)）の[モデルの適合度](#sub:regression-binomial-model-fit)と同じものですので，ここでは説明を省略します。

### Model Coefficients：モデル係数 {#sub:frequencies-loglin-coeff}

設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Coefficients}}（モデル係数）には，次の項目が含まれています（図\@ref(fig:frequencies-loglin-coeff)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/frequencies/loglin-coeff} 

}

\caption{モデル係数の設定}(\#fig:frequencies-loglin-coeff)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Omnibus Tests**（オムニバス検定）
  - Likelihood ratio tests（尤度比検定）　モデル全体の適合度について尤度比検定を行います。
+ **Estimate (Log Rate Ratio)**（推定値：対数率比）
  - Confidence Interval（信頼区間）　対数率比の信頼区間を算出します。
+ **Rate Ratio**（率比）
  - Rate Ratio（率比）　率比を算出します。
  - Confidence Interval（信頼区間）　率比の信頼区間を算出します。
:::

尤度比を用いたオムニバス検定については，ロジスティック回帰の場合と同じですのでここでは説明を省略します。

それ以外の数値についても，基本はロジスティック回帰分析の場合と同じですが，ここで示されるのは*オッズ比*ではなく，各セルの比率に基づく*率比*（比率の比）である点には注意してください。対数線形モデルでは，回帰モデルの各係数は，*対数オッズ比*ではなく，比率の比の対数になっているからです。ただ，このように回帰係数の値の性質が少し異なるというだけで，表示される結果の見方や考え方はロジスティック回帰分析の場合と同じです。「**Estimate (Log Rate Ratio)**」の「Confidence interval」にチェックを入れれば，回帰係数の信頼区間が算出されますし，「**Rate Ratio**」の部分の設定を行えば，回帰係数を指数変換した値やその信頼区間を表示させることができます。

### Estimated Marginal Means：推定周辺平均 {#sub:frequencies-loglin-emm}

設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）には，次の項目が含まれています。

:::{.jmvsettings data-latex=""}
+ Marginal Means（周辺平均値）　周辺平均値の算出対象を指定します
+ **General Options**（全般オプション）
  - Equal cell weights（均等重みづけ）
  - Confidence interval（信頼区間）　周辺平均値の信頼区間を算出します
+ **Output**（出力）
  - Marginal means plots（周辺平均値のグラフ）
  - Marginal means tables（周辺平均値の表）
:::

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimated Marginal Means}}（推定周辺平均）の設定項目やその使用方法は，第\@ref(ch:regression)章の線形回帰のところで説明したのと同じですので，詳細についてはここでは説明は省略します（線形回帰の「[Estimated Marginal Means（推定周辺平均）](#sub:regression-LR-marginalmeans)」を参照）。

なお，このオプションで表示される「推定周辺平均」は，回帰モデルの予測値，つまりは度数の推定値ですので，その点だけ注意してください。


<!--chapter:end:08-Frequencies.Rmd-->



# Factor：因子分析 {#ch:factor}

この章では，「\infig{analysis-factor.pdf}  Factor（因子分析）」ツールについて見ていきます。jamoviの基本構成では，ここには次の分析メニューが含まれています（図\@ref(fig:factor-menu)）。




\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/factor-menu} 

}

\caption{Factor（因子分析）のメニュー}(\#fig:factor-menu)
\end{figure}

:::{.jmvmenu data-latex=""}
+ **Scale Analysis**（尺度分析）
  - Reliability Analysis（信頼性分析）　尺度の内的一貫性についての指標を算出します。
+ **Data Reduction**（データ縮約）
  - Principal Component Analysis（主成分分析）　主成分分析を用いてデータを少数の主成分に集約します。
  - Exploratory Factor Analysis（探索的因子分析）　複数の変数の背後にある共通因子を探索します。
  - Confirmatory Factor Analysis（確認的因子分析）　想定される因子モデルがデータに適合しているかどうかを確かめます。
:::

それではまず，尺度分析の項目から見ていきましょう。

## Reliability Analysis：信頼性分析{#sec:factor-reliability-analysis}

ある体温計で数分間に3回繰り返して体温を測ったとき，1回目の測定では36.6度，2回目は36.5度，3回目は36.6度だったとしましょう。この体温計では，3回の測定値がほとんど同じです。そして別の体温計で同じように3回の測定を行ったとき，1回目の測定では36.2度，2回目には35.1度，3回目は38.2度だったとします。このような場合，1つ目の体温計と2つ目の体温計のどちらを信頼するかと聞かれたら，ほとんどの人は1つ目の体温計を選ぶことでしょう。2つ目の体温計は，測定値がコロコロ変わり，正しく測れているのかどうかもわからないからです。

それは心理尺度の場合も同様です。尺度による測定値が，測定のたびにコロコロと変わるようでは困ります。測定のたびにIQの値が10も20も変わるようでは，その知能検査の結果はあてになりません。

そして，そうした尺度の*信頼性*について，客観的な指標を用いて確認しようとするのが*信頼性分析*です。信頼性にはいくつかの確認方法がありますが，jamoviでは*内的一貫性*の指標を用いた信頼性分析が利用できます。

### 考え方{#sub:factor-reliability-analysis-basic}

心理学の調査では，*リカート法*^[示された文章の内容について，「まったくあてはまらない」から「とてもよくあてはまる」までの5段階や7段階の選択肢から答えさせる手法。]による心理測定尺度がよく用いられます。通常，それらの尺度は内容的に関連のある複数の質問で構成されており，それら複数の質問に対する回答値を合計したり平均したりすることによって尺度得点が算出されます。

このように，複数の質問に対する回答値を足したり平均したりして1つの尺度得点として使用するためには，当然ながらそれらの質問が同じ内容について測定しているものでなくてはなりません。このような同一尺度内における質問内容の一貫性は，*内的一貫性*や*内的整合性*と呼ばれます。

内的一貫性が高い尺度では，ある質問に対して「5」と答えた回答者は他の質問に対しても「5」と答える可能性が高く，「1」と答えた回答者は「1」と答える可能性が高いというように，同じ1人の回答者の中でその回答値が似通ったものになるはずです。類似した内容を測定しているのであれば測定結果も類似した値が得られるということは，その尺度における測定結果が安定したものである（信頼性のあるものである）ことを意味するわけです。


複数の質問で構成される心理尺度を用いた測定を行う場合には，その尺度における内的一貫性が十分であるかどうかの確認が行われますが，その際の内的一貫性の指標としてよく用いられているのが*クロンバックのアルファ*（α）や*アルファ係数*と呼ばれる値です。この値はしばしば*信頼性係数*とも呼ばれます。このクロンバックのアルファは，次のように尺度に含まれる各質問の回答値の分散と，参加者ごとの回答値の合計の分散から算出されます。

\[
 \alpha = \frac{\text{質問数}}{\text{質問数}-1}\times\left(1-\displaystyle\frac{\text{各質問の分散の合計}}{\text{各回答者の合計の分散}}\right)
\]

このようにして計算すると，質問ごとの回答のばらつきが一人一人の回答のばらつきよりも小さい（つまりそれぞれの質問に対する回答値が似通っている）場合にクロンバックのアルファが1に近くなります。

このアルファの値は0から1の値をとり，その大きさについては表\@ref(tab:factor-cronbach-alpha)のような目安を用いて解釈が行われます。一般に，心理尺度においてはこの値が0.8以上ある場合に内的一貫性があるとみなされます。


\begin{table}[H]

\caption{(\#tab:factor-cronbach-alpha)クロンバックのアルファの解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
アルファの値 & 内的一貫性\\
\midrule
0.9〜1.0 & 非常に高い\\
0.8〜0.9 & 高い\\
0.7〜0.8 & 許容レベル\\
0.6〜0.7 & 疑わしい\\
0.5〜0.6 & 低い\\
0.0〜0.5 & 著しく低い\\
\bottomrule
\end{tabular}
\end{table}




### 基本手順 {#sub:factor-reliability-analysis-method}

ここでは，このサンプルデータ（[factor_data01.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/factor_data01.omv)）を用いて尺度の内的一貫性について分析してみましょう。このデータは「メッセージアプリ志向尺度」を用いて測定されたもので，次の変数が含まれています。なお，各質問への回答は，いずれも「1:まったくあてはまらない」から「5:とてもよくあてはまる」までの5段階です（図\@ref(fig:factor-data01)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/data01} 

}

\caption{サンプルデータ}(\#fig:factor-data01)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID`　対象者のID
+ `Q1`　「メッセージアプリをよく使う」への回答値
+ `Q2`　「メッセージアプリよりメールで連絡することのほうが多い」への回答値
+ `Q3`　「メッセージアプリでやりとりするのは楽しい」への回答値
+ `Q4`　「メッセージアプリは何かとめんどくさい」への回答値
+ `Q5`　「送信メッセージに反応がないとソワソワする」への回答値
:::

このデータについて信頼性分析を実施するには，Analysesタブの「\infig{analysis-factor.pdf}  Factor（因子分析）」から「Reliability Analysis（信頼性分析）」を選択します（図\@ref(fig:factor-reliability-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-menu} 

}

\caption{信頼性分析の実行}(\#fig:factor-reliability-menu)
\end{figure}

すると，図\@ref(fig:factor-reliability-setting)のような設定画面が表示されます。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-setting} 

}

\caption{信頼性分析の設定}(\#fig:factor-reliability-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Items（項目）　分析対象の項目（変数）を指定します
+ **Scale Statistics**（尺度統計量）　尺度全体についての統計量を算出します
+ **Additional Options**（追加オプション）　追加の設定を行います
+ **Item Statistics**（項目統計量）　各項目（変数）に関する統計量を算出します
+ **Additional Options**（追加オプション）　結果表示に関するその他の設定です
+ **Reverse Scaled Items**（逆転項目）　逆転項目に関する設定を行います
+ **Save**（保存）　計算結果を変数値として保存します
:::

この画面で，内的一貫性の指標を算出したい質問の回答値が入った変数を指定します。通常は1つの尺度に含まれている質問すべてを指定しますが，その尺度が複数の下位尺度^[1つの尺度の中でさらに小区分に分けられているもののことです。たとえば，ある性格特性尺度が外向性尺度，神経症傾向尺度など複数の小尺度からなる場合，外向性尺度や神経症尺度のことをその性格特性尺度の下位尺度と呼びます。]から構成されている場合には，1つの下位尺度に含まれている質問のみを指定します。サンプルデータのメッセージアプリ志向尺度は「Q1」から「Q5」までの5つの質問で構成されていますので，これら5つを「Items（項目）」の領域に移動します（図\@ref(fig:factor-reliability-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-set-var} 

}

\caption{分析対象の設定}(\#fig:factor-reliability-set-var)
\end{figure}

これで基本的な分析の設定は終わりです，といいたいところですが，残念ながらそうではありません。今回のデータでは，適切な分析結果を得るためにはあと少しだけ設定が必要です。これでなぜ分析設定が完了でないのかは，出力ウィンドウにある結果の表を見てみるとわかります（図\@ref(fig:factor-reliability-error)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-error} 

}

\caption{分析の設定上の問題}(\#fig:factor-reliability-error)
\end{figure}

まず，この結果ではクロンバックのアルファの値がマイナスになっており，これは明らかに計算が正しくありません。そして，この表の下には何やら注釈が長々と書かれています。この内容を訳して見てみると，「項目\`Q2\`と\`Q4\`には尺度全体と負の相関があるため，おそらく逆転の必要があります」と書かれています。

じつは，サンプルデータでは，「Q1」と「Q3」，「Q5」はメッセージアプリの使用が多いほど回答値が大きくなる質問なのですが，「Q2」と「Q4」はその逆で，メッセージアプリをあまり使わない人ほど回答値が大きくなるような，逆内容の質問なのです。このような，他の質問とは逆内容の質問を含む項目は*逆転項目*と呼ばれ，内的一貫性の分析においては，これらはそのままでは分析できません。

### Reverse Scaled Items：逆転項目 {#sub:factor-reliability-reverse-scaled-items}
尺度を構成する質問の中に逆転項目が含まれている場合には，分析設定画面の［Reverse Scaled Items（逆転項目）］の部分を展開し，それらを適切に設定する必要があります（図\@ref(fig:factor-reliability-reverse-items)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-reverse-items} 

}

\caption{逆転項目の設定画面}(\#fig:factor-reliability-reverse-items)
\end{figure}

この画面の左側に通常の尺度項目が，右側に逆転項目が入るように，必要な変数を選択して移動します（図\@ref(fig:factor-reliability-reversed)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-reversed} 

}

\caption{逆転項目の設定}(\#fig:factor-reliability-reversed)
\end{figure}

すると，図\@ref(fig:factor-reliability-cronbach)のように結果の表の下にあった注釈が消え，そして算出結果も0.84という正常な値になりました。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-cronbach} 

}

\caption{クロンバックのアルファの算出結果}(\#fig:factor-reliability-cronbach)
\end{figure}

この結果から，このメッセージアプリ志向尺度の内的一貫性の値は0.84で，十分な内的一貫性を持っているといえそうです。

#### Scale Statistics：尺度統計量{-#subsub:factor-reliability-scale-statistics}

さて，少し前後しましたが，ここからは分析設定の詳細についてみていくことにしましょう。設定画面の**Scale Statistics**の部分では，尺度全体についての内的一貫性を吟味するための指標を設定します。

ここには，次の4つの項目があります。

:::{.jmvsettings data-latex=""}
- Cronbach's α（クロンバックのアルファ）　尺度全体のクロンバックのアルファを算出します
- McDonald's ω（マクドナルドのオメガ）　尺度全体のマクドナルドのオメガを算出します
- Mean（平均値）　尺度全体の平均値を算出します
- Standard deviation（標準偏差）　尺度全体の標準偏差を算出します
:::

これらの項目すべてにチェックを入れると，結果の表は図\@ref(fig:factor-reliability-statistics-results)のようになります。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-statistics-results} 

}

\caption{さまざまな尺度統計量}(\#fig:factor-reliability-statistics-results)
\end{figure}


このうち，クロンバックのアルファについてはすでに説明しましたので，それ以外の項目について見ていきましょう。

##### McDonald's ω：マクドナルドのオメガ{-}

クロンバックのアルファは計算は単純なのですが，その分，正確さにかける部分があり，近年とくにその問題点がたびたび指摘されるようになっています^[とはいえ，クロンバックのアルファは現在でも尺度の内的一貫性の指標として非常によく用いられています。]。そこで，その代替的な指標として近年注目を集めているのが*マクドナルドのオメガ*（ω）です。この値は，*オメガ係数*とも呼ばれます。

クロンバックのアルファでは，尺度に含まれる各質問に対する回答値をそのまま単純に合計しますが，マクドナルドのオメガでは各質問への回答値が共通因子から受けている影響（因子負荷量）を考慮して重みづけを行ったうえで合計します。このオメガについても基本的な解釈の仕方はクロンバックのアルファと同様で，0.8を超える場合に内的一貫性が高いとみなされます。サンプルデータでは，クロンバックのアルファとマクドナルドのオメガはほぼ同じ値で，オメガを指標とした場合にも十分な内的一貫性があることが示されました。

##### Mean，Standard deviation：平均値，標準偏差 {-}

**Scale Statistics**の「Mean（平均値）」と「Standard deviation（標準偏差）」にチェックを入れると，尺度全体の回答値の平均と標準偏差が算出されます。


#### Item Statistics：項目統計量{-#subsub:factor-reliability-item-statistics}

**Item Statistics**（項目統計量）には，尺度を構成する個別の質問項目について吟味するための項目が含まれています。

<!--  -->

:::{.jmvsettings data-latex=""}
- Cronbach's α (if item is dropped)　項目除外時のアルファ係数
- McDonald's ω (if item is dropped)　項目除外時のオメガ係数
- Mean（平均値）
- Standard deviation（標準偏差）
- item-rest correlation（I-R相関）
:::


ここでも，すべての項目にチェックを入れてその結果を見てみましょう（図\@ref(fig:factor-reliability-item-statistics)）。

<!--結果  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-item-statistics} 

}

\caption{項目ごとの統計量}(\#fig:factor-reliability-item-statistics)
\end{figure}

##### Cronbach's α (if item is dropped)：項目除外時のアルファ係数

この項目は，各質問項目を分析から除外した場合にクロンバックのアルファの値がどのように変化するかを示します。ここに表示されている値の中に尺度全体の値よりも大きなものがある場合，その項目を分析から除外することで尺度全体のアルファ係数が上昇することを意味します。今回の分析結果では，いずれの値も全体の値を下回っていますので，分析から除外すべき質問項目はなさそうです。

##### McDonald's ω (if item is dropped)：項目除外時のオメガ係数

この項目は，各質問項目を分析から除外した場合にマクドナルドのオメガの値がどのように変化するかを示します。ここに表示されている値の中に尺度全体の値よりも大きなものがある場合，その項目を分析から除外することで尺度全体のオメガ係数が上昇することを意味します。クロンバックのアルファの場合と同様に，この結果ではオメガの値はいずれも全体の値を下回っていますので，分析から除外すべき質問項目はなさそうです。

##### Mean，Standard deviation：平均値，標準偏差 {-}

ここでの「Mean（平均値）」と「Standard deviation（標準偏差）」は，「Q1」から「Q5」それぞれの平均値と標準偏差を表示します。

##### Item-rest correlation：I-R相関{-}

一番下にある「Item-rest correlation（I-R相関）」の項目にチェックを入れると，*I-R相関*と呼ばれる指標が算出されます。I-R相関は，各質問項目の回答値とそれ以外の項目（rest）の合計値の間の相関係数です。このI-R相関が著しく低い場合には，その質問項目が他の質問項目と異なる回答傾向を持っている（一貫性が低い）ことが考えられます。今回の分析結果では，「Q1」から「Q5」の中にそのような傾向はみられません。

#### Additional Options：追加オプション{-}

**Additional Options**（追加オプション）にある「Correlation heatmap（相関ヒートマップ）」にチェックを入れると，相関行列を*ヒートマップ*の形で視覚化した図が作成されます。ヒートマップとは，相関係数の大きさや向きを色の違いや濃淡で示したもののことをいいます。1つの尺度に含まれる質問項目の数が多い場合，ヒートマップの形で視覚化することによって，他と傾向の異なる質問項目を見つけやすくなります（図\@ref(fig:factor-reliability-heatmap)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-heatmap} 

}

\caption{相関係数のヒートマップ}(\#fig:factor-reliability-heatmap)
\end{figure}

このヒートマップでは，正の相関係数が緑，負の相関係数が赤で，そして相関係数の絶対値が大きくなるほど緑または赤の色が濃くなる形で示されています。


### Save：保存{#sub:factor-reliability-save}

設定画面の一番下にある［Save（保存）］の項目では，逆転項目の処理を行ったうえで，各質問項目の回答値の合計または平均値を新たな変数として保存することができます（図\@ref(fig:factor-reliability-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/reliability-save-scores} 

}

\caption{尺度得点の保存}(\#fig:factor-reliability-save-scores)
\end{figure}

:::{.jmvsettings data-latex=""}
- Mean score（平均得点）　回答値（逆転処理済）の平均値を尺度得点として保存します。
- Sum score（合計得点）　回答値（逆転処理済）の合計値を尺度得点として保存します。
:::


第\@ref(ch:basics)章の「[尺度得点の算出](sec-practice-handling.html#sub:basics2-scale-score)」では，計算変数を用いて尺度得点を変数に格納する方法を紹介しましたが，jamoviのバージョン1.8.0以降であれば，このようにして簡単に尺度得点を作成することができるのです。

このとき，「Mean score」にチェックを入れれば各質問項目への回答値の平均値が，「Sum score」にチェックを入れれば合計値が新たな変数として保存されます。

## Principal Component Analysis：主成分分析{#sec:factor-pca}

ここからは，数学的にデータを縮約する方法について見ていきましょう。

データの縮約とは，たくさんあるデータを類似性などを基準に整理し，それらをより少数の意味あるまとまりとして集約することをいいます。質問紙調査などによる調査研究では，データとして何十種類もの質問文に対する回答値が得られるのが普通ですし，それ以外の場合にも，関心のある事象に関連した指標をできる限り幅広く集めて分析を行おうとすると，分析に使用する変数の種類は膨大になってしまいます。そこで，そのような場合には，多変量解析によって，そうした複雑なデータを，できるだけ元の情報を損なわないようにしながら可能な限り単純化し，理解可能なものに分類，整理しようとするわけです。

このデータ縮約の方法の1つとして，*主成分分析*（PCA）があります。主成分分析では，以下に説明するような考え方で複数の変数がもつ情報を統合し，より少ない数の合成変数に集約するということを行います。

### 考え方

ここでは次のサンプルデータ（[factor_data02.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/factor_data02.omv)）を用いて主成分分析の基本的な考え方を見ておきましょう。このデータは，ある大学の学生男女計250人を対象に，食堂で提供されている代表的なメニュー6種類に対する満足度を「1:とても不満」から「7:非常に満足」までの7段階でたずねた結果です（図\@ref(fig:factor-data02)）。このデータを用い，この食堂で提供されているメニューに対する総合的な満足度について分析したいと思います。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/data02} 

}

\caption{サンプルデータ}(\#fig:factor-data02)
\end{figure}

:::{.jmvvar data-latex=""}
+ `ID` 回答者のID
+ `性別`　回答者の性別
+ `パスタ`　パスタに対する満足度
+ `カレー`　カレーに対する満足感
+ `ラーメン`　ラーメンに対する満足感
+ `カツ丼`　カツ丼に対する満足感
+ `オムライス`　オムライスに対する満足感
+ `ドリア`　ドリアに対する満足感
:::

このデータには全部で6種類のメニューに対する満足度が記録されているわけですが，これらを個別に分析した場合，個別のメニューに対する満足度の傾向は見ることができても，メニュー全体に対する全体的な満足度についてはわかりません。メニューに対する全体的満足度について知るには，これら6つのメニューに対する満足度を，なんらかの形で統合する必要があります。それにはどうすればよいのでしょうか。ここでは話を単純にするために，2つの変数を1つに統合する場合を例に見ていきます。

ここに，r=0.8の正の相関関係にある2つの変数があるとします。相関係数が0.8の変数の値を散布図に示すと，おおよそ図\@ref(fig:factor-pca-scatter1)のようなものになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-scatter1} 

}

\caption{相関r=0.8の2変数の散布図}(\#fig:factor-pca-scatter1)
\end{figure}


この散布図は，2つの変数が持っている情報を，変数1の軸（横軸）と変数2の軸（縦軸）の2つの軸で表現される平面上の点として表現したものです。そして，この2つの変数がもつ情報を1つに集約するということは，この2つの軸で表現されている情報を1つの軸だけで表現するということになるのです。

ここで，たとえばこの散布図に示されたデータの情報を横軸のみで表現した場合について考えてみましょう。縦軸のみで表現するということは，縦軸の値（変数2）は無視するということですので，ここでは変数2の値をすべて0として散布図上に示しなおします（図\@ref(fig:factor-pca-scatter2)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-scatter2} 

}

\caption{データを横軸に集約した場合の散布図}(\#fig:factor-pca-scatter2)
\end{figure}

すると，散布図上の点が横一列に並びました。1つの軸で表現するということは，このようにデータの点が一直線上に並ぶようにするということなのです。

ただし，これでは単に変数2がもつ情報（y軸がもつ情報）を捨てているだけですので，2つの軸がもつ情報を1つの軸に集約したことによって，多くの情報が失われてしまいます（図\@ref(fig:factor-pca-scatter3)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-scatter3} 

}

\caption{集約による情報の損失}(\#fig:factor-pca-scatter3)
\end{figure}

そこで，もう少し工夫をしてみましょう。このように2変数間に正の相関がある場合，その散布図は右肩上がりの楕円形の形になります。その楕円の中央を，楕円の長いほうの軸にそって貫通するような直線を引き，その直線を軸として散布図上の情報を集約させてみます（図\@ref(fig:factor-pca-scatter4)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-scatter4} 

}

\caption{情報の損失が少ない軸に集約}(\#fig:factor-pca-scatter4)
\end{figure}

すると，先ほどの場合よりも失われる情報の量がずっと少なくなりました。このような形で情報を集約できれば，2つの軸で表現される情報を1つの軸で表現したとしても，もとの情報が多く損なわれてしまうということがありません。

主成分分析では，このようにしてデータのもつ情報ができるだけ失われないようにしながら，もとのデータよりも少ない軸を用いてデータを表現しなおすということをするのです。

このとき，この情報を集約する軸は，次のような式によって表現されます。

\[
z = a_1 \times \text{変数}_1 + a_2 \times \text{変数}_2 + \cdots + a_n \times \text{変数}_n
\]


先ほどの2変数の例の場合，情報を集約する軸の式は，\(z=a_1\times\text{変数}_1+a_2\times\text{変数}_2\) となります。つまり，2つの変数の値になんらかの重みづけを行ったうえで合計するという形で合成得点を作成するのです。そして分析においては，このような変換によって失われる情報量が最小となるように，この式における重みづけの部分の値を決定します。

なお，この式は一見すると回帰分析で用いられる回帰式によく似ていますが，式の左辺にあるのが分析に使用する変数ではなく，合成得点zになっているという点に注意してください。この式によって算出される左辺zの値は*主成分得点*と呼ばれます。

それでは，jamoviにおける主成分分析の手順を見ていきましょう。なお，jamoviの主成分分析は，多変量解析の教科書の多くで説明されている主成分分析の形ではなく，かなり*因子分析*寄りの分析手法および結果表示になっています。この後の説明では，主成分分析と因子分析の違いを明確にするためにも，できるだけ統計法の教科書に近い形での結果になるように設定を行いながら分析を進めていきたいと思います。

また，主成分分析には分散共分散行列^[相関行列のような形の表で，相関行列ではつねに1になる表の左上から右下にかけての対角（同じ変数同士の組み合わせの部分）にその変数の分散，相関行列で各変数間の相関係数が示されている部分にそれらの変数の共分散が示されているもの。この分散共分散行列を標準化したものが相関行列です。]を用いる場合と相関行列を用いる場合とがあり，その両者で算出される固有ベクトルの値が異なります。jamoviでは，相関行列を用いた主成分分析が実行されます。

### 基本手順 {#sub:factor-pca-procedure}

主成分分析を実行するには，Analysesタブの「\infig{analysis-factor.pdf}  Factor（因子分析）」から「Principal Component Analysis（主成分分析）」を選択します（図\@ref(fig:factor-pca-menu)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-menu} 

}

\caption{主成分分析の実行}(\#fig:factor-pca-menu)
\end{figure}

すると，図\@ref(fig:factor-pca-setting)のような設定画面が表示されます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-setting} 

}

\caption{主成分分析の設定画面}(\#fig:factor-pca-setting)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Method**（方法）
  - Rotation（回転）　主成分の回転法を設定します
+ **Number of Components**（主成分の個数）
  - Based on parallel analysis（平行分析に基づいて決定）　平行分析の結果をもとに主成分の個数を決定します
  - Based on eigenvalue（固有値に基づいて決定）　固有値の大きさが指定値以上主成分を採用します
  - Fixed number（個数指定）　主成分の個数を直接指定します
+ **Assumption Checks**（前提チェック）
  - Bartlett's test of sphericity（バートレットの球面性検定）　バートレットの球面性検定を実施します
  - KMO measure of sampling adequacy（KMO標本妥当性指標）　標本妥当性指標（MSA）を算出します
+ **Factor Loadings**（因子負荷）
  - Hide loadings below ...（これ未満の負荷を隠す）　絶対値の小さい負荷量を非表示にします
  - Sort loadings by size（負荷量の大きさで並び替え）　負荷量の絶対値が大きい順に変数を並び替えて表示します
+ **Additional Output**（追加の出力）
  - Component summary（主成分の要約）　各主成分について要約量を算出します
  - Component correlations（主成分の相関）　各主成分の間の相関を算出します
  - Initial eigenvalues（回転前の初期値）　回転前の固有値とその寄与率，累積寄与率を算出します
  - Scree plot（スクリープロット）　スクリープロットを表示します
:::

この設定画面で，主成分分析の対象となる変数（「パスタ」から「ドリア」まで）を「Variables（変数）」欄に移動します（図\@ref(fig:factor-pca-set-var)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-set-var} 

}

\caption{分析対象の変数を設定}(\#fig:factor-pca-set-var)
\end{figure}


これで基本的な分析手順は終わりです。ただし，主成分分析の結果は設定によって大きく変わりますので，結果の見方についての説明に入る前に，いくつかの設定項目について説明しておきたいと思います。

#### Method：回転 {-#subsub:factor-pca-method}

主成分分析の目的は，たくさんの変数をできるだけ少数の変数に集約することにあります。そのため，まずは分析に使用した変数全体が持っている情報を1つの軸に集約し，そこで拾いきれなかった情報を2つ目，3つ目の軸に集約していくというのがもともとの考え方です。

しかし，情報の損失を最小限にすることだけを目的として軸を設定した場合，その軸が一体何を表しているのかが解釈困難になる場合もあります。心理学における研究の場合，多数ある変数を少数の軸に集約するだけでなく，それらの軸に対する解釈も重要な関心対象であることがよくあります。そのため，主成分分析の結果を解釈しやすくすることを目的として，分析で得られた軸に対して「*回転*」と呼ばれる操作を行う場合があります。

jamoviの主成分分析では，分析設定画面の「**Method**（方法）」にある「Rotation（回転）」でこの回転方法についての設定ができるようになっており，初期設定値では，回転方法は「Varimax（バリマックス）」が指定されています。ここでは，この設定値を「None（回転なし）」に設定してください（図\@ref(fig:factor-pca-rotate)）。



<!-- -->
<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-rotate} 

}

\caption{主成分のRotate（回転）を「None（なし）」に設定}(\#fig:factor-pca-rotate)
\end{figure}

いわゆる「総合得点」を算出したい場合には，回転は「None（回転なし）」にしておきます。そうすることによって，軸を回転する前の主成分分析結果を得ることができるからです。なお，多変量解析の教科書の多くは，主成分分析では回転を行っていません。

「総合得点」を算出することよりも集約した軸の解釈が主な目的の場合には，適切な回転方法を選んで指定します。軸の回転方法については因子分析のところで説明するため，ここでは省略します。


#### Number of Components：主成分の個数 {-#subsub:factor-pca-component}

主成分分析では，計算上は元の変数と同じ数だけ主成分が抽出されます。しかし，変数が多いからデータがもつ情報を少数の軸に縮約しようとしているのに，元の変数と同じ個数だけ主成分を抽出したのでは意味がありません。そこで実際の分析では，抽出された中から適切な個数の主成分だけを選んで使用するのですが，その際，主成分の「適切な個数」については，いくつかの判断方法があります。

jamoviの「**Number of Components**（主成分の個数）」の設定項目には，次の3種類が用意されています。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-n-components} 

}

\caption{採用する主成分の個数の設定}(\#fig:factor-pca-n-components)
\end{figure}

:::{.jmvsettings data-latex=""}
- Based on parallel analysis（平行分析を基準）
- Based on eigenvalue（固有値を基準）
- Fixed number（個数指定）
:::

ここでは，これら3つの項目を中心に，適切な主成分の個数を判断する方法について見ていきましょう。

###### Based on parallel analysis：平行分析を基準 {-#subsub:factor-pca-component-parallel}

1つ目の「Based on parallel analysis（平行分析に基づいて決定）」では，*平行分析*と呼ばれる手法を用いて最適と考えられる主成分の個数を決定します。jamoviでは，この方法が初期設定値になっています。


この方法では，まずコンピューターを用いて，分析データと変数の個数が同じで標本サイズも同じであるランダムなデータを複数発生させます。そして，それらを用いて主成分分析を行った場合の平均的な結果と，実際のデータを主成分分析した場合の結果を比較し，ランダムなデータの場合よりも*固有値*が大きい主成分を採用するという方法をとります。

さて，この「固有値」とは一体何なのでしょうか。これをきちんと説明するのは非常に難しいので，ここでは大まかなイメージをつかんでおくことにしましょう。

先ほど，主成分分析の考え方のところでは，変数が2つの場合を例にとって説明をしました。変数が2つの場合，それらの変数がもつ情報は2つの軸で構成される平面上に表現することができます。もしこれが3つの変数の場合であれば，それらの変数がもつ情報は3つの軸で構成される3次元空間上に表現されることになります。

今回のサンプルデータでは変数の数は6個ですので，これら6つの変数がもつ情報は，6次元の空間（これがどのようなものかを図示することもイメージすることも不可能ですが）に表現されることになるわけです。そして主成分分析では，それらn次元の空間に表現された情報を，できるだけ情報の損失がないような形で集約できる軸を探していきます。

その際，その軸がどの方向を向いているのかを表した値が，先ほどの主成分得点の式における係数の部分です。2変数の場合には，主成分得点の式は「\(z=a_1\times\text{変数}_1+a_2\times\text{変数}_2\)」という形になりますが，これはこの軸が，グラフの原点（横軸・縦軸ともに0）と，横軸の座標が\(a_1\)，縦軸の座標が\(a_2\)の点（\([{a_1}\ \ {a_2}]\)）を通る直線であることを意味しています。変数が3つの場合にも，主成分の軸はやはり原点（\([0\ \ 0\ \ 0]\)）と主成分得点の各係数を座標要素とする3次元空間中の点\([{a_1}\ \ {a_2}\ \ {a_3}]\)を通る直線になります（図\@ref(fig:factor-pca-eigenvector)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-eigenvector} 

}

\caption{固有ベクトルと固有値}(\#fig:factor-pca-eigenvector)
\end{figure}


このとき，この主成分得点の式の係数で表現される\([{a_1\ \ a_2}]\)や\([{a_1\ \ a_2\ \ a_3}]\)は，数学的には分析対象データの相関行列（または分散共分散行列）の*固有ベクトル*と呼ばれるものになります。そして，その固有ベクトルにそった直線上にデータがどれだけ集約できているのか（その軸でどれだけのばらつきを表現できているか）を数値化したものが*固有値*です^[固有ベクトルと固有値についてのこのような説明は，数学的には適切ではないかもしれません。しかし，より正確な説明のためにはベクトルや行列の知識が必要となりますので，ここでは便宜的にこのように説明をしておきます。]。


なお，「Based on parallel analysis」を選択した状態で「**Additional Output**（追加の出力）」にある「Scree plot（スクリープロット）」にチェックを入れると，平行分析におけるランダムなデータと実際のデータの固有値の変化を見ることができます（図\@ref(fig:factor-pca-parallel)）。

<!--  -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-parallel} 

}

\caption{平行分析のスクリープロット}(\#fig:factor-pca-parallel)
\end{figure}


###### Based on eigenvalue：固有値を基準 {-#subsub:factor-pca-component-eigen}

2つ目の「Based on eigenvalue（固有値を基準）」も非常によく用いられる方法です。一般に，この方法では「固有値が1以上」（これは一般に*カイザー基準*と呼ばれます）の主成分を採用します。SASやSPSSなどの統計ソフトでは，この基準が標準として設定されており，分析で算出される*固有値*の値が1を超える主成分の情報のみが結果に表示されます。

主成分分析で主成分の個数を決める基準として用いられるのはデータの*相関行列*についての固有値ですが，この値はその主成分に「変数何個分」の情報が集約されているかという形で解釈することができます。つまり，「固有値1以上」というのは，最低でも変数1個分の情報を持っているような主成分だけを採用するということなのです。この方法を用いる場合には，「Based on eigenvalue」を選択して「Eigenvalues greater than ...（これ以上の固有値）」の数値を「1」に設定します。

###### Fixed number：個数指定 {-#subsub:factor-pca-fixednumber}

それ以外の方法で主成分の個数を判断した場合には，その個数を「Fixed number（個数指定）」に指定することで，指定した個数の主成分を抽出することができます。

固有値の大きさや平行分析以外の方法で主成分の個数を判断するものとしては，たとえば*スクリープロット*と呼ばれる方法があります。

主成分分析の主成分は，最初のものほど固有値が大きく，2番目の主成分，3番目の主成分と，順番が後ろの主成分になるにつれて固有値は小さくなっていきます。そしてこの各主成分の固有値の大きさをグラフに示したものがスクリープロットで，この方法では，グラフ上で固有値の変化が小さくなる手前までの主成分を採用するという方法をとります。

スクリープロットを利用して主成分の個数を判断したい場合には，この「Fixed number」を選択した状態で，「**Additional Output**（追加の出力）」にある「Scree plot（スクリープロット）」にチェックを入れてスクリープロットを作成します（図\@ref(fig:factor-pca-scree)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-scree} 

}

\caption{スクリープロットを用いた判断}(\#fig:factor-pca-scree)
\end{figure}

今回のデータでは，3つ目の主成分以降は固有値の変化がほとんどありませんので，その手前の2つ目までの主成分を採用すると判断するわけです。そして，そのように判断したら，その主成分の個数（「2」）を「Fixed number」の数値入力欄に指定します。

その他の基準としては，「累積寄与率が70〜80%以上」というものもあります。*寄与率*（または*分散説明率*）とは，データ全体のうち，その主成分に集約されている部分の割合のことで，各主成分の寄与率は，その主成分の固有値を分析に使用した変数の個数で割った値になります。この「累積寄与率が70〜80%以上」という基準は，最初の主成分から順に2番目，3番目と主成分の寄与率を合計していき，その合計値が0.7〜0.8以上になるところまでの主成分を採用するという方法です。

この方法を用いる場合には，「**Additional Output**（追加の出力）」にある「Initial eigenvalues（回転前の固有値）」にチェックを入れます（図\@ref(fig:factor-pca-cumulative)）。すると，各主成分の寄与率（分散説明率）と，その主成分およびその手前の主成分の寄与率の合計値（*累積寄与率*）の表が出力されますので，そこから判断した主成分の個数を「Fixed number」の数値入力欄に指定します。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-cumulative} 

}

\caption{累積寄与率を基準とする判断}(\#fig:factor-pca-cumulative)
\end{figure}


なお，これらの基準は，どれも絶対的なものではなく，主成分の適切な個数を判断する際の目安にすぎません。「固有値1以上」という基準では，主成分の個数が多すぎたり少なすぎたりする場合があります。また，分析の目的にもよるでしょうが，「累積寄与率70〜80%以上」という基準では，主成分の数が多くなりすぎる傾向があります。平行分析の場合にも，主成分の個数が少なめに判定されることがあるようです。そのため，これらの基準を参考にしながら，最終的には分析者の判断で適切と考えられる主成分の個数を決定することになります。

なお，今回のサンプルデータの分析では，主成分の個数は平行分析に基づいて決定することにしましょう。ここでは，「**Number of Components**」は，初期設定値の「Based on parallel analysis（平行分析に基づいて決定）」にします。

#### Factor loadings：因子負荷 {-#subsub:factor-pca-loadings}

「**Factor Loadings**（因子負荷）」には，次の2つの項目が含まれています（図\@ref(fig:factor-pca-loadings)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-loadings} 

}

\caption{因子負荷の設定項目}(\#fig:factor-pca-loadings)
\end{figure}

:::{.jmvsettings data-latex=""}
- Hide loadings below ...（これ未満の負荷を隠す）　絶対値の小さい負荷量を非表示にします
- Sort loadings by size（負荷量の順に並び替え）　負荷量の絶対値が大きい順に変数を並び替えて表示します
:::

##### Hide loadings below：小さな負荷量を隠す{-}

1つ目の「Hide loadings below」の項目は，結果の表の中に絶対値が小さな負荷量を表示しないようにするための設定です。分析に使用する変数や主成分の数が多い場合，主成分とほとんど関連がない部分については数値を非表示にしてしまったほうが，主成分と各変数との関係を把握しやすくなります。そのため，jamoviの初期設定では，負荷量の絶対値が0.3未満の場合にその部分が非表示になるように設定されています。

今回の分析結果ではそのような値は1つもありませんでしたが，結果の表の中に数値が表示されていない部分がある場合には，それらの負荷量はここで設定されている基準値よりも小さいということです。

なお，分析の過程では確かに小さい負荷量は非表示のほうが見やすいかもしれませんが，レポートや論文に結果を報告する際には，それら小さな負荷量も含めて報告するほうがよいでしょう。その場合には，「Hide loadings below」の値を「0」にすることですべての負荷量を表示させることができます。

##### Sort loadings by size：負荷量の大きさで並び替え{-}

この項目は，分析に使用した変数を負荷量の大きさの順に並び替えて表示させるかどうかについての設定です。分析に使用する変数が多い場合や，抽出した主成分の個数が多い場合などは，このチェックをオンにしておくと結果が見やすくなります。

今回の分析では，この設定はオフのままにしておきます。



#### Additional Output：追加の出力 {-#sub:factor-pca-additional}

「**Additional Output**（追加の出力）」には，次の4つの項目が含まれています（図\@ref(fig:factor-pca-additional)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-additional} 

}

\caption{追加の出力}(\#fig:factor-pca-additional)
\end{figure}

:::{.jmvsettings data-latex=""}
- Component summary（主成分の要約）　各主成分について要約量を算出します
- Component correlations（主成分の相関）　各主成分の間の相関を算出します
- Initial eigenvalues（回転前の初期値）　回転前の固有値とその寄与率，累積寄与率を算出します
- Scree plot（スクリープロット）　スクリープロットを表示します
:::

##### Component summary：主成分の要約{-}

この項目は，抽出された主成分の固有値や寄与率についての情報を表示させるかどうかの設定です。この設定項目は，主成分に対して回転を行った場合にその回転後の主成分の情報を知りたい場合に使用します。主成分の回転を行わない場合は，この設定で表示される内容は「Initial eigenvalues（回転前の初期値）」の表の一部とまったく同じですので，今回のサンプルデータを用いた分析ではここは設定の必要はありません。

##### Component correlations：主成分の相関{-}

この項目は，主成分の間の相関係数を算出するための設定項目です。主成分に対して回転操作を行った場合には，その回転方法によって主成分の間に相関が見られることがあるのですが，主成分に対して回転を行わない場合，それぞれの主成分は互いに**独立**（相関0）になりますので，今回の分析ではここも設定の必要はありません。

##### Initial eigenvalues：回転前の固有値{-}

主成分の[個数指定](#subsub:factor-pca-fixednumber)のところで説明したように，「Initial eigenvalues（回転前の固有値）」にチェックを入れると，抽出直後の各主成分の固有値と*寄与率*（分散説明率），そしてその主成分までの寄与率の合計（*累積寄与率*）が表示されます。

##### Scree plot：スクリープロット{-}

すでに[平行分析](#subsub:factor-pca-component-parallel)や主成分の[個数指定](#subsub:factor-pca-fixednumber)のところで説明したように，「Scree plot（スクリープロット）」にチェックを入れると固有値の*スクリープロット*
が作成されます。

なお，この「Scree plot」の項目は，「**Number of Components**」で3つのうちのどれが選択されているかによって少しずつ表示が異なります。「**Number of Components**」で「Based on parallel analysis」が選択されている場合には，分析データとランダムなデータについてのスクリープロットが1つのグラフに示されますが，ここが「Based on eigenvalue」になっている場合には，「Eigenvalue greater than」で指定された位置に点線が示されます。また，「**Number of Components**」が「Fixed number」になっている場合には，固有値のみがグラフ上に示されます（図\@ref(fig:factor-pca-scree-plots)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-scree-plots} 

}

\caption{スクリープロットのバリエーション}(\#fig:factor-pca-scree-plots)
\end{figure}



### 分析結果 {#sub:factor-pca-results}

主成分の個数は平行分析を基準に決定し，主成分の回転は行わないという設定で分析をすると，その結果は図\@ref(fig:factor-pca-results)のようになります。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-results} 

}

\caption{主成分分析の結果}(\#fig:factor-pca-results)
\end{figure}

この表の「**Component**」の部分に示されているのは*主成分負荷量*と呼ばれる値で，これは各変数と主成分との間の相関関係を示しています。この値は，その主成分の固有値の平方根と固有ベクトルを掛け合わせることによって求められます。

回転を行わない主成分分析の場合，1つ目の主成分は全体を総合するような（総合得点的な）ものになることが多いのですが，今回の結果でも，第1主成分はどの変数の値とも0.5から0.7程度の正の相関関係にあり，メニュー全体に対する総合的な満足度を反映した軸といえるようなものになっています。つまり，この主成分の得点が高い人ほど全体的に満足度が高く，主成分得点が低い人ほど全体的に満足度が低い傾向にあるということです。

これに対し，第2主成分ではカレーとラーメン，カツ丼に対する負荷量がプラスになっており，それ以外がマイナスであることから，この主成分の得点が高い人ほどカレーやラーメンなどのいわゆる「がっつり」したにメニューに対する満足度が高く，この主成分の得点が低い人ほどパスタやオムライスなどの洋食メニューに対する満足度が高くなく傾向にあることがわかります。このことから，この第2主成分は，がっつり志向かどうかという，志向性の違いを表しているといえるでしょう。

結果の表の「**Uniqueness**（*独自性*）」の部分は，各変数がもつ情報のうち，この2つの主成分に集約しきれなかった情報の割合を示しています。この独自性の値に，たとえば0.8（80%）を超えるようなものが含まれている場合，その変数は主成分に情報がうまく集約できていないことを意味します。今回の分析結果では，どの変数も独自性は0.3前後ですので，2つの主成分に60%から70%程度の情報が集約できていることになります。これは分析結果としては十分な値でしょう。

### 分析の詳細設定 {#sub:factor-pca-details}

基本的な分析が終わりましたので，ここからは主成分分析のその他の設定項目について見ていきましょう。

#### Assumption Check：前提チェック{-#subsub:factor-pca-assumption}

他の分析手法と同様に，主成分分析にも分析のための全体となる条件がいくつか存在します。それらの条件が満たされているかどうかは，「**Assumption Check**（前提チェック）」に含まれる項目を用いて確認できます（図\@ref(fig:factor-pca-assumption)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-assumption} 

}

\caption{前提チェック}(\#fig:factor-pca-assumption)
\end{figure}

:::{.jmvsettings data-latex=""}
- Bartlett's test of sphericity（バートレットの球面性検定）　バートレットの球面性検定を実施します
- KMO measure of sampling adequacy（KMO標本妥当性指標）　標本妥当性指標（MSA）を算出します
:::

##### Bartlett's test of sphericity：バートレットの球面性検定{-}

この項目にチェックを入れると，*バートレットの球面性検定*と呼ばれる検定が実施されます。

主成分分析では，複数の変数で表現されている情報をより少数の主成分に集約するということを行うわけですが，その際，分析に使用する変数が互いにまったく無関係なものであると，それらを集約することができません。そこで，分析に使用するデータの中に主成分分析を適切に行えるだけの関連性が見られるかどうかを確かめるのが，このバートレットの球面性検定です。

この検定のチェックをオンにすると，図\@ref(fig:factor-pca-bartlett)のような結果が得られます。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-bartlett} 

}

\caption{球面性検定の結果}(\#fig:factor-pca-bartlett)
\end{figure}


この検定は，「分析データの相関行列が*単位行列*である」という仮説に対して検定を行っています。単位行列というのは，相関行列の対角（同じ変数同士の相関係数の部分）が1で，それ以外の要素（相関係数）がすべて0である状態です。つまり，この検定結果が有意である場合，「少なくとも1組以上の変数間に0でない相関がある」ということになります。今回の分析データに対する検定結果は有意（p<.001）ですから，分析のための最低限の条件は満たしていることになります。

##### KMO measure of sampling adequacy：KMO標本妥当性指標{-}

「KMO measure of sampling adequacy（KMO標本妥当性指標）」の項目は，カイザー=マイヤー=オルキン（KMO）の標本妥当性指標（*KMO標本妥当性指標*または*KMO指標*）と呼ばれる値の算出を行います（図\@ref(fig:factor-pca-KMO)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-KMO} 

}

\caption{KMO標本妥当性指標}(\#fig:factor-pca-KMO)
\end{figure}

この値は，変数間の相関および偏相関の情報をもとに算出されたもので，分析データに主成分として集約可能な部分がありそうな程度を示しています。この値の大きさについての大まかな目安は表\@ref(tab:factor-pca-KMO-table)のとおりです。

\begin{table}[H]

\caption{(\#tab:factor-pca-KMO-table)KMOの解釈の目安}
\centering
\begin{tabular}[t]{cc}
\toprule
KMOの値 & 解釈\\
\midrule
0.9〜1.0 & 非常に高い\\
0.8〜0.9 & 高い\\
0.7〜0.8 & 許容レベル\\
0.6〜0.7 & 疑わしい\\
0.5〜0.6 & 低い\\
0.0〜0.5 & 著しく低い\\
\bottomrule
\end{tabular}
\end{table}

この値はデータ全体と各変数それぞれについて算出されますが，主成分分析を実施するには，次の表のように全体のKMO指標が0.8以上であることが望ましく，少なくとも0.6以上である必要があるとされます。もし全体指標の値が小さい場合には、個別指標の値が小さな変数を分析から除外するなどの対応をとります。

今回のデータについてのKMO指標は0.69でやや低めですが，分析に適さないというほどではなさそうです。

### Save：保存{#sub:factor-pca-save}

jamoviのバージョン1.8.0からは，分析結果を新たな変数として保存することができるようになりました。これにより，主成分分析では，各対象者について各主成分の主成分得点を算出し，それを別の分析に使用することが可能になっています。

主成分得点の保存はとても簡単で，分析設定画面の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Save}}（保存）を展開して「Component scores（主成分得点）」にチェックを入れてからデータを確認すると，新たに「Score Component 1」と「Score Component 2」という変数が追加されていることがわかります（図\@ref(fig:factor-pca-save)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-save} 

}

\caption{主成分得点の保存}(\#fig:factor-pca-save)
\end{figure}

今回の分析では2つの主成分を採用しましたので，それぞれについて主成分得点が算出されているのです。なお，主成分得点の算出方法は，分析の考え方のところで示した主成分分析の関係式に各回答者の回答値を代入することによって得られる値です。このデータの場合には，関係式は次のようになります。

\[
z = a_1 \times \text{パスタ} + a_2 \times \text{カレー} + \cdots + a_6 \times \text{ドリア}
\]

そして，主成分1と主成分2のそれぞれについてこの式を用いて計算した結果が，各個人の主成分得点ということになります。

なお，この式における\(a_1\)や\(a_2\)は，主成分負荷量ではなく主成分分析で得られる固有ベクトルである点には注意が必要です。jamoviの分析結果では各主成分における固有ベクトルの値は表示されませんが，必要であれば主成分の負荷量を固有値の平方根で割ることによって求めることができます。


### 主成分得点を用いた分析 {#sub:factor-pca-score-analysis}

さて，分析で得た2つの主成分について主成分得点が求まりましたので，これらの値を使ってさらに別の分析を行ってみましょう。このサンプルデータには，食堂で提供されている代表メニューに対する満足度の他に，回答者の性別についての情報も含まれています。そこで，食堂で提供されているメニューに対する全体的な満足度やメニューに対する好みに男女差が見られるかどうかを見てみることにしましょう。

Analysesタブの「\infig{analysis-ttest.pdf} T-Tests（t検定）」から「Independent Samples T-Test（対応なしt検定）」の項目を選択し，設定画面の「Dependent Variables（従属変数）」の欄に先ほど算出した2つの主成分得点を，「Grouping Variable（グループ変数）」の部分に「性別」を設定します（図\@ref(fig:factor-pca-t-test-setting)）。


<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-t-test-setting} 

}

\caption{主成分得点を用いたt検定}(\#fig:factor-pca-t-test-setting)
\end{figure}

また，男児それぞれにおける各主成分得点の平均値を見るために，「**Additional Statistics**（追加の統計量）」の部分で「Descriptives（記述統計）」にもチェックを入れておきましょう（図\@ref(fig:factor-pca-ttest-descriptive)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-ttest-descriptive} 

}

\caption{t検定と同時に記述統計量を算出}(\#fig:factor-pca-ttest-descriptive)
\end{figure}

そして得られた結果が図\@ref(fig:factor-pca-ttest-results)です。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/pca-ttest-results} 

}

\caption{主成分得点のt検定の結果}(\#fig:factor-pca-ttest-results)
\end{figure}

この結果から，主成分1の主成分得点（食堂のメニューに対する全体的な満足度）は男女差が有意ではありませんが，主成分2の主成分得点（がっつり志向）においては男女差が有意になっています。また，算出された記述統計量からは，男性の主成分得点2の平均値は女性よりも高い値となっていますので，男性のほうがラーメンやカレー，カツ丼へといった「がっつり系」メニューへの志向が強く，女性はパスタやオムライス，ドリアなどの洋食メニューへの志向が強いことがわかります。

## Exploratory Factor Analysis：探索的因子分析{#sec:factor-efa}

ここまで見てきた主成分分析は，複数の変数を総合した得点を作成することによってそこに情報を集約し，変数の数を減らすという手法でした。これに対し，因子分析では，複数の変数の背後にある少数の*共通因子*を探し出すことによって，データの構造を単純化し，理解しやすくする方法です。

なお，因子分析は大きく*探索的因子分析*と*確認的因子分析*と呼ばれるものとに分けられますが，「因子分析」とだけいった場合には，一般に探索的因子分析のことを意味します。そこで，まずはこの探索的因子分析について見ていくことにしましょう。

### 考え方{#sub:factor-efa-basics}

ここに，ある高校における学力テスト10教科（国語，英語，日本史，世界史，公民，地理，数学，物理，生物，化学）の成績データがあるとします。このデータを用いて各生徒の学力について分析したいとしましょう。この場合，成績データは10科目分もありますので，なんらかの形でデータの縮約（削減）を行わないと，生徒の学力についての全体像を把握することは困難でしょう。この場合，先ほど説明した主成分分析を用いて，これらの成績を総合した得点を算出するというのも1つの方法ですが，ここでは別の方法を考えてみます。

学校の教科は一般に「文系科目」，「理系科目」などと分類されますが，もしこれらの科目の成績の背後に「文系学力」や「理系学力」のようなものがあり，それらの能力の高さが個別の成績に影響を与えているのだとしたら，そしてそれらの能力の高さをなんらかの形で推定することができるとしたらどうでしょうか。この生徒は文系学力は高いが理系学力がいまいちだ，この生徒は文系学力も理系学力も高い，などのように，よりシンプルな形でそれぞれの学生の学力について検討できるようになるはずです。

たとえば，これら10教科の成績の相関係数が図\@ref(fig:factor-efa-basics)のようなものになっていたとしましょう。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-basics} 

}

\caption{10教科の相関係数の例}(\#fig:factor-efa-basics)
\end{figure}

この相関行列を見ると，国語から公民まではお互いにだいたい0.4から0.6程度の正の相関があり，数学から化学までの間にも互いに0.5から0.7近い正の相関があります。対照的に，国語や英語と数学や物理の間の相関は0.1や0.2と低いものになっています。これらのことから，国語から公民まで，数学から化学までには成績の点から見た場合にある程度の類似性があり，そして国語や英語などの科目と数学や物理などの科目との間にはそうして類似性が見られないということになります。

因子分析では，このような科目成績間の類似性には，その背後になんらかの共通因子の存在があると考えます。ある共通因子が，程度の差こそあれそれぞれの科目に対して影響を与えているのために，これらの点数が似通ってくると考えるわけです。このようにして考えると，国語から公民までの科目の背後，そして数学から化学までの科目の背後に共通する因子が隠れているといえそうです。

なお，このデータはあくまでも「たとえば」の話として示したもので，かなり誇張した値になっています。ですから，科目間の類似性は相関係数を見ただけでもおおよそわかるのでしょう。しかし，実際のデータではここまでわかりやすい形になっていないことがほとんどです。そこで探索的因子分析では，このような複数の変数の背後にある因子を，数学的な手法を用いて見つけ出そうとするのです。

その際，因子分析では各変数（この例の場合は各教科の成績）と各因子の間の関係を式で表すと次のような形になります。

\begin{eqnarray*}
\text{国語の成績} &=& a_1 \times \text{因子}_1 + b_1 \times \text{因子}_2 +\text{独自因子}_\text{国語}\\
\text{英語語の成績} &=& a_2 \times \text{因子}_1 + b_2 \times \text{因子}_2 +\text{独自因子}_\text{英語}\\
\text{日本史の成績} &=& a_3 \times \text{因子}_1 +\cdots
\end{eqnarray*}

主成分分析の場合とよく似ていますが，式の左側は主成分分析の場合のように合成得点ではなく，各教科の成績得点になっています。つまり，共通因子の影響力を合計したものが実際のテスト成績になるという考え方をとるのです。このとき，各因子の前にある\(a_1\)や\(b_1\)はその教科の成績における各因子の影響力の強さを表しており，これは*因子負荷量*と呼ばれます。このような式は，分析に使用する変数（この例では教科）の個数と同じだけ作成されます。

また，式の最後には「\(\text{独自因子}_\text{国語}\)」というような項目があります。これは，共通因子では説明しきれない，その教科独自の部分を表しており，*独自性*と呼ばれます。これに対し，その教科の得点のばらつきのうち，共通因子によって説明される部分は*共通性*と呼ばれます。

このような考え方に基づいて，因子分析では先ほどの関係式でデータをうまく説明できるような因子負荷量を計算していくのですが，先ほどの関係式で分析前に明らかな値は式の左辺にある各教科の成績（これを*観測変数*と呼びます）のみで，それ以外の共通因子や因子負荷量，独自性（独自因子）の大きさはすべて計算によって求める必要があります。さらに，共通因子がいくつあるのかさえ，分析前にはわからないのです。さすがにこのままではなんでもありな状態になってしまい，最適な値を求めようにも求めようがありません。そこで，因子分析では計算になんらかの条件を設けたうえで，その中で最適と考えられる値を算出するという方法がとられます。

そして，その際にどのような計算上の条件を設けたかによって，因子分析の結果は異なってきます。そのため，因子分析の実施にあたっては，分析をソフトウェア任せにするのではなく，分析者自身が分析データや分析目的に合わせて適切な設定を行うことが非常に重要となります。



### 基本手順 {#sub:factor-efa-procedure}

ここからは，次のサンプルデータ（[factor_data03.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/factor_data03.omv)）を用いて探索的因子分析の分析手順についてみていくことにしましょう（図\@ref(fig:factor-data03)）。
<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/data03} 

}

\caption{サンプルデータ}(\#fig:factor-data03)
\end{figure}


このデータには，「オタク傾向」の強さを測定ために作成した9個の質問項目に対する回答データ（いずれも「1:まったくあてはまらない」〜「7:とてもよくあてはまる」の7段階評定）が300人分含まれています。これらの質問への回答から，「オタク傾向」の背後にどのような共通因子がありそうかを探ってみます。


<!-- -->
:::{.jmvvar data-latex=""}
+ `ID`　回答者のID
+ `Q1`　関心がある対象については徹底して調べ尽くすほうだ
+ `Q2`　好きなものを手に入れるためなら手間やお金は惜しまない
+ `Q3`　趣味に関連するアイテムやグッズなどは全部集めたくなる
+ `Q4`　現実の人間よりフィクションのキャラクターのほうがよいと思うことがある
+ `Q5`　人といるより趣味の時間のほうが楽しい
+ `Q6`　人とは直接話すよりオンラインでやりとりするほうがいい
+ `Q7`　熱くなりすぎて周りに引かれることがある
+ `Q8`　趣味について話し出すととまらない
+ `Q9`　熱中しすぎて我を忘れることがある
:::

探索的因子分析の実施には，Analysesタブの「\infig{analysis-factor.pdf}  Factor（因子分析）」から「Exploratory Factor Analysis（探索的因子分析）」を選択します（図\@ref(fig:factor-efa-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-menu} 

}

\caption{探索的因子分析の実行}(\#fig:factor-efa-menu)
\end{figure}

すると，次の設定画面が表示されます。画面の構成は，主成分分析のものと非常によく似ています（図\@ref(fig:factor-efa-setting)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-setting} 

}

\caption{探索的因子分析の設定画面}(\#fig:factor-efa-setting)
\end{figure}

ここで，分析に使用する観測変数（質問）を右側の「Variables（変数）」欄に移動したら基本的な分析設定は終了です（図\@ref(fig:factor-efa-set-var)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-set-var} 

}

\caption{分析する変数を設定}(\#fig:factor-efa-set-var)
\end{figure}

ただし，主成分分析の場合と同様，あるいはそれ以上に，因子分析の結果は分析の設定によって異なります。そのため，分析結果を見る前に，因子分析の各設定項目について説明していきたいと思います。

また，因子分析においてもそれぞれの回答者について*因子得点*を算出することがあるのですが，現在のところ，jamoviの探索的因子分析には因子得点の算出機能はありません。

### Method：方法{-#subsub:factor-efa-method}

データの中から共通因子をとり出すことを因子の**抽出**といいますが，この因子抽出の方法にはさまざまなものがあり，そしてどれを用いるかによって結果が少しずつ変わってきます。また，因子分析の場合，その抽出した因子に対してまず例外なく**回転**と呼ばれる操作が行われます。そして，その回転の方法によっても，分析結果が大きく変わります。

そこで，ここではこれら因子分析の結果に大きく影響するこれらの設定項目について見ていくことにします。

##### Extraction：因子抽出{-#subsub:factor-fa-extraction}

**Method**の「Extraction（因子抽出）」の項目では，因子の抽出方法について設定を行います。今回のサンプルデータの分析では，因子の抽出は初期設定どおり「Minimum residuals（最小残差法）」で行うことにしますが，jamoviで使用可能な因子抽出法には次の3つの選択肢がありますので，ここではそれらについて簡単に説明しておくことにします（図\@ref(fig:factor-efa-extract)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-extract} 

}

\caption{因子抽出法}(\#fig:factor-efa-extract)
\end{figure}

:::{.jmvsettings data-latex=""}
+ Minimum residuals（最小残差法）　最小2乗法を用いて残差が最小となるように因子を抽出します
+ Maximum likelihood（最尤法）　データの分布に多変量正規分布を仮定し，分析データを説明するモデルとしてもっともあり得そうな（最尤な）因子を抽出します
+ Principal axis（主因子法）　主成分分析と同様の計算を繰り返し行い，計算結果を収束させていくことによって因子を抽出します
:::

###### Minimum residuals：最小残差法{-#subsub:factor-fa-extraction-minres}

jamoviで用意されている因子抽出法のうち，「Minimum residuals（*最小残差法*）」は「*重みづけなし最小2乗法*（Ordinary least squares: OLS）」とも呼ばれる手法で，因子分析モデルとデータの間の残差が最小になるような形で因子の抽出を行います。この方法は，標本サイズが小さめのデータなど，比較的どのようなデータに対しても因子をうまく抽出することができるとされている方法です。

###### Maximum likelihood：最尤法{-}

2つ目の「Maximum likelihood（*最尤法*）」は，データの分布に*多変量正規分布*と呼ばれる分布を仮定することによって，その分析データの説明モデルとしてもっともあり得そうな因子を抽出するという方法をとります。近年，多くの研究で用いられるようになった手法であり，数学的にも洗練された方法であるとされますが，計算途中で計算不能になってしまうケースが最小残差法などに比べて多く発生します。また，適切な結果を得るためには十分な標本サイズが必要とされます。

###### Principal axis：主因子法{-}

3つ目の「Principal axis（*主因子法*）」は，主成分分析と同様に相関係数の*固有ベクトル*と**固有値**の計算を行うことによって因子を抽出する方法です。ただし，主成分分析ではこの計算は1度しか行われませんが，主因子法では最初の計算で得られた結果をもとに各変数に対する*共通性*を算出し，その共通性の値を相関行列の対角（同じ変数同士の相関で値がつねに1.0になる部分）をその共通性の値で置き換えたうえで，再度固有ベクトルと固有値の計算を行う，という手順を複数回繰り返します。最終的に，共通性の値の変化があらかじめ設定した基準値より小さくなった（固有値の値が安定した）ところで計算をストップし，その結果を因子として抽出します。

この主因子法は，最小残差法と同様に，比較的どのようなデータであっても因子を抽出できることが知られています。また，比較的計算が単純であるということから，コンピューターの計算能力がそれほど発達していなかった頃によく用いられてきた方法です。

なお，この主因子法で反復計算を行わず，共通性の初期値を1.0にして（つまり相関行列そのままで）固有値の計算を行って因子を抽出する方法は「*主成分法*^[ややこしいですが，この相関行列を用いて反復計算を行わずに因子抽出する場合を「主因子法」と呼び，反復計算を行う場合を「*反復主因子法*」と呼んで区別することもあります。]」と呼ばれ，その結果はjamoviの「Principal Component Analysis（主成分分析）」を用いた場合の分析結果と同じになります。


##### Rotation：回転{-#subsub:factor-fa-rotation}

因子分析の目的は，たくさんの変数の背後にある共通因子を見つけ出し，それらがどのような因子であるかを解釈することにあります。しかし，因子分析の結果は，そのままでは解釈困難なことがほとんどです。そこで，この因子の解釈を容易にするために行われるのが因子の「回転」と呼ばれる操作です。

次の例は，10教科の学力テストデータから因子抽出した場合の結果を図示したものだと考えてください。この図では，各教科に対する因子1の因子負荷量を横軸に，因子2の負荷量を縦軸にとって示したものです。因子分析直後の結果では，この図のようにそれぞれの教科が因子1と2の両方から影響（負荷）を受けていて，この因子1や因子2が何を表す因子なのかがよくわかりません（図\@ref(fig:factor-efa-factor-example)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-example} 

}

\caption{因子抽出直後の状態の例}(\#fig:factor-efa-factor-example)
\end{figure}


しかし，たとえば次の図のように，各教科の相対的な位置関係は保ったままでグラフの軸を回転させると，国語や英語などの教科は横軸の近くに，数学や物理などの教科は他の教科は縦軸の近くに集まるようになります（図\@ref(fig:factor-efa-factor-example2)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-example2} 

}

\caption{因子の回転}(\#fig:factor-efa-factor-example2)
\end{figure}

これであれば，横軸（因子1）は国語や英語，日本史などのいわゆる文系科目に強く関連する因子（文系学力因子）であり，縦軸（因子2）は数学や物理，化学などのいわゆる理系科目に強く関連する因子（理系学力因子）である，というように，容易に解釈することができるようになります。このようにして，分析結果を理解可能な形にすることが因子回転の役目です。

その際，因子分析では，分析結果ができるだけ「*単純構造*」に近くなるようにして因子の回転を行います。単純構造とは，それぞれの変数が複数の共通因子のうちのいずれか1つからのみ影響を強く受けている状態，つまり，先ほどの図でそれぞれの変数がいずれかの軸にできるだけ近くなるような状態のことです。

また，因子の軸を回転させる際，それぞれの軸が直角に交わった状態を維持したままで回転させる方法はとくに*直交回転*と呼ばれます。この直交回転では，それぞれの因子の間の相関は0になります。これに対し，因子の軸が互いに直角であるという条件をおかずに回転させる方法は*斜交回転*と呼ばれます。一般的には，直交回転よりも斜交回転のほうが，単純構造に近い結果が得られやすくなります。

なお，かつては直交回転が一般的でしたが，それは当時のコンピューターの計算能力では計算が複雑になりがちな斜交回転は難しかっかたらというのが大きな理由の1つでした。現在のコンピューターではそのようなことはありませんので，近年は因子が互いに独立であるという強い仮説でもない限り，斜交回転を用いることが一般的になりつつあります。

<!--  -->

因子の回転方法にはじつにさまざまなものがありますが，jamoviではそのうち次の6つが利用できるようになっています。今回のサンプルデータの分析では，因子の回転法についても初期設定どおり「Oblimin（オブリミン法）」で行うことにしますが，以下に各回転方法について簡単に説明を加えておきます（図\@ref(fig:factor-efa-factor-rotation)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-rotation} 

}

\caption{因子の回転方法}(\#fig:factor-efa-factor-rotation)
\end{figure}

:::{.jmvsettings data-latex=""}
+ None（回転なし）
+ Varimax（バリマックス法）
+ Quartimax（クォーティマックス法）
+ Promax（プロマックス法）
+ Oblimin（オブリミン法）
+ Simplimax（シンプリマックス法）
:::

###### None：回転なし{-#fa-efa-rotation-none}
これは因子回転を行わないという設定です。何らかの理由で途中の計算結果を参照したい場合などを除いて，因子分析において回転を「None」にすることはおそらくほとんどないでしょう。

###### Varimax：バリマックス法{-#fa-efa-rotation-varimax}
バリマックス法は*直交回転*におけるもっとも一般的な手法です。この回転方法では，因子ごとに因子負荷量（の2乗）の分散が最大になるように，つまり，ある因子について，特定の変数に対しては負荷量の絶対値が大きく，他の因子に対しては小さくなるようにして因子軸を回転させます。

###### Quatimax：クォーティマックス法{-#fa-efa-rotation-quartimax}
クォーティマックス法も*直交回転*における手法の1つです。この方法では，それぞれの変数に対する各因子の負荷量にメリハリがつくようにして因子の軸を回転させます。この方法は，どの変数に対しても1つ目の因子の負荷量が高くなりがちで，すべての変数に対して影響を与える全般因子的なものが抽出されやすいことが知られています。


###### Promax：プロマックス法{-#fa-efa-rotation-promax}
プロマックス法は*斜交回転*における代表的な手法の1つです。この回転方法では，まずバリマックス回転によって得られた因子負荷を4乗^[統計ソフトによっては，4乗でなく3乗するものもあります。]して因子負荷量のメリハリを強調した状態を作成し，最終的な結果をそれに近づけるようにして因子の回転を行います。

「斜交回転といえばプロマックス法」といえるほどによく使用される回転方法ですが，この方法はあくまでも簡便法であり，適切な結果を得るには別の回転法が望ましいとする考えもあります。


###### Oblimin：オブリミン法{-#fa-efa-rotation-oblimin}

オブリミン法は*斜交回転*における手法の1つです。この方法では，各因子間で因子負荷（の2乗）の共分散が最小になるような形で因子の回転を行います。なお，オブリミン法はいくつかの斜交回転法をひとまとめにした総称で，jamoviの「Oblimin（オブリミン法）」の結果は，そのうちの*クォーティミン法*による回転結果と一致します。


###### Simplimax：シンプリマックス法{-#fa-efa-rotation-simplimax}

シンプリマックス法も*斜交回転*における手法の1つです。この方法では，因子負荷行列（各変数に対する因子負荷量をまとめた表）において「因子負荷が0」である箇所が特定の個数になるように回転させます。「因子負荷が0」である箇所の個数を指定して分析できる統計ソフトもありますが，jamoviで「Simplimax（シンプリマックス法）」による回転を行った場合，「因子負荷量が0」の箇所が分析に使用した変数と同じ個数になるような形で回転が行われます。

#### Number of Factors：因子の個数{-#subsub:factor-efa-number-of-factors}
主成分分析の場合と同様に，因子分析においても計算上は分析に使用する変数と同じ個数だけ因子を抽出することができます。実際の分析では，その中からとくに重要な因子だけをとり出して解釈することになります。因子の個数の決め方はすでに主成分分析のところで説明したのとまったく同じですので，ここでは説明は省略します。

なお，サンプルデータの分析では，因子の個数は平行分析によって決める（Based on parallel analysis）ことにします。その結果，3つの因子が抽出されたはずです。

#### Assumption Checks：前提チェック{-#subsub:factor-efa-assumption-checks}

因子分析の前提についても，設定に含まれている項目やその使用方法，解釈の方法は主成分分析のところで説明したのと同一です。詳細は主成分分析における前提チェックの項目を参照してください。

#### Factor Loadings：因子負荷量{-#subsub:factor-efa-factor-loadings}

因子負荷量の項目についても，設定項目やその使用方法は主成分分析のところで説明したのと同じです。ここでは，結果の解釈をしやすくするために「Sort loadings by size（負荷量の大きさで並び替え）」にチェックを入れておくことにします。

#### Additional Output：追加の出力{-#sub:factor-efa-additional-output}

「**Additional Output**（追加の出力）」には，以下の項目が含まれています（図\@ref(fig:factor-efa-additional-output)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-additional-output} 

}

\caption{追加の出力}(\#fig:factor-efa-additional-output)
\end{figure}

<!-- -->
:::{.jmvsettings data-latex=""}
+ Factor summary（因子の要約）
+ Factor correlations（因子の相関）
+ Model fit measures（モデル適合度指標）
+ Initial eigenvalues（回転前の固有値）
+ Scree plot（スクリープロット）
:::

##### Factor summary：因子の要約{-#subsub:factor-efa-factor-summary} 
最初の「Factor summary（因子の要約）」の項目にチェックを入れると，因子に関する要約情報として図\@ref(fig:factor-efa-factor-summary)のような結果が表示されます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-summary} 

}

\caption{因子の要約}(\#fig:factor-efa-factor-summary)
\end{figure}


このうち，「SS Loadings（負荷量2乗和）」は各因子の因子負荷量の2乗値の合計で，これはその因子で説明できる情報の量を表します。その隣の「% of Variance」は，データ全体の分散のうち，その因子によって説明される情報量の割合（*因子寄与率*），一番右端の「Cumulative %（累積寄与率）」はその因子までの寄与率の合計です。

この表は，因子抽出法を「Minimum residuals（最小残差法）」，因子の回転法を「Oblimin（オブリミン法）」にして分析した結果についての因子の要約ですが，この結果からは，3つの因子がそれぞれ比較的均等な割合でデータを説明できていることがわかります。また，3つの因子による累積寄与率は57.65%で，これら3つの因子でデータ全体の6割近くを説明できていることから十分といえるでしょう。

##### Factor correlations：因子の相関{-#subsub:factor-efa-factor-correlations} 

「Factor correlations（因子の相関）」にチェックを入れると，各因子間の相関係数が図\@ref(fig:factor-efa-factor-correlations)のように相関行列の形で表示されます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-correlations} 

}

\caption{因子の相関}(\#fig:factor-efa-factor-correlations)
\end{figure}


この相関行列から，3つの因子の間には互いに中程度からやや弱めの正の相関があることがわかります。


##### Model fit measures：モデル適合度指標{-#subsub:factor-efa-fit-measures} 

「Model fit measures（モデル適合度指標）」の項目にチェックを入れると，図\@ref(fig:factor-efa-factor-model-fit)のような表が追加で作成されます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-model-fit} 

}

\caption{モデル適合度指標}(\#fig:factor-efa-factor-model-fit)
\end{figure}

この表には，左から順にRMSEA，RMSEAの90%信頼区間，TLI，BIC，モデルに対する$\chi^2$適合度検定の結果が表示されています。

一番左のRMSEA（*近似誤差2乗平均平方根*）は，回帰分析のところで出てきた*誤差2乗平均平方根*（RMSE）（ 第\@ref(ch:regression)章の[Model Fit（モデル適合度）](#sub:regression-LR-modelfit)を参照）の近似値で，この値が小さいほど，分析によって得られた因子モデルとデータのずれ（残差）が小さいことを意味します。一般には，このRMSEAの値が0.05未満の場合にモデルの適合度が良好であるとみなされます。また，RMSEAについては90%（95%ではない点に注意）の信頼区間と合わせて報告されるのが一般的です。


その隣のTLIは*タッカー=ルイス指数*と呼ばれる値で，これは*独立モデル*（因子と各変数の間の関係をまったく考えないモデル）に対して分析モデルのあてはまりがどれだけ改善されているかを示します。一般には，この値が0.95以上である場合にあてはまりがよいとみなされます。

TLIの隣のBIC（*ベイズ情報量規準*）は，回帰分析のモデル適合度のところで説明した値と同じものです。この値はモデルのあてはまりのよさを相対的に示す数値で，この値1つだけでは，モデルが十分に適合しているかどうかの判断はできません。

表の一番右端の「Model Test（モデルの検定）」の部分には，モデルとデータのずれの大きさについての$\chi^2$適合度検定の結果が示されています。この検定は「モデルとデータのずれは0である」という帰無仮説に対するものなので，この検定結果が「有意でない」ことが望ましいといえます。ただし，この$\chi^2$の値は標本サイズが大きいほど，また分析に使用する変数の個数が多いほど有意になりやすい傾向にあるため，この検定結果が有意だったからといって，必ずしもモデルがデータに適合していないというわけではありません。

今回のサンプルデータの分析結果では，RMSEAは0.01と非常に小さく，TLIは1.00，$\chi^2$検定の結果も有意ではありませんので，モデルの適合度は十分なと考えてよいでしょう。

##### Initial eigenvalues：回転前の固有値{-#subsub:factor-efa-initial-eigenvalues} 

この設定項目にチェックを入れると，因子回転前の固有値に関する情報が表示されます。この設定項目で表示される内容は主成分分析の場合と同じですので，説明は省略します。

##### Scree plot：スクリープロット{-#subsub:factor-efa-scree-plot}

スクリープロットについても主成分分析の場合と同じですので説明は省略します。


### 分析結果{#sub:factor-efa-results}

サンプルデータについて，「Minimum residuals（最小残差法）」で3因子（因子数は平行分析で決定）を抽出し，「Oblimin（オブリミン法）」で回転した結果は図\@ref(fig:factor-efa-factor-results)のとおりです。なお，結果の表示については**Factor Loadings**（因子負荷量）の設定項目で「Sort loadings by size（負荷量の大きさで並び替え）」にチェックを入れて変数の表示順序を因子負荷量の大きさ順に並び替えてあります。

また，因子間の相関係数についても，**Additional Output**（追加の出力）で「Factor correlations（因子相関）」にチェックを入れて算出してあります。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/efa-factor-results} 

}

\caption{探索的因子分析の結果}(\#fig:factor-efa-factor-results)
\end{figure}

この結果の表には，それぞれの質問項目に対する各因子の負荷量と，各質問項目の独自性（Uniqueness）の値が示されています。このようにして各変数に対する因子負荷をまとめたものは*因子パターン行列*と呼ばれます。因子の回転を行わない場合や直交回転を用いた場合には，これらの値は因子と各変数の間の相関係数と同じになりますが，斜交回転の場合にはそうではありませんので，その点には注意が必要です。

では，分析結果を見てみましょう。まず，どの質問項目においても独自性（Uniqueness）が極端に高いことはありませんので，これらの質問への回答は抽出した共通因子で説明できていると考えてよさそうです。もし，分析の結果において独自性が0.8を上回るような質問項目（観測変数）があった場合には，それらは分析から除外したほうがよいでしょう。

また，この表では因子負荷量の絶対値が0.3未満のものは非表示になっています。このようにしてみると，`Q7`から`Q9`は因子1のみから強い負荷を，`Q4`から`Q6`は因子2のみから強い負荷を受けているというように，この分析結果が*単純構造*に近いものになっていることがよくわかります。

今回の分析ではそのような質問項目（観測変数）はありませんでしたが，もし，単純構造を乱すような観測変数，つまり複数の因子の負荷が高い変数が含まれている場合には，それらを分析から除外して再分析することもありますし，分析の目的によっては，そのような変数をそのままにしておく場合もあります。ただし，そのように複数の因子にまたがる変数が多数あるような場合には，分析結果の解釈には注意が必要です。

なお，分析結果を解釈する際には，このように絶対値の小さい負荷量は非表示にしたほうが単純構造に何ているかどうかの確認がしやすいのですが，論文やレポートに結果を報告する際には，設定画面の**Factor Loadings**（因子負荷量）の「Hide loadings below ...（これ未満の負荷を隠す）」に0を入力し，すべての負荷量を表示されるようにしたほうがよいでしょう。


#### 因子の解釈{-#subsub:factor-efa-factor-interpretation}

因子分析では，分析によって抽出された因子をどのように**解釈**できるかということも，分析における重要な関心の1つです。因子の解釈とは，それぞれの共通因子が一体何を意味するものなのかがわかるように，因子にわかりやすく簡潔な名前をつけることをいいます。

たとえば，この分析結果では，因子1は「Q8」，「Q9」，「Q7」の3つの質問に高い負荷を持っていますが，これらの質問は次のとおりの内容でした。

:::{.jmvorange data-latex=""}
+ Q7　熱くなりすぎて周りに引かれることがある
+ Q8　趣味について話し出すととまらない
+ Q9　熱中しすぎて我を忘れることがある
:::

これらの質問内容を見ると，いずれも「熱くなる」部分で共通しているようです。ですので，この因子を「熱中傾向」と名づけることにしましょう。

このように，各因子が高い負荷をもつ観測変数にどのような共通点があるのかを見ながら，因子に名前をつけていくのが因子の解釈です。

同様にして因子2，因子3についても解釈してみましょう。因子2は「Q4」から「Q6」に高い負荷を持っています。

:::{.jmvorange data-latex=""}
+ Q4　現実の人間よりフィクションのキャラクターのほうがよいと思うことがある
+ Q5　人といるより趣味の時間のほうが楽しい
+ Q6　人とは直接話すよりオンラインでやりとりするほうがいい
:::

これらの質問内容は，いずれも人と接することを好まない傾向を示していますので，「非社交性」などと解釈するのが適当でしょう。

また，因子3は「Q1」から「Q3」に高い負荷を持っています。

:::{.jmvorange data-latex=""}
+ Q1　関心がある対象については徹底して調べ尽くすほうだ
+ Q2　好きなものを手に入れるためなら手間やお金は惜しまない
+ Q3　趣味に関連するアイテムやグッズなどは全部集めたくなる
:::

これらの質問内容は，いずれもモノや情報を徹底して集めたいという部分で共通点が見られますので，ここではこれを「収集欲求」と名づけることにしましょう。

このようにして因子を解釈すると，「オタク傾向」には大きく「熱中傾向」，「非社交性」，「収集欲求」が関連しているということがわかります。また，これらの3因子の間には3.35から0.48の中程度の正の相関がありますので，熱中傾向が強い人ほど非社交的で収集欲求も強い傾向にあるということがわかります。このように，因子分析によってたくさんの変数を共通因子に還元することによって，データ全体を非常に簡潔に説明できるようになるのです。



## Confirmatory Factor Analysis：確認的因子分析{#sec:factor-cfa}

探索的因子分析によって得られる因子は，あくまでも分析に使用したデータに基づくものであって，それが普遍的な真実であるというわけではない点には注意が必要です。探索的因子分析の結果というのは一般に不安定なことが多く，分析に使用する変数が増えたり減ったりした場合や，別の集団を対象とした調査結果を分析した場合などには，抽出される因子の結果が変わることもよくあるのです。

となると，分析で得られた因子モデルの正しさを別のデータで確かめたい，という考えが当然ながら生じてくるでしょう。ではその場合，新たに収集したデータを用いて探索的因子分析を行えばいいかというとそうではありません。探索的因子分析は，その分析データをもっともうまく説明できると考えられる因子を探索的に抽出する方法であって，因子モデルが正しいかどうかを確かめるための方法ではないからです。

そして，このようにすでにある因子モデルが別のデータにおいてもあてはまるかどうかを確かめたい場合に使用されるのが，*確認的因子分析*と呼ばれる分析手法です。

### 考え方{#sub:factor-cfa-basics}

ここでは，先ほどの探索的因子分析で用いたサンプルデータ（オタク傾向）の分析結果をもとに，確認的因子分析の考え方を見ていきましょう。先ほどの分析では，9つの質問への回答の背後に3つの共通因子が推定されました。そして，9つの質問のうち，Q1からQ3は「収集欲求」因子のみの負荷が高く，Q4からQ6は「非社交性」因子，Q7からQ9は「熱中傾向」因子のみの負荷が高いというように，各質問への回答には3つの因子のうちいずれか1つのみが強く影響している単純構造にあることが示されました。

そして，このような構造が，海外のオタクにおいてもあてはまるといえるかどうかを知りたいとしましょう。そこで，前回の調査で使用した9つの質問を英訳し，英語圏に住む成人400名を対象に調査を実施しました。その結果がこのサンプルデータ（[factor_data04.omv](https://github.com/sbtseiji/jmv_compguide/raw/main/data/omv/factor_data04.omv)）に入力されています（図\@ref(fig:factor-data04)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/data04} 

}

\caption{サンプルデータ}(\#fig:factor-data04)
\end{figure}

<!-- -->

:::{.jmvvar data-latex=""}
+ `ID`　回答者のID
+ `Q1`　I'm a thorough researcher when it comes to a subject I'm interested in.
+ `Q2`　I'm willing to spend a lot of time and money to get what I want.
+ `Q3`　I want to collect all the items and goods related to my hobby.
+ `Q4`　Sometimes I think fictional characters are better than real people.
+ `Q5`　I enjoy my hobbies more than being with people.
+ `Q6`　It's better to communicate with people online than in person.
+ `Q7`　Sometimes I get too enthusiastic and stun the people around me.
+ `Q8`　I can't stop talking about my hobbies.
+ `Q9`　Sometimes I get so absorbed that I lose control of myself.
:::

このデータを先ほどの因子モデルでうまく説明できるかどうかを見るためには，まず分析に使用する因子モデルをはっきりさせておく必要があります。

前回の因子分析結果を単純な模式図として示すと図\@ref(fig:factor-cfa-model1)のようになります。まず，「Q1」から「Q3」は「収集欲求」因子の影響を強く受けていました。他の2つの因子からもわずかに影響を受けていましたが，それらは非常に弱いので，ここでは省略します。

<!-- -->


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-model1} 

}

\caption{収集欲求因子と観測変数の関係}(\#fig:factor-cfa-model1)
\end{figure}


この図では，因子を楕円で，各観測変数（質問への回答データ）を四角で示しています。因子と各変数は線（*パス*）で繋がれており，このパスは観測変数のほうに向かう矢印の形になっています。この矢印の向きは，変数間の影響の向きを表しています。因子分析の考え方では，各観測変数に対して因子が影響を及ぼしていると考えますので，矢印は因子から各観測変数に向かう形になるのです。

同様に，「Q4」から「Q6」は「非社交性」因子，「Q7」から「Q9」は「熱中傾向」因子の影響を強く受けていました（図\@ref(fig:factor-cfa-model2)）。

<!-- -->

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-model2} 

}

\caption{非社交性因子，熱中傾向因子と観測変数の関係}(\#fig:factor-cfa-model2)
\end{figure}

また，これらの因子の間には，中程度からやや弱目の相関関係がありました。相関関係はお互いに関連があるということなので，ここではパスを両矢印で示します（図\@ref(fig:factor-cfa-model3)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-model3} 

}

\caption{共通因子間の関係}(\#fig:factor-cfa-model3)
\end{figure}

このようにして因子間と観測変数間の関係を図示したものは*パス図*と呼ばれます。このパス図は先ほどの因子分析結果を単純化して示したものですが，これが確認的因子分析において使用される分析モデルになるのです。確認的因子分析では，このような単純化された因子モデルを用いて，このモデルでデータをうまく説明できるかどうかを確かめます。

### 分析手順{#sub:factor-cfa-procedure}

確認的因子分析は，一般に高価な専用ソフトウェアを使用するか，分析モデルをコンピュータープログラムのような形で書き表して実行するような形でしか利用できない場合がほとんどですが，jamoviではこれを驚くほど簡単に実行することができます。

jamoviで確認的因子分析を実行するには，Analysesタブの「\infig{analysis-factor.pdf}  Factor（因子分析）」から「Confirmatory Factor Analysis（確認的因子分析）」を選択します（図\@ref(fig:factor-cfa-menu)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-menu} 

}

\caption{確認的因子分析の実行}(\#fig:factor-cfa-menu)
\end{figure}

すると，次の設定画面が表示されます（図\@ref(fig:factor-cfa-setting)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-setting} 

}

\caption{確認的因子分析の設定画面}(\#fig:factor-cfa-setting)
\end{figure}

この画面右側の「Factors（因子）」の部分に，分析モデルにそって変数を設定します。

初期状態では，「Factors」の部分には「Factor 1」しかありませんが，その下にある「+ Add New Factor（新しい因子を追加）」をクリックすると，因子を追加することができます。今回の分析モデルには3つの因子がありますので，\colorbox{ao}{\textcolor{white}{+ Add New Factor}}を2回クリックして因子を2つ追加します（図\@ref(fig:factor-cfa-add-factors)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-add-factors} 

}

\caption{因子を2つ追加}(\#fig:factor-cfa-add-factors)
\end{figure}


次に，作成した因子の名前を設定します。因子の名前は「Factor 1」や「Factor 2」のままでも計算上は問題ありませんが，結果を見間違えたりしないよう，きちんと因子名を設定しておいたほうがよいでしょう。ここでは，「Factor 1」を「収集」，「Factor 2」を「非社交」，「Factor 3」を「熱中」としておきます（図\@ref(fig:factor-cfa-rename-factors)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-rename-factors} 

}

\caption{因子の名前を変更}(\#fig:factor-cfa-rename-factors)
\end{figure}

因子名の設定が終わったら，それぞれの因子に関連する変数を指定していきます。まず，「収集」因子の負荷が高いと考えられるのは「Q1」，「Q2」，「Q3」の3つですので，この3つを「収集」の「drag variables here（ここに変数をドラッグ）」の部分にマウスでドラッグして移動します（図\@ref(fig:factor-cfa-set-vars)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-set-vars} 

}

\caption{因子1に変数を設定}(\#fig:factor-cfa-set-vars)
\end{figure}

同様にして，「非社交」と「熱中」因子も変数を指定します（図\@ref(fig:factor-cfa-set-vars2)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-set-vars2} 

}

\caption{すべての因子に変数を設定}(\#fig:factor-cfa-set-vars2)
\end{figure}

基本的な分析設定はこれでおしまいです。

### 分析結果 {#sub:factor-cfa-results}

それでは分析結果について見てみましょう。基本設定による分析では，図\@ref(fig:factor-cfa-results)のような結果が表示されます。いろいろな値が表示されているので，1つ1つ見ていきましょう。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-results} 

}

\caption{確認的因子分析の結果}(\#fig:factor-cfa-results)
\end{figure}

1つ目の「Factor Loadings（因子負荷量）」の表には，それぞれの因子から観測変数（各質問）への負荷量の推定値（**Estimate**），標準誤差（**SE**），標準得点（**Z**），有意確率（**p**）が示されています。この結果では，すべての値で負荷量の推定値が1を超えていますが，これは分析結果に問題があるわけではなく，この負荷量の値が標準化されていないものだからです。

この結果では，それぞれの因子負荷量について「因子負荷が0である」という帰無仮説を用いた検定の結果が示されており，いずれの検定も有意確率（p）は「<.001」で有意になっています。

2つ目の「Factor Covariances（因子共分散）」の表には，「Estimate（推定値）」の部分に因子の分散および因子間の共分散の値が示されています。なお，この表では各因子の分散は1.00に固定されており，この表に示されているのは因子間の相関係数になっています。各因子間の相関係数についても，因子負荷と同様に標準誤差（SE）と標準得点（Z），有意確率（p）の値が示されており，それぞれの有意性検定（帰無仮説：相関係数は0である）の結果を見ることができます。

3つ目と4つ目の表には，この分析モデルのデータへの適合度に関する情報が表示されています。3つ目の表はモデルとデータのずれの大きさについての検定で，これは探索的因子分析の「[Model fit measures（モデル適合度指標）](#subsub:factor-efa-fit-measures)」の部分で説明したものと同じです。この検定では$\chi^2$が小さく，検定結果が有意でないことが望ましい結果です。今回の分析結果では有意確率p=0.492で検定結果は有意ではありませんので，分析モデルとデータのずれは0でないといえるほど大きなものでない（ずれは小さい）といえます。

その下の「Fit Measures（適合度指標）」には，モデルのデータの適合度に関する代表的な指標が示されています（図\@ref(fig:factor-cfa-results2)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-results2} 

}

\caption{適合度関連の結果}(\#fig:factor-cfa-results2)
\end{figure}


この表に示されている値のうち，2つ目のTLIと3つ目のRMSEAについては，探索的因子分析の[適合度指標](#subsub:factor-efa-fit-measures)のところで説明したものと同じです。

表の1つ目のCFI（*比較適合度指標*）は，TLIと同様に*独立モデル*（因子と各変数の間の関係をまったく考えないモデル）に比べてどの程度あてはまりが改善しているかを0から1までの数値になるようにして算出した値で，この値が1に近いほどモデルがデータにうまくあてはまっていることを意味します。一般に，この値が0.90または0.95以上である場合に適合度が高いとみなされます。

この分析結果では，適合度指標はCFI=1.00，TLI=1.00，RMSEA=0.00 [0.00-0.04]で，いずれも適合のよさを示しています。したがって，今回の外国人を対象としたデータの場合にも，前回の分析結果で得られた3つの共通因子でうまく説明ができる，つまり，外国人の場合にも日本人と同じオタク傾向の3因子モデルがあてはまるということになります。


では，ここからは分析の詳細設定について見ていきましょう。以下の設定を適切に使用することで，分析結果についてのより詳しい情報が得られます。

### Residual Covariances：残差共分散{#sub:factor-cfa-residual-covariances}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Residual Covariances}}（残差共分散）の設定項目は，因子によって説明しきれない残差（独自因子）の間で共分散（または相関係数）を算出したい場合に使用します。この項目を展開すると、図\@ref(fig:factor-cfa-residual-covariance)のような画面が表示されます。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-residual-covariance} 

}

\caption{残差共分散の設定}(\#fig:factor-cfa-residual-covariance)
\end{figure}


この*残差共分散*（*誤差共分散*とも呼ばれます）を算出するには，ここで残差の共分散を算出したい変数のペアを選択し，それを右側の「Residual Covariances（残差共分散）」の欄に移動します。なお，「\infig{analysis-regression.pdf} Regression（回帰分析）」メニューの「Correlation Matrix（相関行列）」で相関係数を算出する場合とは異なり，ここでは共分散を算出させたい変数のペアを個別に指定する必要があります（図\@ref(fig:factor-cfa-residual-covariance2)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-residual-covariance2} 

}

\caption{残差共分散の設定の例}(\#fig:factor-cfa-residual-covariance2)
\end{figure}


残差共分散を算出するのはモデルの適合度を向上させるためであることがほとんどだと思われますが，残差共分散は因子で説明しきれない部分における変数間の関係であるため，残差共分散を多数算出する必要がある場合には，必要な因子がモデルの中に組み込まれていないなど，想定する因子モデルに問題がある可能性があります。

### Options：オプション{#sub:factor-cfa-options}
\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Options}}（オプション）では，分析における欠損値の扱いと，計算上の制約条件についての設定を行います（図\@ref(fig:factor-cfa-option)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-option} 

}

\caption{Options（オプション）の設定}(\#fig:factor-cfa-option)
\end{figure}


:::{.jmvsettings data-latex=""}
+ **Mission Values Method**（欠損値の処理方法）
  - Full information maximum likelihood（完全情報最尤推定法）　他の測定値から欠損値を推定した上で分析します
  - Exclude cases listwise（データ行ごと除外）　欠損値が含まれるデータ行全体を分析から除外します
+ **Constraints**（制約）
  - Factor variances = 1（因子の分散を1に固定）　因子の分散を1に固定した場合の計算結果を表示します
  - Scale factor = scale first indicator（最初の変数の係数を基準として使用）　各因子の最初の変数の係数を1に固定した場合の計算結果を表示します
:::

#### 欠損値の処理方法{-#subsub:factor-cfa-missing}

今回のサンプルデータには含まれていませんが，分析データに**欠損値**（データが欠落している部分）がある場合，その欠損値をどのように扱うかによって分析結果に影響が生じます。jamoviの確認的因子分析では，分析データに欠損値が含まれている場合，その値を*完全情報最尤推定法*と呼ばれる方法によって他のデータ値から推定し，その値を欠損部分に代入することによって分析を行います。

欠損値に対して推定値を代入せず，欠損のままにしておきたい場合には，「Exclude cases listwise（データ行ごと除外）」に設定を変更してください。完全情報最尤推定法による補完を行うのと，欠損がある場合にデータ行ごと分析から除外するのとでどちらがよいかは一概にはいえませんが，近年，とくに確認的因子分析においては，完全情報最尤推定法など，何らかの形で欠損値を補完して分析することが多いようです。

#### 推定における制約{-#subsub:factor-cfa-constraints}

探索的因子分析でも，何らかの形で計算のための条件や前提を設定しないことには計算結果が1つに定まらなかったのと同様に，確認的因子分析でもまったくの条件なしにはモデルに関する推定ができません。

計算結果を収束させるために，確認的因子分析では「因子の分散を1」に固定するか，「各因子の最初の係数（負荷量）を1」にするか，いずれかの方法で計算を行います。jamoviの分析設定では，ここは「Factor variances = 1（因子の分散を1に固定）」が初期設定値になっています。その場合，当然ですが表示される計算結果ではすべての因子で分散が1になります。

もし因子の分散という情報が分析上重要である場合には，「Scale factor = scale first indicator（最初の変数の係数を基準として使用）」に設定して計算を行うことになるでしょう。その場合，各因子の分散の値は算出されますが，各因子の最初の変数では，その係数（因子負荷量）はすべて1になります。

なお，分析結果として標準化された推定値（**標準化推定値**）を使用する場合には，どちらの場合も最終的な計算結果は同じになります。

### Estimates：推定値{#sub:factor-cfa-estimates}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimates}}（推定値）では，因子や残差の推定値に関する設定を行います（図\@ref(fig:factor-cfa-estimates)）。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-estimates} 

}

\caption{Estimates（推定値）の設定}(\#fig:factor-cfa-estimates)
\end{figure}

<!-- -->

:::{.jmvsettings data-latex=""}
+ **Results**（結果）
  - Factor covariances（因子共分散）　因子の分散，および因子間の共分散または相関係数を算出します
  - Factor intercepts（因子切片）　因子の切片についての推定量を算出します
  - Residual covariances（残差共分散）　残差の分散，および指定した変数間での残差の共分散，または相関係数を算出します
  - Factor intercepts（残差切片）　残差の切片についての推定量を算出します
+ **Statistics**（統計量）
  - Test statistics（検定統計量）　推定した各係数についての有意性検定の結果を表示します
  - Confidence interval（信頼区間）　各係数について，信頼区間の算出を行います
  - Standardized estimate（標準化推定値）　各係数について，標準化された値を算出します
:::

#### Results：結果 {-#subsub:factor-cfa-covariances}

この画面の**Results**（結果）の部分では，因子と各観測変数の残差の分散・共分散と切片の算出結果を表示するかどうかについての設定を行います。

この設定で「Factor covariances（因子共分散）」にチェックを入れた場合には，各因子の分散と，因子間の共分散または相関係数が表示されます。このとき，先ほどの［Options（オプション）］のところで推定のための制約を「Factor variances = 1（因子の分散を1に固定）」に設定した場合には，結果に表示される値は各因子の分散（すべて1.00で固定）と，因子間の相関係数になります。これに対し，制約条件を「Scale factor = scale first indicator（最初の変数の係数を基準として使用）」に設定した場合には，結果の表には各因子の分散と因子間の共分散の値が表示されます。

その下の「Factor intercepts（因子切片）」の部分にチェックを入れると，**因子の切片**（因子の平均値）についての情報が表示されるのですが，jamoviの現在のバージョンでは確認的因子分析で複数グループのデータを同時に分析するといったことはできませんので，この値はいずれの因子においても1.00で固定になります。そのため，この項目については現在のところ使い道はありません。

3つ目の「Residual covariances（残差共分散）」の項目にチェックを入れると，各観測変数の残差の分散が表示されます。また，\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Residual Covariances}}（残差共分散）の設定で共分散を算出するように設定した場合には，設定した観測変数のペアについて，算出された共分散の値が表示されます。

一番下の「Residual intercepts（残差切片）」の部分にチェックを入れると**残差の切片**についての情報が表示されるのですが，その推定値および標準誤差は，どのような場合にもすべて観測変数の平均値と標準誤差の値に等しくなります（図\@ref(fig:factor-cfa-estimates-results)）。そのため，この項目についても今のところ使い道はなさそうです。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-estimates-results} 

}

\caption{各設定項目の出力結果の例}(\#fig:factor-cfa-estimates-results)
\end{figure}



#### Statistics：統計量 {-#subsub:factor-cfa-statistics}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Estimates}}（推定値）右側の**Statistics**（統計量）の部分では，係数の推定に関する設定を行うことができます。1つ目の「Test statistics（検定統計量）」にチェックを入れると，算出した係数（分散や共分散も含む）の推定値について，その係数が0でないかどうかの有意性検定の結果が表示されます。確認的因子分析では，いずれの係数についても標準得点zを用いた検定が行われます。

2つ目の「Confidence interval（信頼区間）」にチェックを入れると，それぞれの係数について指定した幅の信頼区間が表示されます。


3つ目の「Standardized estimate（標準化推定値）」にチェックを入れると，各係数を標準化した値が表示されます。この標準化推定値の値は，［Options（オプション）］のところで計算上の制約として「Factor variances = 1（因子の分散を1に固定）」を選択した場合にも「Scale factor = scale first indicator（最初の変数の係数を基準として使用）」を選択した場合にも同じになります（図\@ref(fig:factor-cfa-standardized)）。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-standardized} 

}

\caption{標準化推定値}(\#fig:factor-cfa-standardized)
\end{figure}


心理学の研究論文では，確認的因子分析の結果を報告する際にはこの標準化推定値を用いることが多いようです。考え方説明のところで用いた因子モデルの図に標準化推定値を示すと，分析結果は図\@ref(fig:factor-cfa-result-model)のようになります。


\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-result-model} 

}

\caption{分析結果のパス図}(\#fig:factor-cfa-result-model)
\end{figure}



### Model Fit：モデル適合度{#sub:factor-cfa-model-fit}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（モデル適合度）では，モデル全体の適合度に関する情報の設定を行います（図\@ref(fig:factor-cfa-model-fit)）。

\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-model-fit} 

}

\caption{モデル適合度の設定項目}(\#fig:factor-cfa-model-fit)
\end{figure}


:::{.jmvsettings data-latex=""}
+ **Test for Exact Fit**（適合度検定）
  - $\chi^2$ test（$\chi^2$検定）　モデル適合度についての$\chi^2$検定の結果を表示します
+ **Fit Measures**（適合度指標）
  - CFI（比較適合度指標）　モデルのあてはまりのよさについての指標を示します
  - TLI（タッカー=ルイス指数）　モデルのあてはまりのよさについての指標を示します
  - SRMR（標準化残差2乗平均平方根）　モデルの残差の大きさについての指標を示します
  - RMSEA（近似誤差2乗平均平方根）　モデル残差の大きさについての指標を示します
  - AIC（赤池情報量規準）　モデル残差の相対的な大きさについての情報を示します
  - BIC（ベイズ情報量規準）　モデル残差の相対的な大きさについての情報を示します
:::

#### Test for Exact Fit：適合度検定{-}

画面左側の「**Test for Exact Fit**（適合度検定）」の部分では，モデルの適合度に関して$\chi^2$検定を行うかどうかを設定できます。この検定では，「このモデルはデータがもつ情報を完全に説明できている（モデルによる残差が0である）」が帰無仮説ですので，この検定結果は有意にならない（pが0.05より大きい）ことが望ましいという点に注意してください。

今回のサンプルデータでは\(\chi^2(\textsf{21})=\textsf{17.37}\)で，有意確率p=0.688ですから，検定結果は有意ではありません。したがって，分析モデルでデータをうまく説明できている（モデルとデータのずれは大きくない）といえます。

なお，探索的因子分析のところでも説明しましたが，この$\chi^2$検定の結果は分析に使用する観測変数がたくさんある場合や標本サイズが大きい場合には有意になりやすい傾向があります。そのため，この検定結果が有意になっていたらだめだというわけでは必ずしもありません。モデルの適合度は，他の適合度指標と合わせて総合的に判断します。

#### Fit Measures：適合度指標{-}

画面右側の**Fit Measures**（適合度指標）の部分では，適合度指標として表示させる値を選択します。

##### CFI，TLI {-}

CFIとTLIについては，すでに探索的因子分析のところで説明しました。これらの値は，分析モデルの適合度が独立モデル（因子と観測変数がまったく無関係なモデル）に比べてどれだけ改善したかを示す値で，この値が1に近いほどあてはまりがよいことを意味します。一般には，0.9以上あるいは0.95以上の場合にあてはまりが良好であるとみなされます。

##### SRMR，RMSEA {-}

SRMRとRMSEAは残差の大きさに関する指標で，これらは0に近いほどよいということになります。RMSEAについては探索的因子分析のところで説明したとおりです。SRMRは，データから求められる共分散と推定モデルの共分散の差をもとに算出されます。これらの指標は，いずれの場合も算出した結果が0.05未満である場合にあてはまりが良好であるとみなすのが一般的です。

##### AIC，BIC {-}

AICとBICについては，回帰分析の\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Model Fit}}（[モデル適合度](#sub:regression-LR-modelfit)
）のところで説明したとおりです。これらはモデルの残差の大きさを表す値ですが，この値未満であればよいというようなものではなく，複数のモデル候補の間で相対的にあてはまりのよさを判断するための指標です。いくつかのモデル候補がある場合には，その中でこれらの値がもっとも小さくなるモデルを選択するのが一般的です。

このように，確認的因子分析ではさまざまなモデル適合度指標を算出することができるのですが，逆にいえばこれは，この値さえ求めておけばよいというような定番の指標がないということでもあります。研究論文でも，モデル適合度の指標として$\chi^2$検定の結果，あてはまりのよさの指標（CFIやTLI）を1つ以上，残差の大きさの指標（SRMRやRMSEA）を1つ以上の3種類の指標をセットで報告するのが一般的です。

また，適合度指標としてどれを報告するかには流行（？）のようなものもあり，あてはまりのよさの指標として少し前まではGFIとAGFIという指標が報告されることが多かったのですが，近年ではそうでもないようです。少なくとも，それらの指標はjamoviのオプションには含まれていません。

### Additional Output：追加の出力{#sub:factor-cfa-additional-output}

\colorbox{bar}{\raisebox{-.25\zh}{\includegraphics[height=1\zh]{images/assets/modules-analyses-arrow-r}}\textcolor{gmoji2}{| Additional Output}}（追加の出力）では，分析結果に基づいてモデルの適合度を向上させるための参考指標などについて設定することができます（図\@ref(fig:factor-cfa-additional)）。



\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-additional} 

}

\caption{追加の出力に関する設定項目}(\#fig:factor-cfa-additional)
\end{figure}

:::{.jmvsettings data-latex=""}
+ **Post-Hoc ModelPerformance**（モデルの事後修正）
  - Residuals observed correlation matrix（相関行列の残差）　モデルから算出される相関係数とデータから算出される相関係数の残差を求めます
  - Modification indices（修正指数）　モデル適合度の向上につながりそうな修正候補を指数として示します

+ **Plots**（作図）
  - Path diagram（パス図）　モデルのパス図を作成します
:::

#### Post-Hoc Model Performance：モデルの事後修正 {-#subsub:factor-cfa-posthoc}

今回のサンプルデータではモデルに十分な適合度がありましたが，実際の分析場面では適合度が十分とはいえない結果になる場合もあるでしょう。その場合，モデルのどの部分に問題があるのかを調べることで，モデルの適合度を向上させられることがあります。

##### Residuals observed correlation matrix：相関行列の残差{-}

そのための参考指標の1つが，モデルから算出される観測変数間の相関係数と，実際のデータにおける観測変数間の相関係数の間の残差です。相関係数の残差を算出するには，「Residuals observed correlation matrix（相関行列の残差）」の部分にチェックを入れます。またその際，「Highlight values above...（これより大きな値を強調）」に指定されている数値より大きな絶対値の部分が赤色の文字で強調表示されます（図\@ref(fig:factor-cfa-residual-correlation)）。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-residual-correlation} 

}

\caption{相関行列の残差}(\#fig:factor-cfa-residual-correlation)
\end{figure}


この相関係数の残差に大きな値（たとえば0.1を超えるようなもの）がある場合には，分析モデルではその関係がうまく説明できていないということになります。そうした部分が特定の変数（表の列または行）に集中しているようであれば，その変数を分析から除外してみたり，モデルにおけるその変数の扱いを修正したりすることによってモデルの適合度が向上するかもしれません。

##### Modification indices：修正指標{-}

また，「Modification indices（修正指数）」にチェックを入れると，分析に使用したモデルには含まれていない関係（パス）について，それらを加えたときにモデル適合度がどの程度向上するかを示す*修正指数*が算出されます。jamoviの初期設定では，この修正指数が3を超える部分が赤色で強調されるようになっていますが，この値は「Highlight values above...（これより大きな値を強調）」の数値を指定することによって変更可能です。

今回の分析結果について修正指数を算出してみると，図\@ref(fig:factor-cfa-residual-modification-indices)のような結果になります。

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-residual-modification-indices} 

}

\caption{モデル修正指数}(\#fig:factor-cfa-residual-modification-indices)
\end{figure}

この結果の1つ目の表から，「収集傾向」の因子で「Q5」と「Q6」の部分が赤になっていますから，現在のモデルに対してこれらのパス（「収集傾向」因子から「Q5」と「Q6」への因子負荷）をモデルに追加すると，さらにモデルの適合度が向上する可能性が高いということがわかります。

2つ目の表は残差共分散に関する修正指数です。今回のこの結果は，ここで赤字になっている部分，たとえば「Q2」と「Q5」の間で残差共分散を算出するようにモデルを修正するとモデル適合度が向上する可能性が高いということを示しています。

ただし，これらの数値はあくまでも「計算上，ここにパスを追加すると適合度があがる可能性がある」というものであって，そのようなパスが理解可能なものかどうかまでは保証されません。これらの指数にそって闇雲にモデルに修正を加えていくと，最終的に解釈不能なモデルになってしまう可能性が高くなります。モデルに修正を加える場合には，その修正が理解可能なものかどうかをよく考えるようにしてください。

そもそも，確認的因子分析はすでにある仮説モデルでデータをうまく説明できるかどうかを確認することを目的とした分析です。分析結果が思わしくなかったからといって，データに合わせて大幅に探索的にモデルを修正していくのは決して好ましいとはいえないでしょう。モデルの修正は，元の仮説で想定される範囲を超えない程度に留めておくことが重要です。

#### Plots：作図 {-}
なお，モデルに複数の修正を加えた場合，そのままではそのモデルがどのような形になっているのかを把握することが困難になっていきます。その場合，**Plots**（作図）の部分にある「Path diagram（パス図）」にチェックを入れて，モデルを図示してみるとよいでしょう。「**Plots**（作図）」の項目にチェックを入れると，図\@ref(fig:factor-cfa-plots-diagram)のように各因子と観測変数の関係，因子間の相関，残差間の相関を図示してくれます。


```{=latex}
\clearpage
```

<!-- -->
\begin{figure}[!ht]

{\centering \includegraphics[width=1\linewidth]{images/factor/cfa-plots-diagram} 

}

\caption{モデルのパス図}(\#fig:factor-cfa-plots-diagram)
\end{figure}

<!--  -->

なお，今回の分析ではモデルの修正は行っていませんので，ここに示されるパス図は，縦横の向きは違うだけで分析前に示したパス図と同じものになっています。

<!--chapter:end:09-Factor.Rmd-->

# (PART\*) 付録 {-#part-three}

<!--chapter:end:10-part3.Rmd-->



# 関数一覧 {-#ch:appendix}
\AppendixChapter{関数一覧}

### Math：数学関数{-#app:math}

ABS(`値`)
: `値`の絶対値を返します（\(\mathsf{|x|}\)）

EXP(`値`)
: ネイピア数eの`値`乗の値（eのべき乗）を返します（\(\mathsf{e^{x}}\)）

LN(`値`)
: `値`の自然対数を返します（\(\mathsf{\log_{e}{x}}\)）

LOG10(`値`)
: `値`の常用対数を返します（\(\mathsf{\log_{10}{x}}\)）


SQRT(`値`)
: `値`の正の平方根を返します（\(\mathsf{\sqrt{x}}\)）


### Statistical：統計関数{-#app:statistical}

ABSIQR(`変数`)
: `IQR()`関数の結果を絶対値で返します。

ABSZ(`変数`)
: `Z()`関数の結果を絶対値で返します。

BOXCOX（`変数`）
: `変数`に対して*ボックス=コックス変換*を行った値を返します。ボックス=コックス変換は，歪んだ分布を持つ変数を正規分布に近づける際に使用される変換です。

IQR(`変数`)
: `変数`の各値が四分位範囲内にある場合は0，そうでない場合は四分位範囲の何倍離れた位置にあるかを返します。通常，この値の絶対値が1.5を超える場合に外れ値とみなされます。

MAX(`値1`,`値2`, …)
: 指定した`値`の中で最大の値を返します。

MAXABSIQR(`変数1`,`変数2`, …)
: 指定した`変数`の`ABSIQR()`の値のうち，最大の値を返します。

MAZABSZ(`変数1`,`変数2`, … [, group_by = `グループ変数`])
: 指定した`変数`の`Z()`関数の結果のうち，最大の値を返します。

MEAN(`値1`,`値2`, … [, ignore_missing=0, min_valid=0])
: 指定した値の平均値を返します。「ignore_missing=1」と指定した場合，欠損値が含まれる変数を除外して平均値を算出します。また，「min_valid」オプションでは平均値の算出に必要な値の個数を指定できます。「min_valid=3」と指定すると，3個以上の値が指定されていない場合には平均値は算出されません。

MIN(`値1`,`値2`, …)
: 指定した`値`の中で最小の値を返します。

RANK(`変数`)
: 指定した`変数`に含まれる各値の順位（昇順）を返します。

ROUND(`値` [, `桁数`])
: 指定した`値`の各値を指定桁数で四捨五入した値を返します。値のみを指定した場合（`ROUND(A)`）には整数値が，値の後ろに`2`を指定した場合（`ROUND(A,2)`）は，小数第2位までで四捨五入した値が返されます。

SCALE(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の各値を標準化した値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとに値が標準化されます。この関数は`Z()`と同一です。

STDEV(`値1`,`値2`, … [, ignore_missing=0])
: 指定した値の標準偏差を返します。欠損値が含まれる変数値を用いて標準偏差を算出する場合は「ignore_missing=1」と指定することで欠損値を含む変数値以外の平均値を算出できます。「ignore_missing=1」と指定した場合，欠損値が含まれる変数を除外して標準偏差を算出します。

SUM(`値1`,`値2`, … [, ignore_missing=0, min_valid=0])
: 指定した値の合計値を返します。「ignore_missing=1」と指定した場合，欠損値が含まれる変数を除外して合計値を算出します。また，「min_valid」オプションでは合計値の算出に必要な値の個数を指定できます。「min_valid=3」と指定すると，3個以上の値が指定されていない場合には合計値は算出されません。

VAR(`値1`,`値2`, … [, ignore_missing=0])
: 指定した値の分散を返します。「ignore_missing=1」と指定した場合，欠損値が含まれる変数を除外して分散を算出します。

Z(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の値を標準化して返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループに標準化が行われます。この関数は`SCALE()`と同一です。

#### V関数 {-}

以下は，「V関数」と呼ばれる統計関数の一覧です。V関数は，その変数全体についての値を返す関数です。V関数でない関数，たとえば`MAX()`で`MAX(A,B)`とした場合，この関数では1行ごとに変数AおよびBの値の最大値を計算して返します。これに対し，`VMAX(A)`は，変数Aに含まれる値すべてにおける最大値を返します。

VMAX(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の最大値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの最大値が返されます。

VMEAN(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の平均値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの平均値が返されます。

VMED(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の中央値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの中央値が返されます。

VMIN(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の最小値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの最小値が返されます。

VMODE(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の最頻値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの最頻値が返されます。

VN(`変数` [, group_by=`グループ変数`])
: 指定した`変数`に含まれる値の個数（度数）を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの度数が返されます。

VSE(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の平均値の標準誤差を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの標準誤差が返されます。

VSTDEV(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の標準偏差を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの標準偏差が返されます。

VSUM(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の合計値を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの合計値が返されます。

VVAR(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の分散を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの分散が返されます。


### Logical：論理関数{-#app:logical}

IF(`条件式`, `真の場合の値・処理`, `偽の場合の値・処理`)
: `条件式`が`真`である場合と`偽`の場合で異なる値（または処理）を使用します。
: 例）`IF(A==1,'Y','N')`では，変数Aの値が`1`の場合に`Y`が，そうでない場合に`N`が返されます。

IFMISS(`変数`, `真の場合の値`, `偽の場合の値`)
: `変数`の値が欠損値である場合（`真`）とそうでない場合（`偽`）で異なる値を使用します。
: 例）`IF(A,9,A)`では，変数Aの値が欠損値の場合には`9`を代入し，そうでない場合には変数Aの値をそのまま使用します。

NOT(`条件式`)
: `条件式`の結果が`真`ならば`偽`(0)を，`偽`ならば`真`(1)を返します。
: 例）`NOT(A=='Y')`は，変数Aの値が`Y`でないならば`1`（真），`Y`ならば`0`（偽）を返します。

### Text：文字列関数{-#app:text}

CONTAINS(`項目1`,`項目2`, … ,`検索対象1`,`検索対象2`)
: `検索対象`の中に`項目`が含まれているかどうかを判定します。含まれていれば`1`（真），含まれていなければ`0`（偽）を返します。
: 例）`CONTAINS('YES',A)`の結果は，変数Aの値に`YES`という文字列が含まれていれば`1`（真），含まれていなければ`0`（偽）になります。

SPLIT(`文字列` [, `区切り文字`, `抽出要素`])
: 指定した文字列を`区切り文字`（初期値は`,`（コンマ））で区切った結果を返します。`抽出要素`を指定すると，その部分だけを抜き出した結果が返されます。
: 例）`SPLIT('a,b,c,d')`は`a b c d`という結果を返します。`SPLIT('a,b,c,d',',',2)`は，文字列をコンマで区切った場合の2つ目の要素（`b`）が結果として返されます。

TEXT(`数値`)
: 指定された`数値`を文字列に変換します。

VALUE(`文字列`)
: 数字で構成された`文字列`を数値に変換します。

### Reference：参照関数{-#app:reference}

HLOOKUP(`位置`,`値1`,`値2`, …)
: `値1`,`値2`, … のうち，`位置`で示された位置にある`値`を返します。
: 例）`HLOOKUP(X,'S','A','B','C','D')`は，変数`X`の値が`1`の場合には`S`（1番目の値），`3`の場合には`B`（3番目の値）を返します。

MATCH(`検索値`,`値1`,`値2`, …)
: `検索値`が`値1`,`値2`, … の何番目の位置にあるかを返します。
: 例）`MATCH(X,'S','A','B','C','D')`は，変数`X`の値が`A`の場合には`2`，`C`の場合には`4`を返します。

### Misc：各種関数{-#app:misc}

FILTER(`変数`,`フィルタ条件式`)
: `フィルタ条件式`を使用して`変数`をフィルタリングします。

INT(`値`)
: 指定された`値`を整数値に変換します。

OFFSET(`変数`, `整数値`)
: `整数値`で指定した数値を`変数`に加えます。`整数値`にマイナスの値を指定すると，その分だけ`変数`の値が減じられます。

ROW()
: その行の行数を返します。

SAMPLE(`変数`, `個数` [, `非選択時の値`])
: `変数`に含まれる値の中から，無作為に`個数`で指定された個数の値を選択します。選択されなかった部分は初期設定では空白（`欠損値`）になりますが，3つ目の要素として`非選択時の値`を設定すると，選択された値が含まれる行以外は，すべてその指定値になります。
: 例) `SAMPLE(A,20)`は，変数Aに含まれる値を無作為に20個（20行）選択します。`SAMPLE(A,20,0)`では，変数Aに含まれる値が無作為に20個（20行）選択され，残りの部分はすべて値が`0`になります。

VROWS(`変数` [, group_by=`グループ変数`])
: 指定した`変数`の行数を返します。「`group_by`」でグループ変数を指定した場合は，それぞれのグループごとの行数が返されます。

### Simulation：シミュレーション関数{-#app:simulation}

BETA(`α`,`β`)
: 指定した`α`と`β`をパラメータとするベータ分布にそった乱数を発生させます。

GAMMA(`形状パラメータ`,`尺度パラメータ`)
: 指定した形状パラメータと尺度パラメータを持つガンマ分布にそった乱数を発生させます。

NORM(`平均値`,`標準偏差`)
: 指定した`平均値`と`標準偏差`をパラメータとする正規分布（ガウス分布）にそった乱数を発生させます。

UNIF(`最小値`,`最大値`)
: 指定した`最小値`から`最大値`までの範囲で一様分布にそった乱数を発生させます。

<!--chapter:end:10a-Appendix.Rmd-->

