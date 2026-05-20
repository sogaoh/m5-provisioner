# m2-provisioner
My PC (M2 Mac) provisioner

since 
- [my previous "mba-provisioner"](https://github.com/sogaoh/mba-provisioner)
- [my previous "mba-provisioner2"](https://github.com/sogaoh/mba-provisioner2)


## Prerequisite

### OS
- macOS Sonoma ~  (zsh)
  - Mac mini (M2)
- macOS Sequoia ~  (zsh)
  - MacBook Air (M3)

### Security
- **Allow full access to terminal.app**
    - System Environment Settings -> Security & Privacy 

### Install
- Install Homebrew (refs https://brew.sh/)
  ```zsh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install Ansible
  ```zsh
  brew update
  brew install ansible
  ```

- Install aqua
  ```zsh
  brew update
  brew install aquaproj/aqua/aqua
  ```

- Install Rust (install cargo,rustup) 
  ```zsh
  brew update
  brew install rustup-init
  rustup-init
  ```

- Install Rosetta (refs https://support.apple.com/HT211861) [if necessary]


### Prepare
- Clone this repository
  ```zsh
  git clone https://github.com/sogaoh/m2-provisioner.git
  ```

- Set `variables.yaml` (If run `make ma`)
  ```
  mackerel_agent_apikey: "<your_key>"
  ```

- Create directory
  ```zsh
  mkdir -p ~/.config/peco
  mkdir -p ~/.config/bat
  mkdir -p ~/.zsh.d
  mkdir -p ~/.ssh/.identity
  mkdir -p ~/.ssh/conf.d
  chmod 700 ~/.ssh
  ```


### Run Setup

```bash
cd /path/to/m2-provisioner
```

```bash
make prezto   # probably just for me
```

```bash
make dot      # probably just for me
```


```bash
make gui
```

```bash
make cli
```

```bash
make aqu    # update
make aqi    # install
```

```bash
make rust
```


#### optional

```bash
make ma   # install mackerel-agent
```

```bash
make awsume   # setup awsume
```

```bash
make nerd-font  # install nerd-font (refs https://www.nerdfonts.com/) 
```

- AWS Session Manager Plugin
  - refs https://docs.aws.amazon.com/ja_jp/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

- AWS Serverless Application Model (SAM) CLI : 
  - refs https://docs.aws.amazon.com/ja_jp/serverless-application-model/latest/developerguide/install-sam-cli.html
