test_that("test c_or_1st()", {
  # both NULLs
  expect_equal(c_or_1st(NULL, NULL), NULL)
  
  # one is NULL
  expect_equal(c_or_1st(NULL, 1), 1)
  expect_equal(c_or_1st(1, NULL), 1)
  expect_equal(c_or_1st(NULL, "a"), "a")
  expect_equal(c_or_1st("a", NULL), "a")
  expect_equal(c_or_1st(NULL, TRUE), TRUE)
  expect_equal(c_or_1st(TRUE, NULL), TRUE)
  
  # logicals
  expect_equal(c_or_1st(TRUE, TRUE), TRUE)
  expect_equal(c_or_1st(TRUE, FALSE), TRUE)
  expect_equal(c_or_1st(FALSE, TRUE), FALSE)
  expect_equal(c_or_1st(FALSE, FALSE), FALSE)
  
  # numerics
  expect_equal(c_or_1st(1, 2), c(1, 2))
  expect_equal(c_or_1st(1:2, 1:3), 1:3)
  expect_equal(c_or_1st(c(1:2, 10), 11), c(1:2, 10:11))
  
  # character
  expect_equal(c_or_1st("a", "b"), "a")
})
