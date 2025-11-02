function barchart --description "Create a bar chart from numeric stdin"
    set -l values
    while read -l line
        set -a values $line
    end
    
    set -l max_val 0
    for val in $values
        if test (math "$val > $max_val") -eq 1
            set max_val $val
        end
    end
    
    for val in $values
        set -l bar_length (math "round($val / $max_val * 50)")
        set -l bar (string repeat -n $bar_length '█')
        printf "%8.2f │%s\n" $val $bar
    end
end
