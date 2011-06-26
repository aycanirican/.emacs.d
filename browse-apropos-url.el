;; http://www.emacswiki.org/emacs/BrowseAproposURL

(require 'browse-url)

(setq apropos-url-alist
      '(
        ("^g:? +\\(.*\\)" . ;; Google Web 
         "http://www.google.com/search?q=\\1")

        ("^g?w:? +\\(.*\\)" .  ;; Google Wikipedia 
         "http://www.google.com/search?q=site%3Aen.wikipedia.org+\\1")
        
        ("^ge:? +\\(.*\\)" .  ;; Emacs Wiki
         "http://www.google.com/search?q=site%3Awww.emacswiki.org+\\1")
        
        ("^g?p:? +\\(.*\\)" .  ;; Google Python 
         "http://www.google.com/search?hl=en&q=site%3Adocs.python.org%2Ftutorial+\\1")
        
        ("^g?i:? +\\(.*\\)" . ;; Google Images
         "http://images.google.com/images?sa=N&tab=wi&q=\\1")

        ("^gd:? +\\(\\w+\\)|? *\\(\\w+\\) +\\(.*\\)" . ;; Google Dict
         "http://www.google.com/dictionary?aq=f&langpair=\\1|\\2&q=\\3&hl=\\1")
        
        ("^hs:? +\\(.*\\)" . ;; Haskell
	  "http://holumbus.fh-wedel.de/hayoo/hayoo.html?query=\\1")
	
        ("^\\(.*\\)" . ;; Default
         "http://www.google.com/search?q=\\1")
        ))

;; Don't know if it's the best way , but it seemed to work. (Requires emacs >= 20)
(defun browse-apropos-url (text &optional new-window)
  (interactive (browse-url-interactive-arg "Location: "))
  (let ((text (replace-regexp-in-string 
               "^ *\\| *$" "" 
               (replace-regexp-in-string "[ \t\n]+" " " text))))
    (let ((url (assoc-default 
                text apropos-url-alist 
                '(lambda (a b) (let () (setq __braplast a) (string-match a b)))
                text)))
      (browse-url (replace-regexp-in-string __braplast url text) new-window))))


(defun browse-apropos-url-on-region (min max text &optional new-window)
  (interactive "r \nsAppend region to location: \nP")
  (browse-apropos-url (concat text " " (buffer-substring min max)) new-window))

(provide 'browse-apropos-url)
