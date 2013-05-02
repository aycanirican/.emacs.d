;;
;; yasnippet
;;
(require 'yasnippet)

(when (locate-library "yasnippet")
  ;; (setq yas/trigger-key "<C-tab>") 
  ;; make sure this is before yas/initialize
  (setq yas-snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/snippets/HSnippets"))
  (yas-reload-all))
