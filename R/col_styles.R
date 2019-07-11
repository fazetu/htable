#' @include htable.R
NULL


#' Add a style to a column
#' 
#' Add a style to each <td> and, optionally, <th> tag in a column. Changes the
#' \code{styles} field.
#' 
#' @name HTable_col_add_style
#' @param col Numeric vector of which columns to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_add_style", function(col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)

  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)

  self$styles[rs, col] <- add_style(self$styles[rs, col], style)
  invisible(self)
})

#' Replace the style in a column
#' 
#' Replace the style of each <td> and, optionally, <th> tag in a column. Changes
#' the \code{styles} field.
#' 
#' @name HTable_col_replace_style
#' @param col Numeric vector of which columns to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_replace_style", function(col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)
  
  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)
  
  self$styles[rs, col] <- style
  invisible(self)
})

#' Clear the style in a column
#' 
#' Clear the style of each <td> and, optionally, <th> tag in a column. Changes
#' the \code{styles} field.
#' 
#' @name HTable_col_clear_style
#' @param col Numeric vector of which columns to target.
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_clear_style", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  self$col_replace_style(col = col, style = "", include_header = include_header)
  invisible(self)
})

#' Add a width style to a column
#' 
#' Add a width style to each <td> and <th> tag in a column. Changes the
#' \code{styles} field.
#' 
#' @name HTable_col_width
#' @param col Numeric vector of which columns to target.
#' @param width Character vector (length 1) of the width to use. Usually of the
#'   format "Npx" or "N\%".
HTable$set("public", "col_width", function(col = NULL, width = NULL) {
  if (is.null(col) | is.null(width)) return(invisible(self))
  stopifnot(is.character(width), length(width) == 1)
  self$col_add_style(col = col, style = sprintf("width:%s;", width), include_header = TRUE)
  invisible(self)
})

#' Add a bold style to a column
#' 
#' Add a bold style to each <td> and, optionally, <th> tag in a column. Changes
#' the \code{styles} field.
#' 
#' @name HTable_col_bold
#' @param col Numeric vector of which columns to target.
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_bold", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  self$col_add_style(col = col, style = "font-weight:bold;", include_header = include_header)
  invisible(self)
})

#' Add an italic style to a column
#' 
#' Add an italic style to each <td> and, optionally, <th> tag in a column.
#' Changes the \code{styles} field.
#' 
#' @name HTable_col_italic
#' @param col Numeric vector of which columns to target.
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_italic", function(col = NULL, include_header = FALSE) {
  if (is.null(col)) return(invisible(self))
  self$col_add_style(col = col, style = "font-style:italic;", include_header = include_header)
  invisible(self)
})

#' Add a background color style to a column
#' 
#' Add a background color style to each <td> and, optionally, <th> tag in a
#' column. Changes the \code{styles} field.
#' 
#' @name HTable_col_bg_color
#' @param col Numeric vector of which columns to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_bg_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$col_add_style(col = col, style = sprintf("background-color:%s;", color), include_header = include_header)
  invisible(self)
})

#' Add a text color style to a column
#' 
#' Add a text color style to each <td> and, optionally, <th> tag in a column.
#' Changes the \code{styles} field.
#' 
#' @name HTable_col_color
#' @param col Numeric vector of which columns to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(col) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$col_add_style(col = col, style = sprintf("color:%s;", color), include_header = include_header)
  invisible(self)
})

#' Edit a column to have a percent format
#' 
#' Change numeric column(s) to have a percent formatting. Changes the
#' \code{contents} field.
#' 
#' @name HTable_col_pct_fmt
#' @param col Numeric vector of which columns to target.
HTable$set("public", "col_pct_fmt", function(col = NULL) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  
  for (c in col) {
    x <- self$data[, c]
    self$contents[-1, c] <- tag_replace_content(self$contents[-1, c], sprintf("%.2f%%", x * 100))
  }
  
  invisible(self)
})

#' Edit a column to have a comma format
#' 
#' Change numeric column(s) to have a comma formatting. Changes the
#' \code{contents} field.
#' 
#' @name HTable_col_comma_fmt
#' @param col Numeric vector of which columns to target.
HTable$set("public", "col_comma_fmt", function(col = NULL) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  
  for (c in col) {
    x <- self$data[, c]
    self$contents[-1, c] <- tag_replace_content(self$contents[-1, c], format(x, big.mark = ","))
  }
  
  invisible(self)
})

#' Edit a column to have a dollar format
#' 
#' Change numeric column(s) to have a dollar formatting. Changes the
#' \code{contents} field.
#' 
#' @name HTable_col_dollar_fmt
#' @param col Numeric vector of which columns to target.
HTable$set("public", "col_dollar_fmt", function(col = NULL) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  
  for (c in col) {
    x <- self$data[, c]
    # literal $ sign was messing up rendering in some cases
    self$contents[-1, c] <- tag_replace_content(self$contents[-1, c], paste0("&dollar;", format(x, big.mark = ",")))
  }
  
  invisible(self)
})

#' Apply a color scale gradient to columns
#'  
#' Change numeric column(s) to have a background color gradient based on the
#' range of values in the column.
#' 
#' @name HTable_col_color_scale
#' @param col Numeric vector of which columns to target.
#' @param exclude_rows Numeric vector of which rows to exclude from calculation
#'   and coloring.
HTable$set("public", "col_color_scale", function(col = NULL, color = c("#63BE7B", "#FFEB84", "#F8696B"), exclude_rows = NULL, na.rm = TRUE) {
  #cat("TODO: col_color_scale not implemented yet\n")
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(color))
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  stopifnot(is.numeric(exclude_rows) | is.null(exclude_rows))
  
  pal <- colorRamp(color)
  
  if (is.null(exclude_rows)) {
    data_exclude_rows <- -(1:nrow(self$data))
    contents_exclude_rows <- 1
  } else {
    data_exclude_rows <- exclude_rows
    contents_exclude_rows <- c(1, exclude_rows + 1)
  }
  
  for (c in col) {
    x <- self$data[-data_exclude_rows, c]
    rx <- range(x, na.rm = TRUE) # range x
    sx <- (x - rx[1]) / diff(rx) # scaled x
    # undo any data bars styling if this happens after
    color_scale_colors <- rep("inherit", length(sx))
    color_scale_colors[!is.na(sx)] <- rgb(pal(sx[!is.na(sx)]), max = 255)
    color_scale_styles <- sprintf("border-radius:0;padding-right:0;background-color:%s;width:100%%;", color_scale_colors)
    self$contents[-contents_exclude_rows, c] <- tag_edit_style(self$contents[-contents_exclude_rows, c], color_scale_styles)
  }
  
  invisible(self)
})

#' Apply a data bar element to columns
#' 
#' Change numeric column(s) to have a colored data bar element in each cell. The
#' length of the bar is based on the range of values in the column. Changes the
#' \code{contents} field.
#' 
#' @name HTable_col_data_bar
#' @param col Numeric vector of which columns to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z). Used to color the data bars.
#' @param exclude_rows Numeric vector of which rows to exclude from calculation
#'   and styling.
#' @param na.rm Boolean if \code{NA}'s should be removed when scaling the data
#'   bars.
HTable$set("public", "col_data_bar", function(col = NULL, color = "lightgreen", exclude_rows = NULL, na.rm = TRUE) {
  if (is.null(col)) return(invisible(self))
  stopifnot(is.numeric(col))
  stopifnot(is.character(color), length(color) == 1)
  stopifnot(all(sapply(self$data[, col], is.numeric)))
  stopifnot(is.numeric(exclude_rows) | is.null(exclude_rows))
  
  color <- rep(color, nrow(self$data))
  
  if (is.null(exclude_rows)) {
    data_exclude_rows <- -(1:nrow(self$data))
    contents_exclude_rows <- 1
  } else {
    data_exclude_rows <- exclude_rows
    contents_exclude_rows <- c(1, exclude_rows + 1)
  }

  for (c in col) {
    x <- self$data[-data_exclude_rows, c]
    color[is.na(x)] <- "inherit"
    width <- (x / max(abs(x), na.rm = na.rm)) * 100
    width[is.na(x)] <- 0
    # white-space:nowrap; prevents a narrow width from forcing the contents to wrap to a new line
    bar_styles <- sprintf("white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:%s;width:%.2f%%;",
                          color, width)
    self$contents[-contents_exclude_rows, c] <- tag_edit_style(self$contents[-contents_exclude_rows, c], bar_styles)
  }

  invisible(self)
})
