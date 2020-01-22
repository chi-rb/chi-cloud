# Cloud

Orchestrates Rails+Kubernetes Clouds.

## Why?

I want a standarized way to manage infrastructure that will only require to know one api.

## How to install?

Run this command:
```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/master/mac/cloud) install
```

## How to uninstall? 

Run this commnad:
```
cloud uninstall
```

NOTE: There is a shortcut if you want to resintall `cloud resinstall`

## How to update?

To update to the latest commit on master:
```
cloud update
```

Or to a specific tag:
```
cloud update v1.4.0
```

### How to initialize a cloud?

To initialize a cloud:
```
cloud init
```

Or the same specifying a path:
```
cloud init awesome/app
```

NOTE: Will generate a rails app if path is empty, otherwise just the `cloud` folder.

## How to manage a cloud?

All the following commands are designed to be executed from the root path of an already initialized cloud.

### Destroy

Removes cloud folder and destroys cloud:
```
cloud destroy
```

### Build

Builds docker images:
```
cloud build
```

### Deploy

Deploys app into the cloud:
```
cloud deploy
```

### Undeploy

Undeploys app from the cloud:
```
cloud undeploy
```

### Status

Prints status of all pods:
```
cloud status
```

Or a verbose description of a specific pod:
```
cloud status rails
```

### Restart

Restarts rails pod:
```
cloud restart
```

Or any other:
```
cloud restart chrome
```

### Shell

Opens bash shell in rails pod:
```
cloud shell
```

Or any other:
```
cloud shell hub
```

### Attach

Attachs into first process of rails pod:
```
cloud attach 
```

Or any other:
```
cloud attach chrome
```

### Tunnel

Creates temporary tunnel into pod:
```
cloud tunnel mysql
```

NOTE: To connect you need to ssh into hacker@cloud.

### Exec

Executes command in rails pod:
```
cloud exec -- bundle update
```

Or any other:
```
cloud exec mysql -- mysqldump
```

### Console

Attachs to rails console:
```
cloud console
```

### Rails

Executes rails command:
```
cloud rails db:migrate
```

### Open

Opens browser pointing to app:
```
cloud open
```

### Log

Tails log of rails pod:
```
cloud log
```

Or any ohter:
```
cloud log redis
```

## How to manage the vm?

All commands related to the virtual machine are prefixed with `vm`.

### Start

Boots virtual machine:
```
cloud vm start
```

### Stop

Halts virtual machine:
```
cloud vm stop
```

### Restart

Stops and starts:
```
cloud vm restart
```

### Shell

Opens bash shell:
```
cloud vm shell
```

### Exec

Executes command:
```
cloud vm exec -- apt update
```

### Update

Updates operating system:
```
cloud vm update
```

## How to check docs?

Print documentation using:
```
cloud help
```

## Knonwn issues

### macOS Catalina

New security measures has been added into Catalina, so you need to manually add `/sbin/nfsd` and `/usr/local/cloud/mac/xhyve` into `System Preferences > Security & Privacy > Privacy > Full Disk Access`.

## Credits

It's sponsored by:

[![Occam Logo](https://www.occam.global/wp-content/uploads/2018/01/Occam_V1_170px.png)](https://www.occam.global)

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.
