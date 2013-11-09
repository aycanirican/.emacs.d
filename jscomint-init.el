(require 'js-comint)
(setq inferior-js-program-command "nodejs") ;; not "node-repl"
;; Use your favorited js mode here:
(add-hook 'js3-mode-hook
          '(lambda () 
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-cl" 'js-load-file-and-go)
             ))
