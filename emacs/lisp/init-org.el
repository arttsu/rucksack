(straight-use-package 'org-plus-contrib)

(use-package org
  :demand
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link)))

(defun org-find-heading (heading)
  (re-search-forward (concat "^" heading "$") nil t))

(defun org-find-or-create-heading (heading)
  (progn
    (goto-char (point-min))
    (when (not (org-find-heading heading))
      (goto-char (point-max))
      (open-line 1)
      (insert heading))))

(defun org-find-or-create-journal-heading ()
  (progn
    (org-find-or-create-heading (format-time-string "* %Y, %B"))))

(defun org-copy-src ()
  "Copy the contents of a source block."
  (interactive)
  (let* ((context
	  (org-element-lineage
	   (org-element-context)
	   '(babel-call inline-src-block src-block)
	   t)))
    (when context
      (let* ((info (org-babel-lob-get-info context))
	     (info (if info (copy-tree info) (org-babel-get-src-block-info))))
	(kill-new (nth 1 info))))))

(customize-set-variable 'org-log-into-drawer nil)

(customize-set-variable 'org-todo-keywords '((sequence "TODO(t@)" "IN_PROGRESS(p@)" "WAIT(w@)" "|" "DONE(d@)" "CANCELED(c@)")))

(customize-set-variable 'org-capture-templates
			`(("t" "Todo" entry
			   (file+function "~/zettelkasten/journal.org" org-find-or-create-journal-heading)
			   (file "~/rucksack/emacs/capture-templates/todo.txt"))
			  ("n" "Note" entry
			   (file+function "~/zettelkasten/journal.org" org-find-or-create-journal-heading)
			   (file "~/rucksack/emacs/capture-templates/note.txt"))
			  ("l" "List entry")
			  ("lb" "A book to read" entry
			   (file+headline "~/zettelkasten/books.org" "To read")
			   (file "~/rucksack/emacs/capture-templates/list-entry.txt"))
			  ("lp" "A place to visit" entry
			   (file+headline "~/zettelkasten/places.org" "To visit")
			   (file "~/rucksack/emacs/capture-templates/list-entry.txt"))))

(customize-set-variable 'org-refile-targets '((org-agenda-files :maxlevel . 1)))
