#' @include htable.R
NULL


# this should always return a column index
HTable$set("private", "col_name_index", function(col) {
  if (is.numeric(col) | is.null(col)) col
  else if (is.character(col)) which(colnames(self$data) %in% col)
  else NULL
})

#' @name HTable_col_add_style
#' @title Add a style to a column
#' @description Add a style to each <td> and, optionally, <th> tag in a column.
#'   Changes the \code{styles} field.
#' @usage obj$col_add_style(col = NULL, style = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_add_style", function(col = NULL, style = NULL, include_header = FALSE) {
  col <- private$col_name_index(col)
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)

  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)

  self$styles[rs, col] <- add_style(self$styles[rs, col], style)
  invisible(self)
})

#' @name HTable_col_replace_style
#' @title Replace the style in a column
#' @description Replace the style of each <td> and, optionally, <th> tag in a
#'   column. Changes the \code{styles} field.
#' @usage obj$col_replace_style(col = NULL, style = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_replace_style", function(col = NULL, style = NULL, include_header = FALSE) {
  col <- private$col_name_index(col)
  if (is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  if (include_header) rs <- 1:nrow(self$styles)
  else rs <- 2:nrow(self$styles)
  
  self$styles[rs, col] <- style
  invisible(self)
})

#' @name HTable_col_clear_style
#' @title Clear the style in a column
#' @description Clear the style of each <td> and, optionally, <th> tag in a
#'   column. Changes the \code{styles} field.
#' @usage obj$col_clear_style(col = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_clear_style", function(col = NULL, include_header = FALSE) {
  self$col_replace_style(col = col, style = "", include_header = include_header)
  invisible(self)
})

#' @name HTable_col_width
#' @title Add a width style to a column
#' @description Add a width style to each <td> and <th> tag in a column. Changes
#'   the \code{styles} field.
#' @usage obj$col_width(col = NULL, width = NULL)
#' @param col Numeric or character vector of which columns to target.
#' @param width Character vector (length 1) of the width to use. Usually of the
#'   format "Npx" or "N\%".
HTable$set("public", "col_width", function(col = NULL, width = NULL) {
  if (is.null(width)) return(invisible(self))
  stopifnot(is.character(width), length(width) == 1)
  self$col_add_style(col = col, style = sprintf("width:%s;", width), include_header = TRUE)
  invisible(self)
})

#' @name HTable_col_bold
#' @title Add a bold style to a column
#' @description Add a bold style to each <td> and, optionally, <th> tag in a
#'   column. Changes the \code{styles} field.
#' @usage obj$col_bold(col = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_bold", function(col = NULL, include_header = FALSE) {
  self$col_add_style(col = col, style = "font-weight:bold;", include_header = include_header)
  invisible(self)
})

#' @name HTable_col_italic
#' @title Add an italic style to a column
#' @description Add an italic style to each <td> and, optionally, <th> tag in a
#'   column. Changes the \code{styles} field.
#' @usage obj$col_italic(col = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_italic", function(col = NULL, include_header = FALSE) {
  self$col_add_style(col = col, style = "font-style:italic;", include_header = include_header)
  invisible(self)
})

#' @name HTable_col_bg_color
#' @title Add a background color style to a column
#' @description Add a background color style to each <td> and, optionally, <th>
#'   tag in a column. Changes the \code{styles} field.
#' @usage obj$col_bg_color(col = NULL, color = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_bg_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$col_add_style(col = col, style = sprintf("background-color:%s;", color), include_header = include_header)
  invisible(self)
})

#' @name HTable_col_color
#' @title Add a text color style to a column
#' @description Add a text color style to each <td> and, optionally, <th> tag in
#'   a column. Changes the \code{styles} field.
#' @usage obj$col_color(col = NULL, color = NULL, include_header = FALSE)
#' @param col Numeric or character vector of which columns to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if the <th> tags in the columns should also be
#'   styled.
HTable$set("public", "col_color", function(col = NULL, color = NULL, include_header = FALSE) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  self$col_add_style(col = col, style = sprintf("color:%s;", color), include_header = include_header)
  invisible(self)
})

#' @name HTable_col_pct_fmt
#' @title Edit a column to have a percent format
#' @description Change numeric column(s) to have a percent formatting. Changes
#'   the \code{contents} field.
#' @usage obj$col_pct_fmt(col = NULL, mult100 = TRUE)
#' @param col Numeric or character vector of which columns to target.
#' @param mult100 Boolean if the values should be multiplied by 100 in order to
#'   turn them into percents.
HTable$set("public", "col_pct_fmt", function(col = NULL, mult100 = TRUE) {
  col <- private$col_name_index(col)
  if (is.null(col)) return(invisible(self))
  
  for (c in col) {
    x <- try_numeric(self$data[, c])
    if (!is.numeric(x)) { # try numeric didn't work
      warning("Column ", c, " is not numeric. No percent format applied.")
      next
    }
    if (mult100) x <- x * 100
    new_content <- self$contents[-1, c] # -1 to skip header
    new_content <- tag_replace_content(new_content, sprintf("%.2f%%", x))
    new_content[is.na(x)] <- tag_replace_content(new_content[is.na(x)], "NA")
    self$contents[-1, c] <- new_content # replace
  }
  
  invisible(self)
})

#' @name HTable_col_comma_fmt
#' @title Edit a column to have a comma format
#' @description Change numeric column(s) to have a comma formatting. Changes the
#'   \code{contents} field.
#' @usage obj$col_comma_fmt(col = NULL)
#' @param col Numeric or character vector of which columns to target.
HTable$set("public", "col_comma_fmt", function(col = NULL) {
  col <- private$col_name_index(col)
  if (is.null(col)) return(invisible(self))
  
  for (c in col) {
    x <- try_numeric(self$data[, c])
    if (!is.numeric(x)) { # try numeric didn't work
      warning("Column ", c, " is not numeric. No comma format applied.")
      next
    }
    new_content <- self$contents[-1, c] # -1 to skip header
    new_content <- tag_replace_content(new_content, trimws(format(x, big.mark = ",")))
    new_content[is.na(x)] <- tag_replace_content(new_content[is.na(x)], "NA")
    self$contents[-1, c] <- new_content
  }
  
  invisible(self)
})

#' @name HTable_col_dollar_fmt
#' @title Edit a column to have a dollar format
#' @description Change numeric column(s) to have a dollar formatting. Changes
#'   the \code{contents} field.
#' @usage obj$col_dollar_fmt(col = NULL)
#' @param col Numeric or character vector of which columns to target.
HTable$set("public", "col_dollar_fmt", function(col = NULL) {
  col <- private$col_name_index(col)
  if (is.null(col)) return(invisible(self))
  
  for (c in col) {
    x <- try_numeric(self$data[, c])
    if (!is.numeric(x)) { # try numeric didn't work
      warning("Column ", c, " is not numeric. No dollar format applied.")
      next
    }
    new_content <- self$contents[-1, c] # -1 to skip header
    new_content <- tag_replace_content(new_content, paste0("&dollar;", trimws(format(x, big.mark = ","))))
    new_content[is.na(x)] <- tag_replace_content(new_content[is.na(x)], "NA")
    # literal $ sign was messing up rendering in some cases
    self$contents[-1, c] <- new_content
  }
  
  invisible(self)
})

#' @name HTable_col_color_scale
#' @title Apply a color scale gradient to columns
#' @description Change numeric column(s) to have a background color gradient
#'   based on the range of values in the column.
#' @usage obj$col_color_scale(col = NULL, color = c("#63BE7B", "#FFEB84",
#'   "#F8696B"), exclude_rows = NULL, na.rm = TRUE)
#' @param col Numeric or character vector of which columns to target.
#' @param exclude_rows Numeric vector of which rows to exclude from calculation
#'   and coloring.
HTable$set("public", "col_color_scale", function(col = NULL, color = c("#63BE7B", "#FFEB84", "#F8696B"), exclude_rows = NULL, na.rm = TRUE) {
  col <- private$col_name_index(col)
  if (is.null(col)) return(invisible(self))
  stopifnot(is.character(color))
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
    x <- try_numeric(self$data[-data_exclude_rows, c])
    if (!is.numeric(x)) { # try numeric didn't work
      warning("Column ", c, " is not numeric. No color scale applied.")
      next
    }
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

#' @name HTable_col_data_bar
#' @title Apply a data bar element to columns
#' @description Change numeric column(s) to have a colored data bar element in
#'   each cell. The length of the bar is based on the range of values in the
#'   column. Changes the \code{contents} field.
#' @usage obj$col_data_bar(col = NULL, color = "lightgreen", exclude_rows =
#'   NULL, na.rm = TRUE)
#' @param col Numeric or character vector of which columns to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z). Used to color the data bars.
#' @param exclude_rows Numeric vector of which rows to exclude from calculation
#'   and styling.
HTable$set("public", "col_data_bar", function(col = NULL, color = "lightgreen", exclude_rows = NULL) {
  col <- private$col_name_index(col)
  if (is.null(col)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)
  stopifnot(is.numeric(exclude_rows) | is.null(exclude_rows))
  
  if (is.null(exclude_rows)) {
    data_exclude_rows <- -(1:nrow(self$data))
    contents_exclude_rows <- 1
  } else {
    data_exclude_rows <- exclude_rows
    contents_exclude_rows <- c(1, exclude_rows + 1)
  }
  
  color <- rep(color, nrow(self$data[-data_exclude_rows, ]))

  for (c in col) {
    x <- try_numeric(self$data[-data_exclude_rows, c])
    if (!is.numeric(x)) { # try numeric didn't work
      warning("Column ", c, " is not numeric. No data bar applied.")
      next
    }
    width <- pct_width(x)
    color[is.na(x)] <- "inherit"
    # white-space:nowrap; prevents a narrow width from forcing the contents to wrap to a new line
    bar_styles <- sprintf("white-space:nowrap;direction:ltr;border-radius:4px;padding-right:2px;background-color:%s;width:%.2f%%;",
                          color, abs(width))
    self$contents[-contents_exclude_rows, c] <- tag_edit_style(self$contents[-contents_exclude_rows, c], bar_styles)
  }

  invisible(self)
})

#' @name HTable_col_centered_data_bar
#' @title Apply a centered data bar element to columns
#' @description Change numeric column(s) to have a colored, centered data bar
#'   element in each cell. The length of the bar is based on the range of values
#'   in the column. Changes the \code{contents} field.
#' @usage obj$col_centered_data_bar(col = NULL, color1 = "lightgreen", color2 =
#'   "pink", exclude_rows = NULL, na.rm = TRUE)
#' @param col Numeric or character vector of which columns to target.
#' @param color1 Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z). Used to color the data bars
#'   for the positive values.
#' @param color2 Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z). Used to color the data bars
#'   for the negative values.
#' @param exclude_rows Numeric vector of which rows to exclude from calculation
#'   and styling.
HTable$set("public", "col_centered_data_bar", function(col = NULL, color1 = "lightgreen", color2 = "pink", exclude_rows = NULL) {
  col <- private$col_name_index(col)
  if (is.null(col)) return(invisible(self))
  stopifnot(is.character(color1), length(color1) == 1)
  stopifnot(is.character(color2), length(color2) == 1)
  stopifnot(is.numeric(exclude_rows) | is.null(exclude_rows))
  
  if (is.null(exclude_rows)) {
    data_exclude_rows <- -(1:nrow(self$data))
    contents_exclude_rows <- 1
  } else {
    data_exclude_rows <- exclude_rows
    contents_exclude_rows <- c(1, exclude_rows + 1)
  }
  
  color1 <- rep(color1, nrow(self$data[-data_exclude_rows, ]))
  color2 <- rep(color2, nrow(self$data[-data_exclude_rows, ]))
  
  for (c in col) {
    x <- try_numeric(self$data[-data_exclude_rows, c])
    if (!is.numeric(x)) { # try numeric didn't work
      warning("Column ", c, " is not numeric. No data bar applied.")
      next
    }
    width <- pct_width(x)
    lg <- vector("character", length(x)) # background linear gradients
    
    # negative-side bars
    neg_dist_center <- 50 - (abs(width) * 0.5)
    # linear-gradient(to right,transparent 0% 10%,lightgreen 10% 50%,transparent 50% 100%);
    lg[width < 0] <- sprintf("linear-gradient(to right,transparent 0%% %.2f%%,%s %.2f%% 50%%,transparent 50%% 100%%);",
                             neg_dist_center[width < 0], color2[width < 0], neg_dist_center[width < 0])
    
    # positive-side bars
    pos_dist_center <- (abs(width) * 0.5) + 50
    # linear-gradient(to right,transparent 0% 50%,lightgreen 50% 90%,transparent 90% 100%);
    lg[width >= 0] <- sprintf("linear-gradient(to right,transparent 0%% 50%%,%s 50%% %.2f%%,transparent %.2f%% 100%%);",
                              color1[width >= 0], pos_dist_center[width >= 0], pos_dist_center[width >= 0])
    
    # white-space:nowrap; prevents a narrow width from forcing the contents to wrap to a new line
    bar_styles <- sprintf("white-space:nowrap;direction:ltr;border-radius:0;padding-right:2px;background:%s;width:100%%", lg)
    self$contents[-contents_exclude_rows, c] <- tag_edit_style(self$contents[-contents_exclude_rows, c], bar_styles)
  }
  
  invisible(self)
})
