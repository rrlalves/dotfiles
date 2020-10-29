# Some useful aliases.
alias texclean='rm -f *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky'
alias clean='echo -n "Really clean this directory?";
  read yorn;
  if test "$yorn" = "y"; then
     rm -f \#* *~ .*~ *.bak .*.bak  *.tmp .*.tmp core a.out;
     echo "Cleaned.";
  else
     echo "Not cleaned.";
  fi'
alias h='history'
alias j="jobs -l"
alias l="ls -l "
alias ll="ls -alF"
alias la='ls -A'
alias ls="ls -F"
alias pu="pushd"
alias po="popd"
alias gg='grep -RIsin --exclude-dir={build,test,.git} --exclude={tags,*.html,*.js}'

alias rdesktop='rdesktop -u rlalves -d padtec -g 1900x1024'
alias netuno='rdesktop netuno -a 16'

# Set terminal title
if [ "$color_prompt" = yes ]; then
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0m\033[1;32m\]\$(parse_git_branch)\[\033[00m\]\$ "
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Function wich gets the git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ <\1>/'
}

#
# Csh compatability:
#
alias unsetenv=unset
function setenv () {
  export $1="$2"
}

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

# "repeat" command.  Like:
#
# repeat 10 echo foo
repeat ()
{
    local count="$1" i;
    shift;
    for i in $(_seq 1 "$count");
    do
        eval "$@";
    done
}

# Subfunction needed by `repeat'.
_seq ()
{
    local lower upper output;
    lower=$1 upper=$2;

    if [ $lower -ge $upper ]; then return; fi
    while [ $lower -lt $upper ];
    do
 echo -n "$lower "
        lower=$(($lower + 1))
    done
    echo "$lower"
}

# export JAVA_HOME="/usr/java/jre1.8.0_221"
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash
