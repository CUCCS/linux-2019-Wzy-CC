#! /bin/env bash

filename=$1
shift
Line=$( awk 'NR != 1{ print $0 }' "$filename" | wc -l )

function helpdoc()
{
    echo "------------------------------------------"
    echo "Option:"
    echo "\n"

    echo "h  :  open help document."
    echo "u  :  show top 100 url."
    echo "i  :  show top 100 ip."
    echo "c  :  show top 100 src host."
    echo "r  :  show response status."
    echo "s  :  show status code top url."
    echo "g  :  show given url top src host."
}


function top_src_host()
{
   echo -e "\n Top 100 Src Host "
   awk -F '\t' 'NR != 1 {a[$1]++} END {for(i in a) { printf("%-40s\t%20d\n",i,a[i]) }}' "$filename" | sort -nr -k2 | head -n 100
}


function top_url()
{
   echo -e "\n Top 100 Url "
   awk -F '\t' 'NR != 1 {a[$5]++} END {for(i in a) { printf("%-50s\t%20d\n",i,a[i]) }}' "$filename" | sort -nr -k2 | head -n 100
}


function response_stats()
{
   echo -e "\n Response Stats "
   awk -F '\t' 'NR != 1 {a[$6]++} END {for(i in a) { printf("%d\t\t%d\t\t%10.4f%\n",i,a[i],100*a[i]/'"$Line"') }}' "$filename"
}


function top_src_host_ip()
{
   echo -e "\n Top 100 Src Host IP "
   awk -F '\t' 'NR != 1 {if($1~/^([0-9]{1,3}\.){3}[0-9]{1,3}$/) a[$1]++} END {for(i in a) {printf("%-20s\t\t%d\n",i,a[i])}}' "$filename" | sort -nr -k2 | head -n 100
}


function given_url_top_src_host()
{
   echo -e "\n Given URL Top 100 Src Host "
   awk -F '\t' 'NR != 1 {if($5=="'"$1"'") a[$1]++} END {for(i in a) {printf("%-40s\t%d\n",i,a[i])}}' "$filename" | sort -nr -k2 | head -n 10 
}


function status_code_top_url()
{
    a=$(awk -F '\t' 'NR != 1 {if($6~/^4[0-9]{2}$/) print $6}' "$filename" | sort -u)
    echo -e "\n Status Code 4xx Top URL "
    for res in $a; 
    do
	awk -F '\t' 'BEGIN {res='"$res"'} NR != 1 {if(res==$6) a[$5]++} END {for(i in a) {printf("%d\t%-60s\t\t%d\n",res,i,a[i])}}' "$filename" | sort -nr -k3 | head -n 10 
    done
}


while getopts ":Auircsg:h" opt; do 
   case $opt in
	u) 
	    top_url 
	    ;;
	i) 
	    top_src_host_ip 
	    ;;
	r) 
	    response_stats 
	    ;;
	c) 
	    top_src_host 
	    ;;
	s) 
	    status_code_top_url 
	    ;;
	g) 
	    given_url_top_src_host "$OPTARG" 
	    ;;
	h) 
	    helpdoc
	    ;;
   esac
done