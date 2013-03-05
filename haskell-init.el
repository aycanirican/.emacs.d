;;;; haskell-mode

;; Add .cabal to the PATH
(setq exec-path (cons "~/.cabal/bin" exec-path))

;; maximum colors
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(setq haskell-font-lock-symbols t)

;; extra key bindings
(global-set-key "\M-C" 'compile)
(global-set-key "\C-^" 'next-error)
(global-set-key "\C-\M-g" 'goto-line)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
		("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode" "Major mode for editing Haskell scripts" t)
(autoload 'literate-haskell-mode "haskell-mode" "Major mode for editing literate Haskell scripts" t)

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(require 'inf-haskell)

;(setq haskell-program-name "/usr/bin/ghci")
;(setq haskell-ghci-program-name "/usr/bin/ghci")
(setq haskell-program-name "~/ghc762/bin/ghci")
(setq haskell-ghci-program-name "~/ghc762/bin/ghci")

(autoload 'run-ghci "haskell-ghci" "Go to the *ghci* buffer" t nil)
(defalias 'run-haskell (quote switch-to-haskell))

(autoload 'switch-to-haskell "inf-haskell"
  "Show the inferior-haskell buffer.  Start the process if needed." t nil)

(define-key haskell-mode-map (kbd "<f3>") (lambda()(interactive)(browse-url (format "http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=%s&start" (current-word)))))
(define-key haskell-mode-map (kbd "<f4>") (lambda()(interactive)(browse-url (format "http://www.haskell.org/hoogle/?hoogle=%s" (current-word)))))

