(when (and (locate-library "muse") (locate-library "planner"))
  (require 'muse-mode)     ; load authoring mode
  (require 'muse-html)     ; load publishing styles I use
  (require 'muse-latex)
  (require 'muse-context)
  
  (setq planner-project "WikiPlanner")
  (setq muse-project-alist
	'(("WikiPlanner"
	   ("~/plans"   ;; Or wherever you want your planner files to be
	    :default "index"
	    :major-mode planner-mode
	    :visit-link planner-visit-link))))
  (require 'planner))
