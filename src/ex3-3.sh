#!/bin/bash

# 점수 입력
read -p "0~100 사이의 정수를 2개 이상 입력하시요. (예: 85 90 78): " -a s

sum=0
c=0

echo "--- 개별 등급 ---"

# 개별 점수 처리
for score in "${s[@]}"; do
    if [ "$score" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi
    echo "점수 $score: $grade"
    sum=$((sum + score))
    c=$((c + 1))
done

# 평균 계산 및 출력
if [ "$c" -gt 0 ]; then
    # bc를 사용하여 소수점 2자리까지 평균 계산
    avg=$(echo "scale=2; $sum / $c" | bc)
    
    # 평균 등급 판별
    is_a=$(echo "$avg >= 90" | bc)
    
    if [ "$is_a" -eq 1 ]; then
        avg_grade="A"
    else
        avg_grade="B"
    fi
    
    echo "--- 평균 등급 ---"
    echo "평균 점수: $avg"
    echo "평균 등급: $avg_grade"
fi