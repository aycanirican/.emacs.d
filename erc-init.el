(require 'erc)
(require 'erc-dcc)
(require 'erc-match)
(require 'tls)

(defun irc ()
  (interactive)
  (select-frame (make-frame '((name . "IRC Frame")
			      (minibuffer . t))))
  (call-interactively 'erc-bitlbee)
  (sit-for 1)
  (call-interactively 'erc-core)
  (sit-for 2)
  (call-interactively 'erc-freenode))


(defmacro ai-erc-connect (command server port ssl nick pass)
  (fset command
	`(lambda (arg)
	   (interactive "p")
	   (if (not ,ssl)
	       (erc :server ,server :port ,port :nick ,nick :full-name ,erc-user-full-name :password ,pass)
	     (erc-tls :server ,server :port ,port :nick ,nick :full-name ,erc-user-full-name :password ,pass)))))

;; use the macro to generate separate funs for servers.
;; (ai-erc-connect erc-freenode "10.40.40.40" 6667 nil irc-nick freenode-password)
(ai-erc-connect erc-freenode "irc.freenode.net" 7000 t irc-nick freenode-password)
(ai-erc-connect erc-bitlbee "localhost" 6667 nil irc-nick nil)
(ai-erc-connect erc-core "irc.core.gen.tr" 8994 t irc-nick core-password)
(ai-erc-connect erc-efnet "irc.paraphysics.net" 6667 nil irc-nick nil)

;; Send passwords after connect
(setq erc-nickserv-passwords
      '((freenode     ((irc-nick . freenode-password)))
	(c0r3net      ((irc-nick . core-password)))))

(defun bitlbee-identify () 
  "If we're on the bitlbee server, send the identify command to the #bitlbee channel."
  (when (and (string= "localhost" erc-session-server)
	     (= 6667 erc-session-port)
	     (string= "&bitlbee" (buffer-name)))
    (erc-send-command (format "PRIVMSG &bitlbee :identify %s" bitlbee-password))))
(add-hook 'erc-join-hook 'bitlbee-identify)

(defun send-oper (server nick)
  "If we're on the core server, send the oper command."
  (when (and (string= "irc.core.gen.tr" server)
	     (= 8994 erc-session-port))
    (erc-send-command (format "OPER %s %s" core-oper-name core-oper-password))))
(add-hook 'erc-after-connect 'send-oper)

;; Automatically /join those
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#haskell" "#happs" "#snapframework")
        ("paraphysics.net" "#dragonflybsd")))

(setq erc-keywords '("fxr" "v0|d" "c0r3"))
(setq erc-notify-list '("v0|d"))

;; ignore notices etc...
(setq erc-hide-list '())
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477" "VOICE" "DEVOICE"))

;; don't show the server on modeline
(setq erc-mode-line-format "%t %a")

;; timestamp on left etc...
(setq 
 erc-insert-timestamp-function 'erc-insert-timestamp-left
 erc-timestamp-format "%H:%M "
 erc-timestamp-only-if-changed-flag nil
 erc-hide-timestamps nil)

;; diğer yapılandırma değerleri
(custom-set-variables
 '(erc-prompt-for-nickserv-password nil)
 '(erc-auto-query (quote window-noselect))
 '(erc-track-mode t)
 '(erc-log-mode t)
 '(erc-server-auto-reconnect nil)
 '(erc-timestamp-mode t)
 '(erc-echo-timestamps t)
 '(erc-auto-discard-away t)
 '(erc-autoaway-idle-seconds 3600)
 '(erc-auto-set-away t)
 '(erc-enable-logging (quote erc-log-all-but-server-buffers))
 '(erc-log-insert-log-on-open nil)
 '(erc-dcc-get-default-directory "~/dcc/")
 '(erc-dcc-server-port 12345)
 '(erc-log-channels-directory "~/.irclogs/")
 '(erc-save-buffer-on-part t)
 '(erc-modules '(autoaway autojoin button capab-identify completion fill irccontrols log match netsplit stamp notify page ring scrolltobottom services stamp track truncate))
 '(erc-kill-queries-on-quit t)
 '(erc-kill-server-buffer-on-quit t)
 ;;'(erc-debug-irc-protocol t)
 )
