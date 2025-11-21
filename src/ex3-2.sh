#!/bin/bash

echo "--- y = 1/2 * x^2 계산기 ---"
echo "계산할 x 값 2개 이상을 입력하세요. (공백으로 구분 예:a b c)"

read -p "x 값 입력: " -a x_values

# 입력된 x 값 개수 확인
if [ ${#x_values[@]} -lt 2 ]; then
    echo "오류: 최소한 2개 이상의 x 값을 입력해야 합니다."
    exit 1
fi

echo "--- 계산 결과 ---"

# 입력받은 각 x 값에 대해 계산 및 출력
for x in "${x_values[@]}"; do

    y=$(echo "scale=4; ($x * $x) / 2" | bc) #소수점 넷째자리까지 

    echo "x = $x, y = $y"
done

echo "-------------------"