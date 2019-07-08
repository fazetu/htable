#' @include htable.R
NULL


htable$set("public", "add_row_style", function(row, style) {
  stopifnot(is.numeric(row))
  stopifnot(is.character(style), length(style) == 1)
  self$styles[row, ] <- paste0(self$styles[row, ], style, collapse = "")
  invisible(self)
})

htable$set("public", "clear_row_style", function(row) {
  stopifnot(is.numeric(row))
  self$styles[row, ] <- ""
  invisible(self)
})

htable$set("public", "row_bold", function(row = NULL) {
  if (is.null(row)) return(invisible(self))
  self$add_row_style(row = row, style = "font-weight:bold;")
  invisible(self)
})

htable$set("public", "row_italic", function(row = NULL) {
  if (is.null(row)) return(invisible(self))
  self$add_row_style(row = row, style = "font-style:italic;")
  invisible(self)
})

htable$set("public", "row_bg_color", function(row = NULL, color = NULL) {
  if (is.null(row) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$add_row_style(row = row, style = sprintf("background-color:%s;", color))
  invisible(self)
})

htable$set("public", "row_color", function(row = NULL, color = NULL) {
  if (is.null(row) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$add_row_style(row = row, style = sprintf("color:%s;", color))
  invisible(self)
})
