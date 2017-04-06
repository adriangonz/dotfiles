# Taken from https://gist.github.com/beaugunderson/3896289

function loadenv_inner() {
   cat .env | while read line; do
      echo export $line
   done
}

function loadenv() {
   if [ -f .env ]; then
      eval `loadenv_inner`
   else
      echo No .env file in `pwd`
   fi
}
