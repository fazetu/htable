#' @include htable.R
NULL


htable$set("public", "cell_add_style", function(row = NULL, col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)
  
  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows
  
  self$styles[row, col] <- add_style(self$styles[row, col], style)
  invisible(self)
})

htable$set("public", "cell_replace_style", function(row = NULL, col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)
  
  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows
  
  self$styles[row, col] <- style
  invisible(self)
})

htable$set("public", "cell_clear_style", function(row = NULL, col = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.numeric(col))
  
  self$cell_replace_style(row = row, col = col, style = "", include_header = include_header)
  invisible(self)
})
