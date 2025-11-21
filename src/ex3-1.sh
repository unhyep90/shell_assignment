#!/bin/bash

# 두 개의 인자를 파라미터 변수 $1, $2로 받음
NUM1=$1
NUM2=$2

echo "--- 실행 결과 ---"
echo "인자 1 (NUM1): $NUM1"
echo "인자 2 (NUM2): $NUM2"

# Bash 산술 확장 $(( ... ))을 사용하여 정수 사칙연산 수행
echo "================="
echo "덧셈: $(( NUM1 + NUM2 ))"
echo "뺄셈: $(( NUM1 - NUM2 ))"
echo "곱셈: $(( NUM1 * NUM2 ))"
echo "나눗셈 (몫): $(( NUM1 / NUM2 ))"
echo "나머지: $(( NUM1 % NUM2 ))"
