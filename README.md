# dl_template

![](https://github.com/tyo-yo/dl_template/workflows/Build%20and%20Test/badge.svg) [![Maintainability](https://api.codeclimate.com/v1/badges/5e23e4bf99dafa1ad824/maintainability)](https://codeclimate.com/github/tyo-yo/dl_template/maintainability)[![Test Coverage](https://api.codeclimate.com/v1/badges/5e23e4bf99dafa1ad824/test_coverage)](https://codeclimate.com/github/tyo-yo/dl_template/test_coverage)[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)



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
    -   [x] micro: gui like text editor
-   [x] Automatically upload image to Docker Hub
-   [x] Automated tests with GitHub Actions
-   [ ] Easily create & publish documentation with spinx + jupyter notebooks



## Commands

```shell
$ git clone https://github.com/tyo-yo/dl_template.git
$ docker-compose build

# Work on docker environment
$ docker-compose run --rm dl bash
$ docker-compose run --rm dl xonsh

# Start jupyter server
$ docker-compose run --rm -p 8888:8888 dl jupyter lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root

# Test
$ docker-compose run --rm dl pytest
```



# Install

```shell
$ pip install git+https://github.com/tyo-yo/dl_template
```

