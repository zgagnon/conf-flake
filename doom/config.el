;; Config for emacs - doom specifi
;; :PROPERTIES:
;; :header-args: :tangle config.el :comments org
;; :END:


;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-



;; Place your private configuration here! Remember, you do not need to run 'doom
;;  sync' after modifying this file!


;;  Some functionality uses this to identify you, e.g. GPG configuration, email
;;  clients, file templates and snippets. It is optional.
;;  (setq user-full-name "John Doe"
;;        user-mail-address "john@doe.com")

(setq user-full-name "Zoe Gagnon"
      user-email-address "zell@mechanical-orchard.com")




;; Doom exposes five (optional) variables for controlling fonts in Doom:

;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face

;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-symbol-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-serif-font (font-spec :family "FiraCode Nerd Font" :size 18))



;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:

(setq doom-theme 'doom-fairy-floss)



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(setq display-line-numbers-type t)



;; Also set the tab width to a default of 2 to preserve screen real-estate

(setq-default tab-width 2)



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "~/org/")



;; Set a more reasonable default for opening a new client windw. The very small window
;; causes a lot of thrash when the window manager grabs a hold of it

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '((tool-bar-lines . 0)
              (width . 200)
              (height . 400)
              )
            )
      )
  )



;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.

;;   (after! PACKAGE
;;     (setq x y))

;; The exceptions to this rule:

;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').

;; Here are some additional functions/macros that will help you configure Doom.

;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).

;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; -----------------------
;; ORG MODE

;; Make sure org mode can tangle some basics. Also prompt to tangle after save - works with auto save

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   (emacs-lisp . t)
   ))

(add-hook 'after-save-hook (lambda ()(if (y-or-n-p "Tangle?")(org-babel-tangle))) nil t)



;; accept completion from copilot and fallback to company
;;                                        ;(use-package! copilot
;;                                        ;  :hook (prog-mode . copilot-mode)
;;                                        ;  :bind (:map copilot-completion-map
;;                                        ;              ("<tab>" . 'copilot-accept-completion)
;;                                        ;              ("TAB" . 'copilot-accept-completion)
;;                                        ;              ("C-TAB" . 'copilot-accept-completion-by-word)
;;                                        ;              ("C-<tab>" . 'copilot-accept-completion-by-word)))

;;                                        ;(use-package org-auto-tangle
;;                                        ;  :load-path "site-lisp/org-auto-tangle/"
;;                                        ;  :defer t
;;                                        ;  :hook (org-mode . org-auto-tangle-mode))

;; ELIXIR -----------------------

;; Add highlighting and ligatures for elixer

;; Highlights *.elixir2 as well

(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
 ;Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(add-hook
 'elixir-mode-hook
 (lambda ()
   (push '(">=" . ?\u2265) prettify-symbols-alist)
   (push '("<=" . ?\u2264) prettify-symbols-alist)
   (push '("!=" . ?\u2260) prettify-symbols-alist)
   (push '("==" . ?\u2A75) prettify-symbols-alist)
   (push '("=~" . ?\u2245) prettify-symbols-alist)
   (push '("<-" . ?\u2190) prettify-symbols-alist)
   (push '("->" . ?\u2192) prettify-symbols-alist)
   (push '("<-" . ?\u2190) prettify-symbols-alist)
   (push '("|>" . ?\u25B7) prettify-symbols-alist)))



;; Or if you use use-packge

(use-package elixir-mode
  :hook (elixir-mode . (lambda ()
                         (push '(">=" . ?\u2265) prettify-symbols-alist)
                         (push '("<=" . ?\u2264) prettify-symbols-alist)
                         (push '("!=" . ?\u2260) prettify-symbols-alist)
                         (push '("==" . ?\u2A75) prettify-symbols-alist)
                         (push '("=~" . ?\u2245) prettify-symbols-alist)
                         (push '("<-" . ?\u2190) prettify-symbols-alist)
                         (push '("->" . ?\u2192) prettify-symbols-alist)
                         (push '("<-" . ?\u2190) prettify-symbols-alist)
                         (push '("|>" . ?\u25B7) prettify-symbols-alist))))


;; Configure elixir-lsp
;; replace t with nil to disable.


(setq lsp-elixir-fetch-deps nil)
(setq lsp-elixir-suggest-specs t)
(setq lsp-elixir-signature-after-complete t)
(setq lsp-elixir-enable-test-lenses t)



;; Compile and test on save

(setq alchemist-hooks-test-on-save t)
(setq alchemist-hooks-compile-on-save t)



;; Set global LSP options

(after! lsp-mode (
                  setq lsp-lens-enable t
                  lsp-ui-peek-enable t
                  lsp-ui-doc-enable nil
                  lsp-ui-doc-position 'bottom
                  lsp-ui-doc-max-height 70
                  lsp-ui-doc-max-width 150
                  lsp-ui-sideline-show-diagnostics t
                  lsp-ui-sideline-show-hover nil
                  lsp-ui-sideline-show-code-actions t
                  lsp-ui-sideline-diagnostic-max-lines 20
                  lsp-ui-sideline-ignore-duplicate t
                  lsp-ui-sideline-enable t))



;; Auto save on context change - both internal and external

(after! org
  (super-save-mode +1))



;; Set up ibuffer with projectile sorting


(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))
