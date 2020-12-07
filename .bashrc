is_regular_readable_file() {
  local file=$1
  if test -f "$file" && test -r "$file"; then
    return 0
  fi  
  return 1
}

finddocuments() {
  find ~/Documents -name '*'"$1"'*'
}

# List all changed files in all git repositories in a directory
_git_all_repo_diff_status() {
  parent_dir=$1

  pushd "$parent_dir" > /dev/null
  for dir in *
  do
    if [ ! -d "$dir" ]; then
      continue
    fi
    cd "$dir"
    if [ ! -d .git ]; then
      cd ..
      continue
    fi
    status=$(git status --short)
    if [ -z "$status" ]; then
      cd ..
      continue
    fi
    echo "============ $dir ============"
    git status --short
    echo
    cd ..
  done
  popd > /dev/null
}

#git_all_repo_diff_status() {
#  _git_all_repo_diff_status {SOME_PROJECT_DIR}
#}


# Generate .gif from .mov
# Example: 
#   generate_gif 'input.mov' 'output.gif' 'palette.png'
# 
# Note: You need `ffmpeg` command (Run `brew install ffmpeg` for macOS to install)
#
# 参考にしたページ: https://qiita.com/takasp/items/65d1d0d90073bcfc4873
generate_gif() {
  local input_mov=$1
  local output_gif=$2
  local palette=$3 # 生成する palette

  ffmpeg -i "$input_mov" -vf "palettegen" -y "$palette"
  ffmpeg -i "$input_mov" -i "$palette" -r 24 -y "$output_gif"
}


alias view='vi -R'



case ${OSTYPE} in
  linux*)
    ;;
  darwin*)
    alias ls='ls -G'
    alias la='ls -aG'
    alias l1='ls -1G'
    alias ll='ls -lG'
    alias lla='ls -laG'
    alias date-iso-8601='date +"%Y-%m-%dT%H:%M:%S%z"'
    alias date-iso-8601-utc='date -u +"%Y-%m-%dT%H:%M:%SZ"'
    alias beep-multi='printf "\a\a\a\a\a"'
    is_regular_readable_file ~/.my_functions_mac.sh && . ~/.my_functions_mac.sh
    ;;
  msys)
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias l1='ls -1 --color=auto'
    # Choose --time-style=iso _OR_ --time-style=long-iso
    alias ll='ls -l --color=auto --time-style=iso'
    alias lla='ls -la --color=auto --time-style=iso'
    ;;
  cygwin)
    ;;
esac

# ------------- Project-specific settings --------------
is_regular_readable_file ~/.my_bashrc_for_proj.sh && . ~/.my_bashrc_for_proj.sh
