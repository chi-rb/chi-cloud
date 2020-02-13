# Cloud

Provides a simple orchestration of a Ruby on Rails deployment within a localised Kubernetes environment on macOS utilising a xhyve hypervisor.

## Why?

I wanted to create a standarized way to manage infrastructure, to enable development teams to work on a consistent platform, whilst lowering the entry bar to running Kubernetes locally.

## What
TODO

## How to install?

Begin by running this command:
```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/master/bin/cloud) install
```
This will commence the cloud install script and prompt for some initial configuration.

Configuration of the base hypervisor VM can be adjusted, depending on host machine specifications.
```
~> Choosing Configuration
Virtual machine memory: 4G
Virtual machine cpus: 4
```

The host administration password will be requested to complete the installation.

## How to uninstall?

To completely uninstall cloud and the associated VM:
```
cloud uninstall
```
THIS IS DESTRUCTIVE - YOU HAVE BEEN WARNED

## How to update?

To update to the latest commit on the master branch:
```
cloud update
```

Or to a specific tag:
```
cloud update v1.4.0
```

## Getting Started

### How to initialize a cloud?

Cloud can be used to generate a new Rails app by running:

```
cloud init path_to/awesome/new_app
```
This will generate a Rails app from the current stable Rails branch.

A Cloud deployment can be added to an existing Rails app by navigating to the root directory and running:
```
cloud init
```
This will leave the existing application intact with the addition of a `cloud` directory, that will contain the required configuration.

NB: If using macOS Catalina see `Known Issues` below.

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

Occasionally it is useful to delete all deployed pods to recover from an error, this can be achieved with:
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

Opens bash shell in the Rails pod:
```
cloud shell
```

Or any other:
```
cloud shell hub
```

### Attach

Attaches into the first process of Rails pod:
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

Executes command in Rails pod:
```
cloud exec -- bundle update
```

Or any other:
```
cloud exec mysql -- mysqldump
```

### Console

Attaches to Rails console:
```
cloud console
```

### Rails

Executes Rails command:
```
cloud rails db:migrate
```

### Open

Opens browser pointing to app:
```
cloud open
```

### Log

Tails log of Rails pod:
```
cloud log
```

Or any other:
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

## Known issues

### macOS Catalina

New security measures have been added into Catalina, so you need to manually add `/sbin/nfsd` and `/usr/local/cloud/mac/xhyve` into `System Preferences > Security & Privacy > Privacy > Full Disk Access`.

## Credits

Development is sponsored by:

[![Occam Logo](https://www.occam.global/wp-content/uploads/2018/01/Occam_V1_170px.png)](https://www.occam.global)

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.
