#!/bin/bash

unit=0.15

function dot {
	xset led 3
	sleep $unit
	xset -led 3
	sleep $unit
}

function dash {
	xset led 3
	sleep "$(echo "3*$unit" | bc)"
	xset -led 3
	sleep $unit
}

function gap {
	sleep "$(echo "2*$unit" | bc)"
}

function pause {
	gap
	gap
	gap
}

# telegraph a single character
function morse {
	case $1 in
		"A")
			dot; dash;;
		"B")
			dash; dot; dot; dot;;
		"C")
			dash; dot; dash; dot;;
		"D")
			dash; dot; dot;;
		"E")
			dot;;
		"F")
			dot; dot; dash; dot;;
		"G")
			dash; dash; dot;;
		"H")
			dot; dot; dot; dot;;
		"I")
			dot; dot;;
		"J")
			dot; dash; dash; dash;;
		"K")
			dash; dot; dash;;
		"L")
			dot; dash; dot; dot;;
		"M")
			dash; dash;;
		"N")
			dash; dot;;
		"O")
			dash; dash; dash;;
		"P")
			dot; dash; dash; dot;;
		"Q")
			dash; dash; dot; dash;;
		"R")
			dot; dash; dot;;
		"S")
			dot; dot; dot;;
		"T")
			dash;;
		"U")
			dot; dot; dash; dash;;
		"V")
			dot; dot; dot; dash;;
		"W")
			dot; dash; dash;;
		"X")
			dash; dot; dot; dash;;
		"Y")
			dash; dot; dash; dash;;
		"Z")
			dash; dash; dot; dot;;
		"1")
			dot; dash; dash; dash; dash;;
		"2")
			dot; dot; dash; dash; dash;;
		"3")
			dot; dot; dot; dash; dash;;
		"4")
			dot; dot; dot; dot; dash;;
		"5")
			dot; dot; dot; dot; dot;;
		"6")
			dash; dot; dot; dot; dot;;
		"7")
			dash; dash; dot; dot; dot;;
		"8")
			dash; dash; dash; dot; dot;;
		"9")
			dash; dash; dash; dash; dot;;
		"0")
			dash; dash; dash; dash; dash;;
		"")
			pause;;
		".")
			dot; dash; dot; dash; dot; dash;;
		",")
			dash; dash; dot; dot; dash; dash;;
		"?")
			dot; dot; dash; dash; dot; dot;;
		"'")
			dot; dash; dash; dash; dash; dot;;
		"!")
			dash; dot; dash; dot; dash; dash;;
		"/")
			dash; dot; dot; dash; dot;;
		"(")
			dash; dot; dash; dash; dot;;
		")")
			dash; dot; dash; dash; dot; dash;;
		"&")
			dot; dash; dot; dot; dot;;
		":")
			dash; dash; dash; dot; dot; dot;;
		";")
			dash; dot; dash; dot; dash; dot;;
		"=")
			dash; dot; dot; dot; dash;;
		"+")
			dot; dash; dot; dash; dot;;
		"-")
			dash; dot; dot; dot; dot; dash;;
		"_")
			dot; dot; dash; dash; dot; dash;;
		"\"")
			dot; dash; dot; dot; dash; dot;;
		"$")
			dot; dot; dot; dash; dot; dot; dash;;
		"@")
			dot; dash; dash; dot; dash; dot;;
		*)
			echo "Hmm... I'm not sure what to do with the character [$1]";;
	esac
	gap
}

# telegraph each character in a string
function morse_str {
	input=$1
	input=${input^^}
	input="$input STOP"
	echo $input
	while test -n "$input"
	do
		c=${input:0:1}
		morse $c
		input=${input:1}
	done
}

echo "Incoming telegraph..."
while read line
do
	morse_str "$line"
done
