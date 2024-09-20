(use-package lsp-tailwindcss
        :straight '(lsp-tailwindcss :type git :host github :repo "merrickluo/lsp-tailwindcss")
        :init (setq lsp-tailwindcss-add-on-mode t)
        :config
        (dolist (tw-major-mode
                '(css-mode
                        css-ts-mode
                        typescript-mode
                        typescript-ts-mode
                        tsx-ts-mode
                        js2-mode
                        js-ts-mode
                        clojure-mode))
                (add-to-list 'lsp-tailwindcss-major-modes tw-major-mode))
        )
