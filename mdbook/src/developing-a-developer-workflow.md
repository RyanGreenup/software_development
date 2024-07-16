# Developing a Developer Workflow
## Introduction
This subject develops skills around best practices in software development. This all starts with developing habits workflows, which itself begins with a knowledge and understanding of the tools and approaches that have been widely adopted in the community.

These are written, broadly, in an order to help you get started.
## Version Control
### What is Version Control
Version control is analogous to track changes in something like *Microsoft Word*. It's a long list of changes that have been made to a document, but it's a lot more powerful than that. It allows you to see who made the changes, when they were made, and why they were made [^1720957340]. It also allows you to revert to a previous version of the document if you make a mistake and have multiple versions simultaneously.

There are multiple version control systems such as SVN, Mercurial and CVS but the most popular is *Git*. Git is a distributed version control system, which means that every user has a complete copy of the repository on their local machine. This allows you to work offline and collaborate with others without needing to be connected to the internet.

In this class we will use git to track changes to our documentation, code and notes. We will use a convention called *Conventional Commits* to ensure that our commit messages are meaningful and easy to understand. Finally, we will be using `git` to collaborate with each other and submit pull requests.
### Learning `git`
The best way to learn `git`, like most things, is to use it. Start, right now, using `git` to track your notes, assessments and dotfiles, within a couple weeks you will have the basics down pat.
### Using `git`
It's important to understand the structure of the `.git/config` and the basics of the CLI, but most of the time you'll find it easier to use a UI like `gitui`. These are much quicker to use and easier to understand.
### Actionables
- [ ] Install `git` and `gitui`
    - `pacman -S git rustup`
    - `rustup init -y && rustup default nightly`
    - `cargo install gitui`
- [ ] Create a git repo for your notes
    ```sh
    mkdir -p ~/Notes/slipbox/
    cd ~/Notes/slipbox/
    git init
    gitui
    ```
- [ ] Create a git repo for your dotfiles
    - See generally [^1720958305]

[^1720958305]: [RyanGreenup/DotFiles: All my DotFiles and Templates](https://github.com/RyanGreenup/DotFiles)
[^1720957340]: Assuming the author was a good person and made meaningful commit messages.

## Notetaking
As a developer, you must write down everything that you do. This is important for a number of reasons, but the most important is that it allows you to reflect on your work and improve.

Pick a piece of software, write atomic self contained notes and link to them, there's pleanty of community resources for this so I'll simple recommend some software, offer some pointers and leave it at that.

### Software

- Tasks
    - Org Mode
        - Use this to keep a todo list and log of your work.
- Notes
    - Obsidian (⚠ Non-Free)
    - Zettlr
    - Vnote
    - Dokuwiki
    - VSCode + Quartz
    - Joplin
        - ⚠ Doesn't support markdown links

Have a browse through the list on [r/pkms](https://www.reddit.com/r/PKMS/comments/nfef59/list_of_personal_knowledge_management_systems/).

### Tips

- Keep your notes atomic
    - One note, one idea
- Link your notes
    - Rather than one long note, link to other notes
- Use `git` to track your notes.
- Use a flat file structure

### Reflections
I, personally, use a combination of NeoVim, VSCode, Quartz and a CLI I wrote that implements search, linking etc. I also use *Dokuwiki* and Org Mode in between. Org mode is great for tracking notes and snippets on a current project.

There's lots of online resources such as [^1720959655] [^1720959668]

[^1720959668]: [Zettelkasten](https://www.reddit.com/r/Zettelkasten/)

[^1720959655]: [Digital Gardens](https://www.reddit.com/r/DigitalGardens/)


For many of the topics in this class, there will be additional workshops held on Thursday's that will serve as assistance for the topics covered. These workshops are only a supplement to the research and self-development required to succeed in this subject.

- Git
- Notetaking
- Installing Python
    - Correctly
- Installing Rust
- Introduction to distrobox
- dotfiles
- Basic usage of the shell
    - TUIs
        - gitui
        - yazi
    - CLI
        - ripgrep
        - fd
        - bat
        - fzf
        - Pandoc
    - Editors
        - Jupyter
        - VsCode
        - Neovim
            - Astrovim
            - lazyVim
            - My Neovim Config
            - Mini Vim
        - Emacs
    - Shells
        - Posix
            - Zsh
        - Friendly
            - Fish
            - Xonsh
            - Elvish
- Notetaking
    - Org Mode
    - Markdown
        - Obsidian
        - Vnote
        - Jopline

Software is configured through dotfiles. A developer must manage and track there dotfiles in order to ensure there work is reproducable. I recommand a bare git repo under `$HOME` [^1720954338] [^1720954344], however tools like Stow and Chezmoi are good too.


Need to cover LSP, go to definition, find references.

How to use local LLms, and tools like copilot.

Which languages they perform the best on. The codellama paper and stableLM paper have good summaries. TL;DR Python, Javascript and rust. Avoid Bash or Kotlin.

Need to cover notetaking and keeping a log of work. Org mode is quite good for this.

Need to cover make, just and


Developer tooling, vim emacs and vscode. How to use them effectively.

Learning lua and writing a vim config can automate **a lot**. Simply writing shell/py scripts and shelling out in neovim is a simple and easy way to cut through a lot of repetition without diving into the intricacies and depth of vim / emacs. Configuring VSCode is a lot more involved, but it is a lot more feature rich out of the box. It's important to learn all of these editors at a cursory level because editing text is the bread and butter of software development. Above all it is crucial to develop a workflow that is comfortable and efficient for you. I recommend starting with VSCode and then moving to vim or emacs as you become more comfortable with the language you are working with.


Managing dotfiles.

