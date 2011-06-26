;; DVC
(require 'dvc-autoloads)

;; bzr backup file hack
;; create a backup file directory
(defun make-backup-file-name (file)
  (concat "~/.emacs.d/backups/" (file-name-nondirectory file) "~"))
