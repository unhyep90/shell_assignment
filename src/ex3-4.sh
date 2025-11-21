#!/bin/bash

# 점수를 저장할 배열 초기화
scores=()

# 5번(종료)이 선택될 때까지 반복
while true; do
    # 메뉴 출력
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " c

    case $c in
        1) # 과목 성적 추가
            read -p "추가할 점수 입력 (공백 구분): " new_scores
            scores+=( $new_scores ) # 배열에 추가
            echo "성적 추가 완료."
            ;;
        2) # 입력된 모든 점수 보기
            echo "--- 입력 점수 ---"
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                echo "${scores[@]}"
            fi
            ;;
        3|4) # 평균 점수 확인 및 평균 등급 변환
            # 점수가 없으면 종료
            count=${#scores[@]}
            if [ "$count" -eq 0 ]; then
                echo "계산할 점수가 없습니다."
                continue
            fi

            # 총점 계산
            sum=0
            for s in "${scores[@]}"; do sum=$((sum + s)); done
            
            # 실수 평균 계산 (bc 사용)
            avg=$(echo "scale=2; $sum / $count" | bc)
            
            if [ "$c" -eq 3 ]; then
                # 3. 평균 점수 확인
                echo "--- 평균 점수 ---"
                echo "평균: $avg"
            elif [ "$c" -eq 4 ]; then
                # 4. 평균 등급 변환 (90점 이상 A, 아니면 B로 가정)
                is_a=$(echo "$avg >= 90" | bc)
                if [ "$is_a" -eq 1 ]; then grade="A"; else grade="B"; fi
                
                echo "--- 평균 등급 ---"
                echo "평균 ($avg) 등급: $grade"
            fi
            ;;
        5) # 종료
            echo "프로그램을 종료합니다."
            break # while 루프 종료
            ;;
        *) # 잘못된 입력 처리
            echo "잘못된 입력입니다. (1~5 중 하나를 입력하세요.)"
            ;;
    esac
    echo "" # 메뉴 사이 줄바꿈
done