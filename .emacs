(setq load-path (cons (expand-file-name "~/emacs/site-lisp/tramp-2.1.3") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/color-theme-6.6.0") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/mm-mode-0.4.8") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/haml-mode") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/jade-mode") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/coffee-mode") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp/git-emacs") load-path))
(setq load-path (cons (expand-file-name "~/emacs/site-lisp") load-path))

(require 'git-emacs)
(require 'git-blame)

(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(autoload 'git-blame-mode "git-blame"
  "Minor mode for incremental blame for Git." t)
(global-set-key "\C-c\C-b" 'git-blame-mode)

;; (setq whitespace-action '(auto-cleanup)) ;; automatically clean up bad whitespace
;; (setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab)) ;; only show bad whitespace
(custom-set-variables
 '(show-trailing-whitespace t))

(require 'coffee-mode)
(require 'sws-mode)
(require 'jade-mode)
(require 'haml-mode)

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-default-port 2222)

(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)
(setq-default indent-tabs-mode nil)

(put 'downcase-region 'disabled nil)

(global-set-key "\C-c\C-g" 'rgrep)
(require 'color-theme)
(color-theme-initialize)
(color-theme-jsc-dark)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(grep-find-ignored-directories (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "log" ".meteor" "node_modules")))
 '(inhibit-startup-screen t)
 '(javascript-indent-level 2)
 '(standard-indent 2))
 '(iswitchb-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html.erb$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sass$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.less$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.slim$" . haml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Assetfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.jade$" . jade-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.styl$" . jade-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.coffee$" . coffee-mode) auto-mode-alist))

;;; cmd key for meta
(setq mac-option-key-is-meta nil
mac-command-key-is-meta t
mac-command-modifier 'meta
mac-option-modifier 'none)

;; auto revert files
(global-auto-revert-mode t)

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
        (add-to-list 'default-frame-alist (cons 'width 120))
      (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
                 (cons 'height (/ (- (x-display-pixel-height) 200) (frame-char-height))))
    (add-to-list 'default-frame-alist
                 (cons 'top 50))
    )))


;;; load spec file for current buffer
(defun load-spec (specfile)
  "Load the spec file for the current buffer"
  (interactive
   (list (completing-read "Load spec: ")))
  (load specfile)
)

(set-frame-size-according-to-resolution)

(defun insert-quotes ()
  "Inserts quotes (\") around the current region or work."
  (interactive)
  (let (start end bounds)
    (if (and transient-mark-mode mark-active)
        (setq start (region-beginning) 
              end (region-end))
      (progn
        (setq bounds (bounds-of-thing-at-point 'symbol))
        (setq start (car bounds) 
              end (cdr bounds))))
    (goto-char start)
    (insert "\"")
    (goto-char (+ end 1))
    (insert "\"")))

(global-set-key "\C-c\C-q" 'insert-quotes)

(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/")
               'APPEND))
(iswitchb-mode t)
