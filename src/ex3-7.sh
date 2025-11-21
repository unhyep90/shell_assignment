#!/bin/bash

show_menu() {
    echo -e "\n=== 시스템 상태 확인 메뉴 ===\n1) 사용자 정보\n2) CPU/GPU 사용률\n3) 메모리 사용량\n4) 디스크 사용량\n5) 종료"
}

while true; do
    show_menu
    read -p ">> 선택 (1-5): " c

    case $c in
        1) echo "--- 사용자 정보 ---"; whoami; who;;
        2) 
            echo "--- CPU/GPU 사용률 ---"
            if command -v nvidia-smi &>/dev/null; then 
                nvidia-smi -q -d UTILIZATION,MEMORY | grep -E "GPU Current|Memory Total|Memory Used"; 
            fi
            echo "[CPU Top 5]"; top -bn1 | head -n 5
            ;;
        3) echo "--- 메모리 사용량 (free -h) ---"; free -h;;
        4) echo "--- 디스크 사용량 (df -h) ---"; df -h; echo "[현재 디렉토리 크기]"; du -sh .;;
        5) echo "프로그램 종료"; break;;
        *) echo "잘못된 입력입니다. 1~5를 선택하세요.";;
    esac
    echo
done