testfiles = c('./input/BCR/W3525_BCR/W3525_B2022.50915_v1_20221204101340383.clone_summary.csv',
              './input/BCR/W3525_BCR/W3525_B2022.50915_v1_20221204101403744.clone_summary.csv',
              './input/TCR/W2406_K2022.1455_20220903012053696.clone_summary.csv',
              './input/TCR/W2406_K2022.1455_20220903012128818.clone_summary.csv')

testthat::test_that(desc = "Correct assignment of panel", 
                    code = {
                      filei = clonesum_read(testfiles[1])
                      testthat::expect_equal(check_seq_panel(file = filei),
                                             "BCR_H"
                      )
                      filei = clonesum_read(testfiles[2])
                      testthat::expect_equal(check_seq_panel(file = filei),
                                             "BCR_K_L"
                      )
                      filei = clonesum_read(testfiles[3])
                      testthat::expect_equal(check_seq_panel(file = filei),
                                             "TCR_gamma"
                      )
                      filei = clonesum_read(testfiles[4])
                      testthat::expect_equal(check_seq_panel(file = filei),
                                             "TCR_beta"
                      )
                    }
)
