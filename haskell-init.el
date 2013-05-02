;;;; haskell-mode
;; Add .cabal to the PATH
(setq exec-path (cons "~/.cabal/bin" exec-path))

;; maximum colors
(setq font-lock-maximum-decoration t)
(setq haskell-font-lock-symbols t)

;; extra key bindings
(global-set-key "\M-C" 'compile)
(global-set-key "\C-^" 'next-error)
(global-set-key "\C-\M-g" 'goto-line)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Add .hs to speedbar
(require 'speedbar)
(speedbar-add-supported-extension ".hs")
(speedbar-add-supported-extension ".lhs")
(speedbar-add-supported-extension ".hsc")

;; haskell-interactive-mode
(autoload 'notify "notify" "Notify TITLE, BODY." t)
(autoload 'haskell-mode "haskell-mode" "haskell" t)
(autoload 'literate-haskell-mode "haskell-mode" "literate haskell" t)

(require 'inf-haskell)

(custom-set-variables
 '(haskell-process-type 'ghci)
 '(haskell-notify-p t)
 '(haskell-tags-on-save t)
 '(haskell-stylish-on-save t)
 '(haskell-ghci-program-args ("-read-dot-ghci")))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'haskell-hook)
(add-hook 'haskell-cabal-mode-hook 'haskell-cabal-hook)
(add-hook 'haskell-mode-hook '(lambda () (yas-minor-mode)))

(autoload 'switch-to-haskell "inf-haskell"
 "Show the inferior-haskell buffer.  Start the process if needed." t nil)
(autoload 'literate-haskell-mode "haskell-mode" "Major mode for editing literate Haskell scripts" t)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
		("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))

;(setq haskell-program-name "/usr/bin/ghci")
;(setq haskell-ghci-program-name "/usr/bin/ghci")
;(setq haskell-program-name "~/ghc762/bin/ghci")
;(setq haskell-ghci-program-name "~/ghc762/bin/ghci")

(autoload 'run-ghci "haskell-ghci" "Go to the *ghci* buffer" t nil)
(defalias 'run-haskell (quote switch-to-haskell))

(defun haskell-hook ()
  (define-key haskell-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)

  ;; Jump to the definition of the current symbol.
  (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)

  ;; Indent the below lines on columns after the current column.
  (define-key haskell-mode-map (kbd "C-<right>")
    (lambda ()
      (interactive)
      (haskell-move-nested 1)))
  ;; Same as above but backwards.
  (define-key haskell-mode-map (kbd "C-<left>")
    (lambda ()
      (interactive)
      (haskell-move-nested -1)))

  (define-key haskell-mode-map (kbd "<f3>") (lambda()(interactive)(browse-url (format "http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=%s&start" (current-word)))))
  (define-key haskell-mode-map (kbd "<f4>") (lambda()(interactive)(browse-url (format "http://www.haskell.org/hoogle/?hoogle=%s" (current-word))))))

(defun haskell-cabal-hook ()
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map [?\C-c ?\C-z] 'haskell-interactive-switch))
