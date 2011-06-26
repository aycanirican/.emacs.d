;; install manually
(when (not (locate-library "magit"))
  (add-to-list 'load-path "~/elisp/magit"))

(require 'magit)