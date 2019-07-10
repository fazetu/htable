#' @include htable.R
NULL


htable$set("public", "col_add_style", function(col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)

  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)

  self$styles[rs, col] <- add_style(self$styles[rs, col], style)
  invisible(self)
})

htable$set("public", "col_replace_style", function(col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)
  
  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)
  
  self$styles[rs, col] <- style
  invisible(self)
})

htable$set("public", "col_clear_style", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  self$col_replace_style(col = col, style = "", include_header = include_header)
  invisible(self)
})

htable$set("public", "col_width", function(col = NULL, width = NULL) {
  if (is.null(col) | is.null(width)) return(invisible(self))
  stopifnot(is.character(width))
  self$col_add_style(col = col, style = sprintf("width:%s;", width), include_header = TRUE)
  invisible(self)
})

htable$set("public", "col_bold", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  self$col_add_style(col = col, style = "font-weight:bold;", include_header = include_header)
  invisible(self)
})

htable$set("public", "col_italic", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  self$col_add_style(col = col, style = "font-style:italic;", include_header = include_header)
  invisible(self)
})

htable$set("public", "col_bg_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$col_add_style(col = col, style = sprintf("background-color:%s;", color), include_header = include_header)
  invisible(self)
})

htable$set("public", "col_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$col_add_style(col = col, style = sprintf("color:%s;", color), include_header = include_header)
  invisible(self)
})

htable$set("public", "col_pct_fmt", function(col = NULL) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  
  for (c in col) {
    x <- self$data[, c]
    self$contents[-1, c] <- span_replace_content(self$contents[-1, c], sprintf("%.2f%%", x * 100))
  }
  
  invisible(self)
})

htable$set("public", "col_comma_fmt", function(col = NULL) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  
  for (c in col) {
    x <- self$data[, c]
    self$contents[-1, c] <- span_replace_content(self$contents[-1, c], format(x, big.mark = ","))
  }
  
  invisible(self)
})

htable$set("public", "col_dollar_fmt", function(col = NULL) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  
  for (c in col) {
    x <- self$data[, c]
    self$contents[-1, c] <- span_replace_content(self$contents[-1, c], paste0("$", format(x, big.mark = ",")))
  }
  
  invisible(self)
})

htable$set("public", "col_color_scale", function(col = NULL, exclude_rows = NULL) {
  invisible(self)
})

htable$set("public", "col_data_bar", function(col = NULL, color = "lightgreen", exclude_rows = NULL, na.rm = TRUE) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(color), length(color) == 1)
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  stopifnot(is.numeric(exclude_rows) | is.null(exclude_rows))
  
  if (is.null(exclude_rows)) {
    data_exclude_rows <- -(1:nrow(self$data))
    contents_exclude_rows <- 1
  } else {
    data_exclude_rows <- exclude_rows
    contents_exclude_rows <- c(1, exclude_rows + 1)
  }

  for (c in col) {
    x <- self$data[-data_exclude_rows, c]
    width <- (x / max(abs(x), na.rm = na.rm)) * 100
    bar_styles <- sprintf("display:inline-block;direction:ltr;border-radius:4px;padding-right:2px;background-color:%s;width:%.2f%%;",
                          color, width)
    self$contents[-contents_exclude_rows, c] <- span_edit_style(self$contents[-contents_exclude_rows, c], bar_styles)
  }

  invisible(self)
})
