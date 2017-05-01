#' Pairwise differences
#'
#' This function calculates the differences for
#' each pair of alternatives using permutation.
#'
#' @param data The data that needs to be normalized
#' @param beneficial_vars The variables whose highest value is considered
#' to be maximum and lowest value is minimum.
#'
#' @return A dataframe with differences between all pairs of alternatives
#' across all criteria.
#'
#' @export
row_wise_difference <- function(normalized_data) {
  # Remove alternative column
  normalized_data <- normalized_data %>%
    select(-1)

  # Finds all permutations of rows and stores in dataframe
  perm <- gtools::permutations(nrow(normalized_data),
                               2,
                               as.numeric(
                                 rownames(
                                   normalized_data))) %>%
    as.data.frame() %>%
    dplyr::rename(P1 = V1, P2 = V2)

  perm_alt <- gtools::permutations(nrow(normalized_data),
                               2,
                               as.data.frame(data)[,1]) %>%
    as.data.frame()


  # Take differences
  out <- normalized_data[perm[,1], ] - normalized_data[perm[,2],]

  bind_cols(perm, out) %>%
    dplyr::mutate(P1 = perm_alt$V1,
                  P2 = perm_alt$V2)
}
