#! /bin/env bash

# FileName:
filename=$1
shift

# helpdoc:
function helpdoc()
{
    echo "------------------------------------------"
    echo "Option:"
    echo "\n"
    echo "-h  :  open help document."
    echo "-a  :  show age status(Number/Percent)."

    echo "-p  :  show position status(Number/Percent)."

    echo "-l  :  show the longest name of players."
    echo "-s  :  show the shortest name of players."

    echo "-o  :  show the oldest player."
    echo "-y  :  show the youngest player."
}


function check_file_exist()
{
   if [[ ! -f "$filename" ]]; then
	echo "No file or dictionary exist."
	exit
   else
# Total line of tsv:
	Line=$( awk 'NR != 1{ print $0 }' "$filename" | wc -l )
   fi
}

function age_stats()
{
   below=$(awk -F '\t' '$6 < 20 && NR != 1 { print $6 }' "$filename" | wc -l)
   middle=$(awk -F '\t' '$6 >= 20 && $6 <= 30 && NR != 1 { print $6 }' "$filename" | wc -l)
   above=$(awk -F '\t' '$6 > 30 && NR != 1 {print $6}' "$filename" | wc -l)
   echo -e "\n Age Stats "
   echo "scale=2; 100*$below/$Line" | bc | awk '{printf("%-10s\t %5d\t\t %10.3f%\n", "[0,20)", '"$below"', $0)}'
   echo "scale=2; 100*$middle/$Line" | bc | awk '{printf("%-10s\t %5d\t\t %10.3f%\n", "[20,30]", '"$middle"', $0)}'
   echo "scale=2; 100*$above/$Line" | bc | awk '{printf("%-10s\t %5d\t\t %10.3f%\n", "(30,99]", '"$above"', $0)}'
}


function max_age()
{
    max=$(awk -F '\t' 'BEGIN {max = 0} NR != 1 {if ($6 > max && $6 < 100) max = $6} END {print max}' "$filename")
    echo -e "\n Max Age "
    awk -F '\t' 'BEGIN{ max = '"$max"' } { if ($6 == max) print $9 "\t\t\t" $6 }' "$filename"
}


function min_age()
{
    min=$(awk -F '\t' 'BEGIN {min = 1000} NR != 1 {if ($6 < min) min = $6} END {print min}' "$filename")
    echo -e "\n Min Age "
    awk -F '\t' 'BEGIN{ min = '"$min"' } { if($6 == min) print $9 "\t\t\t" $6 }' "$filename"
}


function position_stats()
{     
     echo -e "\n Position Age "
     awk -F '\t' 'NR != 1 { if($5 == "D¨¦fenseur") print "Defender";else print $5}' "$filename" | sort -f | uniq -c | awk '{printf("%-10s\t%d\t%.2f%%\n",$2,$1,100*$1/'"$Line"')}'
}


function max_len_name()
{
    max=$(awk -F '\t' 'BEGIN {max = 0} {if (length($9) > max) max = length($9)} END{print max}' "$filename")
    echo -e "\n Max Name Length "
    awk -F '\t' 'BEGIN{max = '"$max"'}{if(length($9) == max) print $9 "\t\t" max}' "$filename"
}


function min_len_name()
{
    min=$(awk -F '\t' 'BEGIN {min = 10000} {if (length($9) < min) min = length($9)} END{print min}' "$filename")
    echo -e "\n Min Name Length "
    awk -F '\t' 'BEGIN{min = '"$min"'}{if(length($9) == min) print $9 "\t\t\t\t" min}' "$filename"
}

# the first func in shell:
check_file_exist
# main func:
while getopts ":Aaoypls" opt; do 
   case $opt in
	h) 
	    helpdoc
	    ;;
	a) 
	    age_stats 
	    ;;
	o) 
	    max_age 
	    ;;
	y) 
	    min_age 
 	    ;;
	p) 
	    position_stats 
	    ;;
	l)
 	    max_len_name 
	    ;;
	s) 
	    min_len_name
 	    ;;
   esac
done