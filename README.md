# Cloud

Provides a simple orchestration of a Ruby on Rails deployment on macOS.

## Why?

I want to have a standarized simple way to manage infrastructure for Ruby on Rails apps.

## How to install?

Run this in your terminal:

```
sh <(curl -s https://raw.githubusercontent.com/chi-rb/chi-cloud/master/bin/cloud) install
```

## How to deploy locally?

** All commands are designed to be executed from the root folder of the project.

### 1. Deploy Containers

```
cloud container deploy
```

### 2. Check if Rails ready

```
cloud container log rails
```

### 3. Open App

```
cloud open
```

## How to use ByeBug?

You need to attach your terminal to the screen session of the main process of the Rails container.

** Since is a screen session, to don't exit and don't kill the process you need to press Ctrl+A D

```
cloud container attach rails
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
