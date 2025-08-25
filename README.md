# Inginx 

Nginx is a really powerful software, but it requires non-trivial configuration and its own working directory. Command-line configuration is possible but verbose.

This utility creates a temporary working directory and assembles an Nginx configuration optimized for common use cases.

> The name “inginx” is derived from “instant Nginx”

## Examples

### Serve file system

Serve a directory `./dir` on `8787`

```
inginx --serve ./dir --listen 0.0.0.0:8787
```

Output:

```
Running /usr/bin/freenginx in /tmp/tmpu8151mtc
127.0.0.1 - - [25/Aug/2025:11:18:50 +0200] "GET / HTTP/1.1" 200 263 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0"
....
```

### Reverse proxy

Start a reverse proxy up to `https://echo.free.beeceptor.com` on `8080`

```
inginx --reverse https://echo.free.beeceptor.com --listen 0.0.0.0:8080
```

Output:
```
Running /usr/bin/freenginx in /tmp/tmpo66xmvm_
127.0.0.1 - - [25/Aug/2025:11:21:03 +0200] "GET / HTTP/1.1" 200 844 "-" "Mozilla/5.0 (X11; Linux x86_64; rv:141.0) Gecko/20100101 Firefox/141.0"
...
```

## Common Flags

- `--serve <directory>` - Serve a local filesystem directory

- `--reverse <remote>` - Set up a reverse proxy

- `--listen <address[:port]>` - Tell Nginx what address/port to use

# Installation

This is a self-contained script that has no dependencies. It is aiming to work on as old Python as 3.7.

## Managed installation (uvx, pipx)

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
> This is generally not recommended. It will work and not break anything in this case because inginx does not have any dependencies.


## Manual

```
wget https://raw.githubusercontent.com/richard-hajek/inginx/refs/heads/main/inginx/inginx.py -O ~/.local/bin
chmod +x ~/.local/bin/inginx
```

> [!WARNING]
> Check that ~/.local/bin is in your path by doing echo $PATH and checking, with your eyes, if '.local/bin' is there
> If not, good luck, have fun, see https://askubuntu.com/questions/440691/add-a-binary-to-my-path for detailed instructions how to manage your $PATH


# Advanced configuration

This tool is not indended for advanced configuration. It will however provide you with a good starting point. If you want to further customize the nginx instance, do

```
mkdir ./prefix
cd ./prefix
inginx <your configuration> --dry > nginx.conf
```

and then make any changes you want to the generated nginx.conf

And run your nginx with

```
freenginx -p $(realpath .) -c $(realpath ./nginx.conf)
```
