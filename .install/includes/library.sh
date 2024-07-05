#!/bin/bash
#  _     _ _                           
# | |   (_) |__  _ __ __ _ _ __ _   _  
# | |   | | '_ \| '__/ _` | '__| | | | 
# | |___| | |_) | | | (_| | |  | |_| | 
# |_____|_|_.__/|_|  \__,_|_|   \__, | 
#                               |___/  
#  
# by Benjamin Palko 
# ----------------------------------------------------- 

# ------------------------------------------------------
# Function: Is package installed
# ------------------------------------------------------
_isInstalledApt() {
    package="$1";
    check=$(dpkg-query -W --showformat='${Status}\n' $package | grep "install ok installed")
    if [ ! -z "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalledFlatpak() {
    package="$1";
    check="$(flatpak list | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalledSnap() {
    package="$1";
    check="$(snap list | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isInstalledBrew() {
    package="$1";
    check="$(brew list | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_isFolderEmpty() {
    folder="$1"
    if [ -d $folder ] ;then
        if [ -z "$(ls -A $folder)" ]; then
            echo 0
        else
            echo 1
        fi
    else
        echo 1
    fi
}

# ------------------------------------------------------
# Function Install all package if not installed
# ------------------------------------------------------
_installPackagesApt() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledApt "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        echo "All apt packages are already installed.";
        return;
    fi;
    echo "Installing packages" "${toInstall[@]}"
    sudo apt-get install "${toInstall[@]}" -y;
}

_installPackagesFlatpak() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledFlatpak "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        echo "All flatpak packages are already installed.";
        return;
    fi;

    flatpak install "${toInstall[@]}" -y;
}

_installPackagesSnap() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledSnap "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        echo "All snap packages are already installed.";
        return;
    fi;

    sudo snap install "${toInstall[@]}";
}

_installPackagesBrew() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalledBrew "${pkg}") == 0 ]]; then
            echo ":: ${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;

    if [[ "${toInstall[@]}" == "" ]] ; then
        echo "All brew packages are already installed.";
        return;
    fi;

    brew install "${toInstall[@]}";
}

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
_installSymLink() {
    name="$1"
    symlink="$2";
    linksource="$3";
    linktarget="$4";
    
    if [ -L "${symlink}" ]; then
        rm ${symlink}
        ln -s ${linksource} ${linktarget} 
        echo ":: Symlink ${linksource} -> ${linktarget} created."
    else
        if [ -d ${symlink} ]; then
            rm -rf ${symlink}/ 
            ln -s ${linksource} ${linktarget}
            echo ":: Symlink for directory ${linksource} -> ${linktarget} created."
        else
            if [ -f ${symlink} ]; then
                rm ${symlink} 
                ln -s ${linksource} ${linktarget} 
                echo ":: Symlink to file ${linksource} -> ${linktarget} created."
            else
                ln -s ${linksource} ${linktarget} 
                echo ":: New symlink ${linksource} -> ${linktarget} created."
            fi
        fi
    fi
}

