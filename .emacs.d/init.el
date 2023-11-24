(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; rimuove la scrollbar
(tool-bar-mode -1)   ; rimuove la toolbar
(tooltip-mode -1)    ; rimuove i tooltips
(set-fringe-mode 10) ; da un po' piu di aria di 

(menu-bar-mode -1)   ; toglie la barra del menu

(setq visible-bell t); imposta un flash in caso di errori senza che parte la campanella 

(set-face-attribute 'default nil :font "Fira Code" :height 115)
(setq custom-safe-themes t)
(load-theme 'doom-material-dark) ; carica un tema 


;; https://melpa.org/ sito in cui vengono caricati i pacchetti
;; inizializziamo le risorse dei pacchetti
(require 'package)   ; include tutte le funzionalita del package manager


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize) ; inizializza il package system
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ; ogni volta che trova un pacchetto mancante lo installa in automatico

;; (use-package command-log-mode) tiene traccia di tutte le istruzioni e i key-bindings

;; installa ivy e aggiunge quake keybinding (ivy migliora la ricerca di comandi e files)
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  )
(ivy-mode 1)

;; Modeline molto figa che aggiunge un po' di funzioni
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Pacchetto di temi della raccolta doom-themes
(use-package doom-themes)

;; Parte per far vedere il # di riga e colonna
(column-number-mode) ; mostra il numero di colonna (?)
(global-display-line-numbers-mode t) ; mostra ovunque il numero di riga

(dolist ( mode '(org-mode-hook
		 term-mode-hook
		 eshell-mode-hook
		 shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0)))) ; il comando non mostra il # di riga quando si e nelle modalita specificate

;; parte per evidenziare le coppie di parentesi usando i colori
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; pacchetto che fa vedere quali sono le combinazioni di tasti possibili in base a quella di partenza e anche cosa succede in Base alla combinazione
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq wich-key-idel-delay 0.1))

;; Pacchetto che mette una descrizione dei comandi (ivy)
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; un po' di keybinding utili per counsel
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil)) ;; con fa partire ricerche con ^

;; migliori schermate di aiuto (molto apprezzate ^_^)
(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable) 
  (counsel-describe-variable-function #'helpful-callable)
  :bind
  ([remap describe-function] . counsel-describe-function) ;remap rimpiazza l'istruzione di default di un keybinding con un'altra
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; abilita la modalità per i file markdown
;; (use-package markdown-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
