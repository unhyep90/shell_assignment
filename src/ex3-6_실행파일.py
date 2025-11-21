#!/usr/bin/env python3
import sys

# sys.argv[0]은 스크립트 이름 자체이므로 인자는 [1:]부터 시작
# 이 코드는 sys.argv[1:]을 사용하여 스크립트 이름을 제외한 모든 입력 인자를 받을 수 있음 
args = sys.argv[1:]

print("--- [프로그램 시작] ---")

if args:
    print(f"입력된 인자 ({len(args)}개): {args}")
else:
    print("입력된 인자가 없습니다.")

print("--- [프로그램 종료] ---")