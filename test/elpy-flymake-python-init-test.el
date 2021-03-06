(ert-deftest elpy-flymake-python-init-should-do-nothing-for-remote-file ()
  (elpy-testcase ()
    (mletf* ((file-remote-p (filename) t))
      (should (equal (elpy-flymake-python-init)
                     nil)))))

(ert-deftest elpy-flymake-python-init-should-return-temp-file ()
  (elpy-testcase ()
    (mletf* ((python-check-command "test-check")
             (buffer-file-name "/")
             (flymake-init-create-temp-buffer-copy (x) "test-temp-file"))
      (should (equal (elpy-flymake-python-init)
                     '("test-check" ("test-temp-file") "/"))))))
