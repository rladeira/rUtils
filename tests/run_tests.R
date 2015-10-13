
library(testthat)

source(file.path("R", "sourceAllFiles.R"))

sourceAllFiles(path = "R")

test_dir("tests")
