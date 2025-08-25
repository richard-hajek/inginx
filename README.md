# Inginx 

Nginx is a really powerful software, but it requires non-trivial configuration and its own working directory. Command-line configuration is possible but verbose.

This utility creates a temporary working directory and assembles an Nginx configuration optimized for common use cases.

> The name “inginx” is derived from “instant Nginx” (in🍸x)


# Installation

## pipx/uvx/....

Ideal solution, but needs uvx, or pipx pre-installed
This is the most painless solution

```
uvx inginx --help
```

```
pipx install inginx
inginx --help
```

## pip

```
pip install --user inginx --break-system-packages
```

> [!WARNING]
> This is generally not recommended. It works-ish in this case because inginx does not have any dependencies


## Manual

```
wget https://raw.githubusercontent.com/richard-hajek/inginx/refs/heads/main/inginx/inginx.py -O ~/.local/bin
chmod +x ~/.local/bin/inginx
```

> [!WARNING]
> Check that ~/.local/bin is in your path by doing echo $PATH and checking, with your eyes, if '.local/bin' is there
> If not, good luck, have fun, see https://askubuntu.com/questions/440691/add-a-binary-to-my-path


# Usage

```
usage: inginx [-h] [-e executable] [-p directory] [-s directory] [-r remote]
              [-l address[:port]] [-d] [-t]

Spawn single use nginx instances

options:
  -h, --help            show this help message and exit
  -e, --executable executable
                        Which nginx executable to use. By default will try freenginx, nginx, in this order
  -p, --prefix directory
                        What directory to use as nginx prefix. By default will use tempfile.TemporaryDirectory
  -s, --serve directory
                        Use to setup a filesystem directory. Will be pasted directly into the root directive https://freenginx.org/en/docs/http/ngx_http_core_module.html#root
  -r, --reverse remote  Use to setup a reverse proxy. Will be pasted directly into the proxy_pass directive https://freenginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass
  -l, --listen address[:port]
                        What address to listen to. Will be pasted directly into the listen directive https://freenginx.org/en/docs/http/ngx_http_core_module.html#listen
  -d, --dry             Construct the config, print it, and exit.
  -t, --test            Construct the config, run nginx test on it and exit
```
