(require 'cask "~/.cask/cask.el")
(cask-initialize)

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :config
  (progn
    ;; Use Company for completion
    (bind-key [remap completion-at-point] #'company-complete company-mode-map)

    (setq company-tooltip-align-annotations t
	  ;; Easy navigation to candidates with M-<n>
	  company-show-numbers t)
    (setq company-dabbrev-downcase nil))
  :diminish company-mode)

(use-package company-go
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (bind-key [remap find-tag] #'godef-jump))
  :config
  (add-hook 'go-mode-hook 'electric-pair-mode))

(use-package python-mode
  :ensure t
  :defer t
  :init
  (progn
    (setq python-shell-interpreter "/usr/bin/ipython3"))
  :config
  (add-hook 'python-mode-hook 'electric-pair-mode))


(use-package company-jedi
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-jedi)))

