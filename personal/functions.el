;; Origin: http://www.emacsblog.org/2007/01/17/indent-whole-buffer/
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun mars/fix-quotations ()
  "Remove proper quotations and replace them with ACII."
  (interactive)
  (beginning-of-buffer)
  (replace-string "“" "\"")
  (beginning-of-buffer)
  (replace-string "”" "\""))

(defun mars/nautilus ()
  "Launch nautilus in the current directory and selects current file"
  (interactive)
  (shell-command
   (concat "nautilus " (convert-standard-filename buffer-file-name))))
