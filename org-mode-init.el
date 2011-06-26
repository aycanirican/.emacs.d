;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-font-lock-mode 1)                     ; for all buffers
(add-hook 'org-mode-hook 'turn-on-font-lock)  ; Org buffers only
(transient-mark-mode 1)
(setq org-log-done t
      org-hide-leading-stars t
      org-odd-levels-only t)

(require 'org-mouse)
(setq org-agenda-files 
      (list "/home/fxr/org/work.org"
            "/home/fxr/org/school.org" 
            "/home/fxr/org/home.org"))
