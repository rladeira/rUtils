
context("character.contains")

test_that("character.contains returns TRUE",{

  expect_that(character.contains("ab", "abc"), is_true())
  expect_that(character.contains("11", "11"), is_true())
  expect_that(character.contains("1", "221"), is_true())
  expect_that(character.contains("", "1"), is_true())
  expect_that(character.contains("", ""), is_true())
})


test_that("character.contains throws error for bad input",{

  expect_that(character.contains(1, 1),
              throws_error("sub.character must be of type character!"))
  expect_that(character.contains("", list()),
              throws_error("character must be of type character!"))
  expect_that(character.contains(NA, NA),
              throws_error("sub.character must be of type character!"))
  expect_that(character.contains("", NA),
              throws_error("character must be of type character!"))
  expect_that(character.contains(NaN, NA),
              throws_error("sub.character must be of type character!"))
  expect_that(character.contains(c("", ""), ""),
              throws_error("sub.character and character must contain just one character element."))
})
