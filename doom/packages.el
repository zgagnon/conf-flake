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
