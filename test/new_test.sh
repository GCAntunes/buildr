# ./test/new_test.sh
#!/usr/bin/env bats

load test_helper

setup() {
    source ./lib/new/new.sh
    rm -rf testing && mkdir testing
    cd testing
}

teardown() {
    cd ..
    rm -rf testing
}

@test "Cria estrutura básica de pastas do projeto Python" {
    create_base_directories testrb
    [ -d "./testrb/" ]
    [ -d "./testrb/docs" ]
    [ -d "./testrb/tests" ] 
}

@test "Cria arquivo .gitignore" {
    create_gitignore_file

    [ -e "./.gitignore" ]
    [ "$(head -n 1 .gitignore)" = "# Created by https://www.toptal.com/developers/gitignore/api/python" ]
}

@test "Cria arquivo README.md" {
    create_readme_file testrb
    [ -e "./README.md" ]
    [ "$(head -n 1 README.md)" = "# testrb README" ]


}

@test "Cria estrutura básica completa do projeto Python" {
    run $BUILDR new testrb
    
    [ "$status" -eq 0 ]
    [ -d "./testrb/docs" ]
    [ -d "./testrb/tests" ] 
    [ -e "./testrb/.gitignore" ]
    [ -e "./testrb/README.md" ]
}