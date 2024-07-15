# Introduction to the Unit

This subject develops skills around best practices in software development using Python and Rust.

In this subject we will develop habits and reinforce workflows by writing software with tooling and approaches that have been widely adopted in the community.

This class begins by looking at documentation, debugging, version control and test driven development, comparing the approaches taken by Rust and python, this will be re-inforced by writing a CLI and a TUI in Rust or Python, students will be required to document every step in there notes, track changes with git via conventional commits [^1720952337] and asked to compare the development experience in both languages for documentation, tdd and typing.

[^1720952337]: [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#summary)


Students will be required to upload there work to a git repo, identify bugs in a students work and then submit and merge a pull request. It is totally acceptable to ask for guidance from the developer, but this must be done using the tooling of the chosen platform. Documentation must be uploaded as a static site to the repository.

We then look at developing a deeper understanding of OOP by comparing the implementation of Rust and python and re-inforcing this be developing an immediate-mode GUI in rust.

Finally we dive deeper into OOP with Python and develop a GUI.

This subject is entirely focused on practical implementation and reflection. There is no one right answer to software development and developers tend to have a lot of opinions. The aim here is to demonstrate how best practices


Need to cover LSP, go to definition, find references.

How to use local LLms, and tools like copilot.

Which languages they perform the best on. The codellama paper and stableLM paper have good summaries. TL;DR Python, Javascript and rust. Avoid Bash or Kotlin.




Need to cover notetaking and keeping a log of work. Org mode is quite good for this.

Need to cover make, just and


Developer tooling, vim emacs and vscode. How to use them effectively.

Learning lua and writing a vim config can automate **a lot**. Simply writing shell/py scripts and shelling out in neovim is a simple and easy way to cut through a lot of repetition without diving into the intricacies and depth of vim / emacs. Configuring VSCode is a lot more involved, but it is a lot more feature rich out of the box. It's important to learn all of these editors at a cursory level because editing text is the bread and butter of software development. Above all it is crucial to develop a workflow that is comfortable and efficient for you. I recommend starting with VSCode and then moving to vim or emacs as you become more comfortable with the language you are working with.


Managing dotfiles.

Software is configured through dotfiles. A developer must manage and track there dotfiles in order to ensure there work is reproducable. I recommand a bare git repo under `$HOME` [^1720954338] [^1720954344], however tools like Stow and Chezmoi are good too.

[^1720954344]: [RyanGreenup / bare_dot_go · GitLab](https://gitlab.com/RyanGreenup/bare_dot_go)
[^1720954338]: [RyanGreenup/DotFiles: All my DotFiles and Templates](https://github.com/RyanGreenup/DotFiles)


Slack, Mattermost and Matrix. We'll be using Matrix. Studen's are required to reach out to fellow students on Matrix in order to negotiate pull requests and ask for help. However, discussion that should be public should be done on the git repo. This is to ensure that the work is documented for the future.

Licencing. the difference between MIT, GPL and Apache. The importance of licencing your work and the implications of using other peoples work.



This will be broken up into three topics:


- Best Practices of Software Development
    - We're going to Write a CLI and a TUI in Rust and Python
- Object Oriented Programming
    - We're going to write a GUI in Rust
- Designing Object Oriented Software
    - We're going to write a GUI in Python


Throughout the semester, students will be maintaining each of the projects and submitting pull requests and issues to each other. This is to ensure that students are able to work in a team and that they are able to communicate effectively with each other.

Students will be required to document every step of the way, this will be done in markdown and uploaded to the repository as a static site.
