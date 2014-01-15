;; Source: http://marc-bowes.com/2012/03/10/rbenv-with-emacs.html
;; Setting rbenv path

(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:"
                       (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims")
                      exec-path))

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

;; Setup peepopen. The application has to be installed first.
(require 'textmate)
(require 'peepopen)
(textmate-mode)

;; For Emacs on Mac OS X http;//emacsformacosx.com/
;; Opens files in the exiting frame instead of making new ones.
(setq ns-pop-up-frames nil)

(guru-global-mode -1)

(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

;; indend with tab width of 2 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default js2-basic-offset 2)

(add-hook 'js2-mode-hook '(lambda () (progn
                                       (set-variable 'indent-tabs-mode nil))))


;; Change highlight of current line to be light gray
(set-face-background 'hl-line "#3e4446")
(set-face-foreground 'highlight nil)

;; HELM
(helm-mode 1)

;; We want to see whitespaces
(global-whitespace-mode t)
