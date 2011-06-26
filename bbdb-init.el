(when (locate-library "bbdb")
  (require 'bbdb)
  (bbdb-initialize 'gnus 'message)
  (bbdb-insinuate-gnus)
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  (bbdb-initialize 'gnus 'message)
  (setq bbdb-default-country "tr")
  (setq bbdb-file "~/.emacs.d/.bbdb")
  (setq bbdb-send-mail-style 'message)
  (setq bbdb-user-mail-names (regexp-opt '("aycan@core.gen.tr"
					   "aycan.irican@core.gen.tr")))
  (setq bbdb-north-american-phone-numbers-p nil)
  ;;cycling while completing email addresses
  (setq bbdb-complete-name-allow-cycling t)
  ;;No popup-buffers
  (setq bbdb-use-pop-up nil)
)
