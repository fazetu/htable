#' @include htable.R
NULL


#' Add a style to a cell
#' 
#' Add a style to a specific <td> or <th> tag. Changes the \code{styles} field.
#' 
#' @name HTable_cell_add_style
#' @param row Numeric vector of which rows to target.
#' @param col Numeric vector of which columns to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "cell_add_style", function(row = NULL, col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)
  
  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows
  
  self$styles[row, col] <- add_style(self$styles[row, col], style)
  invisible(self)
})

#' Replace the style of a cell
#' 
#' Replace the style of a specific <td> or <th> tag. Changes the \code{styles}
#' field.
#' 
#' @name HTable_cell_replace_style
#' @param row Numeric vector of which rows to target.
#' @param col Numeric vector of which columns to target.
#' @param style Character vector (length 1) of style(s).
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "cell_replace_style", function(row = NULL, col = NULL, style = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.numeric(col))
  stopifnot(is.character(style), length(style) == 1)
  
  if (!include_header) row <- row + 1 # move rows down by 1 if not including the header in rows
  
  self$styles[row, col] <- style
  invisible(self)
})

#' Clear the style of a cell
#' 
#' Clear the style of a specific <td> or <th> tag. Changes the \code{styles}
#' field.
#' 
#' @name HTable_cell_clear_style
#' @param row Numeric vector of which rows to target.
#' @param col Numeric vector of which columns to target.
#' @param include_header Boolean if \code{rows} should include the header as the
#'   1st index. E.g. if \code{FALSE}, \code{row = 1} will target the first row,
#'   but if \code{TRUE}, \code{row = 1} will target the header.
HTable$set("public", "cell_clear_style", function(row = NULL, col = NULL, include_header = FALSE) {
  if (is.null(row) | is.null(col) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(row))
  stopifnot(is.numeric(col))
  
  self$cell_replace_style(row = row, col = col, style = "", include_header = include_header)
  invisible(self)
})
