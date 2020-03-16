# Cloud

Provides a simple orchestration of a Ruby on Rails deployment on macOS within a localised Kubernetes environment utilising a XHYVE hypervisor.

## Why?

I want to provide a standarized way to manage infrastructure, to enable development teams to work on a consistent platform, whilst lowering the entry bar to run Kubernetes.

## How using this tool looks like?

The main goal is to keep you development flow the same, so a lot has been done to try to avoid overhead and keep every command as simple and intuitive as possible.

Macro speaking, a usual development flow once everything is setup, might look like this:

### 1. Start the day making the required changes on some files

Possibly pulling from git the latest changes and using your favorite editor to update some files.

Nothing fancy here.

### 2. Ocassionally use Rails/Ruby commands

The script maps all Rails/Ruby commands into the vm seamless, so all the commands you already know will be the same:

```
bin/rails db:migrate
bin/rails c
bin/rails test
```

Since Rails is dockerized and binded to the root folder, all changes all picked automatically and the local Rails server is ensured to be up. So there is no need to do constants restarts or transfer files.

One way that the flow will change, is in how to check logs. Because pods output into stdout, you need a way to sneak into that output:
```
cloud log rails
```

### 3. Deploy changes into the production server

This will look something like this:

#### a) Build docker images:
```
CLOUD=remote cloud build
```

#### b) Trigger a rolling update to make Rails pod fetch the new image:
```
CLOUD=remote cloud restart rails
```

#### c) Ensure everything is in good shape:
```
CLOUD=remote cloud status
```

## How to install?

Begin by running this command:
```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/master/bin/cloud) install
```
This will commence the cloud install script and prompt for some initial configuration.

The host administration password will be requested to complete the installation.

Once is done you're going to be asked to prefix the `$PATH` on your shell profile. This will map any Rails commands to the cloud instance inside the root directory, whilst leaving any additional Ruby management tools (Rbenv, RVM, etc) intact for other projects.

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

## What are clouds and how to manage them?

Clouds are the combination of a Rails app and all his required infrastructure.

All the following commands are designed to be executed from the root path of an already initialized cloud except `init`.

### Init

Generates a default Rails app with the corresponding infrastructure in the specified location:
```
cloud init awesome/app
```

Or used to add to an existing Rails app by navigating to the root directory and running:
```
cloud init
```
This will leave the existing application intact with the addition of a `cloud` directory, that will contain the required configuration plus tmp folder with samples of some suggested tweaks.

### Destroy

Removes cloud folder and destroys cloud locally:
```
cloud destroy
```
THIS IS DESTRUCTIVE - YOU HAVE BEEN WARNED 

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
cloud tunnel postgres
```
You would need to ssh into hacker@cloud previously to stablish the connection.

### Exec

Executes command in Rails pod:
```
cloud exec -- bundle update
```

Or any other one:
```
cloud exec postgres -- pg_dump development > db.sql
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

## What are contexts and how to manage them?

Contexts are the cloud locations, you will have a default local one running using a XHYVE VM for local development, and you can add as many remote one as you like to connect to remote providers like AWS. 

Each context file saves all the settings needed by that context in the form of simple shell variables.

### List

Lists all the available contexts:
```
cloud contexts list
```

If you avoid the `list` part, will work too:
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
Will first open the file to edit using `$EDITOR` and then re-run the setup avoiding any stage that is already configured. 

You can use to complete a premature ended add previous procedure, or by removing one setting, you can execute the respective remote setup block again.

### Delete

Deletes specified context:
```
cloud contexts delete remote
```
Right now we are not able to connects into remote providers to wipe all the remote resources, but we're working towards making this possible in the future.

## What are environments and how to manage them?

Environments are closely tight to `RAILS_ENV`, you should have one per each Rails environment to be able to switch between them. 

Each context file saves all the settings needed by that environment in the form of simple shell variables.

### List

Lists all the available environments:
```
cloud envs list
```

If you avoid the `list` part, will work too:
```
cloud envs
```

### Add

Adds a new environment:
```
cloud envis add production
```
Will create new file and open it to edit using `$EDITOR`. 

### Edit

Edits the specified environment:
```
cloud envs edit production
```
Will open the configuration file to edit it using `$EDITOR`. 

### Delete

Deletes specified environment:
```
cloud envs delete production
```

## How to manage the VM?

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
cloud vm exec -- echo hello from my vm!!! 
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
