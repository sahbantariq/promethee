#' Preference Function
#'
#' This function applies preference function to the pair wise
#' difference data.
#'s
#' @return An output data from preference function.
#'
#' @export
pref_func <- function(row_wise_difference,
                      preference_function = "simple") {

  if (preference_function == "simple") {
    row_wise_difference %>%
      dplyr::mutate_at(c(-1,-2),
                       function(x) ifelse(x > 0, x, 0))
  }
}

