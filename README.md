# Cloud

Orchestrates Rails+Kubernetes Clouds.

## Why?

I was strugglying to manage the complexity introduced by the amount of tools that modern website development involve. So I decided to come up with a orchestration layer that exposes a simple api to manage the infrastructure in a standarized and unifyied way.

## Install

To install copy and paste:
```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/0.0.1-alpha1/mac/cloud) install
```

## Uninstall 

To uninstall:
```
cloud uninstall
```

NOTE: There is a shortcut if you want to resintall `cloud resinstall`

## Update

To update to a specific version:
```
cloud update <tag>
```

NOTE: In some rare cases, might need to run `cloud reinstall`

## Application

The script it's using [microk8s](https://microk8s.io) to manage kubernetes.

NOTE: All commands related to the virtual machine are prefixed with `cloud app` and are desgined to be executed inside the application path.

### Init

Generate the cloud folder skeleton and share the app into the cloud:
```
cloud app init
```

### Remove

Removes the cloud folder and unshares the app from the cloud:
```
cloud app remove
```

### Help

Print documentation using:
```
cloud vm help
```

## Virtual Machine

The script it's using [multipass](https://multipass.run) to manage virtual machines.

NOTE: All commands related to the virtual machine are prefixed with `cloud vm`.

### Start

Start the virtual machine using:
```
cloud vm start
```

### Stop

Stop the virtual machine:
```
cloud vm stop
```

### Restart

Restart the virtual machine:
```
cloud vm restart
```

### Shell

Open a bash shell in the virtual machine:
```
cloud vm shell
```

### Help

Print documentation:
```
cloud vm help
```

## Help

Print documentation using:
```
cloud help
```

## Credits

It's sponsored by:

[![Occam Logo](https://www.occam.global/wp-content/uploads/2018/01/Occam_V1_170px.png)](https://www.occam.global)

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.
