(use-package exec-path-from-shell
  :when (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))
