not_null_bool <- function(bool) {
  if (is.null(bool)) return(FALSE)
  else bool
}

#' Create a style specification
#' 
#' Create a reausable style specification. This makes it easier apply the same
#' styling to multiple htables.
#' 
#' @param borders_line Passed into \code{borders}'s \code{line} argument. See \code{\link{HTable_borders}}.
#' @param borders_width Passed into \code{borders}'s \code{width} argument. See \code{\link{HTable_borders}}.
#' @param borders_color Passed into \code{borders}'s \code{color} argument. See \code{\link{HTable_borders}}.
#' @param padding_padding Passed into \code{padding}'s \code{padding} argument. See \code{\link{HTable_padding}}.
#' @param font_size_size Passed into \code{font_size}'s \code{size} argument. See \code{\link{HTable_font_size}}.
#' @param font_family_font Passed into \code{font_family}'s \code{font} argument. See \code{\link{HTable_font_family}}.
#' @param col_add_style_col Passed into \code{col_add_style}'s \code{col} argument. See \code{\link{HTable_col_add_style}}.
#' @param col_add_style_style Passed into \code{col_add_style}'s \code{style} argument. See \code{\link{HTable_col_add_style}}.
#' @param col_add_style_include_header Passed into \code{col_add_style}'s \code{include_header} argument. See \code{\link{HTable_col_add_style}}.
#' @param col_width_col Passed into \code{col_width}'s \code{col} argument. See \code{\link{HTable_col_width}}.
#' @param col_width_width Passed into \code{col_width}'s \code{width} argument. See \code{\link{HTable_col_width}}.
#' @param col_bold_col Passed into \code{col_bold}'s \code{col} argument. See \code{\link{HTable_col_bold}}.
#' @param col_bold_include_header Passed into \code{col_bold}'s \code{include_header} argument. See \code{\link{HTable_col_bold}}.
#' @param col_italic_col Passed into \code{col_italic}'s \code{col} argument. See \code{\link{HTable_col_italic}}.
#' @param col_italic_include_header Passed into \code{col_italic}'s \code{include_header} argument. See \code{\link{HTable_col_italic}}.
#' @param col_bg_color_col Passed into \code{col_bg_color}'s \code{col} argument. See \code{\link{HTable_col_bg_color}}.
#' @param col_bg_color_color Passed into \code{col_bg_color}'s \code{color} argument. See \code{\link{HTable_col_bg_color}}.
#' @param col_bg_color_include_header Passed into \code{col_bg_color}'s \code{include_header} argument. See \code{\link{HTable_col_bg_color}}.
#' @param col_color_col Passed into \code{col_color}'s \code{col} argument. See \code{\link{HTable_col_color}}.
#' @param col_color_color Passed into \code{col_color}'s \code{color} argument. See \code{\link{HTable_col_color}}.
#' @param col_color_include_header Passed into \code{col_color}'s \code{include_header} argument. See \code{\link{HTable_col_color}}.
#' @param col_pct_fmt_col Passed into \code{col_pct_fmt}'s \code{col} argument. See \code{\link{HTable_col_pct_fmt}}.
#' @param col_pct_fmt_mult100 Passed into \code{col_pct_fmt}'s \code{mult100} argument. See \code{\link{HTable_col_pct_fmt}}.
#' @param col_comma_fmt_col Passed into \code{col_comma_fmt}'s \code{col} argument. See \code{\link{HTable_col_comma_fmt}}.
#' @param col_dollar_fmt_col Passed into \code{col_dollar_fmt}'s \code{col} argument. See \code{\link{HTable_col_dollar_fmt}}.
#' @param col_color_scale_col Passed into \code{col_color_scale}'s \code{col} argument. See \code{\link{HTable_col_color_scale}}.
#' @param col_color_scale_color Passed into \code{col_color_scale}'s \code{color} argument. See \code{\link{HTable_col_color_scale}}.
#' @param col_color_scale_exclude_rows Passed into \code{col_color_scale}'s \code{exclude_rows} argument. See \code{\link{HTable_col_color_scale}}.
#' @param col_color_scale_all Passed into \code{col_color_scale}'s \code{all} argument. See \code{\link{HTable_col_color_scale}}.
#' @param col_data_bar_col Passed into \code{col_data_bar}'s \code{col} argument. See \code{\link{HTable_col_data_bar}}.
#' @param col_data_bar_color Passed into \code{col_data_bar}'s \code{color} argument. See \code{\link{HTable_col_data_bar}}.
#' @param col_data_bar_exclude_rows Passed into \code{col_data_bar}'s \code{exclude_rows} argument. See \code{\link{HTable_col_data_bar}}.
#' @param col_centered_data_bar_col Passed into \code{col_centered_data_bar}'s \code{col} argument. See \code{\link{HTable_col_centered_data_bar}}.
#' @param col_centered_data_bar_color1 Passed into \code{col_centered_data_bar}'s \code{color1} argument. See \code{\link{HTable_col_centered_data_bar}}.
#' @param col_centered_data_bar_color2 Passed into \code{col_centered_data_bar}'s \code{color2} argument. See \code{\link{HTable_col_centered_data_bar}}.
#' @param col_centered_data_bar_exclude_rows Passed into \code{col_centered_data_bar}'s \code{exclude_rows} argument. See \code{\link{HTable_col_centered_data_bar}}.
#' @param row_add_style_row Passed into \code{row_add_style}'s \code{row} argument. See \code{\link{HTable_row_add_style}}.
#' @param row_add_style_style Passed into \code{row_add_style}'s \code{style} argument. See \code{\link{HTable_row_add_style}}.
#' @param row_bold_row Passed into \code{row_bold}'s \code{row} argument. See \code{\link{HTable_row_bold}}.
#' @param row_italic_row Passed into \code{row_italic}'s \code{row} argument. See \code{\link{HTable_row_italic}}.
#' @param row_bg_color_row Passed into \code{row_bg_color}'s \code{row} argument. See \code{\link{HTable_row_bg_color}}.
#' @param row_bg_color_color Passed into \code{row_bg_color}'s \code{color} argument. See \code{\link{HTable_row_bg_color}}.
#' @param row_color_row Passed into \code{row_color}'s \code{row} argument. See \code{\link{HTable_row_color}}.
#' @param row_color_color Passed into \code{row_color}'s \code{color} argument. See \code{\link{HTable_row_color}}.
#' @param row_alt_bg_color_color1 Passed into \code{row_alt_bg_color}'s \code{color1} argument. See \code{\link{HTable_row_alt_bg_color}}.
#' @param row_alt_bg_color_color2 Passed into \code{row_alt_bg_color}'s \code{color2} argument. See \code{\link{HTable_row_alt_bg_color}}.
#' @param row_alt_color_color1 Passed into \code{row_alt_color}'s \code{color1} argument. See \code{\link{HTable_row_alt_color}}.
#' @param row_alt_color_color2 Passed into \code{row_alt_color}'s \code{color2} argument. See \code{\link{HTable_row_alt_color}}.
#' @param row_color_scale_row Passed into \code{row_color_scale}'s \code{row} argument. See \code{\link{HTable_row_color_scale}}.
#' @param row_color_scale_color Passed into \code{row_color_scale}'s \code{color} argument. See \code{\link{HTable_row_color_scale}}.
#' @param row_color_scale_exclude_cols Passed into \code{row_color_scale}'s \code{exclude_cols} argument. See \code{\link{HTable_row_color_scale}}.
#' @param row_color_scale_all Passed into \code{row_color_scale}'s \code{all} argument. See \code{\link{HTable_row_color_scale}}.
#' @param header_add_style_style Passed into \code{header_add_style}'s \code{style} argument. See \code{\link{HTable_header_add_style}}.
#' @param header_bold_flag Boolean if \code{header_bold} should be run. See \code{\link{HTable_header_bold}}.
#' @param header_italic_flag Boolean if \code{header_italic} should be run. See \code{\link{HTable_header_italic}}.
#' @param header_bg_color_color Passed into \code{header_bg_color}'s \code{color} argument. See \code{\link{HTable_header_bg_color}}.
#' @param header_color_color Passed into \code{header_color}'s \code{color} argument. See \code{\link{HTable_header_color}}.
#' @param div_x_scroll_flag Boolean if \code{div_x_scroll} should be run. See \code{\link{HTable_div_x_scroll}}.
#' @param div_y_scroll_flag Boolean if \code{div_y_scroll} should be run. See \code{\link{HTable_div_y_scroll}}.
#' @param div_max_width_width Passed into \code{div_max_width}'s \code{width} argument. See \code{\link{HTable_div_max_width}}.
#' @param div_max_height_height Passed into \code{div_max_height}'s \code{height} argument. See \code{\link{HTable_div_max_height}}.
#' @return List of class "style_spec".
#' @export
style_spec <- function(
  borders_line                       = NULL,
  borders_width                      = NULL,
  borders_color                      = NULL,
  padding_padding                    = NULL,
  font_size_size                     = NULL,
  font_family_font                   = NULL,
  col_add_style_col                  = NULL,
  col_add_style_style                = NULL,
  col_add_style_include_header       = FALSE,
  col_width_col                      = NULL,
  col_width_width                    = NULL,
  col_bold_col                       = NULL,
  col_bold_include_header            = FALSE,
  col_italic_col                     = NULL,
  col_italic_include_header          = FALSE,
  col_bg_color_col                   = NULL,
  col_bg_color_color                 = NULL,
  col_bg_color_include_header        = FALSE,
  col_color_col                      = NULL,
  col_color_color                    = NULL,
  col_color_include_header           = FALSE,
  col_pct_fmt_col                    = NULL,
  col_pct_fmt_mult100                = TRUE,
  col_comma_fmt_col                  = NULL,
  col_dollar_fmt_col                 = NULL,
  col_color_scale_col                = NULL,
  col_color_scale_color              = c("#63BE7B", "#FFEB84", "#F8696B"),
  col_color_scale_exclude_rows       = NULL,
  col_color_scale_all                = FALSE,
  col_data_bar_col                   = NULL,
  col_data_bar_color                 = "lightgreen",
  col_data_bar_exclude_rows          = NULL,
  col_centered_data_bar_col          = NULL,
  col_centered_data_bar_color1       = "lightgreen",
  col_centered_data_bar_color2       = "pink",
  col_centered_data_bar_exclude_rows = NULL,
  row_add_style_row                  = NULL,
  row_add_style_style                = NULL,
  row_bold_row                       = NULL,
  row_italic_row                     = NULL,
  row_bg_color_row                   = NULL,
  row_bg_color_color                 = NULL,
  row_color_row                      = NULL,
  row_color_color                    = NULL,
  row_alt_bg_color_color1            = NULL,
  row_alt_bg_color_color2            = NULL,
  row_alt_color_color1               = NULL,
  row_alt_color_color2               = NULL,
  row_color_scale_row                = NULL,
  row_color_scale_color              = c("#63BE7B", "#FFEB84", "#F8696B"),
  row_color_scale_exclude_cols       = NULL,
  row_color_scale_all                = FALSE,
  header_add_style_style             = NULL,
  header_bold_flag                   = FALSE,
  header_italic_flag                 = FALSE,
  header_bg_color_color              = NULL,
  header_color_color                 = NULL,
  div_x_scroll_flag                  = FALSE,
  div_y_scroll_flag                  = FALSE,
  div_max_width_width                = NULL,
  div_max_height_height              = NULL
) {
  structure(
    list(
      borders_line                       = borders_line,
      borders_width                      = borders_width,
      borders_color                      = borders_color,
      padding_padding                    = padding_padding,
      font_size_size                     = font_size_size,
      font_family_font                   = font_family_font,
      col_add_style_col                  = col_add_style_col,
      col_add_style_style                = col_add_style_style,
      col_add_style_include_header       = col_add_style_include_header,
      col_width_col                      = col_width_col,
      col_width_width                    = col_width_width,
      col_bold_col                       = col_bold_col,
      col_bold_include_header            = col_bold_include_header,
      col_italic_col                     = col_italic_col,
      col_italic_include_header          = col_italic_include_header,
      col_bg_color_col                   = col_bg_color_col,
      col_bg_color_color                 = col_bg_color_color,
      col_bg_color_include_header        = col_bg_color_include_header,
      col_color_col                      = col_color_col,
      col_color_color                    = col_color_color,
      col_color_include_header           = col_color_include_header,
      col_pct_fmt_col                    = col_pct_fmt_col,
      col_pct_fmt_mult100                = col_pct_fmt_mult100,
      col_comma_fmt_col                  = col_comma_fmt_col,
      col_dollar_fmt_col                 = col_dollar_fmt_col,
      col_color_scale_col                = col_color_scale_col,
      col_color_scale_color              = col_color_scale_color,
      col_color_scale_exclude_rows       = col_color_scale_exclude_rows,
      col_color_scale_all                = col_color_scale_all,
      col_data_bar_col                   = col_data_bar_col,
      col_data_bar_color                 = col_data_bar_color,
      col_data_bar_exclude_rows          = col_data_bar_exclude_rows,
      col_centered_data_bar_col          = col_centered_data_bar_col,
      col_centered_data_bar_color1       = col_centered_data_bar_color1,
      col_centered_data_bar_color2       = col_centered_data_bar_color2,
      col_centered_data_bar_exclude_rows = col_centered_data_bar_exclude_rows,
      row_add_style_row                  = row_add_style_row,
      row_add_style_style                = row_add_style_style,
      row_bold_row                       = row_bold_row,
      row_italic_row                     = row_italic_row,
      row_bg_color_row                   = row_bg_color_row,
      row_bg_color_color                 = row_bg_color_color,
      row_color_row                      = row_color_row,
      row_color_color                    = row_color_color,
      row_alt_bg_color_color1            = row_alt_bg_color_color1,
      row_alt_bg_color_color2            = row_alt_bg_color_color2,
      row_alt_color_color1               = row_alt_color_color1,
      row_alt_color_color2               = row_alt_color_color2,
      row_color_scale_row                = row_color_scale_row,
      row_color_scale_color              = row_color_scale_color,
      row_color_scale_exclude_cols       = row_color_scale_exclude_cols,
      row_color_scale_all                = row_color_scale_all,
      header_add_style_style             = header_add_style_style,
      header_bold_flag                   = header_bold_flag,
      header_italic_flag                 = header_italic_flag,
      header_bg_color_color              = header_bg_color_color,
      header_color_color                 = header_color_color,
      div_x_scroll_flag                  = div_x_scroll_flag,
      div_y_scroll_flag                  = div_x_scroll_flag,
      div_max_width_width                = div_max_width_width,
      div_max_height_height              = div_max_height_height
    ),
    class = c("style_spec", "list")
  )
}

HTable$set("private", "apply_style_spec_general", function(style_spec) {
  self$borders(line = style_spec$borders_line, width = style_spec$borders_width, color = style_spec$borders_color)
  self$padding(padding = style_spec$padding_padding)
  self$font_size(size = style_spec$font_size_size)
  self$font_family(font = style_spec$font_family_font)
  if (not_null_bool(style_spec$div_x_scroll_flag)) self$div_x_scroll()
  if (not_null_bool(style_spec$div_y_scroll_flag)) self$div_y_scroll()
  self$div_max_width(width = style_spec$div_max_width_width)
  self$div_max_height(height = style_spec$div_max_height_height)
  invisible(self)
})

HTable$set("private", "apply_style_spec_col", function(style_spec) {
  self$col_add_style(col = style_spec$col_add_style_col, style = style_spec$col_add_style_style, include_header = style_spec$col_add_style_include_header)
  self$col_width(col = style_spec$col_width_col, width = style_spec$col_width_width)
  self$col_bold(col = style_spec$col_bold_col, include_header = style_spec$col_bold_include_header)
  self$col_italic(col = style_spec$col_italic_col, include_header = style_spec$col_italic_include_header)
  self$col_bg_color(col = style_spec$col_bg_color_col, color = style_spec$col_bg_color_color, include_header = style_spec$col_bg_color_include_header)
  self$col_color(col = style_spec$col_color_col, color = style_spec$col_color_color, include_header = style_spec$col_color_include_header)
  self$col_pct_fmt(col = style_spec$col_pct_fmt_col, mult100 = style_spec$col_pct_fmt_mult100)
  self$col_comma_fmt(col = style_spec$col_comma_fmt_col)
  self$col_dollar_fmt(col = style_spec$col_dollar_fmt_col)
  self$col_color_scale(col = style_spec$col_color_scale_col, color = style_spec$col_color_scale_color, exclude_rows = style_spec$col_color_scale_exclude_rows, all = style_spec$col_color_scale_all)
  self$col_data_bar(col = style_spec$col_data_bar_col, color = style_spec$col_data_bar_color, exclude_rows = style_spec$col_data_bar_exclude_rows)
  self$col_centered_data_bar(col = style_spec$col_centered_data_bar_col, color1 = style_spec$col_centered_data_bar_color1, color2 = style_spec$col_centered_data_bar_color2, exclude_rows = style_spec$col_centered_data_bar_exclude_rows)
  invisible(self)
})

HTable$set("private", "apply_style_spec_row", function(style_spec) {
  self$row_add_style(row = style_spec$row_add_style_row, style = style_spec$row_add_style_style)
  self$row_bold(row = style_spec$row_bold_row, include_header = FALSE)
  self$row_italic(row = style_spec$row_italic_row, include_header = FALSE)
  self$row_bg_color(row = style_spec$row_bg_color_row, color = style_spec$row_bg_color_color, include_header = FALSE)
  self$row_color(row = style_spec$row_color_row, color = style_spec$row_color_color, include_header = FALSE)
  self$row_alt_bg_color(color1 = style_spec$row_alt_bg_color_color1, color2 = style_spec$row_alt_bg_color_color2, include_header = FALSE)
  self$row_alt_color(color1 = style_spec$row_alt_color_color1, color2 = style_spec$row_alt_color_color2, include_header = FALSE)
  self$row_color_scale(row = style_spec$row_color_scale_row, color = style_spec$row_color_scale_color, exclude_cols = style_spec$row_color_scale_exclude_cols, all = style_spec$row_color_scale_all)
  invisible(self)
})

HTable$set("private", "apply_style_spec_header", function(style_spec) {
  if (not_null_bool(style_spec$header_bold_flag)) self$header_bold()
  if (not_null_bool(style_spec$header_italic_flag)) self$header_italic()
  self$header_add_style(style = style_spec$header_add_style_style)
  self$header_bg_color(color = style_spec$header_bg_color_color)
  self$header_color(color = style_spec$header_color_color)
  invisible(self)
})

#' @name HTable_apply_style_spec
#' @title Apply a style_spec list
#' @description Apply a style_spec list to the htable.
#' @usage
#' my_styles <- style_spec()
#' obj$apply_style_spec(style_spec = my_styles)
#' @param style_spec Object of class "style_spec". Created using
#'   \code{\link{style_spec}}.
#' @param order Specify the order to apply the styles. Default is row, then
#'   column, then header styles. This is only important if some styles clash
#'   with each other (e.g. the cell (1, 1) when column 1 gets colored blue and
#'   row 1 gets colored red).
HTable$set("public", "apply_style_spec", function(style_spec = NULL, order = c("row", "column", "header")) {
  if (is.null(style_spec)) return(invisible(self))
  stopifnot(is(style_spec, "style_spec"))
  stopifnot(is.character(order), length(order) >= 1, length(order) <= 3)
  stopifnot(all(order %in% c("row", "column", "header")))
  order <- c(order, setdiff(c("row", "column", "header"), order)) # add the others if not included
  
  switch(
    order[1],
    "row" = private$apply_style_spec_row(style_spec),
    "column" = private$apply_style_spec_col(style_spec),
    "header" = private$apply_style_spec_header(style_spec)
  )
  
  switch(
    order[2],
    "row" = private$apply_style_spec_row(style_spec),
    "column" = private$apply_style_spec_col(style_spec),
    "header" = private$apply_style_spec_header(style_spec)
  )

  switch(
    order[3],
    "row" = private$apply_style_spec_row(style_spec),
    "column" = private$apply_style_spec_col(style_spec),
    "header" = private$apply_style_spec_header(style_spec)
  )
  
  private$apply_style_spec_general(style_spec)
  
  invisible(self)
})
