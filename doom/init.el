;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

(setq +literate-config-file "README.org")

(doom! :input

;; Language support
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; Doom language support is configured first.


;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
;;chinese
;;japanese
;;layout            ; auie,ctsrnm is the superior home row

;; Completions
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; Completion configurations enable and control various completion tools


:completion

;; Code
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; Company is an in-line auto complete for suggestions. We can control if the suggestions are
;; in a childframe or popover


(company +childframe)           ; the ultimate code completion backend

;; Search
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; Vertico enhances emacs' built-in search with further capability. Searches files and file contents

;;helm              ; the *other* search engine for love and life
;;ido               ; the other *other* search engine...
;;ivy               ; a search engine for love and life
(vertico +icons)           ; the search engine of the future

;; UI
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; UI configurations change the way DOOM appears

:ui
;;deft              ; notational velocity for Emacs

;; DOOM
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; The doom package creates the overall appearance of DOOM. Includes styles, but also search menus
;; like `SPC-f-p`


doom              ; what makes DOOM look the way it does

;; Doom Dashboard

;; Enables the dashboard and gives an unkillable fallback if all buffers are killed

doom-dashboard    ; a nifty splash screen for Emacs

;; Doom Quit

;; Allows customizing the quit interaction


;;doom-quit         ; DOOM quit-message prompts when you quit Emacs

;; Emoji

;; Allows using emoji in the app. Include the unicode and github support


(emoji +unicode +github)  ; 🙂

;; Hightlight TODO

;; Add highlight to various todo comments


hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW

;; Hydra

;; Hydra is an emacs window management shortcut module. It is deprecated


;;hydra

;; Indent Guides

;; Adds a verticle line showing indent depth levels


;;indent-guides     ; highlighted indent columns

;; Ligatures

;; Enable font ligatures in various contexts


ligatures         ; ligatures and symbols to make your code pretty again

;; Minimap

;; Enables a minimap of the file on the right hand side


minimap           ; show a map of the code on the side

;; Modeline

;; Informative modeline on the bottom of the screen


modeline          ; snazzy, Atom-inspired modeline, plus API

;; Nav-Flash

;; When dragging an action across several lines with vim motions, nav-flash will blink the cursor. This helps locate
;; it after a big move


nav-flash         ; blink cursor line after big motions

;; Neotree

;; A vim-style project tree

;;neotree           ; a project drawer, like NERDTree for vim

;; OPHints

;; When dragging an action across several lines with vim motions or regions, highlight the effected region

ophints           ; highlight the region an operation acts on

;; Popup

;; Keep popup windows from stealing focus or blocking things

(popup +defaults)   ; tame sudden yet inevitable temporary windows

;; Tabs

;; Tab bar on top

tabs              ; a tab bar for Emacs

;; Treemacs

;; Emacs-style project tree instead

(treemacs +lsp)          ; a project drawer, like neotree but cooler

;; Extended Unicode

;; Support for non-latin languages

;unicode           ; extended unicode support for various languages

;; VC Gutter

;; Show git changes in the gutter. +pretty adds a nice coloring to it

(vc-gutter +pretty) ; vcs diff in the fringe

;; VI Tilde Fringe

;; Show a ~ in the left fringe to indicate empty lines

vi-tilde-fringe   ; fringe tildes to mark beyond EOB

;; Window Select

;; Where we're going, we don't need mouse

window-select     ; visually switch windows

;; Workspaces

;; Add tabs and persistant workspaces

workspaces        ; tab emulation, persistence & separate workspaces

;; Zen Mode

;; Does a lot of changes that I don't like

;;zen               ; distraction-free coding or writing

:editor

(evil +everywhere); come to the dark side, we have cookies

file-templates    ; auto-snippets for empty files

fold              ; (nigh) universal code folding

(format +onsave)  ; automated prettiness

;;god               ; run Emacs commands without modifier keys

;;lispy             ; vim for lisp, for people who don't like vim

multiple-cursors  ; editing in many places at once

;;objed             ; text object editing for the innocent

;;parinfer          ; turn lisp into python, sort of

;;rotate-text       ; cycle region at point between text candidates

snippets          ; my elves. They type so I don't have to

;;word-wrap         ; soft wrapping with language-aware indent

:emacs

dired             ; making dired pretty [functional]

electric          ; smarter, keyword-based electric-indent

ibuffer         ; interactive buffer management

undo              ; persistent, smarter undo for your inevitable mistakes

vc                ; version-control and Emacs, sitting in a tree

:term

;;eshell            ; the elisp shell that works everywhere

;;shell             ; simple shell REPL for Emacs

;;term              ; basic terminal emulator for Emacs

vterm             ; the best terminal emulation in Emacs

:checkers

syntax              ; tasing you for every semicolon you forget

;;(spell +flyspell) ; tasing you for misspelling mispelling

;;grammar           ; tasing grammar mistake every you make

:tools

;;ansible

;;biblio            ; Writes a PhD for you (citation needed)

;;collab            ; buffers with friends

(debugger +lsp)          ; FIXME stepping through code, to help you add bugs

direnv

docker

editorconfig      ; let someone else argue about tabs vs spaces

;;ein               ; tame Jupyter notebooks with emacs

(eval +overlay)     ; run code, run (also, repls)

lookup              ; navigate your code and its documentation

(lsp +peek)               ; M-x vscode

magit             ; a git porcelain for Emacs

;;make              ; run make tasks from Emacs

;;pass              ; password manager for nerds

;;pdf               ; pdf enhancements

;;prodigy           ; FIXME managing external services & code builders

;;rgb               ; creating color strings

;;taskrunner        ; taskrunner for all your projects

terraform         ; infrastructure as code

;;tmux              ; an API for interacting with tmux

tree-sitter       ; syntax and parsing, sitting in a tree...

;;upload            ; map local to remote projects via ssh/ftp

:os

(:if (featurep :system 'macos) macos)  ; improve compatibility with macOS

;;tty               ; improve the terminal Emacs experience

:lang

;;agda              ; types of types of types of types...

;;beancount         ; mind the GAAP

(cc +lsp)         ; C > C++ == 1

;;clojure           ; java with a lisp

;;common-lisp       ; if you've seen one lisp, you've seen them all

;;coq               ; proofs-as-programs

;;crystal           ; ruby at the speed of c

;;csharp            ; unity, .NET, and mono shenanigans

;;data              ; config/data formats

;;(dart +flutter)   ; paint ui and not much else

;;dhall

(elixir +tree-sitter +lsp)            ; erlang done right

;;elm               ; care for a cup of TEA?

emacs-lisp        ; drown in parentheses

;;erlang            ; an elegant language for a more civilized age

;;ess               ; emacs speaks statistics

;;factor

;;faust             ; dsp, but you get to keep your soul

;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)

;;fsharp            ; ML stands for Microsoft's Language

;;fstar             ; (dependent) types and (monadic) effects and Z3

;;gdscript          ; the language you waited for

;;(go +lsp)         ; the hipster dialect

;;(graphql +lsp)    ; Give queries a REST

(haskell +lsp)    ; a language that's lazier than I am

;;hy                ; readability of scheme w/ speed of python

;;idris             ; a language you can depend on

json              ; At least it ain't XML

;;(java +lsp)       ; the poster child for carpal tunnel syndrome

;;javascript        ; all(hope(abandon(ye(who(enter(here))))))

;;julia             ; a better, faster MATLAB

;;kotlin            ; a better, slicker Java(Script)

;;latex             ; writing papers in Emacs has never been so fun

;;lean              ; for folks with too much to prove

;;ledger            ; be audit you can be

lua               ; one-based indices? one-based indices

markdown          ; writing docs for people to ignore

;;nim               ; python + lisp at the speed of c

nix               ; I hereby declare "nix geht mehr!"

;;ocaml             ; an objective camel

(org +roam2)               ; organize your plain life in plain text

;;php               ; perl's insecure younger brother

;;plantuml          ; diagrams for confusing people more

purescript        ; javascript, but functional

;;python            ; beautiful is better than ugly

;;qt                ; the 'cutest' gui framework ever

;;racket            ; a DSL for DSLs

;;raku              ; the artist formerly known as perl6

;;rest              ; Emacs as a REST client

;;rst               ; ReST in peace

;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}

;;(rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()

;;scala             ; java, but good

;;(scheme +guile)   ; a fully conniving family of lisps

sh                ; she sells {ba,z,fi}sh shells on the C xor

;;sml

;;solidity          ; do you need a blockchain? No.

;;swift             ; who asked for emoji variables?

;;terra             ; Earth and Moon in alignment for performance.

web               ; the tubes

yaml              ; JSON, but readable

;;zig               ; C, but simpler

:email
;;(mu4e +org +gmail)
;;notmuch
;;(wanderlust +gmail)

:app
;;calendar
;;emms
;;everywhere        ; *leave* Emacs!? You must be joking
;;irc               ; how neckbeards socialize
;;(rss +org)        ; emacs as an RSS reader
;;twitter           ; twitter client https://twitter.com/vnought

:config
       literate
       (default +bindings +smartparens)
)
