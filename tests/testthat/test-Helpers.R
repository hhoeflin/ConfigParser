context("Helper Functions")

test_that("key-interpolation", {
    value <- "%(bar)s is %(baz)s"
    option1 <- ConfigParser:::interpolation_option(value)
    expect_equal(option1, "baz")
    value <- ConfigParser:::do_replacement(value, option1, "too short")
    option2 <- ConfigParser:::interpolation_option(value)
    expect_equal(option2, "bar")
    value <- ConfigParser:::do_replacement(value, option2, "Life")
    expect_equal(value, "Life is too short")
})


