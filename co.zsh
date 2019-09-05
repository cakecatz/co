function co_setup() {
  export CO_PECO_FILTER=${CO_PECO_FILTER:-IgnoreCase}
}

function co() {
  git branch -a --sort=-authordate | cut -b 3- | perl -pe 's#^remotes/origin/###' | perl -nlE 'say if !$c{$_}++' | grep -v -- "->" | peco --initial-filter $CO_PECO_FILTER | xargs git checkout
}

co_setup
