test_that("gt object is returned", {
  result <- pl_table()

  expect_s3_class(result, "gt_tbl")
  expect_type(result, "list")
})
