% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/style_spec.R
\name{HTable_apply_style_spec}
\alias{HTable_apply_style_spec}
\title{Apply a style_spec list}
\usage{
my_styles <- style_spec()
obj$apply_style_spec(style_spec = my_styles)
}
\arguments{
\item{style_spec}{Object of class "style_spec". Created using
\code{\link{style_spec}}.}

\item{order}{Specify the order to apply the styles. Default is row, then
column, then header styles. This is only important if some styles clash
with each other (e.g. the cell (1, 1) when column 1 gets colored blue and
row 1 gets colored red).}
}
\description{
Apply a style_spec list to the htable.
}
