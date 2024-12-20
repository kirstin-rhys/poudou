
;;; don't actually use package.el
(setq package-enable-at-startup nil)


;;; bootstrap straight. we will use this instead 
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


;;; pull in use-package via straight
(straight-use-package 'use-package)

;;; configure use-package to always use straight
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; (add-to-list 'load-path "~/.emacs.d/lisp")

;;; update the melpa package list
;;; this is only for searching / browsing packages, not for installing
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

;; replace some package.el functions
;; (use-package package
;;   :defer t
;;   :straight nil
;;   :config
;;   (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;   (defun package-installed-p (package &optional min-version)
;;     (when (not (or (stringp package) (symbolp package) (package-desc-p package)))
;;       (signal 'bad-argument-types `(package ,(type-of package))))
;;     (let* ((key (cond ((stringp package) package)
;;                       ((symbolp package) (format "%s" package))
;;                       ((package-desc-p package) (format "%s" (package-desc-name package)))))
;;            (plist (gethash key straight--recipe-cache)))
;;       (plist-get plist :local-repo))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#e5ddd9" :foreground "#232627" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 109 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-program-name "agda-2.6.4.1")
 '(blink-cursor-mode nil)
 '(desktop-save-mode t)
 '(global-hl-line-mode t)
 '(httpd-host "0.0.0.0")
 '(httpd-port 8008)
 '(idris-interpreter-path "idris2")
 '(ignored-local-variable-values
   '((eval add-hook 'before-save-hook 'time-stamp)
     (Tab-Width . 4)))
 '(menu-bar-mode nil)
 '(org-babel-load-languages '((emacs-lisp . t) (haskell . t)))
 '(package-selected-packages
   '(straight magit lsp-mode flycheck company-ghci caml company darcsum dash flymake-easy haskell-tab-indent slime vterm with-editor yaml-mode xkb-mode workgroups2 proof-general company-coq vc-darcs flymake-haskell-multi eglot elgot multiple-cursors kconfig-mode kconfig-ref markdown-mode ripgrep ansi package-build shut-up epl git commander f s haskell-mode pallet))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(wg-session-file "~/.emacs.d/workgroups"))


(use-package poudou
  :straight (poudou :type git
		    :host github
		    :repo "kirstin-rhys/poudou"
		    :files ("lisp/poudou/*.el"))
  :demand t)

(provide 'init)

(server-start)
(put 'downcase-region 'disabled nil)
;mm (put 'set-goal-column 'disabled nil)
