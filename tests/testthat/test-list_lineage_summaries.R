testdir='/Users/manzo/USB/USB_Diagnostics/LymphocyteSeq/input/BCR/W3525_BCR'

testthat::test_that(desc = "Correct retrieval of lineage summaries",
                    code = {
                      inputstring = testdir
                      testthat::expect_equal(list_lineage_summaries(inputstring),
                                             c("/Users/manzo/USB/USB_Diagnostics/LymphocyteSeq/input/BCR/W3525_BCR/W3525_B2022.50915_v1_20221204101340383.lineage_summary.csv",
                                               "/Users/manzo/USB/USB_Diagnostics/LymphocyteSeq/input/BCR/W3525_BCR/W3525_B2022.50915_v1_20221204101403744.lineage_summary.csv")
                      )
                      }
)
