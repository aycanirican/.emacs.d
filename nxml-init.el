(when (locate-library "nxml-mode")
  (fset 'html-mode 'nxml-mode)
  (fset 'xml-mode 'nxml-mode)
  )