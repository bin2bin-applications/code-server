![example workflow](https://github.com/bin2bin-applications/code-server/actions/workflows/docker-image.yml/badge.svg)

<h1 id="app:name">Code Server</h1>

<img id="app:logo" src="https://cdn.jsdelivr.net/gh/bin2bin-applications/code-server@master/logo.webp" width="180" height="180"></img>

## Developer

<p>Click <a id="app:developer" href="https://coder.com/">here</a> to go to developer site</p>

## Description
<p id="app:short-description">Visual Studio Code running on web browser</p>

<p id="app:long-description">Code-server is a Visual Studio Code instance running on a remote server accessible through any web browser. It allows you to code anywhere and on any device such as a tablet or laptop with a consistent integrated development environment (IDE). Set up a secure a Linux development machine and get coding on any device with a web browser.</p>

## Supported Architectures

The architectures supported by this image are:

| Architecture | Available | Tag    |
| :----------: | :-------: | ------ |
|    x86-64    |    ✅     | latest |

## Version Tags

The version tags available for this image are:

|  Tag   | Available | Description                           |
| :----: | :-------: | ------------------------------------- |
| latest |    ✅     | Stable releases with Ubuntu baseimage |

## Docker Pull

```bash
docker pull ghcr.io/bin2bin-applications/code-server:latest
```

## Docker Run

```bash
docker run -d --volume /tmp/app:/app -p 8080:8080 ghcr.io/bin2bin-applications/code-server:latest
```
