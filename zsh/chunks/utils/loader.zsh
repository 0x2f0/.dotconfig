# Loads all the scripts from the provided dir. 
function auto_load_scripts_in_dir() {
  if ! [ -d "$1" ];then
    echo "[auto_load_scripts_in_dir] Either no or invaild dir provided"
    return 1;
  fi

  # Loads all the completions
  for script in "$1"*; do
      if [[ -f "$script" && $(basename "$script") != "loader.zsh" ]];then
          source "$script"
      fi
  done
}
