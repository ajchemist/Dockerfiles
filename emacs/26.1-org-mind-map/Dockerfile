FROM ajchemist/emacs:26.1
LABEL maintainer "aJchemist <valchemist@me.com>"


COPY package-install.el /tmp/


RUN emacs --batch -l /tmp/package-install.el \
    && rm /tmp/package-install.el


RUN apk add --update --no-cache graphviz
