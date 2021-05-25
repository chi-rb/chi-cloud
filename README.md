# Cloud

Provides a simple orchestration of a Ruby on Rails deployment on macOS.

## Why?

I want to have a standarized simple way to manage infrastructure for Ruby on Rails apps.

## How to install?

Run this in your terminal:

```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/master/bin/cloud) install
```

ALL COMMANDS ARE DESIGNED TO BE EXECUTED FROM THE ROOT FOLDER OF THE RAILS APP.

## How to deploy Locally?

### 1. Deploy Containers

```
cloud container deploy
```

### 2. Check logs to see if Rails ready

```
cloud container log rails
```

### 3. Open App in browser

```
cloud open
```

## How to deploy Remotely?

### 1. Point into the Remote Context and set the Key:

You can choose to remember this value for all command during a session:

```
export CLOUD_KEY=secret
export CLOUD_CONTEXT=remote
```

Or prefix each command individually:

```
CLOUD_KEY=secret CLOUD_CONTEXT=remote cloud ...
```

### 2. Push new Images

```
cloud image build
cloud image push
```

### 3. Redeploy Container

```
cloud container delete rails
cloud container deploy rails
```

### 4. Switch back Context to Local

Export again:
```
export CLOUD_CONTEXT=local
```

Or prefix new commands with it:
```
CLOUD_CONTEXT=local cloud ...
```

## How to check Status?

You can list all containers of the app with their status using:
```
cloud container
```

## How to encrypt/decrypt?

To protect a secret inside environments you can:
```
CLOUD_KEY=secret cloud encrypt "value"
```

To get back original value from the ENC(...) string:
```
CLOUD_KEY=secret cloud decrypt "ENC(...)"
```

## How to Start/Stop/Restart?

To control the status of the server:
```
cloud server start/stop/restart
```

To control the status of one container:
```
cloud container start/stop/restart rails
```

## How to use ByeBug?

You need to attach your terminal to the screen session of the main process of the Rails container.

SINCE IS A SCREEN SESSION, TO DON'T EXIT AND DON'T KILL THE PROCESS YOU NEED TO PRESS CTRL+A D

```
cloud container attach rails
```

## How to start a Shell?

To SSH into the server:
```
cloud server shell
```

To SSH into one of the containers
```
cloud container shell rails
```

## How to start a Tunnel?

Pass the name of the container and port to the "tunnel" cmd:

```
cloud tunnel start mysql 3306
```

## Credits

This gem is funded and maintained by [mmontossi](https://github.com/mmontossi).

With the sponsorship of:

[![Occam Logo](https://www.occam.global/wp-content/uploads/2018/01/Occam_V1_170px.png)](https://www.occam.global)

## License

It is free software, and may be redistributed under the terms specified in the LICENSE file.
