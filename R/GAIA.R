#' GAIA Plane
#'
#' Plot criteria and alternative
#'
#' @export
gaia_plot <- function(data, beneficial_col,
                      preference_function = "simple",
                      weights, p = 1, q = 0, s = 0.5) {
  netflow_profile <- alternative_profile(data, beneficial_col,
                                         preference_function,
                                         weights, p, q, s)

  pca1 <- stats::prcomp(netflow_profile$single_netflow_criteria)
  pca2 <- stats::prcomp(netflow_profile$transpose_netflow_criteria)

  scores1 = as.data.frame(pca1$rotation)
  scores2 = as.data.frame(pca2$rotation)

  (plot2 <- ggplot2::ggplot() +
      ggplot2::geom_point(data = scores1,  ggplot2::aes(PC1, PC2)) +
      ggplot2::geom_text(data = scores1, colour = "red",
                         alpha = 0.8, size = 4, ggplot2::aes(
                           PC1,PC2, label = rownames(scores1)),
                         hjust = 0) +
      ggplot2::geom_point(data = scores2, ggplot2::aes(PC1, PC2)) +
      ggplot2::geom_text(data = scores2, colour = "blue",
                         alpha = 0.8, size = 4, ggplot2::aes(
                           PC1,PC2, label = rownames(scores2)),
                         hjust = 0) +
      #ggplot2::geom_line(data = decision_stick) +
      ggplot2::geom_hline(yintercept = 0, colour = "gray65") +
      ggplot2::geom_vline(xintercept = 0, colour = "gray65") +
      ggplot2::ggtitle("GAIA PLANE")
  )
}
