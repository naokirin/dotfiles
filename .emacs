; package.el
(load-file "~/emacs/package/lisp_emacs-lisp_package.el")
(require 'package)

; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")) ; ついでにmarmaladeも追加
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))

; Initialize
(package-initialize)

; melpa.el
(require 'melpa)


(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

;
; settings for ocaml
;
;; Typerex mode
;; Loading TypeRex mode for OCaml files
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . typerex-mode))
(autoload 'typerex-mode "typerex" "Major mode for editing Caml code" t)
(add-to-list 'exec-path (expand-file-name "~/.opam/4.00.1/bin"))

;; TypeRex mode configuration
(setq ocp-server-command "/usr/local/bin/ocp-wizard")
(setq-default indent-tabs-mode nil)
(setq ocp-auto-complete t)
;(setq ocp-theme "caml_like")
;(setq ocp-syntax-coloring t)

;; Work around slow syntax highligthing.
(setq ocp-syntax-coloring nil)
(setq load-path (cons "caml-mode" load-path))
(if window-system (require 'caml-font))
(add-hook 'typerex-mode-hook 'caml-font-set-font-lock)

; OCaml identing style
;(setq typerex-in-indent 0)
(setq typerex-let-always-indent nil)
(setq typerex-with-indent 0)
(setq typerex-function-indent 0)
(setq typerex-fun-indent 0)
(setq typerex-type-indent 0)
(setq typerex-if-then-else-indent 0) 

;; ProofGeneral
(load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
(load-file "/Users/naoki/.emacs.d/pg-ssr/pg-ssr.el")
(setq coq-prog-name "/Users/naoki/.opam/4.00.1/bin/coqtop.opt")

(defun w-toggle ()
  "ウィンドウ 2 分割時に、縦分割<->横分割"
  (interactive)
  (unless (= (count-windows 1) 2)
    (error "ウィンドウが 2 分割されていません。"))
  (let (before-height (other-buf (window-buffer (next-window))))
  (setq before-height (window-height))
  (delete-other-windows)
  (if (= (window-height) before-height)
    (split-window-vertically)
    (split-window-horizontally)
  )

  (switch-to-buffer-other-window other-buf)
  (other-window -1)))

(provide 'git-now)

(defun now ()
  (interactive)
  (call-process "git" nil "*git now*" nil "now")
  (pop-to-buffer "*git now*" t nil)
  (other-window -1)
  (message "git now!"))

(defun add ()
  (interactive)
  (call-process "git" nil "add" ".")
  (pop-to-buffer "*git add*" t nil)
  (other-window -1)
  (message "git add!"))

(load-file "~/emacs/eproject-0.4/eproject.el")

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/auto-complete-mode")
(setq ac-dir "auto-complete-1.3.1/")
(add-to-list 'load-path ac-dir)
(require 'auto-complete-config)
(ac-config-default)
 
(add-to-list 'ac-dictionary-directories (concat ac-dir "ac-dict/"))
(global-set-key "\M-/" 'ac-start)
;; C-n/C-p で候補を選択
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(add-to-list 'load-path (expand-file-name "~/emacs/auto-complete-exuberant-ctags"))
(require 'auto-complete-exuberant-ctags)
(defun semantic-and-ctags-complete ()
  (interactive)
  (auto-complete '(ac-source-semantic ac-source-exuberant-ctags)))
(semantic-and-ctags-complete)
;(defun ac-common-setup ()
;  (push 'ac-source-exuberant-ctags ac-sources))

;haxe-mode
(require 'haxe-mode)
(add-to-list 'auto-mode-alist '("\\.hx\\'" . haxe-mode))
(autoload 'haxe-mode "haxe-mode" "Major mode for editing Haxe code." t)

(require 'flymake)
(load-file "~/emacs/hx-complete/hxc-complete.el")
(defvar hxc-read-hxml t)
(local-set-key (kbd ".") (lambda () (interactive) (hxc-complete ".")))
;(local-set-key (kbd "(") (lambda () (interactive) (hxc-complete "(")))

(setq-default tab-width 2 indent-tabs-mode nil)
(setq kill-whole-line t)


;; ctags
(require 'ctags nil t)
(setq tags-revert-without-query t)
(setq ctags-command "/usr/local/bin/ctags -e -R *")
(global-set-key (kbd "<f6>") 'ctags-create-or-update-tags-table)
