(require 'cl)
(require 'ess-site)
(require 'ess-noweb)
(require 'noweb-font-lock-mode)
;;
;; Sweave mode stuff.
;;
;(defun Rnw-mode ()
;  (require 'ess-noweb)
;  (add-hook 'noweb-select-doc-mode-hook
;    (function (lambda ()
; (TeX-normal-mode t))))
;  (noweb-mode)
;  (if (fboundp 'R-mode)
;      (setq noweb-default-code-mode 'R-mode)))

(add-to-list 'auto-mode-alist '("\\.Rnw\\'" . Rnw-mode))
(add-to-list 'auto-mode-alist '("\\.Snw\\'" . Rnw-mode))
