#' @include utils.R
NULL


#' HTable reference class object
#' 
#' Details on the HTable reference class object. All help pages for the methods
#' are prefixed with "HTable", like "HTable_<function_name>".
#' 
#' @field data A copy of the original data frame that was used to create the
#'   HTable. This is used when applying formats or conditional scaling. These
#'   don't get used when rendering an HTable.
#' @field contents A character matrix that determines the content of each cell
#'   of the table. The first row is what gets put into the <th> tags. All other
#'   rows get put into <td> tags. They should always be <span> elements.
#' @field styles A character matrix that determines the styles of each cell of
#'   the table. The first row is the styles of the <th> tags. All other rows are
#'   the styles of the <td> tags. They should always be character strings with
#'   as few spaces as possible and all styles should end in a semi-colon.
#' @field table_style A character vector (length 1) that determines the style of
#'   the <table> tag. It should always have as few spaces as possible and all
#'   styles should end in a semi-colon.
#' @field thead_style A character vector (length 1) that determines the style of
#'   the <thead> tag. It should always have as few spaces as possible and all
#'   styles should end in a semi-colon.
#' @field tbody_style A character vector (length 1) that determines the style of
#'   the <tbody> tag. It should always have as few spaces as possible and all
#'   styles should end in a semi-colon.
#' @field tr_styles A character vector (length \code{nrow(data) + 1}) that
#'   determines the style of each <tr> tag. Each element should always have as
#'   few spaces as possible and all styles should end in a semi-colon.
#' @export
HTable <- R6Class("HTable")

HTable$set("public", "data", NULL)
HTable$set("public", "contents", NULL)
HTable$set("public", "styles", NULL)
HTable$set("public", "table_style", "")
HTable$set("public", "thead_style", "")
HTable$set("public", "tbody_style", "")
HTable$set("public", "tr_styles", "")

HTable$set("public", "initialize", function(x,
                                            table_style = "margin-left:auto;margin-right:auto;",
                                            thead_style = "", tbody_style = "",
                                            tr_styles = rep("", nrow(x) + 1)) {
  stopifnot(is.character(table_style), length(table_style) == 1)
  stopifnot(is.character(thead_style), length(thead_style) == 1)
  stopifnot(is.character(tbody_style), length(tbody_style) == 1)
  stopifnot(is.character(tr_styles), length(tr_styles) == (nrow(x) + 1)) #  + 1 because all <th>'s go in 1 <tr>
  
  styles <- rbind("", matrix("", nrow = nrow(x), ncol = ncol(x)))
  contents <- rbind(
    tsc("span", "", colnames(x)),
    do.call("cbind", lapply(x, function(col) tsc("span", "", col)))
  )
  
  self$data <- x
  self$contents <- contents
  self$styles <- styles
  self$table_style <- table_style
  self$thead_style <- thead_style
  self$tbody_style <- tbody_style
  self$tr_styles <- tr_styles
})

#' Create a new HTable object
#' 
#' Creates a new HTable reference class object from the given data frame.
#' @param x Data frame.
#' @param table_style Character vector (of length 1). This is the CSS style
#'   applied to the overall <table> tag.
#' @param thead_style Character vector (of length 1). This is the CSS style
#'   applied to the <thead> tag.
#' @param tbody_style Character vector (of length 1). This is the CSS style
#'   applied to the <tbody> tag.
#' @param tr_styles Character vector (of length \code{nrow(x) + 1}). These
#'   styles are applied to each <tr> tag in the table.
#' @return Reference class object of class HTable.
#' @export
htable <- function(x, table_style = "margin-left:auto;margin-right:auto;",
                   thead_style = "", tbody_style = "",
                   tr_styles = rep("", nrow(x) + 1)) {
  HTable$new(x = x, table_style = table_style, thead_style = thead_style,
             tbody_style = tbody_style, tr_styles = tr_styles)
}

HTable$set("public", "print", function(...) {
  print(self$data)
  invisible(self)
})

#' Generate the HTML of the HTable object
#' 
#' @name HTable_render
#' @return A length 1 character vector.
HTable$set("public", "render", function() {
  ths <- tsc("th", self$styles[1, ], self$contents[1, ])
  tds <- lapply(2:nrow(self$contents), function(i) tsc("td", self$styles[i, ], self$contents[i, ]))
  
  tr_ths <- tsc("tr", self$tr_styles[1], paste0(ths, collapse = ""))
  tr_tds <- vapply(seq_along(tds), function(i) tsc("tr", self$tr_styles[i + 1], paste0(tds[[i]], collapse = "")), character(1))
  
  thead <- tsc("thead", self$thead_style, tr_ths)
  tbody <- tsc("tbody", self$tbody_style, paste0(tr_tds, collapse = ""))
  
  # does not return self invisibly
  tsc("table", self$table_style, paste0(thead, tbody, collapse = ""))
})

#' Put an HTable into an RMarkdown Document
#' 
#' @name HTable_Rmd
HTable$set("public", "Rmd", function() cat(self$render()))

#' View the HTable in the RStudio Viewer tab
#' 
#' @name HTable_View
HTable$set("public", "View", function() {
  tmp_dir <- tempfile()
  dir.create(tmp_dir)
  tmp_html <- file.path(tmp_dir, "temp.html")
  writeLines(c("<html><body>", self$render(), "</body></html>"), tmp_html)
  rstudioapi::viewer(tmp_html)
})

#' Write the HTML for the HTable and write it to a file
#' 
#' @name HTable_writeLines
HTable$set("public", "writeLines", function(con = stdout(), sep = "\n", useBytes = FALSE) {
  writeLines(self$render(), con = con, sep = sep, useBytes = useBytes)
  invisible(self)
})
