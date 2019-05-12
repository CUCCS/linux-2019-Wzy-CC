#! /usr/bin/env bash

# helpdoc:
function helpdoc
{
    echo "---------------------------------------"
    echo "\n"
    echo "--------   Authored by WzyCC   --------"
    echo "--------     Help Document:    --------"
    echo "\n"
    echo "---------------------------------------"
    echo "Option:"
    echo "\n"
    echo "-h  : open help document."
    echo "-b  : batching the file in dictionary."
    echo "-qu : compression the jpeg images."
    echo "-q  : compression png/svg/jpeg images."
    echo "-w  : add text water-mark on image/images."
    echo "-rn : rename iamge/iamges , add the pre or suf."
    echo "-t  : transform png/svg to jpg image."
}

function CompressImage
{
    file=$1
    q=$2
    $( convert -quality $q $file $file)
}

# compress ratio
function CompressRatio
{
    file=$1
    ratio=$2
    $( convert -resize $ratio $file $file )
}

# add text water-mark:
function addWaterMark
{
    file=$1
    text=$2
    $( convert -fill red -pointsize 30 -draw 'text 10,10 $2' $file $file)
}


# add suf or pre:
function renameFile
{
# ex:test01.jpg
    option=$1
    File=$2
    dirName=$(dirname $2)
    baseName=$(basename $2)
# FileName pattern:(ex:test)
    FileName="${baseName%0*}"
    if [$option='-p'];then
        $( rename $FileName $dirName$FileName)
    elif [$option='-s'];then
        $( rename $FileName $FileName$dirName)
    else
        echo "Error,input 'p' or 's'."
    fi
}

# transform to jpg:
function transToJpg
{
    $( mogrify -format jpg *.png||*.svg)
}

# batching the files
function batching
{
    echo " Waiting batching the files..."
    dir=$1
    op1=$2
    op2=$3
# Number of files in dir:
    count=0
    for file in $(ls $dir)
    do
        count=$($count+1)

        if [-n "$op1"];then
            case "$op1" in
            -h)
                helpdoc
                ;;
            -qu)
                CompressImage $file $op2
                ;;
            -q)
                CompressRatio $file $op2
                ;;
            -w)
                addWaterMark $file $op2
                ;;
            -rn)
                renameFile $op1 $op2
                ;;
            -t)
                transToJpg
            ;;
        esac
        shift
        case "$op" in
        -h)
            ;;
        -b)
    done
    echo " operator finished , Number of files: $count. "
}

# -------------------------------------------------------

# -----------------    main process   -------------------

# -------------------------------------------------------

# get input para num

para_num = $#

# while it has para:
if [ -n ${para_num}];then

# get para:
    if [-n "$1"];then
        case "$1" in
        -h)
            helpdoc
            ;;
        -b)
            batching
            ;;
        -qu)
            CompressImage
            ;;
        -q)
            CompressRatio
            ;;
        -w)
            addWaterMark
            ;;
        -rn)
            renameFile
            ;;
        -t)
            transToJpg
            ;;
        esac
        shift
    fi

# if no para:echo
else
    echo "No input para."
fi


