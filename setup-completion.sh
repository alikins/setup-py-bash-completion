# bash completion for buildr                       -*- shell-script -*-
# http://github.com/alikins/buildr-bash-completion
#

_setup_py_global_help()
{
    COMPREPLY=( $( compgen -W '$( _parse_help "$1" --help )' -- "$cur" ) )
}


_setup_py_sub_command()
{
    local TARGETS=$("$1" --help-commands |  grep "^\s\s\w" | awk '{ print $1; }' )
    # use any help targets as well
    COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "${TARGETS}" -- ${cur}) )
}

_setup_py()
{
    local cur prev words cword cmd cmd_index

    COMPREPLY=()
    _get_comp_words_by_ref cur prev


    #seearching for the command
    # (first non-option argument that doesn't follow a global option that
    #  receives an argument)
    for ((i=1; $i<=$COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
        if [[ ${COMP_WORDS[i-1]} != "-"* ]]; then
        cmd="${COMP_WORDS[i]}"
        cmd_index=$i
        break
        fi
    fi
    done

    # if prev and cur is empty, show sub commands and help
    # if cur is empty and prev is a optional arg (--), then show help args and sub commands
    # if prev is a subcommand , show sub command help

    # find sub command args from help
    if [[ -n "$cmd" ]]; then
        COMPREPLY=( $( compgen -W '$( _parse_help "$1 $cmd" --help )' -- "$cur" ) )

    # ask for optional arg match
    elif [[ "$cur" == -* ]]; then
        #COMPREPLY=( $( compgen -W '$( _parse_help "$1" --help )' -- "$cur" ) )
        _setup_py_global_help "$1"

    # try to find a sub command or global help options
    else
        _setup_py_global_help "$1"
        _setup_py_sub_command "$1"
    fi

}

complete -F _setup_py setup setup.py
# ex: ts=4 sw=4 et filetype=sh
