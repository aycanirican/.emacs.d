(setq-default gnus-asynchronous t)
(setq-default gnus-novice-user nil)
(setq-default gnus-use-cache t)
(setq gnus-registry-max-entries 2500
      gnus-registry-use-long-group-names t)
(gnus-registry-initialize)

;;(setq imap-ssl-program "/usr/sbin/stunnel -c -A /etc/certs/ -v 2 -S 0 -f -r %s:%p")

(spam-initialize)
(require 'spam)
(require 'pgg)

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
      pgg-cache-passphrase         't
      pgg-query-keyserver          't
      pgg-passphrase-cache-expiry  600
      mm-verify-option             'always
      mm-decrypt-option            'always
      message-send-mail-function 'smtpmail-send-it
      gnus-asynchronous t
      gnus-use-demon t
      gnus-agent-expire-days 12
      gnus-visible-headers '("^From" "^To" "^Cc" "^Bcc" "^Subject" "^Date" "^User-Agent")
      gnus-save-newsrc-file nil 
      gnus-read-newsrc-file nil)


(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)
(gnus-demon-add-handler 'gnus-group-get-new-news 10 2)
