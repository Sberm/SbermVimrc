NVIM_CONFIG=~/.config/nvim

if [ ! -f $NVIM_CONFIG ]; then
  mkdir -p $NVIM_CONFIG
fi

cp -f init.vim $NVIM_CONFIG
cp -f .vimrc ~
