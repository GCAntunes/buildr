# ./test/buildr_test.sh

#!/usr/bin/env bats

load test_helper

setup() {
  rm -rf testing && mkdir testing
  cd testing
}

teardown() {
  cd ..
  rm -rf testing
}

@test "Executa comando 'new'" {
  run $BUILDR new
  [ "$status" -eq 1 ]
  [ "${lines[0]}"="Necessário especificar o nome do projeto após o comando 'new'" ]
}

@test "Executa comando new com nome de projeto" {
  run $BUILDR new testrb

  [ "$status" -eq 0 ]
  [ "${lines[0]}"="Construindo workspace do projeto 'testrb'" ]
}