#!/bin/bash
files=( *.png )

#size of array
numFiles=${#files[@]}
echo numFiles = $numFiles

# current directory
dir=$PWD

#------------------------------------------------------------
# define 10% of them for test data set:
takeTest=$(($numFiles/10))
echo takeTest = $takeTest

while (( i < $takeTest ))
do
    r=$((RANDOM%numFiles))
    f=${files[r]}
    if [[ -n $f ]]
    then
        i=$((i+1))
#echo ${files[r]}
        mv ${files[r]} $dir/test
        unset files[r]
    fi
done


#------------------------------------------------------------
files=( *.png )

# define 20% of them for validation data set:
takeValidation=$(($numFiles/5))
echo takeValidation = $takeValidation

i=0
while (( i < $takeValidation ))
do
    r=$((RANDOM%numFiles))
    f=${files[r]}
    if [[ -n $f ]]
    then
        i=$((i+1))
#echo ${files[r]}
        mv ${files[r]} $dir/validation
        unset files[r]
    fi
done

#------------------------------------------------------------
files=( *.png )
numFiles=${#files[@]}

# move remaining files into a train folder data set:
takeRemaining=$(($numFiles))
echo takeRemaining = $takeRemaining

i=0
while (( i < $takeRemaining ))
do
#echo ${files[i]}
    mv ${files[i]} $dir/train
    unset files[i]
    i=$((i+1))
done
