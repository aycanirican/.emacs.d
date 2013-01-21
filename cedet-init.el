;; CEDET 
(when (locate-library "cedet")

  ;; Enable EDE (Project Management) features
  (global-ede-mode 1)

  (semantic-load-enable-gaudy-code-helpers)
  (semantic-load-enable-all-exuberent-ctags-support)
  (global-srecode-minor-mode 1)

  ;; jdee hacks
  (defvar compilation-nomessage-regexp-alist '())
  (add-hook 'compilation-mode-hook (lambda () (setq buffer-read-only nil)))
  (progn
    (autoload 'jde-mode "jde" "JDE mode." t)
    (setq auto-mode-alist
          (append
           '(("\\.java$" . jde-mode))
           auto-mode-alist))
  )
 (setq jde-ant-home "/usr")
 (setq jde-ant-buildfile "./build.xml")
 (setq jde-ant-use-global-classpath nil)
 (setq jde-compile-option-classpath (quote ("/usr/lib/ant.jar" "/usr/lib/ant-launcher.jar")))
 (setq jde-jdk-registry (quote (("1.6.0" . "/usr/lib/jvm/java-6-sun/"))))
)
