# return first if both are not NULL
c_or_1st <- function(a, b) {
  # handle if both are NULL
  if (is.null(a) & is.null(b)) return(NULL)
  
  # handle if one is NULL
  if (!is.null(a) & is.null(b)) return(a)
  if (is.null(a) & !is.null(b)) return(b)
  
  # otherwise do different things based on class
  if (is.logical(a) & is.logical(b)) return(a) # should this be just a or a | b?
  if (is.numeric(a) & is.numeric(b)) return(unique(c(a, b)))
  if (is.character(a) & is.character(b)) return(a)

  NULL
}

#' Combine two \code{style_specs} lists
#' 
#' Compare each value of \code{s1} against \code{s2}. If both are populated (not
#' \code{NULL}), then use \code{s1}'s value. Otherwise, one of them is
#' \code{NULL} so use the other.
#' @param s1 \code{style_spec} list 1.
#' @param s2 \code{style_spec} list 2.
#' @return List of class "style_spec".
#' @export
combine_style_specs <- function(s1, s2) {
  stopifnot(is(s1, "style_spec"), is(s2, "style_spec"))
  
  style_spec(borders_line                       = c_or_1st(s1$borders_line, s2$borders_line),
             borders_width                      = c_or_1st(s1$borders_width, s2$borders_width),
             borders_color                      = c_or_1st(s1$borders_color, s2$borders_color),
             padding_padding                    = c_or_1st(s1$padding_padding, s2$padding_padding),
             font_size_size                     = c_or_1st(s1$font_size_size, s2$font_size_size),
             font_family_font                   = c_or_1st(s1$font_family_font, s2$font_family_font),
             col_add_style_col                  = c(s1$col_add_style_col, s2$col_add_style_col),
             col_add_style_style                = c_or_1st(s1$col_add_style_style, s2$col_add_style_style),
             col_add_style_include_header       = c_or_1st(s1$col_add_style_include_header, s2$col_add_style_include_header),
             col_width_col                      = c(s1$col_width_col, s2$col_width_col),
             col_width_width                    = c_or_1st(s1$col_width_width, s2$col_width_width),
             col_bold_col                       = c(s1$col_bold_col, s2$col_bold_col),
             col_bold_include_header            = c_or_1st(s1$col_bold_include_header, s2$col_bold_include_header),
             col_italic_col                     = c(s1$col_italic_col, s2$col_italic_col),
             col_italic_include_header          = c_or_1st(s1$col_italic_include_header, s2$col_italic_include_header),
             col_bg_color_col                   = c(s1$col_bg_color_col, s2$col_bg_color_col),
             col_bg_color_color                 = c_or_1st(s1$col_bg_color_color, s2$col_bg_color_color),
             col_bg_color_include_header        = c_or_1st(s1$col_bg_color_include_header, s2$col_bg_color_include_header),
             col_color_col                      = c(s1$col_color_col, s2$col_color_col),
             col_color_color                    = c_or_1st(s1$col_color_color, s2$col_color_color),
             col_color_include_header           = c_or_1st(s1$col_color_include_header, s2$col_color_include_header),
             col_pct_fmt_col                    = c(s1$col_pct_fmt_col, s2$col_pct_fmt_col),
             col_pct_fmt_mult100                = c_or_1st(s1$col_pct_fmt_mult100, s2$col_pct_fmt_mult100),
             col_comma_fmt_col                  = c(s1$col_comma_fmt_col, s2$col_comma_fmt_col),
             col_dollar_fmt_col                 = c(s1$col_dollar_fmt_col, s2$col_dollar_fmt_col),
             col_color_scale_col                = c(s1$col_color_scale_col, s2$col_color_scale_col),
             col_color_scale_color              = c_or_1st(s1$col_color_scale_color, s2$col_color_scale_color),
             col_color_scale_exclude_rows       = c_or_1st(s1$col_color_scale_exclude_rows, s2$col_color_scale_exclude_rows),
             col_data_bar_col                   = c(s1$col_data_bar_col, s2$col_data_bar_col),
             col_data_bar_color                 = c_or_1st(s1$col_data_bar_color, s2$col_data_bar_color),
             col_data_bar_exclude_rows          = c_or_1st(s1$col_data_bar_exclude_rows, s2$col_data_bar_exclude_rows),
             col_centered_data_bar_col          = c(s1$col_centered_data_bar_col, s2$col_centered_data_bar_col),
             col_centered_data_bar_color1       = c_or_1st(s1$col_centered_data_bar_color1, s2$col_centered_data_bar_color1),
             col_centered_data_bar_color2       = c_or_1st(s1$col_centered_data_bar_color2, s2$col_centered_data_bar_color2),
             col_centered_data_bar_exclude_rows = c_or_1st(s1$col_centered_data_bar_exclude_rows, s2$col_centered_data_bar_exclude_rows),
             row_add_style_row                  = c(s1$row_add_style_row, s2$row_add_style_row),
             row_add_style_style                = c_or_1st(s1$row_add_style_style, s2$row_add_style_style),
             row_bold_row                       = c(s1$row_bold_row, s2$row_bold_row),
             row_italic_row                     = c(s1$row_italic_row, s2$row_italic_row),
             row_bg_color_row                   = c(s1$row_bg_color_row, s2$row_bg_color_row),
             row_bg_color_color                 = c_or_1st(s1$row_bg_color_color, s2$row_bg_color_color),
             row_color_row                      = c(s1$row_color_row, s2$row_color_row),
             row_color_color                    = c_or_1st(s1$row_color_color, s2$row_color_color),
             row_alt_bg_color_color1            = c_or_1st(s1$row_alt_bg_color_color1, s2$row_alt_bg_color_color1),
             row_alt_bg_color_color2            = c_or_1st(s1$row_alt_bg_color_color2, s2$row_alt_bg_color_color2),
             row_alt_color_color1               = c_or_1st(s1$row_alt_color_color1, s2$row_alt_color_color1),
             row_alt_color_color2               = c_or_1st(s1$row_alt_color_color2, s2$row_alt_color_color2),
             header_add_style_style             = c_or_1st(s1$header_add_style_style, s2$header_add_style_style),
             header_bold_flag                   = c_or_1st(s1$header_bold_flag, s2$header_bold_flag),
             header_italic_flag                 = c_or_1st(s1$header_italic_flag, s2$header_italic_flag),
             header_bg_color_color              = c_or_1st(s1$header_bg_color_color, s2$header_bg_color_color),
             header_color_color                 = c_or_1st(s1$header_color_color, s2$header_color_color))
}
