#' Normalization
#'
#' This function normalizes the input data. It uses min max normalization.
#'
#' @param data The data that needs to be normalized
#' @param beneficial_vars The variables whose highest value is considered
#' to be maximum and lowest value is minimum.
#'
#' @return A dataframe with normalized values
#'
#'
#' @export
normalize <- function(data, beneficial_col = NULL) {

  if (is.null(beneficial_col)) {
    beneficial_col <- colnames(data[,-1])
  } else {
    beneficial_col <- beneficial_col
  }

  message("The beneficial criteria are ",
          list(beneficial_col))

  non_beneficial_col <- dplyr::setdiff(
    colnames(data[,-1]), beneficial_col)

  data %>%
    dplyr::mutate_if(colnames(data) %in% beneficial_col,
                     function(x)
                       (x - min(x)) / (max(x) - min(x))) %>%
    dplyr::mutate_if(colnames(data) %in% non_beneficial_col,
                     function(x)
                       (x - max(x))/ (min(x) - max(x)))
}
