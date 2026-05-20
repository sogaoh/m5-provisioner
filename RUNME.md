---
runme:
  id: 01HN748ZZP8FXJQQC52RN3CYHN
  version: v2.2
---

# m2-provisioner runbook

My PC (M2 Mac) provisioner

## Update 

```bash
cd $PWD
direnv allow
make upg
```


## partial

```bash
make aqu
```

```bash
make aqi
```

```bash 
make gui
```

```bash 
make cli
```

```bash 
make rust
```


## one time

### install mackerel-agent 
(needs `variables.yaml`)
```bash 
make ma   
```

### setup awsume
```bash
make awsume
```

### install nerd-font (refs https://www.nerdfonts.com/)
```bash
make nerd-font
```

### setup prezto (probably just for me)
```bash
make prezto
```

### setup dotfiles (probably just for me)
```bash
make dot
```
