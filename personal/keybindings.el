;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction

;; Some terminals o not suport modified arrow keys.
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key
 (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two
(define-key (current-global-map) (kbd "C-M-\\") 'indent-region)
(define-key (current-global-map) (kbd "<f5>") 'smart-compile)
(define-key (current-global-map) (kbd "<f9>") 'mars/finder)
(define-key (current-global-map) (kbd "<f10>")  'xing-sync)
(define-key (current-global-map)
  (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)

(define-key (current-global-map) (kbd "C-£ c") 'rinari-find-controller)
(define-key (current-global-map) (kbd "C-£ e") 'rinari-find-environment)
(define-key (current-global-map) (kbd "C-£ f") 'rinari-find-file-in-project)
(define-key (current-global-map) (kbd "C-£ h") 'rinari-find-helper)
(define-key (current-global-map) (kbd "C-£ i") 'rinari-find-migration)
(define-key (current-global-map) (kbd "C-£ j") 'rinari-find-javascript)
(define-key (current-global-map) (kbd "C-£ l") 'rinari-find-plugin)
(define-key (current-global-map) (kbd "C-£ m") 'rinari-find-model)
(define-key (current-global-map) (kbd "C-£ n") 'rinari-find-configuration)
(define-key (current-global-map) (kbd "C-£ o") 'rinari-find-log)
(define-key (current-global-map) (kbd "C-£ p") 'rinari-find-public)
(define-key (current-global-map) (kbd "C-£ s") 'rinari-find-script)
(define-key (current-global-map) (kbd "C-£ r") 'rinari-find-rspec)
(define-key (current-global-map) (kbd "C-£ t") 'rinari-find-test)
(define-key (current-global-map) (kbd "C-£ v") 'rinari-find-view)
(define-key (current-global-map) (kbd "C-£ w") 'rinari-find-worker)
(define-key (current-global-map) (kbd "C-£ x") 'rinari-find-fixture)
(define-key (current-global-map) (kbd "C-£ y") 'rinari-find-stylesheet)

(define-key (current-global-map) (kbd "M-£") 'yas/expand)
(define-key (current-global-map) (kbd "C-<") 'er/expand-region)
(define-key (current-global-map) (kbd "C->") 'er/contract-region)

;; Move to char similar to "f" in vim, f+g forward, d+f backward
(require 'key-chord)
(key-chord-define-global "df" 'iy-go-to-char)
(key-chord-define-global "sd" 'iy-go-to-char-backward)
(key-chord-define-global "lk" 'ffap)

;; Assigning C-c , l to evaluate only the current spec in a spec file.
;; Normally you can use C-c , v for the whole file and C-c , a for every
;; file.
(require 'rspec-mode)
(define-key rspec-mode-keymap (kbd "l") 'rspec-verify-single)
(define-key rspec-mode-verifible-keymap (kbd "l") 'rspec-verify-single)

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 7))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 7))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 7))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 7))))
