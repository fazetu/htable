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
#'   rows get put into <td> tags. They should always be <div> elements.
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
#' @field in_div A boolean indicator if the HTable should be wrapped in a <div>
#'   container.
#' @field div_style A character vector (length 1) that is used to style the
#'   <div> container if \code{in_div = TRUE}.
#' @field table_id A character vector (length 1) that is used as the id
#'   attribute for the <table> tag.
#' @field table_id A character vector (length 1) that is used as the class
#'   attribute for the <table> tag.
#' @field div_id  A character vector (length 1) that is used as the id attribute
#'   for the <div> tag (if \code{in_div = TRUE}).
#' @field div_class A character vector (length 1) that is used as the class
#'   attribute <div> tag (if \code{in_div = TRUE}).
#' @export
HTable <- R6Class("HTable")

HTable$set("public", "data", NULL)
HTable$set("public", "contents", NULL)
HTable$set("public", "styles", NULL)
HTable$set("public", "table_style", "")
HTable$set("public", "thead_style", "")
HTable$set("public", "tbody_style", "")
HTable$set("public", "tr_styles", "")
HTable$set("public", "in_div", FALSE)
HTable$set("public", "div_style", "")
HTable$set("public", "table_id", "")
HTable$set("public", "table_class", "")
HTable$set("public", "div_id", "")
HTable$set("public", "div_class", "")

HTable$set("public", "initialize", function(x,
                                            handle_rownames = c("drop", "add_first", "add_last"),
                                            rownames_col_name = "RowNames",
                                            table_style = "",
                                            thead_style = "", tbody_style = "",
                                            tr_styles = rep("", nrow(x) + 1),
                                            in_div = FALSE, div_style = "",
                                            table_id = "", table_class = "",
                                            div_id = "", div_class = "") {
  stopifnot(is.character(table_style), length(table_style) == 1)
  stopifnot(is.character(thead_style), length(thead_style) == 1)
  stopifnot(is.character(tbody_style), length(tbody_style) == 1)
  stopifnot(is.character(tr_styles), length(tr_styles) == (nrow(x) + 1)) # + 1 because all <th>'s go in 1 <tr>
  stopifnot(is.character(div_style), length(div_style) == 1)
  
  stopifnot(is.character(table_id), length(table_id) == 1)
  stopifnot(is.character(table_class), length(table_class) == 1)
  stopifnot(is.character(div_id), length(div_id) == 1)
  stopifnot(is.character(div_class), length(div_class) == 1)
  
  if (!all(attr(x, "row.names") == 1:nrow(x))) { # only care if it has rownames
    handle_rownames <- match.arg(handle_rownames)
    
    if (handle_rownames == "drop") {
      warning("Rownames will be dropped.", call. = FALSE, immediate. = TRUE)
      rownames(x) <- NULL
    } else if (handle_rownames == "add_first") {
      cnms <- c(rownames_col_name, colnames(x))
      x <- cbind(rownames(x), x)
      rownames(x) <- NULL
      colnames(x) <- cnms
    } else if (handle_rownames == "add_last") {
      cnms <- c(colnames(x), rownames_col_name)
      x <- cbind(x, rownames(x))
      rownames(x) <- NULL
      colnames(x) <- cnms
    }
  }

  styles <- rbind("", matrix("", nrow = nrow(x), ncol = ncol(x)))
  contents <- rbind(
    tsc("div", "", colnames(x)),
    do.call("cbind", lapply(x, function(col) tsc("div", "", col)))
  )
  
  self$data <- x
  self$contents <- contents
  self$styles <- styles
  self$table_style <- table_style
  self$thead_style <- thead_style
  self$tbody_style <- tbody_style
  self$tr_styles <- tr_styles
  self$in_div <- in_div
  self$div_style <- div_style
  self$table_id <- table_id
  self$table_class <- table_class
  self$div_id <- div_id
  self$div_class <- div_class
})

#' Create a new HTable object
#' 
#' Creates a new HTable reference class object from the given data frame.
#' @param x Data frame.
#' @param handle_rownames How to handle rownames. Either drop them, add them as
#'   the first column, or add them as the last column.
#' @param rownames_col_name Column name to use for the rownames if adding them
#'   to \code{x}.
#' @param table_style Character vector (of length 1). This is the CSS style
#'   applied to the overall <table> tag.
#' @param thead_style Character vector (of length 1). This is the CSS style
#'   applied to the <thead> tag.
#' @param tbody_style Character vector (of length 1). This is the CSS style
#'   applied to the <tbody> tag.
#' @param tr_styles Character vector (of length \code{nrow(x) + 1}). These
#'   styles are applied to each <tr> tag in the table.
#' @param id  A character vector (length 1) that is used as the id attribute for
#'   either the overall <table> tag (if \code{in_div = FALSE}) or the overall
#'   <div> tag (if \code{in_div = TRUE}).
#' @param class A character vector (length 1) that is used as the class
#'   attribute for either the overall <table> tag (if \code{in_div = FALSE}) or
#'   the overall <div> tag (if \code{in_div = TRUE}).
#' @param in_div A boolean indicator if the HTable should be wrapped in a <div>
#'   container.
#' @param div_style A character vector (length 1) that is used to style the
#'   <div> container if \code{in_div = TRUE}.
#' @return Reference class object of class HTable.
#' @export
htable <- function(x, handle_rownames = c("drop", "add_first", "add_last"),
                   rownames_col_name = "RowNames",
                   table_style = "",
                   thead_style = "", tbody_style = "",
                   tr_styles = rep("", nrow(x) + 1),
                   in_div = FALSE, div_style = "",
                   table_id = "", table_class = "",
                   div_id = "", div_class = "") {
  HTable$new(x = x, handle_rownames = match.arg(handle_rownames),
             rownames_col_name = rownames_col_name, table_style = table_style,
             thead_style = thead_style, tbody_style = tbody_style,
             tr_styles = tr_styles,
             in_div = in_div, div_style = div_style,
             table_id = table_id, table_class = table_class,
             div_id = div_id, div_class = div_class)
}

HTable$set("public", "print", function(...) {
  print(self$data)
  invisible(self)
})

HTable$set("private", "render_html", function() {
  ths <- ticsc(tag = "th", style = self$styles[1, ], content = self$contents[1, ])
  tds <- lapply(2:nrow(self$contents), function(i) ticsc(tag = "td", style = self$styles[i, ], content = self$contents[i, ]))
  
  tr_ths <- ticsc(tag = "tr", style = self$tr_styles[1], content = paste0(ths, collapse = ""))
  tr_tds <- vapply(seq_along(tds), function(i) ticsc(tag = "tr", style = self$tr_styles[i + 1], content = paste0(tds[[i]], collapse = "")), character(1))
  
  thead <- ticsc(tag = "thead", style = self$thead_style, content = tr_ths)
  tbody <- ticsc(tag = "tbody", style = self$tbody_style, content = paste0(tr_tds, collapse = ""))
  
  table <- ticsc(tag = "table", id = self$table_id, class = self$table_class, style = self$table_style, content = paste0(thead, tbody, collapse = ""))
  if (self$in_div) {
    table <- ticsc(tag = "div", id = self$div_id, class = self$div_class, style = self$div_style, content = table)
  }

  # does not return self invisibly  
  table
})

md_table_row <- function(row_vals) {
  mid <- paste0(row_vals, collapse = " | ")
  paste0("| ", mid, " |")
}

HTable$set("private", "render_markdown", function() {
  header <- md_table_row(names(self$data))
  subheader <- paste0("|", paste0(rep(":---", ncol(self$data)), collapse = "|"), "|")
  rows <- vapply(1:nrow(self$data), function(r) {
    row <- as.character(self$data[r, ])
    md_table_row(row)
  }, character(1))
  
  paste0(c(header, subheader, rows), collapse = "\n")
})

#' @name HTable_render
#' @title Generate the HTML of the HTable object
#' @param type Render either an HTML or Markdown table.
#' @usage obj$render("html")
#' @return A length 1 character vector.
HTable$set("public", "render", function(type = c("html", "markdown")) {
  type <- match.arg(type)
  
  if (type == "html") {
    private$render_html()
  } else if (type == "markdown") {
    private$render_markdown()
  }
})

#' @name HTable_Rmd
#' @title Put an HTable into an RMarkdown Document
#' @description For use in an R Markdown document inside of a chunk with the
#'   option \code{results='asis'}.
#' @param type Include either an HTML or Markdown table.
#' @usage obj$Rmd()
HTable$set("public", "Rmd", function(type = c("html", "markdown")) {
  cat(self$render(type = match.arg(type)))
})

#' @name HTable_View
#' @title View the HTable in the RStudio Viewer tab
#' @usage obj$View()
HTable$set("public", "View", function() {
  tmp_dir <- tempfile()
  dir.create(tmp_dir)
  tmp_html <- file.path(tmp_dir, "temp.html")
  writeLines(c("<html><body>", self$render(), "</body></html>"), tmp_html)
  rstudioapi::viewer(tmp_html)
})

#' @name HTable_writeLines
#' @title Write the HTML for the HTable and write it to a file
#' @usage obj$writeLines(con = stdout(), sep = "\n", useBytes = FALSE)
#' @param con A connection object or character string. \code{\link{writeLines}}.
#' @param sep character string. A string to be written to teh connection after
#'   each line of text. \code{\link{writeLines}}.
#' @param useBytes logical. \code{\link{writeLines}}.
HTable$set("public", "writeLines", function(con = stdout(), sep = "\n", useBytes = FALSE) {
  writeLines(self$render("html"), con = con, sep = sep, useBytes = useBytes)
  invisible(self)
})
