#' @include htable.R
NULL


htable$set("public", "table_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- add_style(self$table_style, style)
  invisible(self)
})

htable$set("public", "table_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- style
  invisible(self)
})

htable$set("public", "table_style_clear", function() {
  self$table_style_replace("")
  invisible(self)
})

htable$set("public", "thead_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$thead_style <- add_style(self$thead_style, style)
  invisible(self)
})

htable$set("public", "thead_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$thead_style <- style
  invisible(self)
})

htable$set("public", "thead_style_clear", function() {
  self$thead_style_replace("")
  invisible(self)
})

htable$set("public", "tbody_style_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$tbody_style <- add_style(self$tbody_style, style)
  invisible(self)
})

htable$set("public", "tbody_style_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$tbody_style <- style
  invisible(self)
})

htable$set("public", "tbody_style_clear", function() {
  self$tbody_style_replace("")
  invisible(self)
})

htable$set("public", "tr_styles_all_add", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == length(self$tr_styles))
  
  self$tr_styles <- add_style(self$tr_styles, style)
  invisible(self)
})

htable$set("public", "tr_styles_all_replace", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == length(self$tr_styles))
  
  self$tr_styles <- style
  invisible(self)
})

htable$set("public", "tr_styles_all_clear", function() {
  self$tr_styles_all_replace(rep("", length(self$tr_styles)))
  invisible(self)
})

htable$set("public", "add_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)

  hd$styles <- matrix(sapply(hd$styles, function(col) add_style(col, style)), nrow = nrow(hd$styles), ncol = ncol(hd$styles))
  invisible(self)
})

htable$set("public", "add_all_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)

  self$table_style <- add_style(self$table_style, style)
  self$thead_style <- add_style(self$thead_style, style)
  self$tbody_styles <- add_style(self$tbody_styles, style)
  self$tr_styles <- add_style(self$tr_styles, rep(style, length(self$tr_styles)))
  self$add_styles(style = style)
  invisible(self)
})

htable$set("public", "replace_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- style
  self$thead_style <- style
  self$tbody_styles <- style
  self$tr_styles <- rep(style, length(self$tr_styles))
  self$styles <- matrix(style, nrow = nrow(self$styles), ncol = ncol(self$styles))
  invisible(self)
})

htable$set("public", "replace_all_styles", function(style = NULL) {
  if (is.null(style)) return(invisible(self))
  stopifnot(is.character(style), length(style) == 1)
  
  self$table_style <- style
  self$thead_style <- style
  self$tbody_styles <- style
  self$tr_styles <- rep(style, length(self$tr_styles))
  self$replace_styles(style = style)
  invisible(self)
})

htable$set("public", "clear_styles", function() {
  self$replace_styles(style = "")
  invisible(self)
})

htable$set("public", "clear_all_styles", function() {
  self$replace_all_styles(style = "")
  invisible(self)
})
