# Git

## Student Activities

Use GPT4 and the `git` documentation to complete the following activities on your personal markdown notes or some personal code base:

- [ ] Create a new branch
- [ ] Push Branch
- [ ] Make changes
- [ ] Run Tests
- [ ] Commit changes
- [ ] Squash Merge
- [ ] Delete Branch
- [ ] Time Machine
    - Write a CLI for a time machine as discussed below



### Time Machine

Emacs has a feature called git-time-machine which allows moving backward and forward through the commits in a document. It is very handy


implement one in vim to go forward by doing


```
nmap <leader>g :!git checkout HEAD~1<CR>
```

Going forward is a bit more difficult, the following can be used to get an array of all hashes:


```python
import subprocess

# Top of this is current HEAD
log_command = ["git", "log"]
# Top of this is latest commit
log_command += "main"  # main is branch

# Get the complete log
subprocess.run(log_command, stdout=subprocess.PIPE, text=True)
```

Process the string into a class that contains:

    - hash
    - message

Write a program called `git-time-machine` that exports a binary called `gtx` that takes two commands:

  - `gtx back` - moves back one commit
  - `gtx forward` - moves forward one commit

Use poetry to track the dependencies and use click, typer or the built-in argparse to parse the commands.

Note, when using poetry, the following command can be used to install the binary:

```bash
poetry install .
```

if the entry point is configured correctly in `pyproject.toml` then the binary will be available in the shell.

```toml
[tool.poetry]
name = "git_time_machine"
packages = [ {include = "*", from="src"} ]

[tool.poetry.scripts]
gtx = "main:cli"
```

Where:
    - `src` is denoted as the subdirectory for the source code
        - By default Poetry looks for a directory the project name, i.e. `git_time_machine/`
    - `main` is the name of the python module (e.g. main.py)
    - `cli` is the entry point for the script.
        - This could also be `main()` depending on how you write the code.

