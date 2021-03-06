;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/tramp-2.1.3") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/mm-mode-0.4.8") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp/git-emacs") load-path))
;; (setq load-path (cons (expand-file-name "~/emacs/site-lisp") load-path))

;; added with package installer

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(require 'coffee-mode)
(require 'slim-mode)
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
(setq-default scss-compile-at-save nil)
(setq show-trailing-whitespace t)

(add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)

(add-hook 'after-init-hook #'global-emojify-mode)

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  tab-width 2
                                  indent-tabs-mode nil)))


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)

(put 'downcase-region 'disabled nil)

(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key "\C-c\C-g" 'rgrep)
(global-set-key "\C-c\C-m" 'mc/edit-lines)
;; (global-set-key "\C-c\C-g" 'ag-files)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "log" ".meteor" "node_modules" ".idea")))
 '(ido-enable-flex-matching t)
 '(ido-use-faces nil)
 '(inhibit-startup-screen t)
 '(javascript-indent-level 2)
 '(jsx-indent-level 2)
 '(package-selected-packages
   (quote
    (emojify web-mode tramp-term sws-mode slim-mode scss-mode sass-mode ruby-tools ruby-compilation rubocop projectile-git-autofetch projectile-direnv multiple-cursors magit jump jsx-mode json-mode js2-mode jade-mode icicles helm-projectile git-blame flycheck flx-ido feature-mode exec-path-from-shell color-theme-sanityinc-solarized color-theme coffee-mode base16-theme alchemist ag add-node-modules-path)))
 '(standard-indent 2))

`(dired-listing-switches "-dired")

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
(global-set-key "\M-\?" 'comment-or-uncomment-region)
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html.erb$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.html$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.js.erb$" . javascript-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rhtml$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sass$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.less$" . css-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.feature$" . feature-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.slim$" . slim-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Assetfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Capfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.jade$" . jade-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.styl$" . jade-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.coffee$" . coffee-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.es6$" . js2-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.jsx$" . web-mode) auto-mode-alist))

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;;; cmd key for meta
;; (setq mac-option-key-is-meta nil
;; mac-command-key-is-meta t
;; mac-command-modifier 'meta
;; mac-option-modifier 'none)

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
                 (cons 'height (/ (- (x-display-pixel-height) 250) (frame-char-height))))
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

(defun convert-hashrockets ()
  "Replace ruby hashrockets with new hash syntax"
  (interactive)
  (goto-char 1)
  (while (search-forward-regexp ":\\([-_A-Za-z0-9]+\\)[[:space:]]=>" nil t)
    (replace-match ( concat (match-string 1) ":") t nil )))


(defun insert-double-quotes ()
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

(defun insert-single-quotes ()
  "Inserts single quotes (\') around the current region or work."
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
    (insert "'")
    (goto-char (+ end 1))
    (insert "'")))

(global-set-key "\C-c\C-w" 'insert-single-quotes)
(global-set-key "\C-c\C-q" 'insert-double-quotes)
(global-set-key (kbd "C-M-<down>") 'mc/mark-next-lines)

(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/")
               'APPEND))


(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
      (if (equal 'fullboth current-value)
        (if (boundp 'old-fullscreen) old-fullscreen nil)
        (progn (setq old-fullscreen current-value)
          'fullboth)))))
(global-set-key "\C-\M-g" 'toggle-fullscreen)

;; Disable tool-bar
;;(tool-bar-mode -1)

;; Disable Menu Bar
(menu-bar-mode -1)

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq mouse-wheel-progressive-speed nil)

(defun sort-lines-nocase ()
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

(projectile-mode)
;; (set-default-font "Monaco-14")

(require 'color-theme)
(color-theme-initialize)
(color-theme-jsc-dark)
;; (load-theme 'solarized-dark t)
;; (color-theme-solarized-dark)
