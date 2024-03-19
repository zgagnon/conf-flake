;; Packages
;; :PROPERTIES:
;; :header-args: :tangle packages.el :comments org
;; :END:
;; Here we will install any packages not found in the default modules

;; Install Github Copilot


(package! copilot
  :recipe (:host github :repo "copilot-emacs/copilot.el" :files ("*.el" "dist")))
