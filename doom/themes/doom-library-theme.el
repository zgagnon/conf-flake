;;; doom-library-theme.el --- ported from VSCode's library theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: May 22, 2021 (#545)
;; Author: ccmywish <https://github.com/ccmywish>
;; Maintainer:
;; Source: https://github.com/microsoft/vscode-themes/tree/main/library
;; Source: https://github.com/MarkMichos/library-Scheme
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-library-theme nil
  "Options for the doom-library theme."
  :group 'doom-themes)

(defcustom doom-library-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-library-theme
  :type '(choice integer boolean))

(defcustom doom-library-blue-modeline nil
  "If non-nil, mode-line's color will be blue instead of the default purple."
  :group 'doom-library-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(def-doom-theme doom-library
                "A dark theme inspired by library Theme."
                ((white        '("#D3ccb3" "#D3ccb3" "white"))
                 (red          '("#af3709" "#af3709" "red"))
                 (fire-red          '("#cf3709" "#cf3709" "red"))
                 (orange       '("#FC9354" "#FC9354" "brightred"))
                 (green        '("#2e4435" "#2e4435" "green"))
                 (light-green  '("#B5CEA8" "#BBCCAA" "green"))
                 (teal         '("#35CDAF" "#33CCAA" "brightgreen"))
                 (yellow       '("#FF00CE" "#FF00CE" "brightyellow"))
                 (light-yellow '("#dbc6a8" "#dbc6a8" "brightyellow"))
                 (blue         '("#027d9d" "#8CDAFF" "brightblue"))
                 (dark-blue    '("#2f4d55" "#6699CC" "blue"))
                 (magenta      '("#C586C0" "#CC88CC" "brightmagenta"))
                 (violet       '("#BB80B3" "#BB88BB" "magenta"))
                 (dark-violet  '("#68217A" "#662277" "magenta"))
                 (cyan         '("#007B9F" "#5FD7FF" "brightcyan"))
                 (dark-cyan    '("#2b5e62" "#2277AA" "cyan"))

                 ;; name        default   256       16
                 (bg         '("#fff6d7" "#fff6d7" nil))
                 (bg-alt     '("#f8c67c" "#fff6d7"  nil))
                 (base4      (doom-darken (doom-blend bg orange 0.2) 0.4))
                 (base0      (doom-lighten base4 0.4))
                 (base1      (doom-lighten base4 0.3))
                 (base2      (doom-lighten base4 0.2))
                 (base3      (doom-lighten base4 0.1))
                 (base5      (doom-darken base4 0.1))
                 (base6      (doom-darken base4 0.2))
                 (base7      (doom-darken base4 0.3))
                 (base8      (doom-darken base4 0.4))
                 (fg         (doom-darken bg 0.9))
                 (fg-alt     (doom-darken bg-alt 0.7))

                 (grey base7)

                 ;; component focused
                 (bottomline-blue '("#2b5e62" "#2b5e62" "blue"))
                 (vcmodified-blue '("#007B9F" "#007B9F" "blue"))
                 (vcdeleted-red '("#9D0012" "#9D0012" "red"))

                 ;; face categories -- required for all themes
                 (highlight      blue)
                 (vertical-bar   red)
                 (selection      orange)
                 (builtin        dark-blue)
                 (comments       base6)
                 (doc-comments   base6)
                 (constants      orange)
                 (declarations   red)
                 (functions      blue)
                 (keywords       red)
                 (methods        dark-blue)
                 (operators      red)
                 (type           dark-cyan)
                 (strings        (doom-darken magenta 0.4))
                 (variables      teal)
                 (numbers        orange)
                 (region         (doom-lighten green 0.5))
                 (error          red)
                 (warning       fire-red )
                 (success        green)
                 (vc-modified    vcmodified-blue)
                 (vc-added       green)
                 (vc-deleted     red)

                 ;; custom categories
                 (hidden red)
                 (modeline-bg     (if doom-library-blue-modeline bottomline-blue (doom-darken orange 0.50) ))
                 (modeline-bg-alt (doom-darken orange 0.01))
                 (modeline-fg     yellow)
                 (modeline-fg-alt blue)

                 (-modeline-pad
                  (when doom-library-padded-modeline
                    (if (integerp doom-library-padded-modeline) doom-library-padded-modeline 4))))

  ;;;; Base theme face overrides
                (((highlight &override) :foreground base8 :background bg)
                 (lazy-highlight :background base4 :foreground fg :weight 'bold)
                 (mode-line
                  :background modeline-bg :foreground modeline-fg
                  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
                 (mode-line-inactive
                  :background modeline-bg-alt :foreground modeline-fg-alt
                  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))

                 (tooltip :background base2 :foreground fg)
                 ;; Treemacs Faces
   ;;;; man <built-in>
                 (Man-overstrike :inherit 'bold :foreground magenta)
                 (Man-underline :inherit 'underline :foreground blue)
   ;;;; centaur-tabs
                 (centaur-tabs-headline-match)
                 (centaur-tabs-default :background base7 :foreground base2)
                 (centaur-tabs-selected :background base3 :foreground bg-alt)
                 (centaur-tabs-close-mouse-face :inherit 'centaur-tabs-close :foreground base2 :hover bg-alt)
                 (centaur-tabs-active-bar-face :background base7 :foreground base2)
                 (centaur-tabs-selected-modified
                  :inherit 'centaur-tabs-selected :foreground fg :weight 'bold)
                 (centaur-tabs-unselected-modified
                  :inherit 'centaur-tabs-unselected :foreground fg :weight 'bold)
                 (centaur-tabs-modified-marker-selected
                  :inherit 'centaur-tabs-selected :foreground fg)
                 (centaur-tabs-modified-marker-unselected
                  :inherit 'centaur-tabs-unselected :foreground fg)
   ;;;; company
                 (company-tooltip-selection     :background region)
   ;;;; css-mode <built-in> / scss-mode
                 (css-proprietary-property :foreground orange)
                 (css-property             :foreground green)
                 (css-selector             :foreground blue)
   ;;;; dashboard
                 (dashboard-heading :foreground green :rainbow-delimiters-depth-5-face :foreground violet)
                 (rainbow-delimiters-depth-6-face :foreground yellow)
                 (rainbow-delimiters-depth-7-face :foreground blue)
                 (rainbow-delimiters-depth-8-face :foreground teal)
                 (rainbow-delimiters-depth-9-face :foreground dark-cyan)
   ;;;; rjsx-mode
                 (rjsx-tag :foreground blue)
                 (rjsx-attr :foreground cyan :slant 'italic :weight 'medium)
   ;;;; treemacs
                 (treemacs-root-face :foreground blue :weight 'ultra-bold :height 1.2)
                 (treemacs-directory-face :foreground blue)
                 (treemacs-file-face :foreground blue)
                 (treemacs-git-modified-face :foreground blue)
   ;;;; Org
                 ((org-block &override) :background base1 :foreground (doom-darken bg 0.1))
                 ((org-block-background &override) :background base1 :foreground (doom-darken bg 0.1))
                 ((org-block-begin-line &override) :background base1 :foreground (doom-darken bg 0.1))
                 ((org-block-end-line &override) :background base1 :foreground (doom-darken bg 0.1))
                 ;;;; Evil
                 ((evil-ex-lazy-highlight &override) :background base4 :foreground base0 :weight 'bold)
   ;;;; Tree-sitter
                                        ; (tree-sitter-hl-face:keyword :family "Luminari" :height 200 )
                                        ; (tree-sitter-hl-face:type :family "Rockwell" :foreground dark-cyan)
                                        ;`(org-level-1 :family "Luminari" :height 400)
                                        ; `(org-level-2 :family "Cochin" :height 300)
                                        ; `(org-level-3 :family "Rockwell" :height 200)
                                        ; `(org-level-4 :family "Rockwell" :height 150)
                                        ; `(org-level-5 :family "Rockwell" :height 150)
                                        ; `(org-level-6 :family "Rockwell" :height 150)

                 ))




;;; doom-library-theme.el ends here
