;;; Package  --- Summary
;;; Commentary:


;;; Code:


(package-initialize)


(require 'ox-org)
(require 'org-mind-map)


(defun batch-org-mind-map-write (org-file mind-map-output-type &optional name)
  ""
  (with-temp-buffer
    (insert-file-contents-literally org-file)
    (let ((org-mind-map-dot-output (list mind-map-output-type)))
      (message "%s" (org-mind-map-write-named (or name (concat (file-name-sans-extension org-file) "_diagram")) nil t))
      (while (process-live-p (get-process "org-mind-map-s"))
        (sleep-for 1)))))


(defvar argv-org-file (elt argv 0))
(defvar argv-mind-map-output-type (elt argv 1))
(defvar argv-mind-map-name (elt argv 2))


(unless (and (stringp argv-org-file) (file-exists-p argv-org-file))
  (error (format "No such file: %s" argv-org-file)))


(batch-org-mind-map-write argv-org-file argv-mind-map-output-type argv-mind-map-name)


;;; Local Variables:
;;; mode: emacs-lisp
;;; End:
