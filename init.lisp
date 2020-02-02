;; -*-lisp-*-

(in-package :stumpwm)

(setq *startup-message* nil)
(setq *startup-mode-line* t)

(set-prefix-key (kbd "C-,"))
(define-key *root-map* (kbd "C-f") "exec firefox")
(define-key *root-map* (kbd "C-c") "exec gnome-terminal")

; --- mode line -------------------------------------------------
(setf *mode-line-screen-position* :top)
(setf *mode-line-frame-position* :top)
(setf *mode-line-border-width* 1)
(setf *mode-line-pad-x* 6)
(setf *mode-line-pad-y* 0)
(setf *mode-line-background-color* "black")
(setf *mode-line-foreground-color* "wheat")
(setf *mode-line-border-color* "dark grey")
(setf *screen-mode-line-format*
      (list "^03%N^n "
            '(:eval (run-shell-command
                     "LANG=c; date '+%m/%d(%a)_%H:%M'|tr -d [:cntrl:]" t))
            " | %b | %g"))

(when (and *startup-mode-line*
           (not (head-mode-line (current-head))))
  (mode-line))
