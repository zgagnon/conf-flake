;; Copilot
;; Install Github Copilot


;;; $DOOMDIR/packages.el -*- lexical-binding: t; -*-
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el" "dist")))

;; Projectile

;; Manages projects

;; Install the 'rg' package to use native OS ripgrep command

(use-package rg
  :ensure t
  :config
  (rg-enable-default-bindings))

;; Super-Save Mode
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; [[https://github.com/bbatsov/super-save][Super-Save]] is a minor mode to save on window events.


(package! super-save)
;(use-package! super-save)

(package! expand-region)

(package! cobol-mode)

;;(unless (package-installed-p 'alchemist)
;;  (package-install 'alchemist))
(if (package-installed-p 'alchemist)
   (progn
    ;;  No action needed, its here
     )
        (package! alchemist)
    )

;; Packages
;; :PROPERTIES:
;; :header-args: :tangle packages.el :comments org
;; :END:
;; Here we will install any packages not found in the default modules


(package! just-mode)

(package! evil-commentary)
