function sparkline --description "Generate a sparkline from numeric data"
    set -l sparks ▁ ▂ ▃ ▄ ▅ ▆ ▇ █
    set -l values
    while read -l line
        set -a values $line
    end
    
    set -l min_val $values[1]
    set -l max_val $values[1]
    for val in $values
        if test (math "$val < $min_val") -eq 1
            set min_val $val
        end
        if test (math "$val > $max_val") -eq 1
            set max_val $val
        end
    end
    
    set -l range (math "$max_val - $min_val")
    if test (math "$range == 0") -eq 1
        set range 1
    end
    
    for val in $values
        set -l idx (math "floor(($val - $min_val) / $range * 7) + 1")
        if test $idx -gt 8
            set idx 8
        end
        printf "%s" $sparks[$idx]
    end
    echo
end
