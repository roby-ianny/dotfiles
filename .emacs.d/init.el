(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; rimuove la scrollbar
(tool-bar-mode -1)   ; rimuove la toolbar
(tooltip-mode -1)    ; rimuove i tooltips
(set-fringe-mode 10) ; da un po' piu di aria di 

(menu-bar-mode -1)   ; toglie la barra del menu

(setq visible-bell t); imposta un flash in caso di errori senza che parte la campanella 

;; FONT CONFIGURATION
(set-face-attribute 'default nil :font "RobotoMono Nerd Font" :height 115)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "RobotoMono Nerd Font" :height 115)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Roboto" :height 115 :weight 'regular)




(setq custom-safe-themes t)
;; https://melpa.org/ sito in cui vengono caricati i pacchetti
;; inizializziamo le risorse dei pacchetti
(require 'package)   ; include tutte le funzionalita del package manager


(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/") ; serve per mantenere org aggiornato
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

;; Risolve il probelma delle icone nella modline
(use-package all-the-icons)

;; Modeline molto figa che aggiunge un po' di funzioni
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;; Pacchetto di temi della raccolta doom-themes
(use-package doom-themes
  :init (load-theme 'doom-material-dark t)) ;; carica il tema in automatico

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

;; VIDEO III

;; (global-set-key (kbd "C-M-j") 'counsel-switch-buffer) ;; scorciatoia per passare facilmente tra i buffer

; Installiamo il pacchetto "general"
(use-package general) ; permette di definire più facilmente le scorciatoie

(general-define-key
 "C-M-j" 'counsel-switch-buffer)
(general-define-key
 "C-z" 'undo) ; scorciatoia che permette di annullare con control z

;; esempio di cosa può fare altro general
; (general-create-definer roby/leader-keys
;   :keymaps '(normal insert visual emacs)
;   :prefix "SPC"
;   :global-prefix "C-SPC")

; (roby/leader-keys
;  "t" (:ignore t :which-key "toggles")
;  "tt" (counsel-load-theme :which-key "choocse theme")))

;; evil mode permette di emulare il comportamento "modale" di vi 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(visual-fill-column org-bullets forge evil-magit magit projectile hydra general which-key rainbow-delimiters markdown-mode ivy-rich helpful doom-themes doom-modeline counsel command-log-mode all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (use-package evil
;;  :init
;;  (setq evil-want-integration t)
;;   (setq evil-want-keybinding nil)
;;   (setq evil-want-C-u-scroll t)
	   ; C-u normalmente modifica il comportamento di un comando "potenziandolo"-
;;   (setq evil-want-C-i-jump nil)
           ; C-i è un altra scorciatoia che è stata disabilitata
;;   :config
;;   (evil-mode 1)
;;   (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
;;   (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
;;   (evil-global-set-key 'motion "j" 'evil-next-visual-line)
;;   (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

;;   (evil-set-initial-state 'messages-buffer-mode 'normal)
;;   (evil-set-initial-state 'dashboard-mode 'normal))

;; (use-package evil-collection
;;   :after evil
;;   :config
;;   (evil-collection-init))

;; se la package list non è aggiornata bisogna lanciare il comando
; "list-packages"

					; Hydra e window management
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4) ; Funzione per scalare il testo "velocemente"
	  "scale text"
	  ("j" text-scale-increase "in")
	  ("k" text-scale-decrease "out")
	  ("f" nil "finished" :exit t))

;; Lezione 4 - Projectile e Magit
; Projectile fornisce una serie di utilità per il project management

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy)) ;usa ivy per il sistema di autocompletamento nella ricerca dei files
  ;custom è utile per quando si utilizzao variabili esterne, è una buona pratica per evitare problemi
  :bind-keymap
  ("C-c p" . projectile-command-map) ;tutti i commandi di projectile partono con questa scorciatoia
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Documenti/GitHub") ;directory dei file git
    (setq projectile-project-search-path '("~/Documenti/GitHub"))) ;cerca tutto direttamente nella cartella 
  (setq projectile-switch-project-action #'projectile-dired)) ; carica dired per navigare nei files del progetto

;magit.gc - git porcelain in emacs
(use-package magit
 :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
; il comando custom indica che lavora sempre sulla stessa finestra senza aprirne un'altra

; (use-package evil-magit
; :after magit)

;;TODO
;; NOTE: Make sure to configure a GitHub token before using this package!
;; - https://magit.vc/manual/forge/Token-Creation.html#Token-Creation
;; - https://magit.vc/manual/ghub/Getting-Started.html#Getting-Started

(use-package forge)

;; Lezione 5 - OrgMode basics
; Org mode fa un botto di cose - markup, agenda, todo, tasks planning etc.
(defun efs/org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2) ; cambia la dimensione del testo in base al tipo (titolo etc.)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Roboto" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil   :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾") ;mette la freccina in giù per gli elementi "raggruppati"
  (setq org-agenda-files
	'("~/Documenti/OrgFiles/Tasks.org"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (efs/org-font-setup))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))) ; mette il "pallini" al posto degli asterischi

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

;; Lezione 6 - Org mode per il task management
