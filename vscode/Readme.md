# Vscode config

## Update extension list

```sh
code --list-extensions > extension-list
```

## install extensions

```sh
cat extension-list | xargs -L 1 code --install-extension
```