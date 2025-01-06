#!/bin/bash

number=1

function rectangle_area() {
    # Calculate the area of a rectangle
    # $1 is the length and $2 is the breadth
    number_regex='^-?[0-9]+$'
    echo "Calculating the area of a rectangle $number with length $1 and breadth $2"
    if [[  $# -ne 2 ]]
    then
        echo "Usage: $0 <length> <breadth>"
    elif [[ ! $1 =~ $number_regex || ! $2 =~ $number_regex ]]
    then
        echo "Length ($1) and breadth ($2) must be integer."
    elif [[ $1 -le 0 || $2 -le 0 ]]
    then
        echo "Length ($1) and breadth ($2) cannot be less than 1."
    else
        area=$(echo "$1 * $2" | bc)
        echo "The area of the rectangle with length $1 and breadth $2 is $area"
    fi 
    number=$((number + 1))
    echo "----------------------------------------"
}

rectangle_area 10 20
rectangle_area 20 30
rectangle_area
rectangle_area 10
rectangle_area 10 20 30
rectangle_area 10 -20
rectangle_area -10 20
rectangle_area -10 -20
rectangle_area 0 20
rectangle_area 10 0
rectangle_area 0 0
rectangle_area 10 20.5
rectangle_area 10.5 20
rectangle_area 10.5 20.5
rectangle_area 10.5 20.5.5
rectangle_area 10.5.5 20.5
rectangle_area 10.5.5 20.5.5
rectangle_area test
rectangle_area test test
rectangle_area test 20
rectangle_area 10 test