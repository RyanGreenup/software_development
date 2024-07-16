set shell := ["fish", "-c"]

serve:
    cd mdbook && mdbook serve -n 0.0.0.0 --port 8839 --watcher=native

build:
    cd mdbook && mdbook build

deploy:
    cd mdbook && mdbook build
    rm -rf /tmp/docs
    cp -r mdbook/book /tmp/docs
    git stash
    git checkout book
    cp -r /tmp/docs .
    git add .
    git commit -m "Update book"
    git push github book
    git checkout main
    git stash pop
