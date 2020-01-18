# dl_template



## Features

-   [x] Docker
-   [x] pipenv
    -   [x] 'a' to enter pipenv, 'd' to deactivate pipenv
-   [x] Pre-installed python modules for deeplearning
    -   [x] pytorch, numpy, matplotlib, jupyterlab, pandas, holoviews, ...
-   [x] xonsh: Shell script with python
-   [x] Useful commands
    -   [x] z: jump around
    -   [x] br: interactive git branch checkout
    -   [x] gl: interactive git log
    -   [x] f: interactive file browsing with preview
    -   [x] Ctrl+R: interactive history browsing
    -   [x] Ctrl+S: interactive ssh
-   [ ] Automatically upload image to Docker Hub
-   [ ] Automated tests with GitHub Actions
-   [ ] Easily create & publish documentation with spinx + jupyter notebooks



## Commands

```shell
$ git clone https://github.com/tyo-yo/dl_template.git
$ docker-compose build
$ docker-compose up -d
$ docker-compose exec dl xonsh

$ a
using own xonsh alias function instead of pipenv shell. 'deactivate' or 'd' to exit virtualenv

$ jupyter lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root
```

