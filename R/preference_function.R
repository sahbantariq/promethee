#' Preference Function
#'
#' This function applies preference function to the pair wise
#' difference data.
#'s
#' @return An output data from preference function.
#'
#' @export
pref_func <- function(row_wise_difference,
                      preference_function = "simple", p = 1,
                      q = 0 , s = 0.5) {

  gaussian <- exp(1)^(-(d^2)/2*(s^2))

  switch(preference_function,
         "simple" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2), function(x) ifelse(x > 0, x, 0)),
         "usual" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2), function(x) ifelse(x <= 0, 0, 1)),
         "u-shape" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2), function(x) ifelse(x <= q, 0, 1)),
         "v-shape" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2), function(x) ifelse(
             x <= 0, 0, ifelse((x >= 0 & x <= p), d/p, 1))),
         "level" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2), function(x) ifelse(
             x <= q, 0, ifelse((x > q & x <= p), 1/2, 1))),
         "v-shape-indifference" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2), function(x) ifelse(
             x <= q, 0, ifelse((x > q & x <= p), (d-q)/(p-q), 1))),
         "gaussian" = dplyr::mutate_at(
           row_wise_difference, c(-1,-2),
           function(x) ifelse(x <= 0, 0, gaussian)))
}
