;; ghc-mod
(add-to-list 'load-path "~/elisp/ghcmod/")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
