#' Create a new prisoner game object
#'
#' @param teams_n integer. The number of teams of prisoners
#' @param prisoners_n integer. The number of prisoners per team
#' @param open_max integer. The maximum number of boxes individual prisoners can open
#' @param method character. The method to use for simulation. Either "agent" or "environment"
#'
#' @export
#' @return list. A list with the structure of the game
#'
prisoners_create_game <- function(teams_n, prisoners_n, open_max, method = "environment") {
  params <- list(
    method = method,
    open_max = open_max,
    teams_n = teams_n,
    prisoners_n = prisoners_n
  )

  out <- structure(list(
    params = params,
    rooms = NULL,
    outcomes = NULL,
    summaries = NULL,
    meta = NULL
  ), class = c(method, "prisoner_game"))

  return(out)
}
