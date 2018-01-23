#! /usr/bin/zsh

let total_count=0

recursive_count(){
    #let local count=0

    for part in $@
    do 
        if [ -d $part ]; then            
            echo "$part : D"
            recursive_count $part/*
            # echo "Total count = $total_count"                
        elif [ -f $part ]; then
            lc=$(cat $part | wc -l)
            echo "$part : F : $lc"
            total_count=total_count+lc
            #count=count+lc            
            #echo "Count = $count"
        else
           echo "$part is not a directory or file"
        fi
    done
}

# root call of function
recursive_count $@

echo
echo "Total count = $total_count"
echo