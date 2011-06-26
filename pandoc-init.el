(add-to-list 'load-path "~/elisp/pandoc-mode/src/")
(load "pandoc-mode")
(add-hook 'markdown-mode-hook 'turn-on-pandoc)
