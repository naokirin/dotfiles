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

;
; settings for ocaml
;

; ocaml-mode
;(setq auto-mode-alist
;      (cons '("\\.ml[iylp]?$" . caml-mode) auto-mode-alist))
;(autoload 'caml-mode "caml" "Major mode for editing Caml code." t)
;(autoload 'run-caml "inf-caml" "Run an inferior Caml process." t)
;(global-set-key "\C-q" 'caml-types-show-type)

; tuareg-mode
;(setq load-path (cons "/usr/local/lib/emacs/site-lisp" load-path))
;(setq auto-mode-alist (cons '("\\.ml[iylp]?$" . tuareg-mode) auto-mode-alist))
;(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;(autoload 'camldebug "camldebug" "Run the Caml debugger" t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TypeRex configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Loading TypeRex mode for OCaml files
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . typerex-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . typerex-mode))
(autoload 'typerex-mode "typerex" "Major mode for editing Caml code" t)

;; TypeRex mode configuration
(setq ocp-server-command "/usr/local/bin/ocp-wizard")
(setq-default indent-tabs-mode nil)
;; Uncomment to enable typerex command menu by right click
;;(setq ocp-menu-trigger [mouse-3])

;; Uncomment to make new syntax coloring look almost like Tuareg
;;(setq ocp-theme "tuareg_like")
;; Uncomment to disable new syntax coloring and use Tuareg one
;;(setq ocp-theme "tuareg")
;; Uncomment to disable syntax coloring completely
;;(setq ocp-syntax-coloring nil)

;; TypeRex currently uses the Tuareg indentation mechanism. To get a result
;; closer to the OCaml programming guidelines described at
;; http://caml.inria.fr/resources/doc/guides/guidelines.en.html
;; Some users prefer to indent slightly less, as
;;(setq typerex-let-always-indent nil)
(setq typerex-with-indent 0)
(setq typerex-function-indent 0)
(setq typerex-fun-indent 0)
;; Another reasonable choice regarding if-then-else is:
(setq typerex-if-then-else-indent 0)

;;;; Auto completion (experimental)
;;;; Don't use M-x invert-face default with auto-complete! (emacs -r is OK)
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/auto-complete-mode")
;;(setq ocp-auto-complete t)

;;;; Using <`> to complete whatever the context, and <C-`> for `
;;(setq auto-complete-keys 'ac-keys-backquote-backslash)
;;;; Options: nil (default), 'ac-keys-default-start-with-c-tab, 'ac-keys-two-dollar
;;;; Note: this overrides individual auto-complete key settings

;;;; I want immediate menu pop-up
;;(setq ac-auto-show-menu 0.)
;;;; Short delay before showing help
;;(setq ac-quick-help-delay 0.3)
;;;; Number of characters required to start (nil to disable)
;;(setq ac-auto-start 0)

;;;; Uncomment to enable auto complete mode globally (independently of OCaml)
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "/usr/local/share/emacs/site-lisp/auto-complete-mode/ac-dict")
;;(ac-config-default)

;; For debugging only
;;;;(setq ocp-debug t)
;;;;(setq ocp-profile t)
;;;;(setq ocp-dont-catch-errors t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End of TypeRex configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;


;; TypeRex mode configuration
(setq typerex-in-indent 0)
(setq-default indent-tabs-mode nil)
(setq ocp-menu-trigger [mouse-3])
(add-to-list 'load-path "~/.emacs.d/auto-complete-mode")
(setq ocp-auto-complete t)
(setq auto-complete-keys 'ac-keys-backquote-backslash)
(setq ac-auto-start 0)

(setq load-path (cons "/usr/local/share/emacs/site-lisp/caml-mode" load-path))


;; ProofGeneral
(load-file "/usr/local/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")
(setq coq-prog-name "/usr/local/bin/coqtop.opt")

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
