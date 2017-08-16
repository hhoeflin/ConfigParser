This is the initial submission of the package

---

## Test environments
* Ubuntu Xenial 16.04 running on Windows Subsystem for Linux R-3.4.1
* travis-ci
* appveyor

## R CMD check results

There was 1 NOTE and 1 WARNING. The WARNING seems to be an issue related to a pandoc/tls bug regarding fetching a badge for codecoverage. 
It does not occur on either travis or appveyor and github shows all badges in the README.md correctly. Please see the output below.

R CMD check results
0 errors | 1 warning  | 1 note 
checking top-level files ... WARNING
Conversion of ‘README.md’ failed:
pandoc: Could not fetch https://img.shields.io/codecov/c/github/hhoeflin/ConfigParser/master.svg
TlsExceptionHostPort (HandshakeFailed Error_EOF) "img.shields.io" 443

checking CRAN incoming feasibility ... NOTE
Maintainer: ‘Holger Hoefling <hhoeflin@gmail.com>’

New submission

## Downstream dependencies

No downstream dependencies
