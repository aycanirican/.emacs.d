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
      org-odd-levels-only t
      org-agenda-include-diary t)

(require 'org-mouse)
(setq org-agenda-files 
      (list "/home/fxr/org/work.org"))

(require 'org-install)
(setq org-directory "~/org/"
      org-mobile-directory "~/Dropbox/org/"
      org-mobile-inbox-for-pull "~/org/from-mobile.org")

