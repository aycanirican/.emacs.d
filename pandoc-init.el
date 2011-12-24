(when (locate-library "pandoc")
  (add-hook 'markdown-mode-hook 'turn-on-pandoc))
