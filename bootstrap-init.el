(setq emacs-start-time (current-time))
(setq tramp-default-method "ssh"
      tramp-chunksize 500)

;; set all the different path implementations :(
(let ((my-path (concat "/home/aycan/ghc762/bin:/home/aycan/.cabal/bin:" (getenv "PATH"))))
    (setq eshell-path-env my-path)
    (setq exec-path (append '("/home/aycan/ghc762/bin" "/home/aycan/.cabal/bin") exec-path))
    (setenv "PATH" my-path))

;; start emacs server
(server-start)

;; Backup and auto safe files goes to /tmp/
(setq temporary-file-directory "~/.tmp/")
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(menu-bar-mode 0)

;; Enable iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(display-time)

;; packages
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not (string-equal "root" (getenv "USER")))
  (load "~/.emacs.d/pivotaltracker-init")
  (load "~/.emacs.d/bindings-init")
  (load "~/.emacs.d/smex-init")
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
  ;;(load "~/.emacs.d/cedet-init")
  ;;(load "~/.emacs.d/android-init")
  (load "~/.emacs.d/gnus-init")
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
;; '(mouse-avoidance-mode 'animate)
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

;; Eshell path fix. Toggle between eshell-currentwindow
(require 'eshell)

(global-set-key 
 (kbd "C-M-e")
 (lambda () "Bring up a full-screen eshell or restore previous config."
   (interactive)
   (if (string= "eshell-mode" major-mode)
       (jump-to-register :eshell-fullscreen)
     (progn
       (window-configuration-to-register :eshell-fullscreen)
       (eshell)
       (delete-other-windows)))))

;; Reset the UI to my norms
(defun reset-ui (&optional frame)
  (if frame
      (select-frame frame))
  (interactive)
  (delete-other-windows)
  (if (window-system)
      (cond
       ((= 1050 (display-pixel-height))
        (set-frame-size (selected-frame) 203 71)
        (set-frame-position (selected-frame) 42 0))
       (t
        (set-frame-size (selected-frame) 163 44)
        (set-frame-position (selected-frame) 42 0))))
  (split-window-horizontally)
  (set-window-buffer nil "*scratch*"))

(reset-ui)


;; flymake temporary file fix
(defun flymake-create-temp-intemp (file-name prefix)
  "Return file name in temporary directory for checking FILE-NAME.
This is a replacement for `flymake-create-temp-inplace'. The
difference is that it gives a file name in
`temporary-file-directory' instead of the same directory as
FILE-NAME.

For the use of PREFIX see that function.

Note that not making the temporary file in another directory
\(like here) will not if the file you are checking depends on
relative paths to other files \(for the type of checks flymake
makes)."
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((name (concat
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" prefix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (make-temp-file name nil ext))
         )
    (flymake-log 3 "create-temp-intemp: file=%s temp=%s" file-name temp-name)
    temp-name))
