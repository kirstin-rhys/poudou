

;; ;; Relevant to all programming before language packages are setup:
;; ;;;###autoload
;; (defvar prog-minor-modes-common (list)
;;   "A common hook for programming minor modes")
;; ;;;###autoload
;; (defun prog-minor-modes-common ()
;;   "A common hook for programming minor modes"
;;   (interactive)
;;   (mapc 'funcall prog-minor-modes-common))
;; ;;;###autoload
;; (defun add-prog-minor-modes-common (&rest mode-hooks)
;;   "Add prog-minor-modes-common to MODE-HOOKS"
;;   (mapc (lambda (a) (add-hook a 'prog-minor-modes-common)) mode-hooks))

;; ;; Whitespace detection
;; (defun show-trailing-whitespace ()
;;   (interactive)
;;   (setq show-trailing-whitespace t))

;; (push 'show-trailing-whitespace prog-minor-modes-common)

;; ;; Ansi coloring
;; (use-package ansi-color
;;   :demand t
;;   :straight nil)

;; ;; Compile for... compilation
;; (use-package compile
;;   :after ansi-color
;;   :defer t
;;   :straight nil
;;   :config
;;   (defun colorize-compilation-buffer ()
;;     (toggle-read-only)
;;     (ansi-color-apply-on-region compilation-filter-start (point))
;;     (toggle-read-only))
;;   (add-hook 'compilation-filter-hook 'colorize-compilation-buffer))
;;   ;; :general
;;   ;; (:keymaps '(compilation-mode-map)
;;   ;;           "SPC" nil))

;; Company mode for autocompletion

(use-package company
  :demand t
  :straight (company :type git
                     :host github
                     :repo "company-mode/company-mode")
  :init (global-company-mode 1)
  :config
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 1)
  :commands global-company-mode)

;; LSP mode, a common interface to LSP providers
;; The lsp modes don't play nice with lazy loading(use-package lsp-mode
(use-package lsp-mode
  :straight (lsp-mode :type git
		      :host github
		      :repo "emacs-lsp/lsp-mode")
  :demand t
  :init
  (setq lsp-prefer-flymake nil)
  (setq lisp-enable-semantic-highlighting t)
  :config
  (setq lsp-inhibit-message t
	lsp-print-io nil))

;; LSP's completion package
(use-package company-lsp
  :demand t
  :straight (company-lsp :type git
                         :host github
                         :repo "tigersoldier/company-lsp")
  :config (add-to-list 'company-backend 'company-lsp))



;; ;; Ripgrep for fast grepping through projects
;; (use-package ripgrep
;;   :defer t
;;   :straight t)


;; ;; Magit, the excellent interface to git through emacs
;; (use-package magit
;;   :straight t
;;   :demand t)


;; (use-package git-time-machine
;;   :straight t
;;   :defer t)

;; (use-package flycheck
;;   :straight t
;;   :defer t
;;   :config
;;   (setq flycheck-idle-change-delay 2))


;; ;; LSP integration with flycheck
;; (use-package lsp-ui
;;   :demand t
;;   :straight (lsp-ui :type git
;;                     :host github
;;                     :repo "emacs-lsp/lsp-ui")
;;   :hook (lsp-mode-hook . lsp-ui-mode)
;;   ;; (set-face-attribute 'lsp-ui-sideline-code-action nil
;;   ;;                     :foreground "#4d4d4c"
;;   ;;                     :background "#ffffff")

;;   ;; (set-face-attribute 'lsp-ui-sideline-current-symbol nil
;;   ;;                     :foreground "white"
;;   ;;                     :box '(:line-width -1 :color "white")
;;   ;;                     :weight 'ultra-bold
;;   ;;                     :height 0.80)

;;   ;; (set-face-attribute 'lsp-ui-sideline-symbol nil
;;   ;;                     :foreground "#7f8c8d"
;;   ;;                     :box '(:line-width -1 :color "#7f8c8d")
;;   ;;                     :height 0.80)
;;   :commands lsp-ui-mode)


;; (use-package lsp-ui-flycheck
;;   :demand t
;;   :straight nil
;;   :config (add-hook 'lsp-after-open-hook
;;                     (lambda () (lsp-ui-flycheck-enable 1))))


;; ;; Python:
;; (use-package python
;;   :defer t
;;   :straight nil
;;   :hook (python-modfe-hook . (prog-minor-modes-common lsp)))

;; ;; Treemacs browser:
;; (use-package treemacs
;;   :straight t
;;   :config
;;   (setq treemacs-git-mode 'simple)
;;   (add-hook 'treemacs-mode-hook (lambda () (setq-local truncate-lines t)))
;;   :commands treemacs--setup-icon)


;; ;; Elisp:
;; (use-package elisp-mode
;;   :straight nil
;;   :defer t
;;   :hook ((emacs-lisp-mode . prog-minor-modes-common)))

;; ;; TeX:
;; (use-package auctex
;;   :defer t
;;   :straight t
;;   :hook ((tex-mode . prog-minor-modes-common)
;;          (LaTeX-mode . prog-minor-modes-common)))


;; ;; HTML:
;; (use-package sgml-mode
;;   :defer t
;;   :straight nil
;;   :config (progn (add-hook 'sgml-mode-hook 'prog-minor-modes-common)))



;; ;; Markdown
;; (use-package markdown-mode
;;   :defer t
;;   :straight t
;;   :config (progn (setq markdown-command "/usr/bin/pandoc")
;; 		 (add-hook 'markdown-mode-hook 'prog-minor-modes-common)))



;; ;; Shell
;; (use-package sh-script
;;   :defer t
;;   :straight nil
;;   :config (progn (add-hook 'sh-mode-hook 'prog-minor-modes-common))
;;   :commands sh-mode)


;; (use-package make-mode
;;   :straight nil
;;   :defer t
;;   :init
;;   (add-hook 'makefile-mode-hook 'prog-minor-modes-common))


;; ;; Json
;; (use-package json-mode
;;   :defer t
;;   :straight (json-mode :type git
;;                        :host github
;;                        :repo "joshwnj/json-mode")
;;   :config (progn (add-hook 'json-mode-hook 'prog-minor-modes-common)))

;; ;; Idris2 
;; (use-package idris-mode
;;   :defer t
;;   :straight (idris-mode :type git
;;                         :host github
;;                         :repo "idris-hackers/idris-mode")
;;   :config
;;   (add-prog-minor-modes-common 'idris-mode-hook
;; 			       'idris-repl-mode-hook
;; 			       'idris-ipkg-mode-hook)
;;   (setq idris-intepreter-path "idris2"))

;; ;; Coq
;; (use-package proof-general
;;   :straight t
;;   :defer t)

;; (use-package company-coq
;;   :after proof-general
;;   :straight t
;;   :defer t
;;   :hook (coq-mode . (prog-minor-modes-common company-coq-mode)))


;; ;; Haskell
;; (use-package haskell-mode
;;   :straight (haskell-mode :type git
;;                           :host github
;;                           :repo "haskell/haskell-mode")
;;   :init (setq haskell-process-type 'auto)
;;   :hook (haskell . prog-minor-modes-common)
;;   :defer t)

;; (use-package lsp-haskell
;;   :straight t
;;   :demand t
;;   :after haskell-mode
;;   :hook ((haskell-mode haskell-literate-mode) . lsp))

;; (use-package inf-haskell
;;   :straight nil
;;   :demand t
;;   :after haskell-mode)


;; Lean4

(use-package lean4-mode
  :straight (lean4-mode
	     :type git
	     :host github
	     :repo "leanprover/lean4-mode"
	     :files ("*.el" "data"))
; :hook (lean4-mode . prog-minor-modes-common)
  :commands (lean4-mode))


(provide 'poudou-programming)
