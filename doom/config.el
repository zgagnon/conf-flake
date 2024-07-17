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

(after! treemacs
                  (setq treemacs-indent-guide-style "line"))

;; Projectile

;; Manages projects


(after! projectile
  (projectile-add-known-project "~/kohls/cics"))

;; Create a tab bar across the top of the screen

(after! persp-mode
  ;; alternative, non-fancy version which only centers the output of +workspace--tabline
  (defun workspaces-formatted ()
    (+doom-dashboard--center (frame-width) (+workspace--tabline)))

  (defun hy/invisible-current-workspace ()
    "The tab bar doesn't update when only faces change (i.e. the
current workspace), so we invisibly print the current workspace
name as well to trigger updates"
    (propertize (safe-persp-name (get-current-persp)) 'invisible t))

  (customize-set-variable 'tab-bar-format '(workspaces-formatted tab-bar-format-align-right hy/invisible-current-workspace))

  ;; don't show current workspaces when we switch, since we always see them
  (advice-add #'+workspace/display :override #'ignore)
  ;; same for renaming and deleting (and saving, but oh well)
  (advice-add #'+workspace-message :override #'ignore))

;; need to run this later for it to not break frame size for some reason
(run-at-time nil nil (cmd! (tab-bar-mode +1)))

;; Make the tab bar look good with custom faces


(custom-set-faces!
  '(+workspace-tab-face :inherit default :family "Jost" :height 135)
  '(+workspace-tab-selected-face :inherit (highlight +workspace-tab-face)))

(after! persp-mode
  (defun workspaces-formatted ()
    ;; fancy version as in screenshot
    (+doom-dashboard--center (frame-width)
                             (let ((names (or persp-names-cache nil))
                                   (current-name (safe-persp-name (get-current-persp))))
                               (mapconcat
                                #'identity
                                (cl-loop for name in names
                                         for i to (length names)
                                         collect
                                         (concat (propertize (format " %d" (1+ i)) 'face
                                                             `(:inherit ,(if (equal current-name name)
                                                                             '+workspace-tab-selected-face
                                                                           '+workspace-tab-face)
                                                               :weight bold))
                                                 (propertize (format " %s " name) 'face
                                                             (if (equal current-name name)
                                                                 '+workspace-tab-selected-face
                                                               '+workspace-tab-face))))
                                " "))))
;; other persp-mode related configuration
)

(setq-default tab-width 2)

(global-visual-line-mode 1)

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

(setq lsp-elixir-fetch-deps t)
(setq lsp-elixir-suggest-specs t)
(setq lsp-elixir-signature-after-complete t)
(setq lsp-elixir-enable-test-lenses t)
(after! lsp-mode
  (setq lsp-elixir-local-server-command "/etc/profiles/per-user/zell/bin/elixir-ls"))
(use-package lsp-mode
  :config
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.node_modules\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]deps\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\].data\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\].direnv\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\].elixir_ls\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\].local\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]_build\\'"))

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
