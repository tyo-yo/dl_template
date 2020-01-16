FROM kennethreitz/pipenv

RUN apt-get update --quiet && \
    apt-get install --quiet --yes fish && \
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

SHELL ["fish", "--command"]

RUN fisher add jethrokuan/z ; \
    fisher add oh-my-fish/theme-bobthefish ; \
    set -U theme_color_scheme base16 ; \
    set -U theme_powerline_fonts no ; \
    set -g theme_nerd_fonts no ; \
    set -U theme_display_user no ; \
    set -U theme_date_format "+ %H:%M" ; \
    set -U theme_newline_cursor no ; \
    set -U theme_display_virtualenv no

RUN chsh -s /usr/bin/fish

ENV SHELL /usr/bin/fish
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8

ENV WORKDIR /app/
WORKDIR ${WORKDIR}

COPY Pipfile Pipfile.lock ${WORKDIR}

RUN pipenv install --dev

ENTRYPOINT ["fish"]
