# Nvim Setup
This is my personal neovim setup. It contains my personal code, ideas and other tips gotten from the web. </br>
I won't say this repo offers a fully-featured IDE, but at least it offers linting, syntax-checking, auto- </br>
completion etc. I will add more with time if I feel it is useful. 

## Answers to Prospective Questions
- Feel free to use my repo to startup your neovim journey
- If you are confused about anything, shoot me an email [here](mailto:nkcemeka@gmail.com)

## Notes
- The code is littered with comments. I use that to help me understand. 
- The current repo offers functionality for Python and C++. I will add more with time
- If there is anything I should include that will be of help, let me know!
- Some plugins like NvimTree and Mason allow you get help by pressing 'g?'
- My options settings are being overridden by a python.nvim plugin. Will fix it if I get an easy way
- My python linter is pycodestyle and the LSP is jedi. You need to go to: ~/.local/share/nvim/mason/packages/jedi_language_server/venv/venv.cfg and set its include-site-system-pacakes to true/
- To install pycodstyle, run pip install pycodestyle
- To see hover information, go to command mode and press <SHIFT>+k

## Installation Steps
- Install neovim
- Place this repo in the .config folder and rename it to nvim
- Run nvim in your terminal and the required packages would be downloaded

## Pycodestyle Settings
Pycodestyle is a good linter but can keep producing certain annoying warnings. To disable it, do the following:
- Go to ~/.config
- Create a file called pycodestyle .
- Type the following below
[pycodestyle]
max-line-length = 100
ignore = E226
<br>
To see more warnings to ignore, check out the pycodestyle docs [here][https://pep8.readthedocs.io/en/stable/intro.html]
