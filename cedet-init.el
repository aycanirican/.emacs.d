;; CEDET 
(when (locate-library "cedet")

  ;; Enable EDE (Project Management) features
  (global-ede-mode 1)

  (semantic-load-enable-gaudy-code-helpers)
  (semantic-load-enable-all-exuberent-ctags-support)
  (global-srecode-minor-mode 1)

  ;; jdee hacks
  (defvar compilation-nomessage-regexp-alist '())
  (add-hook 'compilation-mode-hook (lambda () (setq buffer-read-only nil)))
  (progn
    (autoload 'jde-mode "jde" "JDE mode." t)
    (setq auto-mode-alist
          (append
           '(("\\.java$" . jde-mode))
           auto-mode-alist))
  )
