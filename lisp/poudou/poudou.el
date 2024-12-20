;; (setq desired-packages '(caml
;; 			 company
;; 			 company-coq
;; 			 company-ghci
;; 			 darcsum
;; 			 dash
;; 			 dot-mode
;; 			 eglot
;; 			 flycheck
;; 			 flymake-easy
;; 			 flymake-haskell-multi
;; 			 haskell-mode
;; 			 haskell-tab-indent
;; 			 helm-idris
;; 			 idris-mode
;; 			 impatient-mode
;; 			 lsp-mode
;; 			 magit
;; 			 magit-section
;; 			 markdown-mode
;; 			 multiple-cursors
;; 			 poly-erb
;; 			 polymode
;; 			 proof-general
;; 			 ripgrep
;; 			 slime
;; 			 straight
;; 			 use-package
;; 			 vc-darcs
;; 			 vterm
;; 			 with-editor
;; 			 workgroups2
;; 			 xkb-mode
;; 			 yaml-mode
;; 			 ))

;; (dolist (p desired-packages)
;;   (straight-use-package p))



;; (use-package lean4-mode
;;   :straight (lean4-mode
;; 	     :type git
;; 	     :host github
;; 	     :repo "leanprover/lean4-mode"
;; 	     :files ("*.el" "data"))
;;   ;; to defer loading the package until required
;;   :commands (lean4-mode))




(provide 'poudou)



;; ;;; resize windows

;; (defun win-resize-top-or-bot ()
;;   "Figure out if the current window is on top, bottom or in the
;; middle"
;;   (let* ((win-edges (window-edges))
;; 	 (this-window-y-min (nth 1 win-edges))
;; 	 (this-window-y-max (nth 3 win-edges))
;; 	 (fr-height (frame-height)))
;;     (cond
;;      ((eq 0 this-window-y-min) "top")
;;      ((eq (- fr-height 1) this-window-y-max) "bot")
;;      (t "mid"))))

;; (defun win-resize-left-or-right ()
;;   "Figure out if the current window is to the left, right or in the
;; middle"
;;   (let* ((win-edges (window-edges))
;; 	 (this-window-x-min (nth 0 win-edges))
;; 	 (this-window-x-max (nth 2 win-edges))
;; 	 (fr-width (frame-width)))
;;     (cond
;;      ((eq 0 this-window-x-min) "left")
;;      ((eq (+ fr-width 4) this-window-x-max) "right")
;;      (t "mid"))))

;; (defun win-resize-enlarge-horiz ()
;;   (interactive)
;;   (cond
;;    ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
;;    ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
;;    ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
;;    (t (message "nil"))))

;; (defun win-resize-minimize-horiz ()
;;   (interactive)
;;   (cond
;;    ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
;;    ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
;;    ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
;;    (t (message "nil"))))

;; (defun win-resize-enlarge-vert ()
;;   (interactive)
;;   (cond
;;    ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
;;    ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
;;    ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

;; (defun win-resize-minimize-vert ()
;;   (interactive)
;;   (cond
;;    ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
;;    ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
;;    ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

;; (global-set-key [C-M-down] 'win-resize-minimize-vert)
;; (global-set-key [C-M-up] 'win-resize-enlarge-vert)
;; (global-set-key [C-M-left] 'win-resize-minimize-horiz)
;; (global-set-key [C-M-right] 'win-resize-enlarge-horiz)
;; (global-set-key [C-M-up] 'win-resize-enlarge-horiz)
;; (global-set-key [C-M-down] 'win-resize-minimize-horiz)
;; (global-set-key [C-M-left] 'win-resize-enlarge-vert)
;; (global-set-key [C-M-right] 'win-resize-minimize-vert)

;; ;;; window navigation
;; (define-key global-map (kbd "S-M-<up>") 'windmove-up)
;; (define-key global-map (kbd "S-M-<down>") 'windmove-down)
;; (define-key global-map (kbd "S-M-<left>") 'windmove-left)
;; (define-key global-map (kbd "S-M-<right>") 'windmove-right)

;; ;;; trailing whitespace on save
;; (add-hook 'write-file-hooks 'delete-trailing-whitespace)


;; ;;; agda
;; (setq agda-mode-name "agda-mode-2.6.4.1")
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                 (shell-command-to-string (concat agda-mode-name " " "locate"))))

;; ;;; eglot  -- not working yet

;; ;; (use-package eglot
;; ;;   :ensure t
;; ;;   :config
;; ;;   (add-hook 'haskell-mode-hook 'glot-ensure)
;; ;;   :confign
;; ;;   (setq-default eglot-workspace-configuration
;; ;; 		'((haskell
;; ;; 		   (plugin
;; ;; 		    (stan
;; ;; 		     (globalOn . :json-false)))))) ;; disable stan
;; ;;   :custom
;; ;;   (eglot-autoshutdown t) ;; shutdown language server after closing last file
;; ;;   (eglot-confirm-server-initiated-edits nil) ;; allow edits without confirmation
;; ;;   )

;; ;;; haskell mode
;; (defun haskell-setenv-find (dir)
;;   "Find an setenv script in the argument directory"
;;   (let* ((setenv-files
;; 	  (cl-remove-if 'file-directory-p
;; 			(cl-remove-if-not 'file-exists-p
;; 					  (directory-files dir t "setenv")))))
;;     (car setenv-files)))

;; (defun haskell-setenv-find-file (&optional dir)
;;   "Search for setenv file upwards from DIR.
;; If DIR is nil, `default-directory' is used as the starting point
;; for directory traversal. Upward traversal is aborted if the file owner
;; changes. Uses `haskell-sentenv-find' internally."
;;   (let ((use-dir (or dir default-directory)))
;;     (while (and use-dir (not (file-directory-p use-dir)))
;;       (setq use-dir (file-name-directory (directory-file-name use-dir))))
;;     (when use-dir
;;       (catch 'found
;; 	(let ((user (nth 2 (file-attributes use-dir)))
;; 	      ;; Abbreviate, so as to stop when we cross ~/.
;; 	      (root (abbreviate-file-name use-dir)))
;; 	  ;; traverse current dir up to root as long as file owner doesn't change
;; 	  (while (and root (equal user (nth 2 (file-attributes root))))
;; 	    (let ((setenv-file (haskell-setenv-find root)))
;; 	      (when setenv-file
;; 		(throw 'found setenv-file)))
;; 	    (let ((proot (file-name-directory (directory-file-name root))))
;; 	      (if (equal proot root) ;; fix-point reached?
;; 		  (throw 'found nil)
;; 		(setq root proot))))
;; 	  nil)))))

;; (defun haskell-setenv-find-dir (&optional dir)
;;   (let ((use-dir (haskell-setenv-find-file dir)))
;;     (if use-dir
;; 	(file-name-directory use-dir)
;;       nil)))

;; (defun hasktorch-environment (&optional dir)
;;   (let ((use-dir (haskell-setenv-find-dir dir)))
;;     (if use-dir
;; 	(let ((hasktorch-lib-path (string-join (list (concat dir "deps/libtorch/lib/")
;; 						     (concat dir "deps/mklml/lib/")
;; 						     (concat dir "deps/libtokenizers/lib/"))
;; 					       ":"))
;; 	      (ld-library-path (getenv "LD_LIBRARY_PATH")))
;; 	  (string-join (if ld-library-path
;; 			   (list hasktorch-lib-path ld-library-path)
;; 			 (list hasktorch-lib-path))
;; 		       ":"))
;;       nil)))

;; (defun inferior-haskell-start-process-setenv (inf-haskell-start-process &rest args)
;;   "Around advice function to wrap `inferior-haskell-start-process' with custom
;; environment variables"
;;   (let ((path (hasktorch-environment (haskell-setenv-find-dir))))
;;     (if path
;; 	(with-environment-variables (("LD_LIBRARY_PATH" path))
;; 	  (progn
;; 	    (apply inf-haskell-start-process args)))
;;       (apply inf-haskell-start-process args))))

;; (defun haskell-process-type-filter (haskell-process-type-result)
;;   "Override results of `haskell-process-type' if we are in a hasktorch project
;; and it determined that it was a cabal project. See https://github.com/haskell/cabal/issues/8238
;; as cabal does not support `all' for multi-target projects"
;;   (if (and (eq 'auto haskell-process-type)
;; 	   (haskell-setenv-find-dir)
;; 	   (eq 'cabal-repl haskell-process-type-result))
;;       'ghci
;;     haskell-process-type-result))

;; (advice-add 'inferior-haskell-start-process :around #'inferior-haskell-start-process-setenv)
;; (advice-add 'haskell-process-type :filter-return #'haskell-process-type-filter)

;; (add-hook 'haskell-mode-hook 'interactive-haskell-mode)


;; ;;; coq
;; (add-hook 'coq-mode-hook #'company-coq-mode)

;; ;;; c-erb
;; (require 'polymode)

;; (define-hostmode poly-c-hostmode :mode 'c-mode)

;; (define-innermode poly-erb-c-innermode
;;   :mode 'ruby-mode
;;   :head-matcher "<%=?"
;;   :tail-matcher "%>"
;;   :head-mode 'host
;;   :tail-mode 'host)

;; (define-polymode poly-c-mode
;;   :hostmode 'poly-c-hostmode
;;   :innermodes '(poly-erb-c-innermode))

;; (define-hostmode poly-dot-hostmode :mode 'dot-mode)

;; (define-innermode poly-erb-dot-innermode
;;   :mode 'ruby-mode
;;   :head-matcher "<%=?"
;;   :tail-matcher "%>"
;;   :head-mode 'host
;;   :tail-mode 'host)


;; (define-polymode poly-dot-mode
;;   :hostmode 'poly-dot-hostmode
;;   :innermodes '(poly-erb-dot-innermode))


;; ;;; ugh do not uso mononoki under any curcumstances
;; ;; default to mononoki
;; ;; (set-face-attribute 'default nil
;; ;;                     :family "mononoki"
;; ;;                     :height 120
;; ;;                     :weight 'normal
;; ;;                     :width  'normal)

;; ;;; with-envifronment-variables


;; ;; ;; fix \:
;; ;; (set-fontset-font "fontset-default"
;; ;;                   (cons (decode-char 'ucs #x2982)
;; ;;                         (decode-char 'ucs #x2982))
;; ;;                   "STIX")


;; ;;; workgroups
;; ; By default prefix is: “C-c z” (To change it - see settings below)

;; ;; <prefix> <key>
;; ;; <prefix> C-c    - create a new workgroup
;; ;; <prefix> C-v    - open an existing workgroup
;; ;; <prefix> C-k    - delete an existing workgroup

;; ;; If you want to set up this minor mode further:

;; ;; (require 'workgroups2)
;; ;; ;; Change prefix key (before activating WG)
;; ;; (setq wg-prefix-key "C-c z")


;; (workgroups-mode 1)
;; ;;; emacs server

;; (workgroups-mode 1)
;; ;;; emacs server


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (defun ensure-package-installed (&rest packages)
;;   "Assure every package is installed, ask for installation if it’s not.

;; Return a list of installed packages or nil for every skipped package."
;;   (mapcar
;;    (lambda (package)
;;      ;; (package-installed-p 'evil)
;;      (if (package-installed-p package)
;;          nil
;;        (if (y-or-n-p (format "Package %s is missing. Install it? " package))
;;            (package-install package)
;;          package)))
;;    packages))

;; ;; make sure to have downloaded archive description.
;; ;; Or use package-archive-contents as suggested by Nicolas Dudebout
;; (or (file-exists-p package-user-dir)
;;     (package-refresh-contents))

;; (ensure-package-installed 'caml
;; 			  'company
;; 			  'company-coq
;; 			  'company-ghci
;; 			  'darcsum
;; 			  'dash
;; 			  'eglot
;; 			  'flycheck
;; 			  'flymake-easy
;; 			  'flymake-haskell-multi
;; 			  'haskell-mode
;; 			  'haskell-tab-indent
;; 			  'lsp-mode
;; 			  'magit
;; 			  'magit-section
;; 			  'markdown-mode
;; 			  'multiple-cursors
;; 			  'proof-general
;; 			  'ripgrep
;; 			  'slime
;; 			  'straight
;; 			  'use-package
;; 			  'vc-darcs
;; 			  'vterm
;; 			  'with-editor
;; 			  'workgroups2
;; 			  'xkb-mode
;; 			  'yaml-mode
;; 			  )

;; ;; activate installed packages
;; (package-initialize)

;; ;;; pallet does not seem to be availible for emacs 28
;; ;(require 'cask "/usr/local/src/cask/cask.el")
;; ;(cask--initialize)
;; ;(require 'pallet)
;; ;(pallet-mode t)



