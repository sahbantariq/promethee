#' Promethee
#'
#' @export
flow <- function(data, beneficial_col,
                 preference_function = "simple",
                 weights) {
  normalized_data <- data %>%
    normalize(beneficial_col) %>%
    mutate_if(is.double, function(x) round(x, 2))

  prefer_func_data <-  normalized_data %>%
    row_wise_difference() %>%
    pref_func(preference_function = preference_function) %>%
    mutate_if(is.double, function(x) round(x, 2))

  outranking <- prefer_func_data %>%
    outranking()

  outranking_aggregate <- outranking %>%
    outranking_aggregate(wt_matrix = weights) %>%
    mutate_if(is.double, function(x) round(x, 2))

  DT::datatable(
    outranking_aggregate, extensions = c('Buttons', 'ColReorder', 'AutoFill'),
    options = list(
      colReorder = TRUE,
      AutoFill = TRUE,
      dom = 'Bftrip',
      buttons = list('copy', 'csv', 'excel', 'pdf', 'print'))
  )

  list(normalized_data = normalized_data,
       outranking_data = outranking,
       outranking_aggregate_data = outranking_aggregate)
}
