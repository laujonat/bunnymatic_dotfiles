(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default scss-compile-at-save nil)
(setq-default web-mode-markup-indent-offset 2)
(setq-default web-mode-css-indent-offset 2)
(setq-default web-mode-code-indent-offset 2)
(setq-default show-trailing-whitespace t)

(require 'color-theme)
(color-theme-initialize)
(color-theme-jsc-dark)
;; (set-default-font "Monaco-14")
;; (load-theme 'solarized-dark t)
;; (color-theme-solarized-dark)
(global-linum-mode)

;; auto revert files
(global-auto-revert-mode t)

;; Disable tool-bar
(tool-bar-mode -1)

;; Disable Menu Bar
(menu-bar-mode -1)

(add-hook 'before-save-hook 'whitespace-cleanup)

(put 'downcase-region 'disabled nil)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
