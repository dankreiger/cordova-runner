<p align="center">
  <h3 align="center">Cordova Runner</h3>
  <p align="center">
    Transform html/css/js projects into iOS and Android apps.
    <br>
    <a href="https://dankreiger.github.io/cordova-runner"><strong>Explore Docs &raquo;</strong></a>
    <br>
    <br>
  </p>
</p>

<br>

## Table of contents

- [Status](#status)
- [Prerequisites](#prerequisites)
- [App icons and loading screens](#app-icons-and-loading-screens)
- [Install](#install)
- [Setup](#setup)
- [Usage](#usage)


## Status
[![Build Status](https://travis-ci.org/dankreiger/cordova-runner.svg?branch=master)](https://travis-ci.org/dankreiger/cordova-runner)


## Prerequisites

Please install
- [Node >= 6.0.0 and NPM >= 5.0.0](./NODE_INSTALL.md)
- [Android Studio](https://developer.android.com/studio/index.html) (for Android development)
- [Xcode](https://itunes.apple.com/de/app/xcode/id497799835?l=en&mt=12) (for iOS development)

- Imagemagick for icon processing

``` bash
$ sudo apt-get install imagemagick
$ # on Mac: brew install imagemagick
$ # on Windows: http://www.imagemagick.org/script/binary-releases.php#windows (check "Legacy tools")
```

## App icons and loading screens

- `cordova-runner` uses the convenient [cordova-icon](https://github.com/AlexDisler/cordova-icon) and [cordova-splash](https://github.com/AlexDisler/cordova-splash) packages for icon and loading (splash) screen processing.

**App icon**
- Your app icon must be a `.png` file
- You must name it `icon.png`
- It should be square and ideally 512x512px, but no smaller than 192x192px

**Loading screen**
- Your app icon must be a `.png` file
- You must name it `splash.png`
- It should be 2208x2208 px with a center square of about 1200x1200 px.

- Please copy your `icon.png` and `splash.png` to the root of your project before using `cordova-runner`.

## Install

```bash
$ npm install -g cordova-runner
```

## Setup

- `cd` into your `html/css/js` project.

  - A generic project structure might look something like this:

  ```bash
  .
  ├── css
  │   ├── style.css
  │   └── theme.css
  ├── img
  │   └── image.png
  ├── js
  │   ├── custom.js
  │   └── theme.js
  ├── about.html
  ├── contact.html
  ├── icon.png
  ├── index.html
  └── splash.png

  ```


  - **Note:** Your root html **must** be called `index.html`. Please rename your root html file if you have to.


## Usage:

1. Run in your terminal:
```bash
$ cordova-runner
```

2. After that, just follow the prompt.
