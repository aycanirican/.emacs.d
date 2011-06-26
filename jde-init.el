;; JDE
(when (locate-library "cedet")

  (load "cedet.el" nil t t)

  ;; jdee hacks
  (defvar compilation-nomessage-regexp-alist '())
  (add-hook 'compilation-mode-hook (lambda () (setq buffer-read-only nil)))
  (progn
    (autoload 'jde-mode "jde" "JDE mode." t)
    (setq auto-mode-alist
          (append
           '(("\\.java$" . jde-mode))
           auto-mode-alist))
    (require 'beanshell)
    (require 'jde-compile)
    (defclass jde-compile-javac-16 (jde-compile-javac-15)
      ()
      "Class of J2SDK 1.6 javac compilers.")
    
    (defmethod initialize-instance ((this jde-compile-javac-16) &rest fields)
      (call-next-method)
      (oset this version "1.6"))
    
    (add-to-list 'jde-compile-javac-compilers (jde-compile-javac-16 "javac 1.6.x") t))
  )