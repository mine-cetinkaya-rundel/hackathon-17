source("prompt.R")

# modeling --------------------------------------------------------------------

question <- read_lines("questions/model-birth-simple-linear/model-births-simple-linear-Q.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

rubric <- read_lines("questions/model-birth-simple-linear/model-births-simple-linear-R.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

rubric_detailed <- read_lines("questions/model-birth-simple-linear/model-births-simple-linear-RD.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

bad_answer <- read_lines("questions/model-birth-simple-linear/model-births-simple-linear-sample-answer-bad.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

good_answer <- read_lines("questions/model-birth-simple-linear/model-births-simple-linear-sample-answer-bad.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

# bad
prompt(
  question = question, 
  rubric = rubric,
  answer = bad_answer
)

# good
prompt(
  question = question, 
  rubric = rubric,
  answer = good_answer
)

# tidying ---------------------------------------------------------------------

question <- read_lines("questions/tidy-country-inflation-pivot-longer/tidy-country-inflation-pivot-longer-Q.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

rubric <- read_lines("questions/tidy-country-inflation-pivot-longer/tidy-country-inflation-pivot-longer-R.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

rubric_detailed <- read_lines("questions/tidy-country-inflation-pivot-longer/tidy-country-inflation-pivot-longer-RD.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

bad_answer <- read_lines("questions/tidy-country-inflation-pivot-longer/tidy-country-inflation-pivot-longer-sample-answer-bad.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

good_answer <- read_lines("questions/tidy-country-inflation-pivot-longer/tidy-country-inflation-pivot-longer-sample-answer-good.qmd") |>
  glue_collapse() |>
  str_remove("---.*?---")

# bad
prompt(
  question = question, 
  rubric = rubric,
  answer = bad_answer
)

# good
prompt(
  question = question, 
  rubric = rubric,
  answer = good_answer
)
