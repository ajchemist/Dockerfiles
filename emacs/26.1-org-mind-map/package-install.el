(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Fix HTTP1/1.1 problems
(setq url-http-attempt-keepalives nil)
(package-refresh-contents)
(package-install 'org-mind-map)


;;; Local Variables:
;;; mode: emacs-lisp
;;; End:
