(defun projectile-git-project-directories ()
  "Return a list of git project directories known to Projectile."
  (mapcar (lambda (project) (cons (directory-file-name project) 1))
	  (cl-remove-if-not (lambda (project) (file-directory-p (concat project ".git")))
			    (projectile-relevant-known-projects))))

(use-package projectile
  :demand
  :after magit
  :custom
  (projectile-switch-project-action 'projectile-dired)
  :config
  (projectile-mode 1)
  (customize-set-variable 'magit-repository-directories (projectile-git-project-directories))
  :bind
  (:map projectile-mode-map
   ("s-p" . projectile-command-map)))
