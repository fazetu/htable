% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/col_styles.R
\name{HTable_col_data_bar}
\alias{HTable_col_data_bar}
\title{Apply a data bar element to columns}
\usage{
obj$col_data_bar(col = NULL, color = "lightgreen", exclude_rows =
  NULL, na.rm = TRUE)
}
\arguments{
\item{col}{Numeric or character vector of which columns to target.}

\item{color}{Character vector (length 1) of an HTML color name, hex color
code, or rgb color of the form rgb(x, y, z). Used to color the data bars.}

\item{exclude_rows}{Numeric vector of which rows to exclude from calculation
and styling.}
}
\description{
Change numeric column(s) to have a colored data bar element in
  each cell. The length of the bar is based on the range of values in the
  column. Changes the \code{contents} field.
}
