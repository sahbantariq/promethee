#' Outranking Aggregate
#'
#' @export
outranking_aggregate <- function(outranking_data, wt_matrix){
  outranking_positive <- outranking_data$positive[-1] %>%  as.matrix()
  outranking_negative <- outranking_data$negative[-1] %>%  as.matrix()
  wt_matrix <- wt_matrix %>% as.matrix()

  phi_aggregate_plus <- outranking_positive %*% wt_matrix %>%
    as.data.frame() %>%
    dplyr::rename(Entering_Flow = V1) %>%
    dplyr::mutate_(id = ~ as.data.frame(data)[,1]) %>%
    dplyr::select_("id", "Entering_Flow") %>%
    dplyr::rename_(.dots = setNames("id",
                                    colnames(data)[1]))

  phi_aggregate_minus <- outranking_negative %*% wt_matrix %>%
    as.data.frame() %>%
    dplyr::rename(Leaving_Flow = V1) %>%
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
