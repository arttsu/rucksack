(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load custom-file)

(customize-set-variable 'create-lockfiles nil)
(customize-set-variable 'make-backup-files nil)

(customize-set-variable 'inhibit-startup-screen t)
(customize-set-variable 'initial-scratch-message nil)

;; https://github.com/lewang/flx#gc-optimization
;;
;; GC time can contribute significantly to the runtime of computation
;; that allocates and frees a lot of memory. This increases GC
;; threshold from 0.76 MB allocated to 20 MB.
(customize-set-variable 'gc-cons-threshold 20000000)

(defun save-all-buffers ()
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all-buffers)
