# ConfigParser

[![Build Status](https://travis-ci.org/hhoeflin/ConfigParser.png)](https://travis-ci.org/hhoeflin/ConfigParser)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/hhoeflin/ConfigParser?branch=master&svg=true)](https://ci.appveyor.com/project/hhoeflin/ConfigParser)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/ConfigParser)](https://cran.r-project.org/package=ConfigParser)
[![Coverage Status](https://img.shields.io/codecov/c/github/hhoeflin/ConfigParser/master.svg)](https://codecov.io/github/hhoeflin/ConfigParser?branch=master)

# Getting Started

We can generate a new ConfigParser object and pre-seed a few variable values. Then we set several options in a new section 'Section 1'.

```R
config <- ConfigParser$new(init=c("bar"="Life", "baz"="too short"))
config$set(option=c("a_bool", "a_float", "foo"), value=c("true", "3.1415", "%(bar)s is %(baz)s"),
           section="Section 1", error_on_new_section=FALSE)
```

Of these we can then read out specific values in the form of a string or also directly ask for a float or a boolean.
```R
config$get("foo", NA, "Section 1")
config$getboolean("a_bool", NA, "Section 1")
config$getfloat("a_float", NA, "Section 1")
```

It is also easy to pre-seed a config file with e.g. all environment variables, 
this time setting the **optionxform**  to **identity** to prevent the default lower-casing of all options and then read an INI file from disk.
```R
config <- ConfigParser$new(Sys.getenv(), optionxform=identity)
config$read(system.file("test.INI", package="ConfigParser"))
```

The manual shows a few other functions, but these basics here should get everyone started.
