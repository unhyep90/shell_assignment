#!/bin/bash

EXECUTABLE="./src/ex3-6_실행파일.py"

# 사용자로부터 입력 인자를 입력 받음
read -p "실행 파일에 전달할 인자 2개 이상을 입력하세요 (공백 구분): " input_args

# 인자 개수 확인
if [ -z "$input_args" ] || [ $(echo "$input_args" | wc -w) -lt 2 ]; then
    echo "오류: 최소 2개 이상의 인자를 입력해야 합니다."
    exit 1
fi


# 입력 인자들을 실행 파일에 전달하여 시작
# eval을 사용하지 않고 "$input_args"를 그대로 전달하여 쉘이 공백을 기준으로 인자를 분리하도록 함
$EXECUTABLE $input_args
