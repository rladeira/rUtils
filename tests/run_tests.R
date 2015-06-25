
library(testthat)

source(file.path("R", "source.all.files.R"))

source.all.files(path = "R")

test_dir("tests")
