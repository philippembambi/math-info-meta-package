#!bin/bash
echo "Veillez patienter ..."
install_dependencies(){
    sudo apt install equivs
}
build_packages(){
    equivs-build ./packages/package-all
    equivs-build ./packages/package-chrome
    equivs-build ./packages/package-lamp-env
    equivs-build ./packages/package-java
    
    sudo apt install ./packages/package-all_1.0_all
    sudo apt install ./packages/package-chrome_1.0_all
    sudo apt install ./packages/package-lamp-env_1.0_all
    sudo apt install ./packages/package-java_1.0_all
}

install_dependencies
build_packages

provided_apps=("vscode", "chrome", "framework.net", "netbeans", "codeblock", "lamp")
echo -e ""
echo "Salut $USER !"
echo -e ""
echo "*********** Bienvenue au departement de MATH-INFO *********** "
echo -e ""
echo "Voici la liste des programmes utiles pour un étudiant en formation"

for app in "${provided_apps[@]}"
do
echo "$app"
done

echo -e ""
echo "Listez vos programmes de choix séparés par des espaces [all : pour tout sélectionner]"
echo -e ""
read -a apps

if [ "${apps[0]}" == "all" ]
then
    echo "Vous avez choisi de tout installer !"
else
    echo "Vous avez selectionné : ${apps[@]}"
fi