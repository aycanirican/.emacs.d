(setq emacs-start-time (current-time))

;; Backup and auto safe files goes to /tmp/
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(menu-bar-mode 0)

;; Enable iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(display-time)

(when (not (string-equal "root" (getenv "USER")))
  (load "~/.emacs.d/w3m-init")
  (load "~/.emacs.d/haskell-init")
  (load "~/.emacs.d/ghcmod-init")
  (load "~/.emacs.d/browse-apropos-url")
  (load "~/.emacs.d/ido-init")
  (load "~/.emacs.d/yasnippet-init")
  (load "~/.emacs.d/magit-init")
  (load "~/.emacs.d/erc-init")
  (load "~/.emacs.d/bbdb-init")
  (load "~/.emacs.d/planner-init")
  (load "~/.emacs.d/auctex-init")
  (load "~/.emacs.d/psgml-init")
  (load "~/.emacs.d/pandoc-init")
  (load "~/.emacs.d/easypg-init")
  (load "~/.emacs.d/cedet-init")
  (load "~/.emacs.d/android-init")
  ;;(load "~/.emacs.d/slime-init")
  ;;(load "~/.emacs.d/core-server-init")
  ;;(load "~/.emacs.d/ess-init")
  ;;(load "~/.emacs.d/ecb-init")
  ;;(load "~/.emacs.d/dvc-init")
  (load "~/.emacs.d/private")
  )

;; Set frames' font to Monaco (which you should install manually)
(add-to-list 'default-frame-alist '(font . "Monaco-10"))

;; Customizations
(custom-set-variables
 '(inhibit-startup-message t)
 '(mouse-avoidance-mode 'animate)
 '(display-time-mode t)
 '(display-time-24hr-format t)
 '(line-number-mode t)
 '(column-number-mode t)
 '(size-indication-mode t)
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(global-font-lock-mode t)
 '(font-lock-maximum-decoration t)
 '(face-font-family-alternatives (quote (("courier" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 99 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
     (time-to-seconds (time-since emacs-start-time)))
  )
