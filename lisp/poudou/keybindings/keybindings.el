

;;; Code:
(use-package undo-tree
  :demand t
  :straight t
  :config
  (global-undo-tree-mode 1))

(use-package general
  :demand t
  :straight t)
  ;; :init
  ;; (eval-and-compile
  ;;   (require 'general)))


(provide 'poudou-keybindings)
