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
(setq spam-use-bogofilter t
      spam-log-to-registry t
      spam-use-BBDB t
      spam-use-regex-headers t
      spam-mark-only-unseen-as-spam t
      spam-split-group "INBOX.Spam"
      nnimap-split-download-body t
      spam-move-spam-nonspam-groups-only nil
      spam-mark-only-unseen-as-spam t
      spam-mark-ham-unread-before-move-from-spam-group t
      query-user-mail-address nil
      mail-user-agent gnus-user-agent
      nnimap-split-inbox '("INBOX")
      nnimap-split-predicate "UNDELETED"
      nnimap-split-crosspost nil
      imap-ssl-program "openssl s_client -quiet -ssl3 -connect %s:%p"
      ;; pgg-cache-passphrase         't
      ;; pgg-query-keyserver          't
      ;; pgg-passphrase-cache-expiry  600
      ;; mm-verify-option             'always
      ;; mm-decrypt-option            'always
      message-send-mail-function 'smtpmail-send-it
      gnus-asynchronous t
      gnus-use-demon t
      gnus-agent-expire-days 12
      gnus-visible-headers '("^From" "^To" "^Cc" "^Bcc" "^Subject" "^Date" "^User-Agent")
      gnus-save-newsrc-file nil 
      gnus-read-newsrc-file nil)


(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(gnus-demon-add-handler 'gnus-group-get-new-news 10 2)
