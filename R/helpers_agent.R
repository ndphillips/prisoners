#' Title
#'
#' @param room tbl. A tibble created by prisoners_create_room()
#' @param prisoner_i integer. The prisoner number
#' @param pick_max integer. The maximum number of boxes to search
#'
#' @return  list
#'
#' @export
#'
#' @examples
simulate_agent_prisoner <- function(room = NULL,
                                    prisoner_i = 1,
                                    pick_max = NULL) {
  pick_i <- 1
  ticket_v <- room |>
    dplyr::filter(box == prisoner_i) |>
    dplyr::pull(ticket)

  is_success_i <- FALSE

  if (ticket_v == prisoner_i) {
    is_success_i <- TRUE
  }

  while (length(ticket_v) <= nrow(room) && is_success_i == FALSE) {
    pick_i <- pick_i + 1

    ticket_i <- room |>
      dplyr::filter(box == ticket_v[pick_i - 1]) |>
      dplyr::pull(ticket)

    ticket_v <- c(ticket_v, ticket_i)

    if (ticket_i == prisoner_i) {
      is_success_i <- TRUE
    }
  }

  is_success_i <- length(ticket_v) <= pick_max

  out <- list(
    prisoner = prisoner_i,
    is_success = is_success_i,
    ticket_v = ticket_v,
    boxes_opened_n = length(ticket_v)
  )

  return(out)
}