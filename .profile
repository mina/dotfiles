if [[ -e ~/.myconfigs ]]
then
  if [[ $MY_CONFIGS != "loaded" ]]
  then
    source ~/.myconfigs
  fi
fi
