#' Outranking
#'
#' This function calculates the extent to which a variable outranks
#' other variable and the extent to which it is being outranked by
#' other variable.
#'
#' @export
outranking <- function(pref_func_data){

  phi_pos <- pref_func_data %>%
    group_by_("P1") %>%
    summarise_at(c(-1,-2), mean) %>%
    dplyr::mutate_(id = ~ as.data.frame(data)[,1]) %>%
    dplyr::rename_(.dots = setNames("id",
                                    colnames(data)[1])) %>%
    dplyr::select_(colnames(data)[1], ~ 2:ncol(data)) %>%
    mutate_if(is.double, function(x) round(x, 2))

  phi_neg <- pref_func_data %>%
    group_by_("P2") %>%
    summarise_at(c(-1,-2), mean) %>%
    dplyr::mutate_(id = ~ as.data.frame(data)[,1]) %>%
    dplyr::rename_(.dots = setNames("id",
                                    colnames(data)[1])) %>%
    dplyr::select_(colnames(data)[1], ~ 2:ncol(data)) %>%
    mutate_if(is.double, function(x) round(x, 2))

  list(positive = phi_pos, negative = phi_neg)
}
