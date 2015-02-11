LS_COLORS="di=00;34:ln=00;35:so=00;32:pi=01;33:ex=00;31:bd=00;34"
if [[ "$(uname)" == "Darwin" ]]; then
	alias ls='ls -FHG'
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
	alias ls='ls --color=auto'
fi
