(setq-default gnus-asynchronous t)
(setq-default gnus-novice-user nil)
(setq-default gnus-use-cache t)
(setq gnus-registry-max-entries 2500
      gnus-registry-use-long-group-names t)
(gnus-registry-initialize)

;;(setq imap-ssl-program "/usr/sbin/stunnel -c -A /etc/certs/ -v 2 -S 0 -f -r %s:%p")

(spam-initialize)
(require 'spam)
;; EasyPG Assistant settings
(require 'epg-config)
(require 'epa-mail)

;; personalization
(setq user-full-name "Aycan iRiCAN")
(setenv "ORGANIZATION" "Kor Ltd.")

(setq user-mail-address "aycan.irican@core.gen.tr"
      query-user-mail-address nil
      mail-user-agent gnus-user-agent)

(setq gnus-select-method '(nnimap "coregentr"
			    (nnimap-address "imap.core.gen.tr")
			    (nnimap-server-port 993)
			    (nnimap-stream ssl)
                            (nnimap-inbox "INBOX")
                            (nnimap-unsplittable-articles nil)
			    (nnimap-authenticator login)
                            (nnimap-expunge-on-close always)
                            (setq nnimap-nov-is-evil t)
			    (nnimap-list-pattern ("INBOX" "*"))
                            (nnimap-split-methods 'nnmail-split-fancy)))

(setq nnmail-split-abbrev-alist
      '((any . 
             "from\\|to\\|cc\\|sender\\|apparently-to\\|resent-from\\|resent-to\\|resent-cc")
        (mail . "mailer-daemon\\|postmaster\\|uucp")
        (to . "to\\|cc\\|apparently-to\\|resent-to\\|resent-cc")
        (from . "from\\|sender\\|resent-from")
        (daemon-errors . "Cron daemon\\|mailer-daemon")
        (list . "list-id\\|x-mailing-list\\|to\\|cc\\|sender")))

(setq nnimap-split-rules '(("coregentr" ("INBOX" nnimap-split-fancy)))
      nnimap-split-fancy 
      '(| (: gnus-registry-split-fancy-with-parent)
          (: spam-split 'spam-use-regex-headers)
          ("List-Id" ".*full-disclosure.lists.grok.org.uk.*" "INBOX.Lists.Full-Disclosure")
          ("List-Id" ".*haskell-cafe.haskell.org.*" "INBOX.Lists.haskell-cafe")
          ("List-Id" ".*xmonad.haskell.org.*" "INBOX.Lists.XMonad")
          ("List-Id" ".*elephant-devel.common-lisp.net.*" "INBOX.Lists.Elephant-Devel")
          ("List-Id" ".*plt-scheme.list.cs.brown.edu.*" "INBOX.Lists.Plt-scheme")
          ("List-Id" ".*slime-devel.common-lisp.net.*" "INBOX.Lists.Slime-Devel")
          ("List-Id" ".*sbcl-devel.lists.sourceforge.net.*" "INBOX.Lists.sbcl-devel")
          ("List-Id" ".*nix-dev.cs.uu.nl.*" "INBOX.Lists.Nixos")
          ("List-Id" ".*Humak.yahoogroups.com.*" "INBOX.Lists.HUMAK")
          ("List-Id" ".*gambit-list.iro.umontreal.ca.*" "INBOX.Lists.Gambit")
          ("List-Id" ".*bese-devel.common-lisp.net.*" "INBOX.Lists.Bese-Devel")
          ("List-Id" ".*happs.googlegroups.com.*" "INBOX.Lists.HAppS")
          ("List-Id" ".*cs-lisp.cs.bilgi.edu.tr.*" "INBOX.Lists.CS-Lisp")
          ("List-Id" ".*bese-devel@common-lisp.net.*" "INBOX.Lists.Bese-Devel")
          ("List-Id" ".*rucksack-devel.common-lisp.net.*" "INBOX.Lists.rucksack")
          ("List-Id" ".*tmb_list.yahoogroups.com.*" "INBOX.Lists.TMB_Lisp")
          ("List-Id" ".*iolib-devel.common-lisp.net.*" "INBOX.Lists.iolib-devel")
          ("List-Id" ".*flapjax.googlegroups.com.*" "INBOX.Lists.flapjax")
          ("List-Id" ".*core-server.googlegroups.com.*" "INBOX.Lists.core-server")
          ("List-Id" ".*snow-users-list.iro.umontreal.ca.*" "INBOX.Lists.snow")
          ("List-Id" ".*gardeners.lispniks.com.*" "INBOX.Lists.Gardeners")
          ("List-Id" ".*reactive.haskell.org.*" "INBOX.Lists.reactive")
          ("List-Id" ".*web-devel.haskell.org.*" "INBOX.Lists.web-devel")
          ("List-Id" ".*haskell-platform.projects.haskell.org.*" "INBOX.Lists.haskell-platform")
          ("List-Id" ".*debian-haskell.lists.debian.org.*" "INBOX.Lists.haskell-debian")
          ("List-Id" ".*movitz-devel.common-lisp.net.*" "INBOX.Lists.Movitz-Devel")
          ("List-Id" ".*glasgow-haskell-users.haskell.org.*" "INBOX.Lists.haskell-ghc")
          ("List-Id" ".*users.dragonflybsd.org.*" "INBOX.Lists.dfly-users")
          ;;("X-Spam-Status" "Yes.*" "INBOX.Spamassassined")
          ;;("subject" "Backup report" "INBOX.backupreports")
          ;;("from" "MAILER-DAEMON@example\\.com" "INBOX.example.mailer-daemon") 
          (: spam-split)
          "INBOX.mail.unsorted"))

(setq mml2015-use 'epg
      mml2015-verbose t
      mml2015-signers '("2D002BBF")
      epg-user-id "2D002BBF"
      mml2015-encrypt-to-self t
      mml2015-always-trust nil
      mml2015-cache-passphrase t
      mml2015-passphrase-cache-expiry '36000
      mml2015-sign-with-sender t
      
      gnus-message-replyencrypt t
      gnus-message-replysign t
      gnus-message-replysignencrypted t
      gnus-treat-x-pgp-sig t
      
      ;;       mm-sign-option 'guided
      ;;       mm-encrypt-option 'guided
      mm-verify-option 'always
      mm-decrypt-option 'always
      
      gnus-buttonized-mime-types
      '("multipart/alternative"
        "multipart/encrypted"
        "multipart/signed")
      
      epg-debug t ;;  then read the *epg-debug*" buffer
      )

;; Customizations
(set (if (< emacs-major-version 24) 'nnimap-split-inbox 'nnimap-inbox) "INBOX")

(setq spam-use-bogofilter t
      spam-log-to-registry t
;;      spam-use-BBDB t
      spam-use-regex-headers t
      spam-mark-only-unseen-as-spam t
      spam-split-group "INBOX.Spam"
      nnimap-split-download-body t
      spam-move-spam-nonspam-groups-only nil
      spam-mark-only-unseen-as-spam t
      spam-mark-ham-unread-before-move-from-spam-group t
      query-user-mail-address nil
      mail-user-agent gnus-user-agent
      nnimap-split-predicate "UNDELETED"
      nnimap-split-crosspost nil
      imap-ssl-program "openssl s_client -quiet -ssl3 -connect %s:%p"
      ;; imap-ssl-program "/usr/sbin/stunnel -c -A /etc/certs/ -v 2 -S 0 -f -r %s:%p"
      ;; mm-verify-option             'always
      ;; mm-decrypt-option            'always
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "mail.core.gen.tr"
      smtpmail-auth-credentials "~/.authinfo"
      smtpmail-starttls-credentials '(("mail.core.gen.tr" 587 nil nil))
      smtpmail-default-smtp-server "mail.core.gen.tr"
      smtpmail-smtp-service 587
      nnimap-authinfo-file "~/.authinfo"
      starttls-gnutls-program "gnutls-cli"
      starttls-extra-arguments '("--insecure")
      starttls-use-gnutls t
      gnus-asynchronous t
      gnus-use-demon t
      gnus-agent-expire-days 12
      gnus-visible-headers '("^From" "^To" "^Cc" "^Bcc" "^Subject" "^Date" "^User-Agent")
      gnus-save-newsrc-file nil 
      gnus-read-newsrc-file nil)

;; No HTML mail
(setq gnus-buttonized-mime-types
      '("multipart/alternative" "multipart/signed")
      mm-discouraged-alternatives
      '("text/html" "image/.*"))

(setq gnus-outgoing-message-group
      '(lambda () (list (if (message-mail-p) gnus-newsgroup-name)
                   "nnimap+coregentr:INBOX.Sent")))

(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(gnus-demon-add-handler 'gnus-group-get-new-news 10 2)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
