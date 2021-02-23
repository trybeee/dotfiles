;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dima Novotochinov"
      user-mail-address "trybeee@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "Fira Code" :size 14))
(setq doom-font (font-spec :family "JetBrains Mono" :size 14))
;;(setq doom-font (font-spec :family "monospace" :size 14))
;;
(defconst jetbrains-ligature-mode--ligatures
  '("-->" "//" "/**" "/*" "*/" "<!--" ":=" "->>" "<<-" "->" "<-"
    "<=>" "==" "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".."
    "|||" "///" "&&&" "===" "++" "--" "=>" "|>" "<|" "||>" "<||"
    "|||>" "<|||" ">>" "<<" "::=" "|]" "[|" "{|" "|}"
    "[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." "::"
    "+++" "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>"
    "<:" ":<" ":>" ">:" "<>" "***" ";;" "/==" ".=" ".-" "__"
    "=/=" "<-<" "<<<" ">>>" "<=<" "<<=" "<==" "<==>" "==>" "=>>"
    ">=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<" "---" "<-|"
    "<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>"
    "<$>" "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>"
    "<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
    "|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
    "&="))

(dolist (pat jetbrains-ligature-mode--ligatures)
  (set-char-table-range composition-function-table
                        (aref pat 0)
                        (nconc (char-table-range composition-function-table (aref pat 0))
                               (list (vector (regexp-quote pat)
                                             0
                                             'compose-gstring-for-graphic)))))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-opera-light)
;; (setq doom-theme 'doom-nova)
;; (setq doom-theme 'doom-fairy-floss)
(setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-localleader-key ",")

(require 'stylus-mode)

;; (define-key clojure-mode-map (kbd ", e f") #'cider-eval-defun-at-point)

(map! (:localleader
          (:map (clojure-mode-map clojurescript-mode-map)
            (:prefix ("e" . "eval")
              "f" #'cider-eval-defun-at-point))))

(evil-define-key 'normal clojure-mode-map
  ">" #'sp-slurp-hybrid-sexp
  "<" #'sp-backward-barf-sexp)


(map! :leader
      ;; undoes all the other window bindings?
      (:prefix "w"
         :nv :desc "Split window right" "|"  #'split-window-right
         :nv :desc "Split window below" "-"  #'split-window-below
         :nvie :desc "Winner redo" "U" #'winner-redo)

      (:prefix "c"
        ;; also works for cider jumping
        :nv :desc "Jump back" "b"  #'dumb-jump-back)

      (:prefix "k"
        :nv :desc "Kill sexp" "k" #'paredit-kill
        :nv :desc "Wrap with ()" "w" #'sp-wrap-round
        :nv :desc "Unwrap with ()" "W" #'sp-unwrap-sexp
        :nv :desc "Barf" "b" #'sp-forward-barf-sexp
        :nv :desc "Slurp" "s" #'sp-forward-slurp-sexp
        :nv :desc "Raise" "r" #'sp-raise-sexp)

      (:prefix "j"
        :nv :desc "Jump to symbol" "i" #'imenu
        :nv :desc "Jump to symbol across buffers" "I" #'imenu-anywhere
        :nv :desc "Jump to link" "l" #'ace-link
        :nv :desc "Avy jump" "j" #'avy-goto-char-timer)

      (:prefix "p"
        :nv :desc "Find file in project" "f" #'projectile-find-file
        :nv :desc "Neotree" "t" #'neotree-open-this)

      (:prefix "o"
        :nv :desc "Neotree for this file" "p" #'neotree-open-this)

      (:prefix "b"
        :nv :desc "Switch buffer"               "b" #'switch-to-buffer
        :nv :desc "Delete buffer"               "d" #'kill-this-buffer
        :nv :desc "Recent files"                "r" #'recentf-open-files)

      (:when (featurep! :tools magit)
        (:prefix-map ("g" . "git")
          :desc "Magit status"              "s" #'magit-status
          :desc "Git link"                  "ll" #'git-link
          :desc "Magit switch branch"       "B" #'magit-branch-checkout
          :desc "Magit blame"               "b" #'magit-blame-addition)))

(add-to-list 'load-path "~/bin/")

;; (autoload 'anakondo-minor-mode "anakondo")
;; ;; Enable anakondo-minor-mode in all Clojure buffers
;; (add-hook 'clojure-mode-hook #'anakondo-minor-mode)
;; ;; Enable anakondo-minor-mode in all ClojureScript buffers
;; (add-hook 'clojurescript-mode-hook #'anakondo-minor-mode)
;; ;; Enable anakondo-minor-mode in all cljc buffers
;; (add-hook 'clojurec-mode-hook #'anakondo-minor-mode)

;; (map! :prefix doom-leader-key "/" #'+ivy/project-search)

;; (add-hook! cider-repl-mode #'evil-normalize-keymaps)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
