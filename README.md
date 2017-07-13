## Cordova Runner

[![Build Status](https://travis-ci.org/dankreiger/cordova-runner.svg?branch=master)](https://travis-ci.org/dankreiger/cordova-runner)


##### Turn your html/css/js project into an iOS or Android app.

#### Prerequisites:

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

#### Install:

```bash
$ npm install -g cordova-runner
```

#### Setup:

1. `cd` into your `html/css/js` project.

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
  └── index.html

  ```

  - Note: Your root html **must** be called `index.html`. Please rename your root html file if you have to.

2. Run in your terminal:

  ```bash
  $ cordova-runner
  ```

3. After that, just follow the prompt.
