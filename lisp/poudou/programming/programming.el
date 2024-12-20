

;; Relevant to all programming before language packages are setup:
;;;###autoload
(defvar prog-minor-modes-common (list)
  "A common hook for programming minor modes")
;;;###autoload
(defun prog-minor-modes-common ()
  "A common hook for programming minor modes"
  (interactive)
  (mapc 'funcall prog-minor-modes-common))
;;;###autoload
(defun add-prog-minor-modes-common (&rest mode-hooks)
  "Add prog-minor-modes-common to MODE-HOOKS"
  (mapc (lambda (a) (add-hook a 'prog-minor-modes-common)) mode-hooks))

;; Whitespace detection
(defun show-trailing-whitespace ()
  (interactive)
  (setq show-trailing-whitespace t))

(push 'show-trailing-whitespace prog-minor-modes-common)

;; Ansi coloring
(use-package ansi-color
  :demand t
  :straight nil)

;; Compile for... compilation
(use-package compile
  :after ansi-color
  :defer t
  :straight nil
  :config
  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region compilation-filter-start (point))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
  :general
  (:keymaps '(compilation-mode-map)
            "SPC" nil))


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


(provide 'poudou-programming)
