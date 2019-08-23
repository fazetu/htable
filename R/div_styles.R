#' @include htable.R
NULL


#' @name HTable_div_style_add
#' @title Add a style to the <div> tag
#' @description Add to the existing styles located in the \code{div_style}
#'   field.
#' @usage obj$div_style_add(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "div_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  if (!self$in_div) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$div_style <- add_style(self$div_style, style)
  invisible(self)
})


#' @name HTable_div_style_replace
#' @title Replace the <div> tag style
#' @description Overwrite the \code{div_style} field.
#' @usage obj$div_style_replace(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "div_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  if (!self$in_div) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$div_style <- style
  invisible(self)
})

#' @name HTable_div_style_clear
#' @title Clear the <div> tag style
#' @description Clear any styles in the \code{div_style} field.
#' @usage obj$div_style_clear()
HTable$set("public", "div_style_clear", function() {
  self$div_style_replace("")
  invisible(self)
})

#' @name HTable_div_x_scroll
#' @title Add an auto scroll bar to the <div> tag in the x direction
#' @description Add an auto scroll bar to the <div> tag in the x direction.
#'   Changes the \code{div_style} field.
#' @usage obj$div_x_scroll()
HTable$set("public", "div_x_scroll", function() {
  self$div_style_add("overflow-x:auto;")
  invisible(self)
})

#' @name HTable_div_y_scroll
#' @title Add an auto scroll bar to the <div> tag in the y direction
#' @description Add an auto scroll bar to the <div> tag in the y direction.
#'   Changes the \code{div_style} field.
#' @usage obj$div_y_scroll()
HTable$set("public", "div_y_scroll", function() {
  self$div_style_add("overflow-y:auto;")
  invisible(self)
})

#' @name HTable_div_max_width
#' @title Set the max width of the <div> tag
#' @description Set the max width of the <div> tag. Changes the \code{div_style}
#'   field.
#' @param width Character vector (length 1) of the max width to use. Usually of
#'   the format "Npx" or "N\%".
#' @usage obj$div_max_width()
HTable$set("public", "div_max_width", function(width = NULL) {
  if (is.null(width)) return(invisible(self))
  self$div_style_add(sprintf("max-width:%s;", width))
  invisible(self)
})

#' @name HTable_div_max_height
#' @title Set the max height of the <div> tag
#' @description Set the max height of the <div> tag. Changes the
#'   \code{div_style} field.
#' @param height Character vector (length 1) of the max height to use. Usually
#'   of the format "Npx" or "N\%".
#' @usage obj$div_max_height()
HTable$set("public", "div_max_height", function(height = NULL) {
  if (is.null(height)) return(invisible(self))
  self$div_style_add(sprintf("max-height:%s;", height))
  invisible(self)
})
