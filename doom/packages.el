;; Copilot
;; Install Github Copilot


;;; $DOOMDIR/packages.el -*- lexical-binding: t; -*-
(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el" "dist")))

;; Super-Save Mode
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; [[https://github.com/bbatsov/super-save][Super-Save]] is a minor mode to save on window events.


(package! super-save)
;(use-package! super-save)



;; Install alchemist cause it seems like doom didn't pull it?

;;(unless (package-installed-p 'alchemist)
;;  (package-install 'alchemist))
(if (package-installed-p 'alchemist)
   (progn
    ;;  No action needed, its here
     )
        (package! alchemist)
    )
