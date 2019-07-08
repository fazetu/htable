#' @include htable.R
NULL


htable$set("public", "add_col_style", function(col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)

  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)

  self$styles[rs, col] <- paste0(self$styles[rs, col], style, collapse = "")
  invisible(self)
})

htable$set("public", "clear_col_style", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))

  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)

  self$styles[rs, col] <- ""
  invisible(self)
})

htable$set("public", "col_bold", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  self$add_col_style(col = col, style = "font-weight:bold;", include_header = include_header)
  invisible(self)
})

htable$set("public", "col_italic", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  self$add_col_style(col = col, style = "font-style:italic;", include_header = include_header)
  invisible(self)
})

htable$set("public", "col_bg_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$add_col_style(col = col, style = sprintf("background-color:%s;", color), include_header = include_header)
  invisible(self)
})

htable$set("public", "col_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$add_col_style(col = col, style = sprintf("color:%s;", color), include_header = include_header)
  invisible(self)
})
