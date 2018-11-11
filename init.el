
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)


(load-theme 'tango-dark t)

(setq indent-tabs-mode t)

(setq-default tab-width 2)
(setq default-tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28
			30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60))


(load (expand-file-name "~/.roswell/helper.el"))
