;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction

;; Some terminals o not suport modified arrow keys.
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two
(define-key (current-global-map) (kbd "C-M-ß") 'indent-region)
(define-key (current-global-map) (kbd "<f5>") 'smart-compile)
(define-key (current-global-map) (kbd "<f9>") 'mars/nautilus)

(define-key (current-global-map) (kbd "C-ö c") 'rinari-find-controller)
(define-key (current-global-map) (kbd "C-ö e") 'rinari-find-environment)
(define-key (current-global-map) (kbd "C-ö f") 'rinari-find-file-in-project)
(define-key (current-global-map) (kbd "C-ö h") 'rinari-find-helper)
(define-key (current-global-map) (kbd "C-ö i") 'rinari-find-migration)
(define-key (current-global-map) (kbd "C-ö j") 'rinari-find-javascript)
(define-key (current-global-map) (kbd "C-ö l") 'rinari-find-plugin)
(define-key (current-global-map) (kbd "C-ö m") 'rinari-find-model)
(define-key (current-global-map) (kbd "C-ö n") 'rinari-find-configuration)
(define-key (current-global-map) (kbd "C-ö o") 'rinari-find-log)
(define-key (current-global-map) (kbd "C-ö p") 'rinari-find-public)
(define-key (current-global-map) (kbd "C-ö s") 'rinari-find-script)
(define-key (current-global-map) (kbd "C-ö r") 'rinari-find-rspec)
(define-key (current-global-map) (kbd "C-ö t") 'rinari-find-test)
(define-key (current-global-map) (kbd "C-ö v") 'rinari-find-view)
(define-key (current-global-map) (kbd "C-ö w") 'rinari-find-worker)
(define-key (current-global-map) (kbd "C-ö x") 'rinari-find-fixture)
(define-key (current-global-map) (kbd "C-ö y") 'rinari-find-stylesheet)

(define-key (current-global-map) (kbd "M-ö") 'yas/expand)

;; Assigning C-c , l to evaluate only the current spec in a spec file.
;; Normally you can use C-c , v for the whole file and C-c , a for every
;; file.
;; (define-key rspec-mode-keymap (kbd "l") 'rspec-verify-single)
;; (define-key rspec-mode-verifible-keymap (kbd "l") 'rspec-verify-single)
