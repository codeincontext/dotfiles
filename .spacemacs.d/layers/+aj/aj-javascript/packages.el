;; Use rjsx mode instead of react-mode for better syntax highlighting and indentation
;; Initial layer from https://github.com/aaronjensen/spacemacs.d/tree/master/layers/%2Baj/aj-javascript
;; Edited to remove eslintd-fix and flow
;; Has working tern, company-tern, flycheck
;; No evil-matchit
;; This mode doesn't define any toggles under [SPC m]
;; Including things like SPC m m g(jump to definition)
;; See https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bframeworks/react to copy from react-mode

(defconst aj-javascript-packages
  '(
    add-node-modules-path
    flycheck
    rjsx-mode
    ))

(defun aj-javascript/init-rjsx-mode ()
  (use-package rjsx-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

      (setq
       js2-mode-show-strict-warnings nil
       js2-mode-show-parse-errors nil
       js-indent-level 2
       js2-basic-offset 2
       js2-strict-trailing-comma-warning nil
       js2-strict-missing-semi-warning nil)

      (advice-add #'js-jsx-indent-line
                  :after
                  #'aj-javascript/js-jsx-indent-line-align-closing-bracket)

      (add-hook 'rjsx-mode-hook #'aj-javascript/eslintd-set-flycheck-executable t))
    :config
    (modify-syntax-entry ?_ "w" js2-mode-syntax-table)))

(defun aj-javascript/init-add-node-modules-path ()
  (use-package add-node-modules-path
    :defer t
    :init
    (progn
      (add-hook 'web-typescript-mode-hook #'add-node-modules-path)
      (add-hook 'web-mode-hook #'add-node-modules-path)
      (add-hook 'typescript-mode-hook #'add-node-modules-path)
      (with-eval-after-load 'rjsx-mode
        (add-hook 'rjsx-mode-hook #'add-node-modules-path)))))

(defun aj-javascript/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (push 'javascript-jshint flycheck-disabled-checkers)
    (push 'json-jsonlint flycheck-disabled-checkers))

  (spacemacs/add-flycheck-hook 'rjsx-mode))
  ;; (spacemacs/enable-flycheck 'rjsx-mode))

(defun react-tag-fix ()
  (define-key evil-insert-state-map (kbd "C-d") nil))

(add-hook 'js-mode-hook 'react-tag-fix)
