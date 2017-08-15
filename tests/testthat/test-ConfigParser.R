context("ConfigParser")

test_that("Reading options", {
    ## create a configparser with all environment variables
    Sys.setenv(USER="ConfigParser")
    config <- ConfigParser$new(Sys.getenv())
    config$read(system.file("test.INI", package="ConfigParser"))

    ## check all the various options
    expect_equal(config$get("user", NA, section="sys-info"), Sys.getenv("USER"))
    expect_equal(config$getboolean("a_bool", NA, section="section 1"), TRUE)
    expect_equal(config$getfloat("a_float", NA, section="section 1"), 3.1415)

    ## check that the fallback is returned if there is nothing else
    expect_equal(config$get("nothing", NA, section="default"), NA)
    expect_error(config$get("nothing", section="default"), "Option not found and no fallback given")
})

test_that("Round-trip", {
    config <- ConfigParser$new()
    config$set(option=c("a_bool", "a_float", "foo"), value=c("true", "3.1415", "%(bar)s is %(baz)s"), section="Section 1",
           error_on_new_section=FALSE)

    outfile <- tempfile()
    config$write(filepath=outfile)

    config2 <- ConfigParser$new()$read(filepath=outfile)

    expect_equal(config, config2)
    file.remove(outfile)
})

test_that("Other optionxform", {
    ## try out identity as optionxform
    config <- ConfigParser$new(optionxform=identity)
    config$read(system.file("test.INI", package="ConfigParser"))

    
    expect_equal(config$get("a_bool", NA, section="Section 1"), "true")
    expect_equal(config$get("a_bool", NA, section="section 1"), NA)
    
})
