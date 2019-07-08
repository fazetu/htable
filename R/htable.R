#' @include utils.R
NULL

#' @export
htable <- R6Class("htable")

htable$set("public", "data", NULL)
htable$set("public", "contents", NULL)
htable$set("public", "styles", NULL)
htable$set("public", "table_styles", NULL)

htable$set("public", "initialize", function(x, table_styles = "") {
  stopifnot(is.character(table_styles))
  styles <- rbind("", matrix("", nrow = nrow(x), ncol = ncol(x)))
  contents <- rbind(colnames(x), do.call("cbind", lapply(x, as.character)))
  self$data <- x
  self$contents <- contents
  self$styles <- styles
  self$table_styles <- table_styles
})

htable$set("public", "print", function(...) {
  print(self$data)
  invisible(self)
})

htable$set("public", "render", function() {
  table_tmp <- tag_styles("table", self$table_styles, "<tbody>%s</tbody>")
  tr_tmp <- "<tr>%s</tr>"

  ths <- tag_styles("th", self$styles[1, ], self$contents[1, ])
  tds <- lapply(2:nrow(self$contents), function(i) tag_styles("td", self$styles[i, ], self$contents[i, ]))
  trs <- paste0(
    sprintf(tr_tmp, paste0(ths, collapse = "")),
    paste0(sapply(tds, function(td) sprintf(tr_tmp, paste0(td, collapse = ""))), collapse = ""),
    collapse = ""
  )

  sprintf(table_tmp, trs)
  # does not return self invisibly
})
