#!/usr/bin/env node

var shell = require('shelljs');
shell.echo('Cordova version:');
shell.exec('cordova -v');
