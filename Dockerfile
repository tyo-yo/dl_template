FROM python:3.7-buster




# RUN chsh -s /usr/bin/xonsh

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8


# install pipenv
RUN pip install pipenv

# install xonsh
RUN pip install xonsh
RUN chsh -s /usr/local/bin/xonsh
SHELL ["xonsh", "-c"]
RUN xpip install xontrib-z xonsh-docker-tabcomplete xontrib-powerline2 xontrib-readable-traceback prompt_toolkit
RUN curl https://raw.githubusercontent.com/tyo-yo/dotfiles/master/.xonshrc -Lo ~/.xonshrc


# install peco
RUN apt update ; \
    apt install -y peco ; \
    mkdir -p ~/.config/peco ; \
    curl https://raw.githubusercontent.com/tyo-yo/dotfiles/master/.config/peco/config.json -Lo ~/.config/peco/config.json

# install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf ; \
    ~/.fzf/install

# install bash-completion
RUN apt update; apt install -y bash-completion


WORKDIR /root
# install micro
RUN curl https://getmic.ro | bash ; \
    mv micro /usr/local/bin

ENV WORKDIR /app/
WORKDIR ${WORKDIR}

# -- Adding Pipfiles
COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock

# -- Install dependencies:
RUN pipenv install --dev

EXPOSE 8888
EXPOSE 11111

ENTRYPOINT ["xonsh"]
