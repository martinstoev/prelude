;; Source: http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:"
                       (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin")
                            exec-path)))

;; Setting default font-size
(when window-system
  (set-face-attribute 'default nil :height 160))

;; Setting color theme
(disable-theme 'zenburn)
(load-theme 'tango-dark)

(global-linum-mode 1)

(require 'rdefs)
(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map (kbd "M-e") 'ruby-rdefs)))

;; Make sure Monaco is installed properly and then use it as default font
(if (file-exists-p "~/.fonts/Monaco_Linux.ttf")
    (set-default-font "Monaco-14"))

(require 'auto-complete)
(global-auto-complete-mode 1)
