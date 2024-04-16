;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Zoe Gagnon"
      user-email-address "zell@mechanical-orchard.com")

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))



;; We can then use it to set the fonts. See 'C-h v doom-font' for documentation and more examples of what they
;;  accept.

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-symbol-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-serif-font (font-spec :family "FiraCode Nerd Font" :size 18))



;; And the theme. doom-fairy-floss is purple, good for day and night

(setq doom-theme 'doom-fairy-floss)



;; Set up ligatures for elixir

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

;; Basic editor configuration

;; Tab Width

(setq-default tab-width 2)




;; Set a more reasonable default for opening a new client window. The very small window causes a lot of thrash when the window manager grabs a hold of it

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



;; In order for it to hook in to org mode, we need to load it after that

(after! org
  (super-save-mode +1))

(setq auto-save-default nil)



;; Set up ibuffer with projectile sorting


(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))




;; Add ".elixir2" files to the list of files that trigger the mode

(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
 ;Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
;(add-hook 'elixir-mode-hook
;         (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))




;; Setup mix for nix

(setq alchemist-mix-command "/etc/profiles/per-user/zell/bin/mix")



;; and configure it?

(use-package! alchemist
  :hook (elixir-mode . alchemist-mode)
  :config
  (set-lookup-handlers! 'elixir-mode
    :definition #'alchemist-goto-definition-at-point
    :documentation #'alchemist-help-search-at-point)
  (set-eval-handler! 'elixir-mode #'alchemist-eval-region)
  (set-repl-handler! 'elixir-mode #'alchemist-iex-project-run)
  (setq alchemist-mix-env "dev")
  (map! :map elixir-mode-map :nv "m" alchemist-mode-keymap))

;; LSP

;; Configure some LSP options

(setq lsp-elixir-fetch-deps nil)
(setq lsp-elixir-suggest-specs nil)
(setq lsp-elixir-signature-after-complete t)
(setq lsp-elixir-enable-test-lenses t)



;; Set some global LSP options as well

(after! lsp-ui (
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

;; Copilot

;; Add a copilot indentation for elixir

(defvar universal-indent 2)

(after! (evil copilot)
  (add-to-list 'copilot-indentation-alist '(elixir-mode universal-indent)))



;; Make sure org mode can tangle some basics. Also prompt to tangle after save - works with auto save

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   (emacs-lisp . t)
   ))

(add-hook 'after-save-hook (lambda ()(if (y-or-n-p "Tangle?")(org-babel-tangle))) nil t)



;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "~/org/")

;; Config for emacs - doom specifi
;; :PROPERTIES:
;; :header-args: :tangle config.el :comments org
;; :END:


;; Place your private configuration here! Remember, you do not need to run 'doom
;;  sync' after modifying this file!


;;  Some functionality uses this to identify you, e.g. GPG configuration, email
;;  clients, file templates and snippets. It is optional.
;;  (setq user-full-name "John Doe"
;;        user-mail-address "john@doe.com")


