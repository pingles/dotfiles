;(setenv "PATH" (concat "/usr/local/ruby187pl202patched/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/bin:/sbin:/texbin:" (getenv "PATH")))
(setq exec-path (cons "/Users/paul/.cljr/bin:/Users/paul/.rvm/bin:/Users/paul/Tools/hadoop-0.20.2/bin:/Users/paul/Tools/ec2-api-tools-1.3-51254/bin:/Users/paul/Tools/ElasticLoadBalancing-1.0.9.3/bin:/Users/paul/Tools/hadoop-0.20.2/bin:/Users/paul/.gem/ruby/1.8/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin" exec-path))

;; Always show the menu
(menu-bar-mode 1)

;; Don't split my buffer vertically with pop ups
;;(setq split-width-threshold nil)

;; skaes config
;; (setenv "RAILS_ROOT" "/Users/antonio.garrote/Development/invites-project/invites")
;; (setenv "GEM_HOME" "/Users/antonio.garrote/Development/invites-project/gems")
;; (setenv "GEM_PATH" "/Users/antonio.garrote/Development/invites-project/gems")
;; (setenv "PATH" "/Users/antonio.garrote/Development/invites/bin:" (getenv "PATH"))
;; (setenv "PATH" "/Users/antonio.garrote/Development/invites/vendor/xing_production_log_analyzer/bin:" (getenv "PATH"))
;; (setenv "PATH" "/Users/antonio.garrote/Development/invites/vendor/plugins/gc_hacks/bin" (getenv "PATH"))
;; (setenv "IMAGEMAGICK_PATH" "/usr/local/bin")


;;eshell banner
(setq eshell-banner-message "Welcome Antonio on the Emacs shell\n\n")
;; clearing eshell
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;;shell color and read only prompt
(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)


;; Erlang
;;(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.4/emacs"
;;      load-path))
;;      (setq erlang-root-dir "/usr/local/lib/erlang/")
;;      (setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
;;      (require 'erlang-start)
(defvar inferior-erlang-prompt-timeout t)

;; twitter
;;(load-file "~/.emacs.d/modes/twit.el")
;; Now in the ELPA twitter package
(load-file "~/.emacs.d/elein.el")

;; ssh.el
(load-file "~/.emacs.d/modes/ssh.el")

;; find-cmd.el
(load-file "~/.emacs.d/modes/find-cmd.el")

;; linum
(load-file "~/.emacs.d/modes/linum.el")
(require 'linum)
(setq linum-format "%d ")
(put 'downcase-region 'disabled nil)

;; XING
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
;; (setq-default fill-column 120)
;; (add-hook 'ruby-mode-hook 'turn-on-auto-fill)

;;__________________________________________________________________________
;;;;    VM - Mail

(add-to-list 'load-path "~/.emacs.d/modes/vm")
(setq vm-toolbar-pixmap-directory "~/.emacs.d/modes/vm/pixmaps")
(setq vm-image-directory "~/.emacs.d/modes/vm/pixmaps")

(autoload 'vm "vm" "Start VM on your primary inbox." t)
(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
(autoload 'vm-mail "vm" "Send a mail message using VM." t)
(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

;; Some file locations are relative to my HOME or BIN directories
(defvar home-dir)
(setq home-dir (concat (expand-file-name "~") "/"))

;; Basic VM setup
;;(setenv "PATH" (concat (concat (expand-file-name "~") "/bin/emacs/site-lisp/vm/bin") ":" (getenv "PATH")))
(setq send-mail-function 'sendmail-send-it)
(setq user-full-name "Antonio Garrote")
(setq user-mail-address "antoniogarrote@gmail.com")
(setq mail-archive-file-name "~/Mail/SENT")

;; Configure inbound mail (POP)
(setq vm-spool-files
      '(("~/INBOX" "pop-ssl:pop.gmail.com:995:pass:antoniogarrote:*" "~/INBOX.CRASH")))

;; Use W3M to read HTML email
;; (require 'w3m-load)
;; (setq vm-mime-use-w3-for-text/html nil)
;; (setq vm-url-browser 'w3m)
;; (load "vm-w3m")
;; (setq w3m-input-coding-system 'utf-8
;;       w3m-output-coding-system 'utf-8)

;; Configure outbound mail (SMTP)
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("smtp.gmail.com"
				   587
				   "antoniogarrote@gmail.com"
				   nil)))


;; GIT
(add-to-list 'load-path "~/.emacs.d/modes/git")
(add-to-list 'load-path "~/.emacs.d/modes/git-emacs")
(require 'git)
(require 'git-emacs)


;; jabber
(require 'jabber)

;; Show trailing white spaces
(setq-default show-trailing-whitespace t)


;; Clojure connection with slime
;;(clojure-slime-config)

;; clojure load path
;;  (add-to-list 'load-path (concat clojure-src-root "~/Development/old/clj-gearman-actors/src"))
;;  (add-to-list 'load-path (concat clojure-src-root "~/Development/old/clj-gearman-actors/src"))
;;  (add-to-list 'load-path (concat clojure-src-root "~/Development/old/clj-gearman-actors/lib/gearman-java-0.03.jar"))
;;  (add-to-list 'load-path (concat clojure-src-root "~/Development/old/clj-gearman-actors/lib/clj-tuples-0.3.2-SNAPSHOT.jar"))

;; (setq swank-clojure-jar-path (concat clojure-src-root "/clojure/clojure.jar"))

;;(setq swank-clojure-extra-classpaths (list "/Users/antonio.garrote/Development/old/ab_testing/a_b_backend/lib/clojure-db-object-0.1.1-20091229.021828-2.jar"
;;                                           "/Users/antonio.garrote/Development/old/ab_testing/a_b_backend/lib/mongo-java-driver-1.1.0-20091229.021828-3.jar"
;;                                           "/Users/antonio.garrote/Development/old/ab_testing/a_b_backend/lib/congomongo-0.1.1-20091229.021828-1.jar"))


;; emacs speaks statistics
(load "/Users/paul/.emacs.d/modes/ess/lisp/ess-site")
(require 'ess-site)

;; tuareg mode tuned for F# and mono
(setq load-path (cons "~/.emacs.d/modes/tuareg-mode" load-path))
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

;; Rainbow Parens
(load "/Users/paul/.emacs.d/modes/rainbow-parens.el")
(require 'rainbow-parens)

;(add-hook 'clojure-mode-hook 'rainbow-paren-mode)

;; fsharp
(setq auto-mode-alist (cons '("\\.fs\\w?" . tuareg-mode) auto-mode-alist))

(defadvice tuareg-find-alternate-file (around fsharp-find-alternate-file)
  "Switch Implementation/Interface."
  (interactive)
  (let ((name (buffer-file-name)))
    (if (string-match "\\`\\(.*\\)\\.fs\\(i\\)?\\'" name)
        (find-file (concat (tuareg-match-string 1 name)
                           (if (match-beginning 2) ".fs" ".fsi"))))))

(defconst tuareg-error-regexp-fs
  "^\\([^(\n]+\\)(\\([0-9]+\\),\\([0-9]+\\)):"
  "Regular expression matching the error messages produced by fsc.")

(add-hook 'tuareg-mode-hook
          '(lambda ()
             (ad-activate 'tuareg-find-alternate-file)
             (setq tuareg-interactive-program "fsi")
             (if (boundp 'compilation-error-regexp-alist)
                 (or (assoc tuareg-error-regexp-fs
                            compilation-error-regexp-alist)
                     (setq compilation-error-regexp-alist
                           (cons (list tuareg-error-regexp-fs 1 2 3)
                                 compilation-error-regexp-alist))))))

;; Groovy
(setenv "JAVA_HOME" "/System/Library/Frameworks/JavaVM.framework/Versions/1.6")
(setenv "GROOVY_HOME" "/opt/local/share/java/groovy")
(setenv "MAVEN_HOME" "/usr/share/maven")

(setenv "PATH" (concat (getenv "PATH")
		       ":" (getenv "JAVA_HOME") "/Commands"
		       ":" (getenv "GROOVY_HOME") "/bin"
		       ":" (getenv "MAVEN_HOME") "/bin"))


(load-file "~/.emacs.d/modes/groovy-mode.el")
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
;;; inf-groovy
(load-file "~/.emacs.d/modes/inf-groovy.el")
(autoload 'run-groovy "inf-groovy" "Run an inferior Groovy process")
(autoload 'inf-groovy-keys "inf-groovy" "Set local key defs for inf-groovy in groovy-mode")

(add-hook 'groovy-mode-hook
          '(lambda ()
             (inf-groovy-keys)
             ))


;; rails
(load-file "~/.emacs.d/modes/snippet.el")
(load-file "~/.emacs.d/modes/find-recursive.el")
(setq load-path (cons "~/.emacs.d/modes/emacs-rails" load-path))
(require 'rails)


;; color themes
(setq load-path (cons "~/.emacs.d/modes/color-theme" load-path))
(load-file "~/.emacs.d/modes/blackboard.el")
(load-file "~/.emacs.d/modes/zenburn.el")
(load-file "~/.emacs.d/modes/twilight.el")
(require 'color-theme)
(color-theme-initialize)
(color-theme-arjen)
;(color-theme-initialize)
;(color-theme-zenburn)
;(color-theme-blackboard)
;(color-theme-zenburn)

;; full screen
(defun fullscreen (&optional f)
  (interactive)
  (set-frame-parameter f 'fullscreen
        	       (if (frame-parameter f 'fullscreen) nil 'fullboth)))

(global-set-key [f11] 'fullscreen)

(add-hook 'after-make-frame-functions 'fullscreen)


;; tramp bug emacs < 23
(defun tramp-list-tramp-buffers ()
  "Return a list of all Tramp connection buffers."
  (append
   (all-completions
    "*tramp" (mapcar 'list (mapcar 'buffer-name (buffer-list))))
   (all-completions
    "*debug tramp" (mapcar 'list (mapcar 'buffer-name (buffer-list))))))

(defun tramp-list-remote-buffers ()
  "Return a list of all buffers with remote default-directory."
  (delq
   nil
   (mapcar
    (lambda (x)
      (with-current-buffer x
	(when (and (stringp default-directory)
		   (file-remote-p default-directory))
	  x)))
    (buffer-list))))


(global-hl-line-mode 0)
;;(global-linum-mode 1)

(setq-default fill-column 80)
(setq auto-fill-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; PERL
;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>
(defalias 'perl-mode 'cperl-mode)

(add-hook 'erlang-mode-hook '(lambda () (linum-mode 1)))
(add-hook 'ruby-mode-hook '(lambda () (linum-mode 1)))
(add-hook 'java-mode-hook '(lambda () (linum-mode 1)))
(add-hook 'clj-mode-hook '(lambda () (linum-mode 1)))
(add-hook 'clojure-mode-hook '(lambda () (linum-mode 1)))

(add-hook 'erlang-mode-hook '(lambda () (hl-line-mode 1)))
(add-hook 'ruby-mode-hook '(lambda () (hl-line-mode 1)))
(add-hook 'java-mode-hook '(lambda () (hl-line-mode 1)))
(add-hook 'clj-mode-hook '(lambda () (hl-line-mode 1)))
(add-hook 'clojure-mode-hook '(lambda () (hl-line-mode 1)))

;; gnus
;; (load-file "~/.emacs.d/modes/ssl.el")
;; (load-file "~/.emacs.d/modes/pop3.el")


;; Viper mode !!!

;;(require 'viper)


;; Fuzzy find in project
(add-to-list 'load-path "~/.emacs.d/modes/fuzzy-find-in-project")
(require 'fuzzy-find-in-project)
(fuzzy-find-project-root "~/path/to/project")


;; Moz REPL
(add-to-list 'load-path "~/.emacs.d/modes/moz.el")
(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'javascript-mode-hook 'javascript-custom-setup)
(defun javascript-custom-setup ()
  (moz-minor-mode 1))

;; Cua Mode
(cua-selection-mode t)

;; Aything mode
(add-to-list 'load-path "~/.emacs.d/modes")
(require 'anything-config)

;; ;;; Configuration for JDEE

;; ;; Elib
;; ;;; $Id: startup-template.el,v 0.5 1993/05/31 23:49:29 ceder Exp $
;; ;;; Support for the elisp library elib.
;; (setq load-path (append (list "/opt/local/share/emacs/site-lisp/elib")
;;                         load-path))

;; ;; CEDET

;; ;; Load CEDET.
;; ;; See cedet/common/cedet.info for configuration details.
;; (load-file "~/.emacs.d/modes/cedet/common/cedet.el")


;; ;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;; ;; Enable EDE for a pre-existing C++ project
;; ;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; ;; Enabling Semantic (code-parsing, smart completion) features
;; ;; Select one of the following:

;; ;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; ;; * This enables some tools useful for coding, such as summary mode
;; ;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; ;; * This enables even more coding tools such as intellisense mode
;; ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; ;; * This enables the use of Exuberent ctags if you have it installed.
;; ;;   If you use C++ templates or boost, you should NOT enable it.
;; ;; (semantic-load-enable-all-exuberent-ctags-support)
;; ;;   Or, use one of these two types of support.
;; ;;   Add support for new languges only via ctags.
;; ;; (semantic-load-enable-primary-exuberent-ctags-support)
;; ;;   Add support for using ctags as a backup parser.
;; ;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; ;; Enable SRecode (Template management) minor-mode.
;; ;; (global-srecode-minor-mode 1)


;; ;; JDEEE properly

;; ;; Update the Emacs load-path to include the path to
;; ;; the JDE and its require packages. This code assumes
;; ;; that you have installed the packages in the emacs/site
;; ;; subdirectory of your home directory.
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/modes/jdee/lisp"))

;; ;; If you want Emacs to defer loading the JDE until you open a
;; ;; Java file, edit the following line
;; (setq defer-loading-jde nil)
;; ;; to read:
;; ;;
;; ;;  (setq defer-loading-jde t)
;; ;;

;; (if defer-loading-jde
;;     (progn
;;       (autoload 'jde-mode "jde" "JDE mode." t)
;;       (setq auto-mode-alist
;; 	    (append
;; 	     '(("\\.java\\'" . jde-mode))
;; 	     auto-mode-alist)))
;;   (require 'jde))

;; ;; Sets the basic indentation for Java source files
;; ;; to two spaces.
;; (defun my-jde-mode-hook ()
;;   (setq c-basic-offset 2))

;; (add-hook 'jde-mode-hook 'my-jde-mode-hook)

;; ;; Include the following only if you want to run
;; ;; bash as your shell.

;; ;; Setup Emacs to run bash as its primary shell.
;; (setq shell-file-name "bash")
;; (setq shell-command-switch "-c")
;; (setq explicit-shell-file-name shell-file-name)
;; (setenv "SHELL" shell-file-name)
;; (setq explicit-sh-args '("-login" "-i"))


;; ;; ECB
;; (add-to-list 'load-path "/Users/antonio.garrote/.emacs.d/modes/ecb")
;; (load-file "/Users/antonio.garrote/.emacs.d/modes/ecb/ecb.el")
;; (require 'ecb-autoloads)

;; Multi term
(load "/Users/paul/.emacs.d/modes/multi-term.el")
(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/bash")   ;; use bash
;; (setq multi-term-program "/bin/zsh") ;; or use zsh...

;; only needed if you use autopair
(add-hook 'term-mode-hook
  #'(lambda () (setq autopair-dont-activate t)))

(add-hook 'term-mode-hook
  #'(lambda () (setq show-trailing-whitespace nil)))


(global-set-key (kbd "C-c t") 'multi-term-next)
(global-set-key (kbd "C-c T") 'multi-term) ;; create a new one

(custom-set-variables
     '(term-default-bg-color "#000000")        ;; background color (black)
     '(term-default-fg-color "#ff9900"))       ;; foreground color (orange)

(defun htop ()
  "htop shell."
  (interactive)
   (let ((multi-term-program "/opt/local/bin/htop"))
    (multi-term)))

;; Counting words in a LaTeX document
(defun latex-word-count ()
  (interactive)
  (shell-command (concat "/usr/local/bin/texcount.pl "
                         ; "uncomment then options go here "
                         (buffer-file-name))))

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/modes/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/modes/ac-dict")
(ac-config-default)


;; google
(defun google ()
  (interactive)
  (let ((to-search (read-string "what should I search?: ")))
    (browse-url (concat "http://google.com/search?q=" to-search))))

;; wikipedia
(defun wikipedia ()
  (interactive)
  (let* ((to-search-pre (read-string "what should I search?: "))
         (to-search-post      (string-replace-match " " to-search-pre "_"))
         (to-search (if to-search-post to-search-post to-search-pre)))
    (browse-url (concat "http://en.wikipedia.org/wiki/Special:Search?search=" to-search))))

(require 'artist)
