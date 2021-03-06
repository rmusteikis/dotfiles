function cbfile {
  [[ "$#" != 1  ]] && return 1
  local file_to_copy=$1
  cat $file_to_copy | xsel --clipboard --input
}

function cbdir {
  pwd | tr -d "\r\n" | xsel --clipboard --input
}

function gi() { curl https://www.gitignore.io/api/$@ ; }

function xsb() {
  [[ "$#" != 1  ]] && return 1
  x-seen-by $1 | sed 's/,/\n/g'
}

function rc() {
  [[ "$#" != 2  ]] && return 1
  for x in {$1..$2}; echo $x && xfce4-screenshooter -r -s "/home/slicklash/code/pwa2/public/img/q_sign_$x.png"
}

_gitignireio_get_command_list() {
  curl -s https://www.gitignore.io/api/list | tr "," "\n"
}

_gitignireio () {
  compset -P '*,'
  compadd -S '' `_gitignireio_get_command_list`
}

compdef _gitignireio gi
