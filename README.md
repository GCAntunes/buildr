# buildr

## Aviso

O script desse repositório foi criado a partir desse artigo no [Medium](https://medium.com/@rdavid1099/create-a-simple-cli-with-shell-script-1-of-2-e9b22c7f1eaa), da autoria de **Ryan David Workman**.

Fiz algumas modificações pensando em um projeto Python e para funcionar no setup específico que uso, como o [zsh](https://www.zsh.org/) e o [Poetry](https://python-poetry.org/). 

## Pré-requisitos

Utilizar o shell [zsh](https://www.zsh.org/)
Ter o [Poetry](https://python-poetry.org/) instalado

## Introdução

buildr é um script que construi para agilizar meu fluxo de trabalho quando iniciando um novo projeto. Ele cria um pasta com a estrutura de diretórios básicas, adicionar os arquivos .gitignore e README.md e instala as seguintes bibliotecas utilizando o Poetry:

- ruff
- mkdocs
- mkdocstrings-python
- mkdocs-material
- pytest

## Instalação

Para instalar basta clonar o repositório:

```bash
git clone https://github.com/GCAntunes/buildr.git
cd buildr
```

Na sequência execute o arquivo de instalação
```bash
./config/install.sh
```

Remova os arquivos
```bash
cd ..
rm -rf buildr/
```

Ative o zsh para finalizar a instalação
```bash
exec zsh
```
