(defun mahori:starts-with-p (string1 string2)
  (string= (substring string1 0 (min (length string1) (length string2))) string2))

(defun mahori:dont-backup-commit-files-p (filename)
  (let ((filename-part (file-name-nondirectory filename)))
    (if (mahori:starts-with-p filename-part "svn-commit")
        nil
      (normal-backup-enable-predicate filename))))
