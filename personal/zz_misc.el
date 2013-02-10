;; Source: http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "HOME") "/.rbenv/bin:"
                       (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      (cons (concat (getenv "HOME") "/.rbenv/bin")
                            exec-path)))

;; ;; Beginning of the el4r block:
;; ;; RCtool generated this block automatically. DO NOT MODIFY this block!
;; (add-to-list 'load-path "/home/mars/.rbenv/versions/1.9.3-p286/share/emacs/site-lisp")
;; (require 'el4r)
;; (el4r-boot)
;; ;; End of the el4r block.
;; ;; User-setting area is below this line.

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
;; (if (file-exists-p "~/.fonts/Monaco_Linux.ttf")
    ;; (set-default-font "Monaco-13")

(set-default-font "Monaco-16")

(require 'auto-complete)
(global-auto-complete-mode 1)

(key-chord-mode 1)
