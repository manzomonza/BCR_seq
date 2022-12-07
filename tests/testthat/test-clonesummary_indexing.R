testthat::test_that(desc = "Correct indexing of panel", 
                   code = {
                     inputstring = 'BCR_H'
                     testthat::expect_equal(clonesummary_indexing(charstring = inputstring),
                                          c("BCR",1)
                     )
                     inputstring = 'BCR_K_L'
                     testthat::expect_equal(clonesummary_indexing(charstring = inputstring),
                                            c("BCR",2)
                                            )
                     inputstring = 'TCR_beta'
                     testthat::expect_equal(clonesummary_indexing(charstring = inputstring),
                                            c("TCR",2) 
                                            )
                     inputstring = 'TCR_gamma'
                     testthat::expect_equal(clonesummary_indexing(charstring = inputstring),
                                            c("TCR",1)
                                            )
                   }
)
