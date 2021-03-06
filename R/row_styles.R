#' @include htable.R
NULL


#' @name HTable_row_add_style
#' @title Add a style to a row
#' @description Add a style to each <td> and, optionally, <th> tag in a row.
#'   Changes the \code{styles} field.
#' @usage obj$row_add_style(row = NULL, style = NULL, include_header = FALSE)
#' @param row Numeric vector of which rows to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_add_style", function(row = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.character(style), length(style) == 1)
  if (is.null(include_header)) include_header <- FALSE

  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows

  self$styles[row, ] <- add_style(self$styles[row, ], style)
  invisible(self)
})

#' @name HTable_row_replace_style
#' @title Replace the style in a row
#' @description Replace the style of each <td> and, optionally, <th> tag in a
#'   row. Changes the \code{styles} field.
#' @usage obj$row_replace_style(row = NULL, style = NULL, include_header =
#'   FALSE)
#' @param row Numeric vector of which rows to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_replace_style", function(row = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.character(style), length(style) == 1)
  if (is.null(include_header)) include_header <- FALSE

  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows

  self$styles[row, ] <- style
  invisible(self)
})

#' @name HTable_row_clear_style
#' @title Clear the style in a row
#' @description Clear the style of each <td> and, optionally, <th> tag in a row.
#'   Changes the \code{styles} field.
#' @usage obj$row_clear_style(row = NULL, include_header = FALSE)
#' @param row Numeric vector of which rows to target.
#' @param style Character vector (length 1) of a style to use.
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_clear_style", function(row = NULL, include_header = FALSE) {
  self$row_replace_style(row = row, style = "", include_header = include_header)
  invisible(self)
})

#' @name HTable_row_bold
#' @title Add a bold style to a row
#' @description Add a bold style to each <td> and, optionally, <th> tag in a
#'   row. Changes the \code{styles} field.
#' @usage obj$row_bold(row = NULL, include_header = FALSE)
#' @param row Numeric vector of which rows to target.
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_bold", function(row = NULL, include_header = FALSE) {
  self$row_add_style(row = row, style = "font-weight:bold;", include_header = include_header)
  invisible(self)
})

#' @name HTable_row_italic
#' @title Add an italic style to a row
#' @description Add an italic style to each <td> and, optionally, <th> tag in a
#'   row. Changes the \code{styles} field.
#' @usage obj$row_italic(row = NULL, include_header = FALSE)
#' @param row Numeric vector of which rows to target.
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_italic", function(row = NULL, include_header = FALSE) {
  if (is.null(row)) return(invisible(self))

  self$row_add_style(row = row, style = "font-style:italic;", include_header = include_header)
  invisible(self)
})

#' @name HTable_row_bg_color
#' @title Add a background color style to a row
#' @description Add a background color style to each <td> and, optionally, <th>
#'   tag in a row. Changes the \code{styles} field.
#' @usage obj$row_bg_color(row = NULL, color = NULL, include_header = FALSE)
#' @param row Numeric vector of which rows to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_bg_color", function(row = NULL, color = NULL, include_header = FALSE) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)

  self$row_add_style(row = row, style = sprintf("background-color:%s;", color), include_header = include_header)
  invisible(self)
})

#' @name HTable_row_color
#' @title Add a text color style to a row
#' @description Add a text style to each <td> and, optionally, <th> tag in a
#'   row. Changes the \code{styles} field.
#' @usage obj$row_color(row = NULL, color = NULL, include_header = FALSE)
#' @param row Numeric vector of which rows to target.
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "row_color", function(row = NULL, color = NULL, include_header = FALSE) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)

  self$row_add_style(row = row, style = sprintf("color:%s;", color), include_header = include_header)
  invisible(self)
})

#' @name HTable_row_alt_bg_color
#' @title Add an alternating background color style to all rows
#' @description Add an alternating background color style to each <td> and,
#'   optionally, <th> tag. The odd rows get the background color \code{color1}
#'   and the evens get the background color \code{color2}. Changes the
#'   \code{styles} field.
#' @usage obj$row_alt_bg_color(color1 = NULL, color2 = NULL, include_header = FALSE)
#' @param color1 Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param color2 Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if the header should also be given a background
#'   color.
HTable$set("public", "row_alt_bg_color", function(color1 = NULL, color2 = NULL, include_header = FALSE) {
  if (is.null(color1) | is.null(color2)) return(invisible(self))
  stopifnot(is.character(color1), length(color1) == 1)
  stopifnot(is.character(color2), length(color2) == 1)

  if (nrow(self$data) == 1 & !include_header) {
    # quit early if coloring 1 row only
    self$row_bg_color(1, color = color1, include_header = FALSE)
    return(invisible(self))
  }

  if (include_header) nr <- nrow(self$styles) # use the longer self$styles
  else nr <- nrow(self$data)

  odds <- which((1:nr) %% 2 == 1)
  evens <- which((1:nr) %% 2 == 0)
  self$row_bg_color(odds, color = color1, include_header = include_header)
  self$row_bg_color(evens, color = color2, include_header = include_header)

  invisible(self)
})

#' @name HTable_row_alt_color
#' @title Add an alternating text color style to all rows
#' @description Add an alternating text color style to each <td> and,
#'   optionally, <th> tag. The odd rows get the text color \code{color1} and the
#'   evens get the text color \code{color2}. Changes the \code{styles} field.
#' @usage obj$row_alt_color(color1 = NULL, color2 = NULL, include_header =
#'   FALSE)
#' @param color1 Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param color2 Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
#' @param include_header Boolean if the header should also be given a text
#'   color.
HTable$set("public", "row_alt_color", function(color1 = NULL, color2 = NULL, include_header = FALSE) {
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

#' @name HTable_row_color_scale
#' @title Apply a color scale gradient to rows
#' @description Change numeric values in row(s) to have a background color
#'   gradient based on the range of values in the row.
#' @usage obj$row_color_scale(row = NULL, color = c("#63BE7B", "#FFEB84",
#'   "#F8696B"), exclude_cols = NULL, na.rm = TRUE, all = FALSE)
#' @param row Numeric vector of which rows to target. \code{row = 1} corresponds
#'   to the first row after the header row - the header row cannot be targeted
#'   with color scales.
#' @param color Character vector of HTML color names, hex color codes, or rgb
#'   colors of the form rgb(x, y, z). Used to create a color palette.
#' @param exclude_cols Numeric vector of which columns to exclude from
#'   calculation and coloring.
#' @param all Boolean if the color scaling should be scaled across all of the
#'   values in the \code{row} rows.
HTable$set("public", "row_color_scale", function(row = NULL, color = c("#63BE7B", "#FFEB84", "#F8696B"), exclude_cols = NULL, na.rm = TRUE, all = FALSE) {
  if (is.null(row) | is.null(color)) return(invisible(self))
  stopifnot(is.character(color))
  stopifnot(is.numeric(exclude_cols) | is.null(exclude_cols))
  if (is.null(na.rm)) na.rm <- TRUE
  if (is.null(all)) all <- FALSE
  
  pal <- colorRamp(color)
  not_num_cols <- which(!vapply(self$data, is.numeric, logical(1)))
  
  if (is.null(exclude_cols)) data_exclude_cols <- -(setdiff(1:ncol(self$data), not_num_cols))
  else data_exclude_cols <- unique(c(exclude_cols, not_num_cols))
  
  if (all) {
    num <- lapply(self$data[row, -data_exclude_cols], try_numeric)
    all_vals <- unlist(num)
    rx <- range(all_vals, na.rm = TRUE)
  }
  
  for (r in row) {
    x <- try_numeric(self$data[r, -data_exclude_cols])
    if (!is.numeric(x)) next # try numeric didn't work
    
    if (!all) rx <- range(x, na.rm = TRUE) # range x
    sx <- (x - rx[1]) / diff(rx) # scaled x
    
    # undo any data bars styling if this happens after
    color_scale_colors <- rep("inherit", length(sx))
    color_scale_colors[!is.na(sx)] <- rgb(pal(sx[!is.na(sx)]), max = 255)
    color_scale_styles <- sprintf("border-radius:0;padding-right:0;background-color:%s;width:100%%;", color_scale_colors)
    # r + 1 because first row of self$contents is header (can't color scale header)
    self$contents[r + 1, -data_exclude_cols] <- tag_edit_style(self$contents[r + 1, -data_exclude_cols], color_scale_styles)
  }
  
  invisible(self)
})


################################################################################

#' @name HTable_header_add_style
#' @title Add a style to the header
#' @description Add a style to each <th> tag. Changes the \code{styles} field.
#' @usage obj$header_add_style(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "header_add_style", function(style = NULL) {
  self$row_add_style(row = 1, style = style, include_header = TRUE)
  invisible(self)
})

#' @name HTable_header_replace_style
#' @title Replace the style of the header
#' @description Replace the style of each <th> tag. Changes the \code{styles}
#'   field.
#' @usage obj$header_replace_style(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "header_replace_style", function(style = NULL) {
  self$row_replace_style(row = 1, style = style, include_header = TRUE)
  invisible(self)
})

#' @name HTable_header_clear_style
#' @title Clear the style of the header
#' @description Clear the style of each <th> tag. Changes the \code{styles}
#'   field.
#' @usage obj$header_clear_style()
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "header_clear_style", function() {
  self$row_clear_style(row = 1, include_header = TRUE)
  invisible(self)
})

#' @name HTable_header_bold
#' @title Add a bold style to the header
#' @description Add a bold style to each <th> tag. Changes the \code{styles}
#'   field.
#' @usage obj$header_bold()
HTable$set("public", "header_bold", function() {
  self$header_add_style(style = "font-weight:bold;")
  invisible(self)
})

#' @name HTable_header_italic
#' @title Add an italic style to the header
#' @description Add an italic style to each <th> tag. Changes the \code{styles}
#'   field.
#' @usage obj$header_italic()
HTable$set("public", "header_italic", function() {
  self$header_add_style(style = "font-style:italic;")
  invisible(self)
})

#' @name HTable_header_bg_color
#' @title Add a background color style to the header
#' @description Add a background color style to each <th> tag. Changes the
#'   \code{styles} field.
#' @usage obj$header_bg_color(color = NULL)
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
HTable$set("public", "header_bg_color", function(color = NULL) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)

  self$header_add_style(style = sprintf("background-color:%s;", color))
  invisible(self)
})

#' @name HTable_header_color
#' @title Add a text color style to the header
#' @description Add a text color style to each <th> tag. Changes the
#'   \code{styles} field.
#' @usage obj$header_color(color = NULL)
#' @param color Character vector (length 1) of an HTML color name, hex color
#'   code, or rgb color of the form rgb(x, y, z).
HTable$set("public", "header_color", function(color = NULL) {
  if (is.null(color)) return(invisible(self))
  stopifnot(is.character(color), length(color) == 1)

  self$header_add_style(style = sprintf("color:%s;", color))
  invisible(self)
})
