# pdfCompress

## 概要:
PDFファイルを解像度を落とし、PDFファイルサイズを縮小する。

## 使い方:
本スクリプトを実行すれば、inputフォルダー内のPDFファイルすべてのファイルサイズを縮小する。<br>
縮小されたファイルはoutputフォルダーに格納される。

## ディレクトリ構造
```
.
├── input
│   └── dummy.pdf
├── output
│   └── dummy_min.pdf
└── pdfCompress_v1.X.sh
```
## 動作環境：
OS：macOS Catalina 10.15.7

## 事前準備
### 下記のパッケージを導入する。
- ghostscript
### 導入方法：		
```
  $ brew install ghostscript
```
 
## 実行方法:
```
./pdfCompress_v1.X.sh 
```
