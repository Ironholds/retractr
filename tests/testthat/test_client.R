testthat::context("Test client")

testthat::test_that("The API client works with withdrawn papers", {
	result <- retractr::check_retraction(doi = "10.7860/JCDR/2013/4833.2724")
	testthat::expect_true(result$retracted)
})

testthat::test_that("The APi client works with non-withdrawn papers", {
	result <- retractr::check_retraction(doi = "10.7860/JCDR/2fdgfdgdf013/4833.2724")
	testthat::expect_false(result$retracted)
})
