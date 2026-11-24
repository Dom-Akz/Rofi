# funcitons

function clg
    set filename Wallpapers-(date +%d-%m-%y).log 
    tail -n 50 $argv[1] /home/soufiane/.local/share/chwall/$filename | bat -l log --file-name /home/soufiane/.local/share/chwall/$filename
end

# show the password of the current network connection
# -s : show the secret password (hiiddne)
function psk
   nmcli conn show $argv[1] -s | grep -m 1 "802-11-wireless-security.psk" | awk '{print $NF}' 
end

# long du 
# go the directory and get all disque usage of all the files or sub-dirctorys
function ldu --description "print disque usage of all files and sub-dirctorys"  
    du -cha $argv[1] | sort -h
end

# remove a path from the global PATH 
function rmp
    set PATH (string match -v $argv[1] $PATH)
end


# dir owner
function own
    ls -ld $argv[1] | awk '{print $3}'
end

# find all process (by name) and kill all instance
function rkill
    pgrep -f $argv[1] && pkill -USR2 -f $argv[1] 
end

# largest file with it a directory (TODO: or sub-dirctorys)
function bdu
    du -ah $argv[1] | sort -h | tail -n 2 | head -n 1
end


# convert to pdf
function topdf
    libreoffice --headless --convert-to pdf $argv[1] --outdir $argv[2]
end


function enc
     openssl enc -aes-256-cbc -pbkdf2 -in $argv[1] -out $argv[2] 
end

function dec
     openssl enc -d -aes-256-cbc -pbkdf2 -in $argv[1] -out $argv[2] 
end

# i use this so i don't override the file
function add
    echo $argv[1] >> $argv[2]
end 




function dfh
    set -gx fish_history ''

    set -g fish_autosuggestion_enabled 0

    for key in up down ctrl-p ctrl-n alt-up alt-down ctrl-r
        bind $key true
    end
end


# alias
    
    alias c 'clear && fish_greeting'
    alias nv 'nvim'
    alias h 'cd ~'
    alias s 'h && c'
    alias ctd 'echo -e "LARP:";cat ~/text-files/todo ; echo -e "\nFORENSICS"; cat ~/cs/forensics/todo.list ; echo -e "\nNET:"; cat ~/NSZ-L/Networking/todo ;
    echo -e "\nPR:"; cat ~/NSZ-P/todo.list ; echo -e "\nLE:"; cat ~/NSZ-L/todo ;  echo -e "\nCLOUD:"; cat ~/cs/cloud-sec/todo.list ; echo -e "\nETH:"; cat ~/cs/ETH/todo.list' 
    alias met 'curl "wttr.in/Casablanca?format=3"'
    alias meta 'curl wttr.in/Casablanca'
    alias lsc 'ls -r -s=changed' 
    alias cur 'cat ~/.local/state/caelestia/wallpaper/path.txt'
    alias raimg 'find . -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.tif" -o -iname "*.webp" -o -iname "*.svg" -o -iname "*.ico" -o -iname "*.heic" -o -iname "*.heif" -o -iname "*.avif" -o -iname "*.raw" -o -iname "*.cr2" -o -iname "*.nef" -o -iname "*.psd" \) -delete'
    alias prs 'ss -lnutps | grep'
    alias sandbox 'sudo firejail --net=none /usr/local/bin/inetsim --log-dir=/opt/inetsim/log/ --config=/opt/inetsim/conf/inetsim.conf'
    alias p 'ps aux | grep'
    alias adp 'set -U fish_user_paths'
    alias scan-dir 'clamscan -ri --no-summary'
    alias enzp '7z a -t7z -mhe=on -p' # zip a file with encryption, ex: enzp enc-dir.zip dir
    alias chp 'cp (shuf -n 1 -e ~/Pictures/Wallpapers/PROFILE/*) ~/.face'
    alias cpm 'history --max=1 | string trim | wl-copy'

    # yt-dlp
    alias ytad 'yt-dlp  -f "bestaudio" -x --audio-format mp3 --audio-quality 0 --no-playlist  -o "/home/soufiane/%(title)s.%(ext)s"'
    alias ytvd 'yt-dlp --cookies-from-browser firefox -S "res,ext:mp4:m4a" --merge-output-format mp4  --no-playlist -o "/home/soufiane/Videos/%(title)s.%(ext)s"'
    
    # pkg manager
    alias addp 'sudo pacman -S'
    alias addy 'yay -S'
    alias delp 'sudo pacman -R'
    alias ddelp 'sudo pacman -Rns'
    alias dely 'yay -R'
    alias ddely 'yay -Rns'
    alias update 'sudo pacman -Syu'


# Abbrs

    abbr sw 'swappy -f'
    abbr zn 'zen-browser'
