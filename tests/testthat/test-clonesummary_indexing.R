testthat::test_that(desc = "Correct indexing of panel", 
                   code = {
                     inputstring = 'BCR_H'
                     testthat::expect_equal(clonesummary_indexing(charstring = inputstring),
                                          c("BCR",1)
                     )
                   }
                   )
