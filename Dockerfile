FROM python:3.7-buster

ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8
SHELL ["bash", "-c"]

# install pipenv
RUN pip install --upgrade pip && pip install pipenv

# install xonsh
RUN pip install xonsh
RUN pip install xontrib-z xonsh-docker-tabcomplete xontrib-powerline2 xontrib-readable-traceback prompt_toolkit
RUN curl https://raw.githubusercontent.com/tyo-yo/dotfiles/master/.xonshrc -Lo ~/.xonshrc

# install entrykit
ENV ENTRYKIT_VERSION 0.4.0
RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz && \
    mv entrykit /bin/entrykit && \
    chmod +x /bin/entrykit && \
    entrykit --symlink

# install peco
RUN apt update && \
    apt install -y peco && \
    mkdir -p ~/.config/peco && \
    curl https://raw.githubusercontent.com/tyo-yo/dotfiles/master/.config/peco/config.json -Lo ~/.config/peco/config.json

# install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

# install bash-completion
RUN apt update && apt install -y bash-completion

# install micro
WORKDIR /root
RUN curl https://getmic.ro | bash && \
    mv micro /usr/local/bin

ENV WORKDIR /app/
WORKDIR ${WORKDIR}

EXPOSE 8888 11111

COPY scripts/ /opt/bin/
ENTRYPOINT ["prehook", "/opt/bin/docker-setup.sh", "--", "/opt/bin/docker-entrypoint.sh"]
