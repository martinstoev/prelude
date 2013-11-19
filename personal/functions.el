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


(defvar mars-grep-project-history nil)

;; For some reason I cannot quote the directory
;; This might break if there are spaces in the directory
(defun mars-grep-in-directory (directory search-for)
  "Search for a specific string in a directory"
  (grep-find
   (concat
    "cd " directory "; "
    "find . "
    "\\( -path '*/.svn' -or "
    "-path '*/tmp' -or "
    "-path '*/coverage' -or "
    "-path '*/.git' -or "
    "-path '*/config/locales' -or "
    "-path '*/javascripts/locales' -or "
    "-path '*/vendor' \\) "
    "-prune -or -type f -print0 | "
    "xargs -0 grep -nr --ignore-case --fixed-strings "
    "--exclude='*.log' "
    "--exclude='*TAGS'"
    " '" search-for "'")))

(defun mars-grep-project (search-for)
  "Searches for a specific string in the whole project"
  (interactive
   (list
    (read-from-minibuffer "Search for: "
                          (car mars-grep-project-history)
                          nil
                          nil
                          'mars-grep-project-history)))
  (let (project-directory)
    (setq project-directory
          (expand-file-name(if (ffip-project-root)
                               (ffip-project-root)
                             default-directory)))
    (mars-grep-in-directory project-directory search-for)))

(defun mars-grep-in-current-directory (search-for)
  "Searches for a specific string in the current directory"
  (interactive
   find-file-in-project
   (list
    (read-from-minibuffer "Search for: "
                          (car mars-grep-project-history)
                          nil
                          nil
                          'mars-grep-project-history)))
  (let (project-directory)
    (setq project-directory (expand-file-name default-directory))
    (mars-grep-in-directory project-directory search-for)))

(defun notes ()
  "Jump to notes"
  (interactive)
  (find-file "~/notes.org"))
