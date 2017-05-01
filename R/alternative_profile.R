#' Profile of Alternative
#'
#' It expresses how an alternative a is outranking or outranked by all the
#' other alternatives on each criterion.
#'
#' @export
alternative_profile <- function(data, beneficial_col,
                                preference_function = "simple",
                                weights, p = 1, q = 0, s = 0.5) {
  outranking <- flow(data, beneficial_col,
                     preference_function, weights, p, q, s)

  criteria_wise_netflow <- outranking$outranking_data$positive[, -1] -
    outranking$outranking_data$negative[, -1]

  single_netflow_criteria <- criteria_wise_netflow %>%
    dplyr::mutate_(P1 = ~ as.data.frame(data)[,1]) %>%
    dplyr::rename_(.dots = setNames("P1",
                                    colnames(data)[1])) %>%
    tibble::column_to_rownames(colnames(data)[1])

  profile <- criteria_wise_netflow %>%
    dplyr::mutate_(P1 = ~ as.data.frame(data)[,1]) %>%
    tidyr::gather(Criteria, Values, -P1) %>%
    tidyr::spread(P1, Values) %>%
    tibble::remove_rownames() %>%
    tibble::column_to_rownames("Criteria")

  list(single_netflow_criteria = single_netflow_criteria,
       transpose_netflow_criteria = profile)
}

#' Profile of Alternative
#'
#' It expresses how an alternative a is outranking or outranked by all the
#' other alternatives on each criterion.
#'
#' @export
alternative_profile_plot <- function(data, beneficial_col,
                                preference_function = "simple",
                                weights, p = 1, q = 0, s = 0.5) {

  alt_profile_data <- alternative_profile(data, beneficial_col,
                                  preference_function,
                                  weights, p = 1, q = 0, s = 0.5)

  df <- alt_profile_data$transpose_netflow_criteria %>%
    dplyr::select(-1)

  plot_stuff <- function(x, val) {

    x %>%
      ggplot2::ggplot(ggplot2::aes_(x = base::as.name(val),
                                    y = base::as.name(val))) +
      ggplot2::geom_bar(stat = "identity")
  }

  plots <- lapply(names(df), plot_stuff, x = df)

  gridExtra::grid.arrange(grobs = plots, ncol = 3, nrow = 4)

}


