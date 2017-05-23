;;; package --- Summary

;;; Commentary:
;;; Current pcurry .emacs on Karhoo MacBook Pro

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq inhibit-startup-message t)                 ;no splash screen
(setq inhibit-splash-screen t)                   ;Eliminate GNU splash screen


;;; Imports my shell environment PATH when on a mac
(when (memq window-system '(mac ns))
  (let ((path (shell-command-to-string "source .zshrc; echo -n $PATH")))
    (setenv "PATH" path)
    (setq exec-path
          (append
           (split-string-and-unquote path ":")
           exec-path))))

;; el-get basic setup and autoload
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(when (memq window-system '(mac ns))
  (require 'exec-path-from-shell)
  (exec-path-from-shell-copy-envs '("PYTHONPATH" "MANPATH")))

(load-theme 'wombat)

;; desktop mode (save buffers on exit)
;; autosave buffers
(require 'desktop)
(desktop-save-mode 1)
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))

;;; autosave hook
(add-hook 'auto-save-hook 'my-desktop-save)

;; Some configuration to automatic behavior.
(delete-selection-mode t)
(show-paren-mode t)

;; Interactive do mode
(require 'ido)
(ido-mode t)

;; set some behavioral defaults
(setq-default indent-tabs-mode nil)  ;; never indent with tabs
(setq-default show-trailing-whitespace t)

;; Auto mode hooks
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.tfstate$" . json-mode))

;; text mode hooks
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;;enable linum mode
(add-hook 'python-mode-hook 'linum-mode)

;; python-mode hooks and keymap
(add-hook 'python-mode-hook
	  (lambda ()
            (setq py-python-command "python3")
            (setq py-smart-indentation nil)
            (setq py-indent-offset 4)
            (setq indent-tabs-mode nil)
	    (define-key python-mode-map [f8] 'python-pep8)))

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)

;; let jedi try to complete on dot
(setq jedi:complete-on-dot t)

;; sh-mode keymap
(add-hook 'sh-mode-hook
	  (lambda ()
	    (define-key sh-mode-map "\C-c#" 'comment-region)))

(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))

;; Global function key bindings
(global-set-key [f5] 'refresh-file)
(global-set-key [f7] 'linum-mode)
(global-set-key [f9] 'delete-trailing-whitespace)

;; Take off some of the training wheels.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
