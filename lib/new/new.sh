# ./lib/new/new.sh
#!/bin/bash

execute_new_command() {
  if [ "$1" = "" ]; then
    echo "Error: Necessário especificar o nome do projeto após o comando 'new'"
    exit 1
  else
    echo "Construindo workspace do projeto '${1}'"
    create_base_directories $1
    cd $1
    create_gitignore_file
    create_readme_file $1
    poetry init -n -q
    poetry add ruff mkdocs mkdocs-material mkdocstrings-python pytest
    git init
    git add .
    git commit -m 'Commit inicial automatizado por buildr'
    exit
  fi
}

create_base_directories() {
  mkdir $1
  mkdir $1/docs $1/tests $1/$1

}

create_gitignore_file() {
    curl -o .gitignore -sS https://www.toptal.com/developers/gitignore/api/python
}

create_readme_file() {
    touch README.md
    printf "%s\n" "# $1 README" "" "Gerado por buildr." \
                "Em desenvolvimento." > README.md
}