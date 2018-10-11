(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)

(load-theme 'tango-dark t)

(setq indent-tabs-mode t)

(setq-default tab-width 2)
(setq default-tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28
			30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60))

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "\C-m") 'newline-and-indent)
	    (define-key python-mode-map (kbd "RET") 'newline-and-indent)))

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(require 'auto-complete-config)
(ac-config-default)
