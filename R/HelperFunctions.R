################################
##
## Custom error handling taken
## from Hadley's website
##
################################
condition <- function(subclass, message, call = sys.call(-1), ...) {
  structure(
    class = c(subclass, "condition"),
    list(message = message, call = call),
    ...
  )
}
is.condition <- function(x) inherits(x, "condition")

custom_stop <- function(subclass, message, call = sys.call(-1), 
                        ...) {
  c <- condition(c(subclass, "error"), message, call = call, ...)
  stop(c)
}

##############################
##
## Helper Function for the
## ConfigParser
##
##############################

##' Search for option's for interpolation
##'
##' Searches the string for occurences of %(...)s that needs interpolation
##' and return the unchanged value of ... as the option;
##'
##' This can then later be used with \code{do_replacement} and a value
##' to perform the actual replacement.
##' @title Search for option's for interpolation
##' @param value The value to search for possibly required interpolation
##' @return A string representing the option of NULL
##' @author Holger Hoefling
##' @keywords internal
interpolation_option <- function(value) {
    optionREGEXP <- "^.*%\\(([^\\)]+)\\)s.*$"
    option <- character(0)
    if(grepl(optionREGEXP, value, perl=TRUE)) {
        option <- gsub(optionREGEXP, "\\1", value)
    }
    return(option)
}

##' @rdname interpolation_option
do_replacement <- function(input, option, replacement) {
    replace_str <- paste0("%(", option, ")s")
    return(gsub(pattern=replace_str, replacement=replacement, x=input, fixed=TRUE))
}

