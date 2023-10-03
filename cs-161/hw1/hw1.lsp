;; CS 161
;; Homework 1
;; Zooey Nguyen
;; October 16, 2020

; Problem 1
(defun PAD (N)
    (if (or (eql N 0) (eql N 1) (eql N 2))
        1
        (+ (PAD (- N 1)) (PAD (- N 2)) (PAD (- N 3)))
    )
)

; Problem 2
(defun SUMS (N)
    (cond   ((< N 0) "Invalid negative input.")
            ((or (eql N 0) (eql N 1) (eql N 2)) 0)
            (t (+ 2 (SUMS (- N 1)) (SUMS (- N 2)) (SUMS (- N 3))))
    )
)

; Problem 3
(defun ANON (TREE)
    (cond   ((not TREE) nil) ; includes empty list, returns nil
            ((atom TREE) 0)
            (t  (cons ; cons will not include nil
                    (ANON (car TREE))
                    (ANON (cdr TREE))
                )
            )

    )
)
