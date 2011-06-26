(require 'slime)

(add-hook 'lisp-mode-hook 
	  (lambda ()
	    (progn
	      (slime-mode t))))

(add-hook 'slime-mode-hook 
	  (lambda ()
	    (slime-define-key "\C-c\C-k"
			      (lambda ()
				(interactive)
				(save-buffer)
				(slime-compile-and-load-file)))))

(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(setf slime-lisp-implementations
      '((sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix)
        (clisp ("clisp") :coding-system utf-8-unix)
        (cmucl ("lisp") :coding-system iso-latin-1-unix)))

(slime-setup '(inferior-slime slime-autodoc slime-banner slime-xref-browser
	       slime-references slime-presentations
	       slime-presentation-streams slime-fancy-inspector))

(setq lisp-indent-function 'common-lisp-indent-function)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(setq slime-multiprocessing t)

;; SBCL
(defun sbcl ()
  (interactive)
  (setq slime-net-coding-system 'utf-8-unix)
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (load "slime"))

(sbcl)
