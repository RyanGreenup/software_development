# Dependency Mangement

One of the reasons for using Rust in this subject is that it has a very good dependency management system. This is a very important feature of a programming language, as it promotes reproducability. Source based operating systems such as Gentoo or even ports in BSD / Arch are a great example of the importance of this topic. As a user I have struggled to get software installed because the author of the port was unable to keep up with changing dependencies. As a developer and researcher I have struggled to run the projects of others which often means I need to repeat the work of others needlessly.


- python poetry
    - pipx
- Dynamic vs Static linking
    - Why is this important?
        - Security
            - Libraries can be updated independently
        - Performance
            - Smaller binaries
    - The move toward static binaries
        - many languages
            - Go
            - Rust
            - musl
            - zig
        - Reproducable
        - easy
            - `rsync -a ~/.cargo/bin user@host:~/.cargo/`
- Rust
    - Static Binaries and musl
- [ ] virtual environment
- [ ] Isolation
    - chroots and bubble wrap
    - Docker and podman
        - toolbox
        - distrobox



Python has quite a few, this article [^1720952643] documents it all quite well.

- poetry
- pipenv
- conda
- virtualenv
- pip

[^1720952643]: [Dublog: Python Package Managers](https://dublog.net/blog/so-many-python-package-managers/)
