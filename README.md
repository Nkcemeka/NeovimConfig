# Nvim Setup
This is my personal neovim setup. It contains my personal code, ideas and other tips gotten from the web.I won't say this repo offers a fully-featured IDE, but at least it offers linting, syntax-checking, autocompletion etc.

## Answers to Prospective Questions
- Feel free to use my repo to startup your neovim journey
- If you are confused about anything, shoot me an email [here](mailto:nkcemeka@gmail.com)

## Linux Installation Steps
- Install neovim. I suggest you do this manually by extracting the zip or tar file to your home directory. Using the apt-manager will use a stale version which might be incompatible with Lazy.
- Clone this repo to the .config folder and rename it to nvim
- Install value on your Linux distro. Check [here](https://vale.sh/docs/vale-cli/installation/)
- Run nvim in your terminal and the required packages would be downloaded

## Windows Installation
- Install the chocolatey package manager on Windows Powershell
- Install neovim with chocolatey
- In $HOME/AppData/Local (Ignore my path inaccuracies), clone this repo and rename it to nvim
- Install vale from chocolatey to help with the linting process
- Viola, you are done! Everything should work perfectly.

## Notes
- The code is littered with comments. I use that to help me understand. 
- The current repo offers functionality for Python and C++. I will add more with time
- If there is anything I should include that will be of help, let me know!
- Some plugins like NvimTree and Mason allow you get help by pressing 'g?'
- My options settings are being overridden by a python.nvim plugin. Will fix it if I get an easy way
- My python linter is pycodestyle and the LSP is jedi. You need to go to: ~/.local/share/nvim/mason/packages/jedi_language_server/venv/venv.cfg and set its include-site-system-pacakes to true. The same applies if you setup cpplint as a linter
- To install pycodstyle, run pip install pycodestyle
- To see hover information, go to command mode and press <SHIFT>+k


## Pycodestyle Settings
Pycodestyle is a good linter but can keep producing certain annoying warnings. To disable it, do the following:
- Go to ~/.config. For Windows, I think you would have to go to C:\Users\<username>
- Create a file called pycodestyle 
- Type the following below
[pycodestyle]
max-line-length = 100
ignore = E226
<br>
To see more warnings to ignore, check out the pycodestyle docs [here](https://pep8.readthedocs.io/en/stable/intro.html).
