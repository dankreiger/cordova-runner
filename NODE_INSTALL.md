## Node installation

### VERSION CHECK

- Check to see if you have node installed and which version.

  ```bash
  $ node -v
  ```

- Check to see if you have npm installed and which version.

  ```bash
  $ npm -v
  ```

****

- If you have Node >= 6.0.0 and NPM >= 5.0.0

  - You may proceed with the app prequisites.

***

- If you have Node >= 6.0.0 and NPM < 5.0.0

  please run:

  ```bash
  $ npm update -g
  ```

  Once npm is updated, please go back and do the [version check](#version_check).

***

- If you have Node < 6.0.0

  Please install nvm

  ```bash
  $ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
  ```

  Verify that nvm was installed by running:

  ```bash
  $ command -v nvm
  ```


  From there you can run:

  ```bash
  $ nvm install 6.0.0
  ```

  Once everything is installed, please go back and do the [version check](#version-check).
