#!/bin/bash

# PASS_MAX_DAYS 값 확인
if [ "$(grep -v '^ *#' /etc/login.defs | grep -i "PASS_MAX_DAYS" | awk -F '\t' '{print $2}')" -le 90 ]; then
    echo
    echo "패스워드 최대 사용기간이 90일 이하로 설정되어 있으므로 양호함"
    echo
    echo "[현황]"
    grep -v '^ *#' /etc/login.defs | grep -i "PASS_MAX_DAYS"
    echo "양호"
    exit 0
else
    echo
    echo "패스워드 최대 사용기간이 90일 초과로 설정되어 있으므로 취약함"
    echo
    echo "[현황]"
    grep -v '^ *#' /etc/login.defs | grep -i "PASS_MAX_DAYS"
    echo "경고"
    exit 1
fi
