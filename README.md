# tgenv
[Terraform](https://www.terragrunt.io/) version manager inspired by [tfenv](https://github.com/kamatama41/tgenv)


## Support
Currently tgenv supports the following OSes
- Mac OS X (64bit)
- Linux (64bit)

## Installation

1. Check out tgenv into any path (here is `${HOME}/.tgenv`)

  ```bash
  $ git clone https://github.com/cunymatthieu/tgenv.git ~/.tgenv
  ```

2. Add `~/.tgenv/bin` to your `$PATH` any way you like

  ```bash
  $ echo 'export PATH="$HOME/.tgenv/bin:$PATH"' >> ~/.bash_profile
  ```

  OR you can make symlinks for `tgenv/bin/*` scripts into a path that is already added to your `$PATH` (e.g. `/usr/local/bin`) `OSX/Linux Only!`

  ```bash
  $ ln -s ~/.tgenv/bin/* /usr/local/bin
  ``` 

## Usage
### tgenv install
Install a specific version of Terraform  
`latest` is a syntax to install latest version
`latest:<regex>` is a syntax to install latest version matching regex (used by grep -e)

```bash
$ tgenv install 0.7.0
$ tgenv install latest
$ tgenv install latest:^0.8
```

If you use [.terragrunt-version](#terragrunt-version), `tgenv install` (no argument) will install the version written in it.

### tgenv use
Switch a version to use
`latest` is a syntax to use the latest installed version
`latest:<regex>` is a syntax to use latest installed version matching regex (used by grep -e)

```bash
$ tgenv use 0.7.0
$ tgenv use latest
$ tgenv use latest:^0.8
```

### tgenv uninstall
Uninstall a specific version of Terraform
`latest` is a syntax to uninstall latest version
`latest:<regex>` is a syntax to uninstall latest version matching regex (used by grep -e)

```bash
$ tgenv uninstall 0.7.0
$ tgenv uninstall latest
$ tgenv uninstall latest:^0.8
```

### tgenv list
List installed versions

```bash
% tgenv list
0.12.15
0.12.8
0.10.0
0.9.9
```

### tgenv list-remote
List installable versions

```bash
% tgenv list-remote
0.12.15
0.12.14
0.12.13
0.12.12
0.12.11
0.12.10
0.12.9
0.12.8
0.12.7
0.12.6
0.12.5
0.12.4
0.12.3
0.12.2
0.12.1
0.12.0
0.11.1
0.11.0
0.10.3
0.10.2
0.10.1
0.10.0
0.9.9
...
```

## .terragrunt-version
If you put `.terragrunt-version` file on your project root, tgenv detects it and use the version written in it. If the version is `latest` or `latest:<regex>`, the latest matching version currently installed will be selected.

```bash
$ cat .terragrunt-version
0.9.9

$ terragrunt --version
Terraform v0.9.9

Your version of Terraform is out of date! The latest version
is 0.7.3. You can update by downloading from www.terragrunt.io

$ echo 0.9.9 > .terragrunt-version

$ terragrunt --version
Terraform v0.7.3

$ echo latest:^0.10 > .terragrunt-version

$ terragrunt --version
Terraform v0.10.3
```

## Upgrading
```bash
$ git --git-dir=~/.tgenv/.git pull
```

## Uninstalling
```bash
$ rm -rf /some/path/to/tgenv
```

## LICENSE
- [tgenv itself](https://github.com/cunymatthieu/tgenv/blob/master/LICENSE)
- [tfenv ](https://github.com/kamatama41/tgenv/blob/master/LICENSE) : pkenv mainly uses tfenv's source code

