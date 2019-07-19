#' @include htable.R
NULL


#' @name HTable_table_style_add
#' @title Add a style to the <table> tag
#' @description Add to the existing styles located in the \code{table_style}
#'   field.
#' @usage obj$table_style_add(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "table_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- add_style(self$table_style, style)
  invisible(self)
})

#' @name HTable_table_style_replace
#' @title Replace the <table> tag style
#' @description Overwrite the \code{table_style} field.
#' @usage obj$table_style_replace(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "table_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- style
  invisible(self)
})

#' @name HTable_table_style_clear
#' @title Clear the <table> tag style
#' @description Clear any styles in the \code{table_style} field.
#' @usage obj$table_style_clear()
HTable$set("public", "table_style_clear", function() {
  self$table_style_replace("")
  invisible(self)
})

#' @name HTable_thead_style_add
#' @title Add a style to the <thead> tag
#' @description Add to the existing styles located in the \code{thead_style}
#'   field.
#' @usage obj$thead_style_add(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "thead_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$thead_style <- add_style(self$thead_style, style)
  invisible(self)
})

#' @name HTable_thead_style_replace
#' @title Replace the <thead> tag style
#' @description Overwrite the \code{thead_style} field.
#' @usage obj$thead_style_replace(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "thead_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$thead_style <- style
  invisible(self)
})

#' @name HTable_thead_style_clear
#' @title Clear the <thead> tag style
#' @description Clear any styles in the \code{thead_style} field.
#' @usage obj$thead_style_clear()
HTable$set("public", "thead_style_clear", function() {
  self$thead_style_replace("")
  invisible(self)
})

#' @name HTable_tbody_style_add
#' @title Add a style to the <tbody> tag
#' @description Add to the existing styles located in the \code{tbody_style}
#'   field.
#' @usage obj$tbody_style_add(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "tbody_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$tbody_style <- add_style(self$tbody_style, style)
  invisible(self)
})

#' @name HTable_tbody_style_replace
#' @title Replace the <tbody> tag style
#' @description Overwrite the \code{tbody_style} field.
#' @usage obj$tbody_style_replace(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "tbody_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$tbody_style <- style
  invisible(self)
})

#' @name HTable_tbody_style_clear
#' @title Clear the <tbody> tag style
#' Clear any styles in the \code{tbody_style} field.
#' @usage obj$tbody_style_clear()
HTable$set("public", "tbody_style_clear", function() {
  self$tbody_style_replace("")
  invisible(self)
})

#' @name HTable_tr_styles_all_add
#' @title Add styles to the <tr> tags
#' @description Add to the existing styles located in the \code{tr_styles}
#'   field.
#' @usage obj$tr_styles_all_add(style = NULL)
#' @param style Character vector (length \code{nrow(data) + 1} or 1) of styles
#'   to add. If of length 1 then the style will be added to all <tr> tags.
HTable$set("public", "tr_styles_all_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  if (length(style) == 1) style <- rep(style, length(self$tr_styles))
  stopifnot(is.character(style), length(style) == length(self$tr_styles))
  
  self$tr_styles <- add_style(self$tr_styles, style)
  invisible(self)
})

#' @name HTable_tr_styles_all_replace
#' @title Replace the <tr> tag styles
#' @description Overwrite the \code{tr_styles} field.
#' @usage obj$tr_styles_all_replace(style = NULL)
#' @param style Character vector (length \code{nrow(data) + 1} or 1) of styles
#'   to add. If of length 1 then the style will be added to all <tr> tags.
HTable$set("public", "tr_styles_all_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  if (length(style) == 1) style <- rep(style, length(self$tr_styles))
  stopifnot(is.character(style), length(style) == length(self$tr_styles))
  
  self$tr_styles <- style
  invisible(self)
})

#' @name HTable_tr_styles_all_clear
#' @title Clear the <tr> tag styles
#' @description Clear any styles in the \code{tr_styles} field.
#' @usage obj$tr_styles_all_clear()
HTable$set("public", "tr_styles_all_clear", function() {
  self$tr_styles_all_replace(rep("", length(self$tr_styles)))
  invisible(self)
})

#' @name HTable_tr_styles_which_add
#' @title Add styles to the <tr> tags at certain tags
#' @description Add to the existing styles located in the \code{tr_styles}
#'   field, but only to the ones specified.
#' @usage obj$tr_styles_which_add(which = NULL, style = NULL)
#' @param which Numeric vector of which <tr> tags to target.
#' @param style Character vector of style(s). It must be the same length as
#'   \code{which}.
HTable$set("public", "tr_styles_which_add", function(which = NULL, style = NULL) {
  if (is.null(which) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(which))
  stopifnot(is.character(style))
  stopifnot(length(which) == length(style))
  
  self$tr_styles[which] <- add_style(self$tr_styles[which], style)
  invisible(self)
})

#' @name HTable_tr_styles_which_replace
#' @title Replace the <tr> tags styles at certain tags
#' @description Overwrite the \code{tr_styles} field, but only the ones
#'   specified.
#' @usage obj$tr_styles_which_replace(which = NULL, style = NULL)
#' @param which Numeric vector of which <tr> tags to target.
#' @param style Character vector of style(s). It must be the same length as
#'   \code{which}.
HTable$set("public", "tr_styles_which_replace", function(which = NULL, style = NULL) {
  if (is.null(which) | is.null(style)) return(invisible(self))
  stopifnot(is.numeric(which))
  stopifnot(is.character(style))
  stopifnot(length(which) == length(style))
  
  self$tr_styles[which] <- style
  invisible(self)
})

#' @name HTable_tr_styles_all_clear
#' @title Clear the <tr> tag styles at certain tags
#' @description Clear any styles in the \code{tr_styles} field, but only the
#'   ones specified.
#' @usage obj$tr_styles_which_clear(which = NULL)
#' @param which Numeric vector of which <tr> tags to target.
HTable$set("public", "tr_styles_which_clear", function(which = NULL) {
  if (is.null(which)) return(invisible(self))
  stopifnot(is.numeric(which))
  
  self$tr_styles_which_replace(which = which, style = "")
  invisible(self)
})

#' @name HTable_add_styles
#' @title Add a style to every <th> and <td> tag
#' @description Add a style to every entry in the \code{styles} field. This is a
#'   character matrix of styles that represents the styles applied to each <th>
#'   and <td> tag.
#' @usage obj$add_styles(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "add_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)

  self$styles <- matrix(sapply(self$styles, function(col) add_style(col, style)), nrow = nrow(self$styles), ncol = ncol(self$styles))
  invisible(self)
})

#' @name HTable_add_all_styles
#' @title Add a style to every HTML table tag
#' @description Add a style to the following fields: \code{table_style},
#'   \code{thead_style}, \code{tbody_style}, and each element of
#'   \code{tr_styles}. It also add a style to every entry in the \code{styles}
#'   field.
#' @usage obj$add_all_styles(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "add_all_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style_add(style = style)
  self$thead_style_add(style = style)
  self$tbody_style_add(style = style)
  self$tr_styles_all_add(style = rep(style, length(self$tr_styles)))
  self$add_styles(style = style)
  invisible(self)
})

#' @name HTable_replace_styles
#' @title Replace the style of every <th> and <td> tag
#' @description Replace the style of every entry in the \code{styles} field.
#'   This is a character matrix of styles that represents the styles applied to
#'   each <th> and <td> tag.
#' @usage obj$replace_styles(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "replace_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$styles <- matrix(style, nrow = nrow(self$styles), ncol = ncol(self$styles))
  invisible(self)
})

#' @name HTable_replace_all_styles
#' @title Replace the style of every HTML table tag
#' @description Replace the style of the following fields: \code{table_style},
#'   \code{thead_style}, \code{tbody_style}, and each element of
#'   \code{tr_styles}. It also replaces the style of every entry in the
#'   \code{styles} field.
#' @usage obj$replace_all_styles(style = NULL)
#' @param style Character vector (length 1) of style(s).
HTable$set("public", "replace_all_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- style
  self$thead_style <- style
  self$tbody_styles <- style
  self$tr_styles <- rep(style, length(self$tr_styles))
  self$replace_styles(style = style)
  invisible(self)
})

#' @name HTable_clear_styles
#' @title Clear the style of every <th> and <td> tag
#' @description Clear the style of every entry in the \code{styles} field. This
#'   is a character matrix of styles that represents the styles applied to each
#'   <th> and <td> tag.
#' @usage obj$clear_styles()
HTable$set("public", "clear_styles", function() {
  self$replace_styles(style = "")
  invisible(self)
})

#' @name HTable_clear_all_styles
#' @title Clear the style of every HTML table tag
#' @description Clear the style of the following fields: \code{table_style},
#'   \code{thead_style}, \code{tbody_style}, and each element of
#'   \code{tr_styles}. It also clears the style of every entry in the
#'   \code{styles} field.
#' @usage obj$clear_all_styles()
HTable$set("public", "clear_all_styles", function() {
  self$replace_all_styles(style = "")
  invisible(self)
})

#' @name HTable_reset_contents
#' @title Reset the contents of every <th> and <td> tag
#' @description Reset the contents of every entry in the \code{contents} field.
#'   This is a character matrix of contents that represents the contents of each
#'   <th> and <td> tag.
#' @usage obj$reset_contents()
HTable$set("public", "reset_contents", function() {
  x <- self$data
  contents <- rbind(
    tsc("div", "", colnames(x)),
    do.call("cbind", lapply(x, function(col) tsc("div", "", col)))
  )
  self$contents <- contents
  invisible(self)
})
