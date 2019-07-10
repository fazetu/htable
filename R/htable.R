#' @include utils.R
NULL

#' @export
htable <- R6Class("htable")

htable$set("public", "data", NULL)
htable$set("public", "contents", NULL)
htable$set("public", "styles", NULL)
htable$set("public", "table_style", "")
htable$set("public", "thead_style", "")
htable$set("public", "tbody_style", "")
htable$set("public", "tr_styles", "")

htable$set("public", "initialize", function(x,
                                            table_style = "margin-left:auto;margin-right:auto;",
                                            thead_style = "",
                                            tbody_style = "",
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

htable$set("public", "print", function(...) {
  print(self$data)
  invisible(self)
})

htable$set("public", "render", function() {
  ths <- tsc("th", self$styles[1, ], self$contents[1, ])
  tds <- lapply(2:nrow(self$contents), function(i) tsc("td", self$styles[i, ], self$contents[i, ]))
  
  tr_ths <- tsc("tr", self$tr_styles[1], paste0(ths, collapse = ""))
  tr_tds <- vapply(seq_along(tds), function(i) tsc("tr", self$tr_styles[i], paste0(tds[[i]], collapse = "")), character(1))
  
  thead <- tsc("thead", self$thead_style, tr_ths)
  tbody <- tsc("tbody", self$tbody_style, paste0(tr_tds, collapse = ""))
  
  # does not return self invisibly
  tsc("table", self$table_style, paste0(thead, tbody, collapse = ""))
})

htable$set("public", "writeLines", function(con = sdout(), sep = "\n", useBytes = FALSE) {
  writeLines(self$render(), con = con, sep = sep, useBytes = useBytes)
  invisible(self)
})
