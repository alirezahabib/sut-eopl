#lang racket

(define (main in out)
  (write-to-file
   (map eval (file->list in)) out))