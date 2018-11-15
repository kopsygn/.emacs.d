(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
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

;;
;; Auto Complete
;;
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(ac-set-trigger-key "TAB")
(setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
(setq ac-use-fuzzy t)          ;; 曖昧マッチ


(load (expand-file-name "~/.roswell/helper.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (neotree auto-complete ## slime yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq common-lisp-hyperspec-root
      (concat "file://" (expand-file-name "/usr/share/doc/hyperspec/"))
      common-lisp-hyperspec-symbol-table
      (expand-file-name "/usr/share/doc/hyperspec/Data/Map_Sym.txt"))

;w3mの設定
(require 'w3m-load)

;; HyperSpecをw3mで見る
(defadvice common-lisp-hyperspec
  (around hyperspec-lookup-w3m () activate)
  (let* ((window-configuration (current-window-configuration))
         (browse-url-browser-function
          `(lambda (url new-window)
             (w3m-browse-url url nil)
             (let ((hs-map (copy-keymap w3m-mode-map)))
               (define-key hs-map (kbd "q")
                 (lambda ()
                   (interactive)
                   (kill-buffer nil)
                   (set-window-configuration ,window-configuration)))
n               (use-local-map hs-map)))))
    ad-do-it))

;日本語利用
(setq slime-net-coding-system 'utf-8-unix)

;; カーソル付近にある単語の情報を表示
(slime-autodoc-mode)

;=======================================================================
; 対応する括弧を光らせる
;=======================================================================
(show-paren-mode)

;=======================================================================
; リージョンに色を付ける
;=======================================================================
(setq transient-mark-mode t)

;=======================================================================
; 行数を表示する
;=======================================================================
(global-linum-mode t)
(setq linum-format "%d ")


;=======================================================================
; ディレクトリツリー表示
;=======================================================================
(setq neo-theme 'ascii) ;; icon, classic等もあるよ！
(setq neo-persist-show t) ;; delete-other-window で neotree ウィンドウを消さない
(setq neo-smart-open t) ;; neotree ウィンドウを表示する毎に current file のあるディレクトリを表示する

;=======================================================================
;スクロールバー非表示
;=======================================================================
(scroll-bar-mode 0)
