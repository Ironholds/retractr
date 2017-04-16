# Check Paper Retractions in R

__Author:__ Oliver Keyes, Jay Jacobs<br/>
__License:__ [MIT](http://opensource.org/licenses/MIT)<br/>
__Status:__ Stable

[![Travis-CI Build Status](https://travis-ci.org/Ironholds/retractr.svg?branch=master)](https://travis-ci.org/Ironholds/retractr) ![downloads](http://cranlogs.r-pkg.org/badges/grand-total/retractr)

`retractr` provides a client for the [Open Retractions](http://openretractions.com/) dataset of paper retractions.

## Example

This is a basic example which shows you how to solve a common problem:

```R
library(retractr)

retraction_result <- check_retraction(doi = "10.7860/JCDR/2013/4833.2724")
```

## Installation

The package is soon to be on CRAN, but in the meantime:

```R
devtools::install_github("ironholds/retractr")
```
