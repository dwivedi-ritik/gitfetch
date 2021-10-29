#! /usr/bin/zsh

usr_name=$1
url="https://api.github.com/users"

col="\033[0;94m"
yell_col="\033[0;37m"
end="\033[0m"

ascii_art=$(cat art.txt)

if [[ -z $usr_name ]]; then
    echo "Username don't seem to be appear"
    exit 1
fi


c1="\033[7;30m  \033[0;1;30m"
c2="\033[7;31m  \033[0;1;31m"
c3="\033[7;32m  \033[0;1;32m"
c4="\033[7;33m  \033[0;1;33m"
c5="\033[7;34m  \033[0;1;34m"
c6="\033[7;35m  \033[0;1;35m"
c7="\033[7;36m  \033[0;1;36m"
c8="\033[7;37m  \033[0;1;37m"


data=$(curl -s $url/$usr_name)


name=$( echo $data | jq .name)
login=$( echo $data | jq .login)
bio=$( echo $data | jq .bio)
follower=$( echo $data | jq .followers)
following=$( echo $data | jq .following)
url=$( echo $data | jq .url)
repos_count=$( echo $data | jq .public_repos)
git_ver=$(git version)
hostname=$(hostname -i)
tput cup 2 2
print "$ascii_art"

pos=4

tput cup $((pos)) 30
printf "$col Name :$yell_col $name $end\n"
tput cup $((pos+1)) 30
printf "$col Host :$yell_col $hostname $end\n"
tput cup $((pos + 2)) 30
printf "$col Bio :$yell_col $bio $end\n"
tput cup $((pos + 3)) 30
printf "$col Follower :$yell_col $follower $end\n"
tput cup $((pos + 4)) 30
printf "$col Following :$yell_col $repos_count $end\n"
tput cup $((pos + 5)) 30
printf "$col Repos :$yell_col $repos_count $end\n"
tput cup $((pos + 6)) 30
printf "$col Url :$yell_col $url $end\n"
tput cup $$((pos + 7)) 30
printf "$col Git Ver :$yell_col $git_ver $end\n"



tput cup 13 30
printf " $c1$c2$c3$c4$c5$c6$c7$c8\n"

