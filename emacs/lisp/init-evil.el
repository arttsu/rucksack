(use-package evil
  :demand
  :after dired
  :config
  (evil-mode 1)
  :bind
  (:map evil-normal-state-map
   ("-" . dired-jump)
   :map dired-mode-map
   ("-" . dired-up-directory)))

(use-package evil-org
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook (lambda () (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-magit
  :after (evil magit))
