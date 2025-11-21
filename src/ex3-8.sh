#!/bin/bash

# 현재 디렉토리에서 DB 폴더 확인, 없으면 생성
DB_DIR="./DB"
if [ ! -d "$DB_DIR" ]; then
    echo "DB 폴더가 존재하지 않아 생성합니다."
    mkdir "$DB_DIR"
else
    echo "DB 폴더가 이미 존재합니다."
fi

# DB 폴더 안에 임의의 5개 파일 생성
for i in {1..5}; do
    FILE="$DB_DIR/file_$i.txt"
    echo "이것은 파일 $i 입니다." > "$FILE"
done
echo "DB 폴더에 5개의 파일 생성 완료."

# 생성된 파일 압축 (모든 파일 안전하게 포함)
tar -czf "$DB_DIR/db_files.tar.gz" -C "$DB_DIR" .
echo "DB 폴더의 파일을 압축 완료: $DB_DIR/db_files.tar.gz"

# train 폴더 생성
TRAIN_DIR="./train"
if [ ! -d "$TRAIN_DIR" ]; then
    mkdir "$TRAIN_DIR"
    echo "train 폴더 생성 완료."
else
    echo "train 폴더가 이미 존재합니다."
fi

# DB에 있는 5개 파일만 train 폴더에 링크
for i in {1..5}; do
    ln -sf "$DB_DIR/file_$i.txt" "$TRAIN_DIR/file_$i.txt"
done
echo "train 폴더에 DB 파일 링크 생성 완료."
