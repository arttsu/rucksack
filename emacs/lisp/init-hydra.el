(use-package hydra
  :config
  (defhydra org-hydra (:color blue)
    "Org mode helpers"
    ("c" org-copy-src "Copy source block"))
  :bind
  ("C-c o" . org-hydra/body))
