;; DOOM Files
;; :PROPERTIES:
;; :header-args: :comments org
;; :END:

;; The ==init.el== file controls installed modules and order is important.


;;; $DOOMDIR/init.el -*- lexical-binding: t; -*-

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

treemacs          ; a project drawer, like neotree but cooler

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

;; Use the mouse to switch window

;;window-select     ; visually switch windows

;; Workspaces

;; Add tabs and persistant workspaces

workspaces        ; tab emulation, persistence & separate workspaces

;; Zen Mode

;; Does a lot of changes that I don't like

;;zen               ; distraction-free coding or writing



;; A set of modules that change the way the editor works

:editor

;; EVIL

;; Only way emacs is good

(evil +everywhere); come to the dark side, we have cookies

;; File Templates

;; Inserts a snippet when opening a blank file

file-templates    ; auto-snippets for empty files

;; Folding

;; Code folding. Not interesting, occasionaly useful. May delete it later

fold              ; (nigh) universal code folding

;; Format

;; Auto-formatting. + doing it on save. Don't fight about brackets, please

(format +onsave)  ; automated prettiness

;; God Mode

;; Emacs people are pretty dramatic

;;god               ; run Emacs commands without modifier keys

;; Lispy

;; Editor enhancements for when programing lisp

;;lispy             ; vim for lisp, for people who don't like vim

;; Multiple Cursors

;; Enables multi-cursor editing via [[https://github.com/hlissner/evil-multiedit][Evil Multi-Edit]]

multiple-cursors  ; editing in many places at once

;; Text Object Editing

;; Makes emacs aware of [[https://github.com/clemera/objed][Text Objects]] and gives capability to navigate among them and manipulate them

;;objed             ; text object editing for the innocent

;; Parinfer

;; Attempt to infer parenthesis for lisp code

;;parinfer          ; turn lisp into python, sort of

;; Rotate Text

;; Given a configiguration with a list of text candidates, rotate between them with a keypress

;;rotate-text       ; cycle region at point between text candidates

;; Snippets

;; Another way to expand text, this time for emacs only

snippets          ; my elves. They type so I don't have to

;; Word Wrap

;; Self explanatory

;;word-wrap         ; soft wrapping with language-aware indent

;; Emacs

;; This section of modules changes the way emacs works itsuls

:emacs

;; Dired

;; Directory navigation and editing. Not sure if I like it

dired             ; making dired pretty [functional]

;; Electric Indent

;; Smart auto indent

electric          ; smarter, keyword-based electric-indent

;; IBuffer

;; See what buffers are open and select among them

ibuffer         ; interactive buffer management

;; Undo

;; Better undo

undo              ; persistent, smarter undo for your inevitable mistakes

;; VC

;; Git

vc                ; version-control and Emacs, sitting in a tree

;; Terminals

;; In case your terminal isn't good enough, emacs is one too


:term

;; ESHell

;; elisp shell

;;eshell            ; the elisp shell that works everywhere

;; Shell

;; a shell

;;shell             ; simple shell REPL for Emacs

;; Term

;; terminal emulator

;;term              ; basic terminal emulator for Emacs

;; VTerm

;; virtual terminal emulator

vterm             ; the best terminal emulation in Emacs

;; Checkers

;; Checking syntax, spelling, stuff


:checkers

;; Syntax

;; Code syntax

syntax              ; tasing you for every semicolon you forget

;; Spelling


;;(spell +flyspell) ; tasing you for misspelling mispelling

;; Grammar



;;grammar           ; tasing grammar mistake every you make

;; Tools

;; Cool tools for doing things - mostly command line


:tools

;; Ansible

;; Setting up computers remotely, the old way

;;ansible

;; Biblio

;; Plug citations into latex

;;biblio            ; Writes a PhD for you (citation needed)

;; Collab

;; Remote buffers for all the friends emacs users don't have

;;collab            ; buffers with friends

;; Debugger

;; Sometimes you need to know what the code is actually doing

(debugger +lsp)          ; FIXME stepping through code, to help you add bugs

;; Direnv

;; Can't have per-directory environment without per-directory

direnv

;; Docker

;; Fake systems

;;docker

;; Editorconfig

;; Getting the same settings as the team

editorconfig      ; let someone else argue about tabs vs spaces

;; EIN (Jupyter)

;; Isn't Jupyter just org mode for python?

;;ein               ; tame Jupyter notebooks with emacs

;; Eval

;; Run emacs in emacs

(eval +overlay)     ; run code, run (also, repls)

;; Lookup

;; Finding things in your emacs

lookup              ; navigate your code and its documentation

;; LSP

;; What if emacs was an IDE? (It's not)

(lsp +peek)               ; M-x vscode

;; Magit

;; This is the worst name for a git client, and its an entirely different porcelain which I don't need
;; but it puts blame in the buffers

magit             ; a git porcelain for Emacs

;; Make

;; What if we didn't learn anything in the last 40 years (said from Emacs)

;;make              ; run make tasks from Emacs

;; Password

;; Emacs can do everything (in a very mediocre way)

;;pass              ; password manager for nerds

;; PDF

;; Do I want this?

;;pdf               ; pdf enhancements

;; Prodigy

;; Monit but in emacs

;;prodigy           ; FIXME managing external services & code builders

;; RGB

;; Strings

;;rgb               ; creating color strings

;; Taskrunner

;; Deprecated

;;taskrunner        ; taskrunner for all your projects

;; Terraform

;; I do this at work!

terraform         ; infrastructure as code

;; TMUX

;; For people without modern terminals

;;tmux              ; an API for interacting with tmux

;; Tree-sitter

;; Make emacs understand what code should look like

tree-sitter       ; syntax and parsing, sitting in a tree...

;; Upload

;; seems overkill

;;upload            ; map local to remote projects via ssh/ftp

;; OS

;; Setting up your operating system

:os

;; MacOs compatibility

(:if (featurep :system 'macos) macos)  ; improve compatibility with macOS

;; TTY Compatibility

;; Might want this if I want emacs in a terminal ever

;;tty               ; improve the terminal Emacs experience

;; Programming Languages

:lang

;; Agda

;; Its esoteric and has good types - cool. You need a special keyboard - cooler

;;agda              ; types of types of types of types...

;; Beancount

;; Emacs double entry book-keeping. Like acountants would use emacs

;;beancount         ; mind the GAAP

;; CC

;; C or C**

(cc +lsp)         ; C > C++ == 1

;; Clojure

;; A lisp you can use for work

;;clojure           ; java with a lisp

;; Common Lisp

;; A lisp proffesionals use for work

;;common-lisp       ; if you've seen one lisp, you've seen them all

;; COQ

;; The theorem proving language

;;coq               ; proofs-as-programs

;; Crystal

;; Everyone wants fast ruby, but not typed ruby

;;crystal           ; ruby at the speed of c

;; C-Sharp

;; Cause Microsoft didn't own java

;;csharp            ; unity, .NET, and mono shenanigans

;; Data

;; "Data" the language?

;;data              ; config/data formats

;; Dart

;; What if you could make UIs, but with objects

;;(dart +flutter)   ; paint ui and not much else

;; Dhall

;; Side-effect free config language

;;dhall

;; Elixir

;; I guess its fine for work

(elixir +lsp)            ; erlang done right

;; ELM
;; Someone wanted haskell for flux loop

;;elm               ; care for a cup of TEA?

;; ELisp

;; Use it for this thingy

emacs-lisp        ; drown in parentheses

;; Erlang

;; Doesn't know what a string is

;;erlang            ; an elegant language for a more civilized age

;; Ess

;; Statistics?

;;ess               ; emacs speaks statistics

;; Factor

;; Stack based and not popular, apparently

;;factor

;; Faust

;; Sound processing language

;;faust             ; dsp, but you get to keep your soul

;; Fortran

;; Older than bones, but still not dead

;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)

;; F#

;; What if Microsoft had a haskell

;;fsharp            ; ML stands for Microsoft's Language

;; FStar

;; Somebody is working on it

;;fstar             ; (dependent) types and (monadic) effects and Z3

;; GDScript

;; Godot script

;;gdscript          ; the language you waited for

;; GoLang

;; Its fine

;;(go +lsp)         ; the hipster dialect

;; GraphQL

;; Ask for what you need

;;(graphql +lsp)    ; Give queries a REST

;; Haskell

;; The best, if you can get it to work

(haskell +lsp)    ; a language that's lazier than I am

;; HY

;; Lisp embedded in python

;;hy                ; readability of scheme w/ speed of python

;; Idriss

;; Another typed functional language

;;idris             ; a language you can depend on

;; JSON

;; YAML but with more quotes

json              ; At least it ain't XML

;; Java

;; Write once, debug everywhere

;;(java +lsp)       ; the poster child for carpal tunnel syndrome

;; Javascript

;; Runs in the operating system of the present (browser)

;;javascript        ; all(hope(abandon(ye(who(enter(here))))))

;; Julia


;;julia             ; a better, faster MATLAB

;; Kotlin

;; Java++

;;kotlin            ; a better, slicker Java(Script)

;; Latex

;; Make a resume

;;latex             ; writing papers in Emacs has never been so fun

;; Lean

;; Another theorem prover

;;lean              ; for folks with too much to prove

;; Ledger

;; Another book-keeper

;;ledger            ; be audit you can be

;; Lua

;; The best language to put in your langauge

lua               ; one-based indices? one-based indices

;; Markdown

;; Its pretty low-lift

markdown          ; writing docs for people to ignore

;; Nim

;; Typed language again

;;nim               ; python + lisp at the speed of c

;; Nix

;; The OS controller

nix               ; I hereby declare "nix geht mehr!"

;; OCaml

;; Pretty good

;;ocaml             ; an objective camel

;; Org

;; Not logseq

org               ; organize your plain life in plain text

;; PHP

;; oh god oh god

;;php               ; perl's insecure younger brother

;; PlantUML

;; UML D:

;;plantuml          ; diagrams for confusing people more

;; Purescript

;; They tried

;;purescript        ; javascript, but functional

;; Python

;; Misplaced principals

;;python            ; beautiful is better than ugly

;; QT

;; It works

;;qt                ; the 'cutest' gui framework ever

;; Racket

;; Language definer

;;racket            ; a DSL for DSLs

;; Raku

;; perl

;;raku              ; the artist formerly known as perl6

;; Rest

;; I guess emacs does this too

;;rest              ; Emacs as a REST client

;; RST

;; Another one

;;rst               ; ReST in peace

;; Ruby

;; Big mistake

;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}

;; Rust

;; Make it fast, make it safe

;;(rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()

;; Scala

;; Like 10 languages in one

;;scala             ; java, but good

;; Scheme

;; A good lisp

;;(scheme +guile)   ; a fully conniving family of lisps

;; SH

;; Shell programming

sh                ; she sells {ba,z,fi}sh shells on the C xor

;; Standard ML

;; ML

;;sml

;; Solidity

;; Blockchain 🤢

;;solidity          ; do you need a blockchain? No.

;; Swift

;; Better than objective c?

;;swift             ; who asked for emoji variables?

;; Terra

;; Standalone low-level language of lua

;;terra             ; Earth and Moon in alignment for performance.

;; Web

;; Web?

;;web               ; the tubes

;; YAML

;; JSON, with invisible brackets

yaml              ; JSON, but readable

;; Zig

;; Rust's less popular brother

;;zig               ; C, but simpler

;; Email

;; NO

:email
;;(mu4e +org +gmail)
;;notmuch
;;(wanderlust +gmail)

;; Apps

;; Why not just use the real thing?

:app
;;calendar
;;emms
;;everywhere        ; *leave* Emacs!? You must be joking
;;irc               ; how neckbeards socialize
;;(rss +org)        ; emacs as an RSS reader
;;twitter           ; twitter client https://twitter.com/vnought

;; Config

:config
       literate
       (default +bindings +smartparens)
)
