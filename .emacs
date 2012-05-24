(add-to-list 'load-path "~/.emacs.d/")

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; Shortcut for fullscreen toggle
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Previous window
(global-set-key (kbd "C-x p")
                (lambda ()
                  (interactive)
                  (other-window -1)))

;; Automatic indentation
(add-hook 'ruby-mode-hook '(lambda ()
      (local-set-key (kbd "RET") 'newline-and-indent)))

;; fullscreen mode on startup
(tool-bar-mode -1) 
(toggle-scroll-bar -1)
(ns-toggle-fullscreen)

;; set my mysql path
(setq sql-mysql-program "/usr/local/bin/mysql")

;; show time on status bar
(display-time-mode)

;; show paren
(show-paren-mode 1)

;; CUA mode
(cua-selection-mode t)

;; linum
(require 'linum)
(global-linum-mode 1)

;; hl
(global-hl-line-mode 1)

;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; adding public packages
(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                          ("gnu" . "http://elpa.gnu.org/packages/")
                          ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-blackboard.el")
(color-theme-blackboard)

;;(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
;;(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;; Load and configure SLIME
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))
 
;; Load a major mode for editing Clojure code.
(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(require 'clojure-mode)
(require 'clojure-test-mode) ;; requires slime

(load "~/.emacs.d/flymake-ruby.el")

(require 'haml-mode)
(add-hook 'haml-mode-hook
                  '(lambda ()
                         (setq indent-tabs-mode nil)
                         (define-key haml-mode-map "\C-m" 'newline-and-indent)))


;; Load and configure SLIME
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))
