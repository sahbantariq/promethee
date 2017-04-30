#' Promethee I
#'
#' This function applies Promethee I
#'
#' @export
promethee_one <- function(data, beneficial_col, preference_function, weights) {

  alternative <- colnames(data)[1]

  flow <- promethee::flow(data,
                          beneficial_col,
                          "simple", wt)$outranking_aggregate_data %>%
    select_("-Net_Flow", "-Rank")

  comb <- gtools::combinations(nrow(flow), 2, flow[,1]) %>%
    as.data.frame(stringsAsFactors = FALSE) %>%
    rename_(.dots = setNames("V1", alternative))

  dplyr::left_join(comb, flow, by = alternative) %>%
    dplyr::rename_("a" = alternative) %>%
    dplyr::rename_("phi_a_plus" = "Entering_Flow") %>%
    dplyr::rename_("phi_a_minus" = "Leaving_Flow") %>%
    dplyr::rename_(.dots = setNames("V2", alternative)) %>%
    dplyr::left_join(flow, by = alternative) %>%
    dplyr::rename_("phi_b_plus" = "Entering_Flow") %>%
    dplyr::rename_("phi_b_minus" = "Leaving_Flow") %>%
    dplyr::rename_("alternative_a" = "a") %>%
    dplyr::rename_(.dots = setNames(alternative, "alternative_b")) %>%

    dplyr::mutate_(positive_condition = ~ dplyr::if_else(
      phi_a_plus > phi_b_plus, alternative_a, dplyr::if_else(
        phi_a_plus == phi_b_plus, "Equal", alternative_b))) %>%
    dplyr::mutate_(negative_condition = ~ dplyr::if_else(
      phi_a_minus < phi_b_minus, alternative_a, dplyr::if_else(
        phi_a_plus == phi_b_plus, "Equal", alternative_b))) %>%

    dplyr::mutate_(
      partial_ranking = ~
        dplyr::if_else(
          (positive_condition != "Equal" & negative_condition != "Equal" &
             positive_condition == negative_condition), paste(
               positive_condition, "Preferred"),
          dplyr::if_else((
            positive_condition != "Equal" & negative_condition != "Equal" &
              positive_condition != negative_condition), "Incomparable",
            dplyr::if_else((
              positive_condition == "Equal" & negative_condition == "Equal"),
              "Indifferent",
              dplyr::if_else(
                (positive_condition != "Equal" & negative_condition == "Equal"),
                paste(positive_condition, "Preferred"),
                paste(negative_condition, "Preferred"))))))
}
