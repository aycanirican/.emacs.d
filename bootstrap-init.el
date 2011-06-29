(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Enable iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)


(require 'font-lock)

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
  ;;(load "~/.emacs.d/slime-init")
  ;;(load "~/.emacs.d/core-server-init")
  ;;(load "~/.emacs.d/ess-init")
  ;;(load "~/.emacs.d/ecb-init")
  ;;(load "~/.emacs.d/dvc-init")
  ;;(load "~/.emacs.d/jde-init") 
  (load "~/.emacs.d/private")
  )

;;;; ansi-color
;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-to-list 'default-frame-alist '(font . "-unknown-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))

;; Customizations
(custom-set-variables
 '(inhibit-startup-message t)
 '(mouse-avoidance-mode 'animate)
 '(display-time-24hr-format t)
 '(line-number-mode t)
 '(column-number-mode t)
 '(show-paren-mode t)
 '(transient-mark-mode t)
 '(global-font-lock-mode t)
 '(font-lock-maximum-decoration t)
 '(column-number-mode t)
 '(display-time-mode t)
 '(face-font-family-alternatives (quote (("courier" "fixed") ("helv" "helvetica" "arial" "fixed"))))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(ecb-options-version "2.32")
 '(jde-ant-home "/usr")
 '(jde-ant-buildfile "./build.xml")
 '(jde-ant-use-global-classpath nil)
 '(jde-compile-option-classpath (quote ("/usr/lib/ant.jar" "/usr/lib/ant-launcher.jar")))
 '(jde-jdk-registry (quote (("1.6.0" . "/usr/lib/jvm/java-6-sun/")))))

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 99 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
