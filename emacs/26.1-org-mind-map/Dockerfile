FROM ajchemist/emacs:26.1
LABEL maintainer "aJchemist <valchemist@me.com>"


COPY package-install.el /tmp/
COPY org-mind-map-batch.el /emacs-lisp/


RUN emacs --batch -l /tmp/package-install.el \
    && rm /tmp/package-install.el


RUN apk add --update --no-cache graphviz ttf-freefont
