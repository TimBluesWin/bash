#!/bin/bash

function print_current_date() {
    today_date=$(date +%Y-%m-%d\ %H:%M:%S)
    echo "The current date is $today_date"
}

print_current_date