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



;; We can then use it to set the fonts. See 'C-h v doom-font' for documentation and more examples of what they accept.

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 18 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-symbol-font (font-spec :family "FiraCode Nerd Font" :size 18)
      doom-serif-font (font-spec :family "FiraCode Nerd Font" :size 18))

(setq window-divider-default-right-width 4
      window-divider-default-bottom-width 4)



;; And the theme. doom-fairy-floss is purple, good for day and night

(setq doom-theme 'doom-library)



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

(setq-default tab-width 2)

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

(use-package! expand-region
  :bind ("C-=" . er/expand-region))

(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-projectile-set-filter-groups)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

;(after! cobol-mode (setq auto-mode-alist
      ;; (append
      ;;  '(("\\.cob\\'" . cobol-mode)
      ;;    ("\\.cbl\\'" . cobol-mode)
      ;;    ("\\.cpy\\'" . cobol-mode))
      ;;  auto-mode-alist)))

(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
 ;Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
;(add-hook 'elixir-mode-hook
;         (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

(setq alchemist-mix-command "/etc/profiles/per-user/zell/bin/mix")

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

(setq lsp-elixir-fetch-deps nil)
(setq lsp-elixir-suggest-specs nil)
(setq lsp-elixir-signature-after-complete t)
(setq lsp-elixir-enable-test-lenses t)

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

(defvar universal-indent 2)

(after! (evil copilot)
  (add-to-list 'copilot-indentation-alist '(elixir-mode universal-indent)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (shell . t)
   (emacs-lisp . t)
   ))

(add-hook 'after-save-hook (lambda ()(if (y-or-n-p "Tangle?")(org-babel-tangle))) nil t)

(setq org-directory "~/logseq/")
(setq org-roam-directory "~/logseq/")
(setq org-roam-dailies-directory "journals/")

(custom-set-faces!
  `(org-level-1 :family "Luminari" :height 400)
  `(org-level-2 :family "Cochin" :height 300)
  `(org-level-3 :family "Rockwell" :height 200)
  `(org-level-4 :family "Rockwell" :height 150)
  `(org-level-5 :family "Rockwell" :height 150)
  `(org-level-6 :family "Rockwell" :height 150)
                )
