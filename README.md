# ConfigParser

[![Build Status](https://travis-ci.org/hhoeflin/ConfigParser.png)](https://travis-ci.org/hhoeflin/ConfigParser)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/hhoeflin/ConfigParser?branch=master&svg=true)](https://ci.appveyor.com/project/hhoeflin/ConfigParser)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/ConfigParser)](https://cran.r-project.org/package=ConfigParser)
[![Coverage Status](https://img.shields.io/codecov/c/github/hhoeflin/ConfigParser/master.svg)](https://codecov.io/github/hhoeflin/ConfigParser?branch=master)

# Getting Started

We can generate a new ConfigParser object and pre-seed a few variable values. Then we set several options in a new section 'Section 1'.

```R
config <- ConfigParser$new(init=c("bar"="Life", "baz"="too short"))
config$set(option=c("a_bool", "a_float", "foo"), value=c("true", "3.1415", "%(bar)s is %(baz)s"), section="Section 1",
           error_on_new_section=FALSE)
```
