#' Outranking Aggregate
#'
#' @export
outranking_aggregate <- function(outranking_data, wt_matrix){
  phi_aggregate_plus <- rowSums(
    outranking_data$positive[,c(-1, -2)] * wt_matrix) %>%
    as.data.frame() %>%
    dplyr::rename(., Entering_Flow = .) %>%
    dplyr::mutate_(id = ~ as.data.frame(data)[,1]) %>%
    dplyr::select_("id", "Entering_Flow") %>%
    dplyr::rename_(.dots = setNames("id",
                                    colnames(data)[1]))

  phi_aggregate_minus <- rowSums(
    outranking_data$negative[,c(-1, -2)] * wt_matrix) %>%
    as.data.frame() %>%
    dplyr::rename(., Leaving_Flow = .) %>%
    dplyr::mutate_(id = ~ as.data.frame(data)[,1]) %>%
    dplyr::select_("id", "Leaving_Flow") %>%
    dplyr::rename_(.dots = setNames("id",
                                    colnames(data)[1]))

  dplyr::left_join(phi_aggregate_plus, phi_aggregate_minus,
                   by = colnames(data)[1]) %>%
    dplyr::mutate_(Net_Flow = ~ (
      Entering_Flow - Leaving_Flow)) %>%
    dplyr::mutate_(Rank = ~ rank(-.$Net_Flow,
                                 ties.method = "first"))
}
