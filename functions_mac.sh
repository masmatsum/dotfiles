

# https://superuser.com/questions/105499/change-terminal-title-in-mac-os-x
changetitle() {
  local title=$1
  echo -n -e "\033]0;$title\007"
}
