;; ghc-mod
(add-to-list 'load-path "~/elisp/ghcmod/")
(autoload 'ghc-init "ghc" nil t)
(setq ghc-ghc-options `(,(concat "-i" (expand-file-name "~/Devel/picus/picus/dist/build/autogen")) "-isrc"))
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
