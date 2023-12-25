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
    run_poetry
    create_git_env
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

run_poetry() {
  poetry init -n -q
  poetry add ruff mkdocs mkdocs-material mkdocstrings-python pytest pre-commit -q
  poetry run mkdocs new . -q
}

config_ruff() {
  echo "\n" >> pyproject.toml
  echo "[tool.ruff]
select = ['I', 'D']
extend-exclude = ["tests"]
extend-ignore = ["D201", "D213"]

[tool.ruff.lint.pydocstyle]
convention = "google"" >> pyproject.toml

}

create_git_env() {
  git init -q
  poetry run pre-commit install
  write_pre_commit_file
  git add . 
  git commit -m 'Commit inicial automatizado por buildr' -q
}

write_pre_commit_file() {    
  echo "repos:
  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.1.7
    hooks:
      - id: ruff
        args: [ --fix ]
      - id: ruff-format" >> .pre-commit-config.yaml
}
