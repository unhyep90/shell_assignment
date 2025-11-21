#!/bin/bash

DB_FILE="./DB.txt"

# DB 파일이 없으면 생성
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="

    read -p "선택: " choice

    case $choice in
        1)
            read -p "팀원 이름: " name
            read -p "생일 또는 전화번호: " info
            echo "TEAM|$name|$info" >> "$DB_FILE"
            echo "팀원 정보 추가 완료."
            ;;
        2)
            read -p "날짜 (YYYY-MM-DD): " date
            read -p "팀원 이름: " name
            read -p "한 일 기록: " work
            echo "WORK|$date|$name|$work" >> "$DB_FILE"
            echo "활동 기록 추가 완료."
            ;;
        3)
            read -p "검색할 팀원 이름: " search_name
            echo "검색 결과:"
            grep -i "TEAM|$search_name" "$DB_FILE" | while IFS='|' read -r tag name info; do
                echo "이름: $name, 생일/전화번호: $info"
            done
            ;;
        4)
            read -p "검색할 날짜 (YYYY-MM-DD): " search_date
            echo "검색 결과:"
            grep "WORK|$search_date" "$DB_FILE" | while IFS='|' read -r tag date name work; do
                echo "날짜: $date, 팀원: $name, 내용: $work"
            done
            ;;
        5)
            echo "프로그램 종료."
            exit 0
            ;;
        *)
            echo "잘못된 선택입니다. 다시 입력하세요."
            ;;
    esac
    echo
done
