# Add to ~/.config/fish/functions/ or config.fish

# Enhanced ls with size visualization
function lsv --description "ls with visual size bars"
    ls -lh $argv | awk 'NR>1 {
        size=$5
        name=$9
        # Convert size to numeric for visualization
        num=size
        gsub(/[^0-9.]/, "", num)
        unit=substr(size, length(size))
        
        mult=1
        if (unit=="K") mult=1
        else if (unit=="M") mult=1024
        else if (unit=="G") mult=1024*1024
        
        val=num*mult
        if (maxval<val) maxval=val
        sizes[NR]=val
        names[NR]=name
        origsize[NR]=size
        count=NR
    }
    END {
        for (i=1; i<=count; i++) {
            bars=int(sizes[i]/maxval*30)
            printf "%-8s ", origsize[i]
            for (j=0; j<bars; j++) printf "▓"
            printf " %s\n", names[i]
        }
    }'
end

# Process list with CPU/Memory visualization
function psv --description "ps with visual resource bars"
    ps aux | awk 'NR>1 {
        printf "%-10s %5.1f%% ", $1, $3
        cpu=int($3/10)
        for(i=0; i<cpu; i++) printf "█"
        printf "\n"
    }' | head -n 20
end

# Disk usage visualization
function dfv --description "df with visual bars"
    df -h | awk 'NR>1 {
        used=$5
        gsub(/%/, "", used)
        mount=$6
        
        printf "%-20s %4s%% ", mount, used
        bars=int(used/5)
        for(i=0; i<bars; i++) {
            if (used>90) printf "█"
            else if (used>70) printf "▓"
            else printf "▒"
        }
        printf "\n"
    }'
end

# Git status with visual indicators
function gstv --description "git status with visualization"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Not a git repository"
        return 1
    end
    
    echo "📊 Git Status Visualization"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Count file types
    set -l modified (git status --short | grep '^ M' | wc -l | string trim)
    set -l added (git status --short | grep '^A' | wc -l | string trim)
    set -l deleted (git status --short | grep '^ D' | wc -l | string trim)
    set -l untracked (git status --short | grep '^??' | wc -l | string trim)
    
    # Visual bars
    if test $modified -gt 0
        printf "Modified:   %2d " $modified
        string repeat -n (math "min($modified, 20)") '█' | string collect
    end
    if test $added -gt 0
        printf "Added:      %2d " $added
        string repeat -n (math "min($added, 20)") '█' | string collect
    end
    if test $deleted -gt 0
        printf "Deleted:    %2d " $deleted
        string repeat -n (math "min($deleted, 20)") '█' | string collect
    end
    if test $untracked -gt 0
        printf "Untracked:  %2d " $untracked
        string repeat -n (math "min($untracked, 20)") '░' | string collect
    end
end

# Directory size visualization
function dusv --description "du with visual size comparison"
    du -sh $argv[1]/* 2>/dev/null | sort -hr | awk '
    BEGIN { maxval=0 }
    NR==1 { 
        maxsize=$1
        gsub(/[^0-9.]/, "", maxsize)
        unit=substr($1, length($1))
        if (unit=="G") maxval=maxsize*1024
        else if (unit=="M") maxval=maxsize
        else if (unit=="K") maxval=maxsize/1024
        else maxval=maxsize/1024/1024
    }
    {
        size=$1
        name=$2
        num=size
        gsub(/[^0-9.]/, "", num)
        unit=substr(size, length(size))
        
        val=num
        if (unit=="G") val=num*1024
        else if (unit=="M") val=num
        else if (unit=="K") val=num/1024
        else val=num/1024/1024
        
        bars=int(val/maxval*40)
        printf "%-8s ", size
        for(i=0; i<bars; i++) printf "█"
        printf " %s\n", name
    }' | head -n 20
end

# History usage visualization
function histv --description "Show command usage statistics"
    history | awk '{print $1}' | sort | uniq -c | sort -rn | head -n 15 | awk '
    BEGIN { maxval=0 }
    NR==1 { maxval=$1 }
    {
        count=$1
        cmd=$2
        bars=int(count/maxval*40)
        printf "%4d ", count
        for(i=0; i<bars; i++) printf "█"
        printf " %s\n", cmd
    }'
end

# Network connections visualization
function netv --description "Show network connections with counts"
    if command -v netstat >/dev/null
        netstat -an | awk '/ESTABLISHED/ {
            split($5, a, ":")
            ip=a[1]
            ports[ip]++
        }
        END {
            maxval=0
            for (ip in ports) if (ports[ip]>maxval) maxval=ports[ip]
            for (ip in ports) {
                bars=int(ports[ip]/maxval*30)
                printf "%-20s %3d ", ip, ports[ip]
                for(i=0; i<bars; i++) printf "█"
                printf "\n"
            }
        }' | sort -k2 -rn | head -n 10
    else
        echo "netstat not available"
    end
end

# File type distribution
function ftypev --description "Visualize file type distribution in directory"
    set -l dir $argv[1]
    if test -z "$dir"
        set dir "."
    end
    
    find $dir -type f | awk -F. '{
        if (NF>1) ext=$NF
        else ext="no-ext"
        count[ext]++
    }
    END {
        maxval=0
        for (e in count) if (count[e]>maxval) maxval=count[e]
        for (e in count) {
            bars=int(count[e]/maxval*40)
            printf "%-10s %4d ", e, count[e]
            for(i=0; i<bars; i++) printf "█"
            printf "\n"
        }
    }' | sort -k2 -rn | head -n 15
end

# CSV column statistics
function csvstat --description "Show statistics for CSV columns"
    if not set -q argv[1]
        echo "Usage: csvstat <file.csv>"
        return 1
    end
    
    awk -F',' '
    NR==1 { 
        for(i=1; i<=NF; i++) headers[i]=$i
        ncols=NF
        next
    }
    {
        for(i=1; i<=NF; i++) {
            if ($i ~ /^[0-9.]+$/) {
                sum[i]+=$i
                count[i]++
                if (NR==2 || $i>max[i]) max[i]=$i
                if (NR==2 || $i<min[i]) min[i]=$i
            }
        }
    }
    END {
        for(i=1; i<=ncols; i++) {
            if (count[i]>0) {
                avg=sum[i]/count[i]
                printf "\n%s:\n", headers[i]
                printf "  Min: %8.2f ", min[i]
                printf "  Avg: %8.2f ", avg
                printf "  Max: %8.2f\n", max[i]
                
                # Visual range
                printf "  "
                range=max[i]-min[i]
                if (range>0) {
                    avgpos=int((avg-min[i])/range*50)
                    for(j=0; j<avgpos; j++) printf "▓"
                    printf "◆"
                    for(j=avgpos; j<50; j++) printf "░"
                }
                printf "\n"
            }
        }
    }' $argv[1]
end
