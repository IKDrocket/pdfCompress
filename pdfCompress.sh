#!/bin/bash

#############
## 定数定義 ##
#############

##定数定義
#compress元ディレクトリ
readonly BEFORE_DIR='/Users/ikdrocket/workspace/pdfCompress/input/'

#compress先ディレクトリ
readonly AFTER_DIR='/Users/ikdrocket/workspace/pdfCompress/output/'


################################################################################
## gs(Ghostscript)オプション説明##
## -dNOPAUSE:入力ファイルを1つ処理完了したら、次の入力ファイルを処理する
## -dBATCH:変換処理が完了したらgsを終了する
## -sDEVICE=pdfwrite:ファイルの出力方式を指定。PDFファイルに変換を指定している。
## -dCompatibilityLevel=1.4:PDFバージョンを指定。ここでは1.4を指定している。
## -dPDFSETTINGS=/ebook:出力用途(品質)を指定。ここではebook(電子図書)を指定している。
## -sOutputFile:変換後の出力先パス、ファイル名を指定。
################################################################################

function pdfmin()
{
    local cnt=0
    for i in $@; do
      printf "%s" ${i} is compressing...;
      gs -sDEVICE=pdfwrite \
           -dCompatibilityLevel=1.4 \
           -dPDFSETTINGS=/ebook \
           -dNOPAUSE -dQUIET -dBATCH \
           -sOutputFile=${AFTER_DIR}${i%%.*}_min.pdf ${i} &
        (( (cnt += 1) % 4 == 0 )) && wait;
    done
    printf '\n\n'
    wait && return 0
}

##################
## compress処理 ##
##################
cd $BEFORE_DIR
pdfmin *.pdf
echo "All processes completed!!";
exit 0

