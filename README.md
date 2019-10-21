# Cloud

Orchestrates Rails+Kubernetes Clouds.

## Why?

I want to provide a standarized way to manage infrastructure, abstracting all moving parts in a way that you only need to know this api to work.

## How to install?

Copy and past this inside a terminal:
```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/0.0.1-alpha2/mac/cloud) install
```

## How to uninstall? 

Run this commnad:
```
cloud uninstall
```

NOTE: There is a shortcut if you want to resintall `cloud resinstall`

## How to update?

Run this command specifying tag version:
```
cloud update <tag>
```

## How to manage apps?

All commands for the are prefixed with `cloud app` and are desgined to be executed inside the application path.

### Init

Generates the cloud folder skeleton and share the app into the cloud:
```
cloud app init
```

### Remove

Removes the cloud folder and unshares the app from the cloud:
```
cloud app remove
```

### Build

Builds the images needed by the deploy commadn:
```
cloud app build
```

### Deploy

Deploys the app into the cloud:
```
cloud app deploy
```

### Undeploy

Undeploys the app from the cloud:
```
cloud app undeploy
```

## How to manage the vm?

All commands related to the virtual machine are prefixed with `cloud vm`.

### Start

Starts the virtual machine using:
```
cloud vm start
```

### Stop

Stops the virtual machine:
```
cloud vm stop
```

### Restart

Restarts the virtual machine:
```
cloud vm restart
```

### Shell

Opens a bash shell in the virtual machine:
```
cloud vm shell
```

## How to check docs?

Print documentation using:
```
cloud [app|vm] help
```

## Knonwn issues

### macOS Catalina

New security measures has been added into Catalina, so you need to manually add `/sbin/nfsd` and `/usr/local/cloud/mac/xhyve` into `System Preferences > Security & Privacy > Privacy > Full Disk Access`.

## Credits

It's sponsored by:

[![Occam Logo](https://www.occam.global/wp-content/uploads/2018/01/Occam_V1_170px.png)](https://www.occam.global)

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.
