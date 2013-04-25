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

(defun mars/finder ()
  "Launch Finder in the current directory and selects current file"
  (interactive)
  (shell-command
   (concat "open -R " (convert-standard-filename buffer-file-name))))

;; Origin http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun open-xing (project) (interactive (list (read-directory-name "Peepopen for project: " "~/code/xing/profile")))
  (flet ((textmate-project-root () (file-truename project)))
    (peepopen-goto-file-gui)))

(defun open-playground (project) (interactive (list (read-directory-name "Peepopen for project: " "~/code/playground/")))
  (flet ((textmate-project-root () (file-truename project)))
    (peepopen-goto-file-gui)))

(defun xing-sync () (interactive (shell-command "xing sandbox sync")))

(defun mars-convert-json-to-hash (startPos endPos)
  "Convert a json object to a ruby hash..
This command calls the external script 'convert_json_to_rb_hash.rb'."
  (interactive "r")
  (let (scriptName)
    (setq scriptName "/Users/martin.stoev/bin/convert_json_to_rb_hash.rb") ; full path to your script
    (shell-command-on-region startPos endPos scriptName nil t nil t))
  (indent-region startPos endPos))

(defun mars-convert-hash-to-json (startPos endPos)
  "Convert a json object to a ruby hash..
This command calls the external script 'convert_rb_hash_to_json.rb'."
  (interactive "r")
  (let (scriptName)
    (setq scriptName "/Users/martin.stoev/bin/convert_rb_hash_to_json.rb") ; full path to your script
    (shell-command-on-region startPos endPos scriptName nil t nil t))
  (indent-region startPos endPos))

(defun mars-convert-hash-to-params (startPos endPos)
  "Convert a ruby hash to the params format for rails.
This command calls the external script 'convert_rb_hash_to_http_params.rb'."
  (interactive "r")
  (let (scriptName)
    (setq scriptName "/Users/martin.stoev/bin/convert_rb_hash_to_http_params.rb") ; full path to your script
    (shell-command-on-region startPos endPos scriptName nil t nil t))
  (indent-region startPos endPos))

(defun mars-xing-profile-tags ()
  "Creates a new TAGS table for the profile"
  (interactive)
  (let (scriptname)
    (setq scriptname "/Users/martin.stoev/bin/tag-rails.sh&")
    (shell-command scriptname))
  (visit-tags-table "/User/martin.stoev/code/xing/profile"))
