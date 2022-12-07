testthat::test_that(desc = "errors", 
                    code = {
                      filePath = 'thisisawrongpath'
                      testthat::expect_error(clonesum_read(inputpath = filePath),
                                             "File 'thisisawrongpath' does not exist or is non-readable"
                                             )
                      filePath = ''
                      testthat::expect_error(clonesum_read(inputpath = filePath),
                                             "Input is empty or only contains BOM or terminal control characters"
                                             )
                    }
)
