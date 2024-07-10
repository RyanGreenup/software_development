# IT1010 -- Statistics

## Running the Book

```
cargo add \
    mdbook \
    mdbook-katex \
    mdbook-catppuccin \
    mdbook-callouts \
    mdbook-yml-header \
    mdbook-mermaid \
    mdbook-toc \
    just \
    --force

# mdbook-catppuccin install
# mdbook-mermaid install
just serve
```

### Troubleshooting
I cannot get mdbook to watch the files for me :shrug:

Consider increasing inotify limits

```sh
echo 256   | sudo tee /proc/sys/fs/inotify/max_user_instances
echo 749024| sudo tee /proc/sys/fs/inotify/max_user_watches
```
