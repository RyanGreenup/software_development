# Documentation

Documentation is arguably the most important part of software development. Documentation needs to target developers and users alike. Many programming languages have an API documentation:

- Python
    - pdoc [^1720952218]
    - pdoc3
    - sphinx
    - doxygen
    - pydoc
    - pydoctor
- Rust
    - cargo doc


For user facing documentation, there are a few approaches.

Traditionally documentation was contained in a `man` page and the `--help` was quite lean, see most applications in e.g. OpenBSD. For a simple example, compare the help output of `tmux` with the output of `rg --help`.

Nowadays, the convention is to use a static site generator. This is a good approach because it allows for the documentation to be versioned and easily searchable. The most popular static site generators are

- mkdocs
- 11ty
- Docusaurus
- Docsify
- mdbook
- quartz
- Hugo
- Jekyll


Search the internet for "Awesome Static Site List" and you will find a list of static site generators on a Git repo, e.g. [^1720953172] or look at jamstack [^1720953252]. My recommendation is mdbook, mkdocs or quartz as I've had success with those in the past.


Markdown editors:


- Vscode
- Vim
- Emacs
- Zettlr
- Vnote
- Marktext
- Zettlr (wysiwym!)
- Qownnotes
- https://github.com/KDE/ghostwriter
- https://apps.kde.org/marknote/
- klevernotes


Notetaking

It is just as important to take notes and keep a log, that way when things break you can go back and see what you did

try out:

- joplin
- zettlr
- vnote
- obsidian


[^1720953252]: [Static Site Generators - Top Open Source SSGs | Jamstack](https://jamstack.org/generators/)

[^1720953172]: [myles/awesome-static-generators: A curated list of static web site generators.](https://github.com/myles/awesome-static-generators?tab=readme-ov-file#science)



[^1720952218]: [pdoc – Auto-generate API documentation for Python projects](https://pdoc3.github.io/pdoc/)



Writing documentation


See style by williams and strunk and

and style by eb white.
