function histogram --description "Create a histogram from data"
    set -l bins 10
    if set -q argv[1]
        set bins $argv[1]
    end
    
    sort -n | awk -v bins=$bins '
    BEGIN { min=1e100; max=-1e100 }
    { 
        data[NR]=$1
        if ($1<min) min=$1
        if ($1>max) max=$1
    }
    END {
        range=max-min
        for (i=0; i<bins; i++) count[i]=0
        for (i=1; i<=NR; i++) {
            bin=int((data[i]-min)/range*bins)
            if (bin==bins) bin--
            count[bin]++
        }
        maxcount=0
        for (i=0; i<bins; i++) if (count[i]>maxcount) maxcount=count[i]
        for (i=0; i<bins; i++) {
            lo=min+i*range/bins
            hi=min+(i+1)*range/bins
            bars=int(count[i]/maxcount*40)
            printf "%7.2f-%7.2f | ", lo, hi
            for (j=0; j<bars; j++) printf "█"
            printf " (%d)\n", count[i]
        }
    }'
end
