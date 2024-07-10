set shell := ["fish", "-c"]

serve:
    cd mdbook && mdbook serve -n 0.0.0.0 --port 8839 --watcher=native

build:
    cd mdbook && mdbook build
