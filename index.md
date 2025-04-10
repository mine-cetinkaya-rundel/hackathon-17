# Testing, testing…


``` r
source("prompt.R")
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.4          ✔ readr     2.1.5     
    ✔ forcats   1.0.0          ✔ stringr   1.5.1     
    ✔ ggplot2   3.5.1          ✔ tibble    3.2.1.9044
    ✔ lubridate 1.9.4          ✔ tidyr     1.3.1     
    ✔ purrr     1.0.4          
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

# Approach

- Create a folder with question, sample answers (based on real student
  work, but not replicas), rubric, and a detailed rubric.
- Add content for system prompt. **(Q: Not sure if this is the right way
  to go about it?)**
- Give feedback!

# Modeling

Load information from text files:

``` r
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
```

Evaluate a **bad** answer:

``` r
prompt(
  question = question, 
  rubric = rubric,
  answer = bad_answer
)
```

    **Feedback:**

    * Part (a) - Code correctly fits linear regression model: The code fits a 
    linear model with the correct variables, but needs to include a tidy() summary.

    * Part (a) - Regression summary displayed with tidy(): The tidy() summary is 
    missing from the code.

    * Part (b) - Estimated least squares regression line is correct: The equation 
    uses incorrect coefficient values and incorrect notation for both the predicted
    outcome and predictor variable.

    * Part (c) - Narrative provides correct interpretation of the intercept: The 
    interpretation is unclear and does not mention that this is an expected or 
    average value.

    * Part (c) - Narrative states intercept is meaningful with justification: The 
    response does not explicitly address whether the intercept is meaningful or 
    provide justification.

    * Part (d) - Narrative provides correct interpretation of the slope: The 
    interpretation is close but missing language about this being an expected or 
    average difference.

    * Code smell, style, and readability: The code needs spaces around operators 
    and after commas, and should have consistent indentation.

Evaluate a **good** answer:

``` r
prompt(
  question = question, 
  rubric = rubric,
  answer = good_answer
)
```

    **Feedback:**

    * Part (a) - Code correctly fits linear regression model: The code correctly 
    uses linear_reg() and fit() with appropriate variables.

    * Part (a) - Regression summary displayed with tidy(): The tidy() function is 
    missing from the code, which is needed to display the regression coefficients 
    in a clean format.

    * Part (b) - Estimated least squares regression line: The equation has 
    incorrect coefficient values and inappropriate notation for the predictor 
    variable.

    * Part (c) - Interpretation of intercept: The interpretation is convoluted and 
    fails to properly state the expected/average weight of babies born to 
    non-smoking mothers.

    * Part (c) - Intercept meaningfulness: There is no explicit statement about 
    whether the intercept is meaningful or justification for why.

    * Part (d) - Interpretation of slope: The interpretation omits "on average" or 
    "expected" and could be more precise with the numerical value.

    * Code style and readability: The code needs spaces around operators (=) and 
    commas, and better indentation following the pipe operator.

Now evaluare a **good** answer **again:**

``` r
prompt(
  question = question, 
  rubric = rubric,
  answer = good_answer
)
```

    **Feedback:**

    * Part (a) - Code correctly fits linear regression model: The model is fit 
    correctly using tidymodels functions.

    * Part (a) - Regression summary with tidy(): The tidy() function was not used 
    to display the model summary.

    * Part (b) - Estimated least squares regression line: The equation has 
    incorrect coefficients and uses incorrect notation for the predictor variable.

    * Part (c) - Interpretation of intercept: The interpretation is confusing and 
    does not clearly state what the intercept represents in terms of 
    expected/average baby weight.

    * Part (c) - Intercept meaningfulness: The response does not explicitly address
    whether the intercept is meaningful or provide proper justification.

    * Part (d) - Interpretation of slope: The interpretation is mostly correct but 
    should include language about "on average" or "expected" values.

    * Code style: The code needs spaces after commas and around the equals sign, 
    and should be properly indented after the pipe.

# Tidying
