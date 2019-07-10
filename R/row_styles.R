#' @include htable.R
NULL


htable$set("public", "row_add_style", function(row = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.character(style), length(style) == 1)
  
  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows
  
  self$styles[row, ] <- add_style(self$styles[row, ], style)
  invisible(self)
})

htable$set("public", "row_replace_style", function(row = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.character(style), length(style) == 1)
  
  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows
  
  self$styles[row, ] <- style
  invisible(self)
})

htable$set("public", "row_clear_style", function(row = NULL, include_header = FALSE) {
  if (is.null(row)) return(invisible(self))
  stopifnot(is.numeric(row))
  
  self$row_replace_style(row = row, style = "", include_header = include_header)
  invisible(self)
})

htable$set("public", "row_bold", function(row = NULL, include_header = FALSE) {
  if (is.null(row)) return(invisible(self))
  
  self$row_add_style(row = row, style = "font-weight:bold;", include_header = include_header)
  invisible(self)
})

htable$set("public", "row_italic", function(row = NULL, include_header = FALSE) {
  if (is.null(row)) return(invisible(self))
  
  self$row_add_style(row = row, style = "font-style:italic;", include_header = include_header)
  invisible(self)
})

htable$set("public", "row_bg_color", function(row = NULL, color = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  
  self$row_add_style(row = row, style = sprintf("background-color:%s;", color), include_header = include_header)
  invisible(self)
})

htable$set("public", "row_color", function(row = NULL, color = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  
  self$row_add_style(row = row, style = sprintf("color:%s;", color), include_header = include_header)
  invisible(self)
})

htable$set("public", "row_alt_bg_color", function(color1 = NULL, color2 = NULL, include_header = FALSE) {
  if (is.null(color1) | is.null(color2)) return(invisible(self))
  stopifnot(is.character(color1), length(color1) == 1)
  stopifnot(is.character(color2), length(color2) == 1)
  
  if (include_header) nr <- nrow(self$styles) # use the longer self$styles
  else nr <- nrow(self$data)
  
  odds <- which((1:nr) %% 2 == 1)
  evens <- which((1:nr) %% 2 == 0)
  self$row_bg_color(odds, color = color1, include_header = include_header)
  self$row_bg_color(evens, color = color2, include_header = include_header)
  
  invisible(self)
})

htable$set("public", "row_alt_color", function(color1 = NULL, color2 = NULL, include_header = FALSE) {
  if (is.null(color1) | is.null(color2)) return(invisible(self))
  stopifnot(is.character(color1), length(color1) == 1)
  stopifnot(is.character(color2), length(color2) == 1)
  
  if (include_header) nr <- nrow(self$styles) # use the longer self$styles
  else nr <- nrow(self$data)
  
  odds <- which((1:nr) %% 2 == 1)
  evens <- which((1:nr) %% 2 == 0)
  self$row_color(odds, color = color1, include_header = include_header)
  self$row_color(evens, color = color2, include_header = include_header)
  
  invisible(self)
})


# header styles are similar to row styles
htable$set("public", "header_add_style", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$row_add_style(row = 1, style = style, include_header = TRUE)
  invisible(self)
})

htable$set("public", "header_replace_style", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$row_replace_style(row = 1, style = style, include_header = TRUE)
  invisible(self)
})

htable$set("public", "header_clear_style", function() {
  self$row_clear_style(row = 1, include_header = TRUE)
  invisible(self)
})

htable$set("public", "header_bold", function() {
  self$header_add_style(style = "font-weight:bold;")
  invisible(self)
})

htable$set("public", "header_italic", function() {
  self$header_add_style(style = "font-style:italic;")
  invisible(self)
})

htable$set("public", "header_bg_color", function(color = NULL) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  
  self$header_add_style(style = sprintf("background-color:%s;", color))
  invisible(self)
})

htable$set("public", "header_color", function(color = NULL) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  
  self$header_add_style(style = sprintf("color:%s;", color))
  invisible(self)
})
