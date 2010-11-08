### Read .osc/$1 from current and previous dir
function _op() {
    for i in '.' '../'; do
        [ -r "${i}/.osc/${1}" ] && printf "%s\n" $(< ${i}/.osc/${1}) && return 0
    done
    return 1
}

### Print the project name from current or parent dir
function opr() {

    _op "_project"

}

### Print the package name from current or parent dir
function opk() {

    _op "_package"

}

### Print the project/pakage from current or parent dir
function opp {

    local _project _package
    _project=$(opr)
    _package=$(opk)

    if [[ -n "${_project}" && -n "${_package}" ]]; then
        printf "%s/%s\n" $(opr) $(opk)
        return 0
    fi
    return 1

}
