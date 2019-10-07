;; Use rjsx mode instead of react-mode for better syntax highlighting and indentation
;; Initial layer from https://github.com/aaronjensen/spacemacs.d/tree/master/layers/%2Baj/aj-javascript
;; Edited to remove eslintd-fix
;; Has working tern, company-tern, flycheck, flow
;; No evil-matchit
;; This mode doesn't define any toggles under [SPC m]
;; Including things like SPC m m g(jump to definition)
;; See https://github.com/syl20bnr/spacemacs/blob/master/layers/%2Bframeworks/react to copy from react-mode

(defconst aj-javascript-packages
  '(
    ;; company-flow
    ;; flycheck
    prettier-js
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

;; (defun aj-javascript/post-init-company-flow ()
;;   (spacemacs|add-company-backends
;;    :backends
;;    '((company-flow :with company-dabbrev-code)
;;      company-files)))

;; (spacemacs|use-package-add-hook company-flow
;;   :post-init
;;   (progn
;;     (setq company-backends-js2-mode '((company-flow :with company-dabbrev)
;;                                       company-files
;;                                       company-dabbrev))
;;     (setq company-backends-react-mode '((company-flow :with company-dabbrev)
;;                                         company-files
;;                                         company-dabbrev))))


;; (spacemacs|use-package-add-hook company-flow
;;   :post-init
;;   (progn
;;     (setq company-backends-js2-mode '((company-flow :with company-dabbrev-code)
;;                                       company-files))
;;     (setq company-backends-react-mode '((company-flow :with company-dabbrev-code)
;;                                         company-files))))

;; (defun aj-javascript/post-init-flycheck ()
;;   (with-eval-after-load 'flycheck
;;     (push 'javascript-jshint flycheck-disabled-checkers)
;;     (push 'json-jsonlint flycheck-disabled-checkers))

;;   (spacemacs/add-flycheck-hook 'rjsx-mode))
;;   ;; (spacemacs/enable-flycheck 'rjsx-mode))

(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook #'add-node-modules-path))

(defun aj-javascript/init-prettier-js ()
  (use-package prettier-js
    :defer t
    :init
    (progn
      (add-hook 'rjsx-mode-hook 'prettier-js-mode)
      (add-hook 'css-mode-hook 'prettier-js-mode)
      (setq prettier-js-args '(
                               "--trailing-comma" "es5"
                               "--print-width" "120"
                               "--single-quote"
                               )))))

(defun react-tag-fix ()
  (define-key evil-insert-state-map (kbd "C-d") nil))

(add-hook 'js-mode-hook 'react-tag-fix)
