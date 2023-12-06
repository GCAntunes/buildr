# ./config/install.sh
#!/bin/bash
script_pwd=$(pwd)
if [ -d $HOME/bin/buildr ]; then
  echo "buildr já está instalado nessa máquina"
else
  mkdir -p $HOME/bin/buildr && cd $HOME/bin/buildr
  echo "Instalando buildr"
  mkdir lib
  cp -r $script_pwd/lib/* ./lib
  cp $script_pwd/buildr .
  echo "Adicionando buildr aos comandos do zsh"
  echo "export PATH=${HOME}/bin/buildr:${PATH}" >> ~/.zshrc
  echo "Instalação completa"
fi