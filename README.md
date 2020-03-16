# Cloud

Provides a simple orchestration of a Ruby on Rails deployment within a localised Kubernetes environment on macOS utilising a xhyve hypervisor.

## Why?

I want to provide a standarized way to manage infrastructure, to enable development teams to work on a consistent platform, whilst lowering the entry bar to run Kubernetes.

## How to install?

Begin by running this command:
```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/master/bin/cloud) install
```
This will commence the cloud install script and prompt for some initial configuration.

The host administration password will be requested to complete the installation.

Once is done you're going to be asked to prefix the $PATH on your shell profile. This will map any rails commands to the cloud instance inside the root directory, whilst leaving any additional Ruby management tools (rbenv, RVM etc) intact for other projects.

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

If you want a specific version use the corresponding tag:
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
This will leave the existing application intact with the addition of a `cloud` directory, that will contain the required configuration plus tmp folder with samples of some suggested tweaks.

## How to manage a cloud?

All the following commands are designed to be executed from the root path of an already initialized cloud.

### Destroy

Removes cloud folder and destroys cloud locally:
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

### Status

Prints status of all pods:
```
cloud status
```

Or a verbose description of a specific one:
```
cloud status rails
```

### Restart

Restarts all pods:
```
cloud restart
```

Or a specific one:
```
cloud restart chrome
```

### Shell

Opens bash shell in the Rails pod:
```
cloud shell
```

Or any other one:
```
cloud shell hub
```

### Attach

Attaches into the first process of Rails pod:
```
cloud attach
```

Or any other one:
```
cloud attach chrome
```

### Tunnel

Creates temporary tunnel into a pod:
```
cloud tunnel mysql
```
You would need to ssh into hacker@cloud previously to stablish the connection.

### Exec

Executes command in Rails pod:
```
cloud exec -- bundle update
```

Or any other one:
```
cloud exec mysql -- mysqldump
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

Or any other one:
```
cloud log redis
```

## How to manage contexts?

Contexts are the cloud locations, you will have a default local one running using a xhyve vm for local development, and you can add as many remote one as you like to connect to remote providers like AWS. 

Each context file saves all the settings needed by that context in the form of simple shell variables.

### List

Lists all the available contexts:
```
cloud contexts list
```

If you avoid the `list` part, will work yoo:
```
cloud contexts
```

### Add

Adds a new context:
```
cloud contexts add remote
```
This wil connect with the providers api to setup the remote context in order to be ready to accept deployments.

### Edit

Edits the specified context:
```
cloud contexts edit remote
```
Will first open the file to edit using $EDIT and then re-run the setup avoiding any stage that is already configured. 

You can use to complete a premature ended add previous procedure, or by removing one setting, you can execute the respective remote setup block again.

### Delete

Deletes specified context:
```
cloud contexts delete remote
```
Right now we are not able to connects into remote providers to wipe all the remote resources, but we're working towards making this possible in the future.

## How to manage environments?

Environments are closely tight to `RAILS_ENV`, you should have one per each Rails environment to be able to switch between them. 

Each context file saves all the settings needed by that environment in the form of simple shell variables.

### List

Lists all the available environments:
```
cloud envs list
```

If you avoid the `list` part, will work yoo:
```
cloud envs
```

### Add

Adds a new environment:
```
cloud envis add production
```
Will create new file and open it to edit using $EDITOR. 

### Edit

Edits the specified environment:
```
cloud envs edit production
```
Will open the configuration file to edit it using $EDITOR. 

### Delete

Deletes specified environment:
```
cloud envs delete production
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

## Credits

This gem is funded and maintained by [mmontossi](https://github.com/mmontossi).

With the sponsorship of:

[![Occam Logo](https://www.occam.global/wp-content/uploads/2018/01/Occam_V1_170px.png)](https://www.occam.global)

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.
