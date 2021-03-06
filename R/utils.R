tsc <- function(tag, style, content) { # tsc = tag, style, content
  mapply(function(t, s, c) {
    if (s == "") sprintf("<%s>%s</%s>", t, c, t)
    else sprintf("<%s style='%s'>%s</%s>", t, s, c, t)
  }, tag, style, content, USE.NAMES = FALSE)
}

# using this one now:
ticsc <- function(tag, id = "", class = "", style = "", content = "") { # ticsc = tag, id, class, style, content
  mapply(function(t, i, cl, s, cont) {
    id_fill <- ifelse(i == "", "", sprintf(" id='%s' ", i))
    class_fill <- ifelse(cl == "", "", sprintf(" class='%s' ", cl))
    style_fill <- ifelse(s == "", "", sprintf(" style='%s'", s))
    
    sprintf("<%s%s%s%s>%s</%s>", t, id_fill, class_fill, style_fill, cont, t)
  }, tag, id, class, style, content, USE.NAMES = FALSE)
}

add_style <- function(curr_styles, new_styles) {
  new_styles_splt <- lapply(strsplit(new_styles, ";"), paste0, ";") # add back on semi-colon
  curr_styles_splt <- lapply(strsplit(curr_styles, ";"), function(stl) {
    if (length(stl) == 0) return(stl)
    paste0(stl, ";")
  })
  
  final_styles <- mapply(function(cs, ns) {
    if (length(cs) == 0) return(paste0(ns, collapse = ""))
    c_names <- gsub("(.*):.*;", "\\1", cs)
    n_names <- gsub("(.*):.*;", "\\1", ns)
    cf <- cs[!c_names %in% n_names] # filter out name if we are adding that style
    unique(c(cf, ns))
  }, curr_styles_splt, new_styles_splt, SIMPLIFY = FALSE)
  
  vapply(final_styles, function(s) paste0(s, collapse = ""), character(1))
}

nested_depth <- function(html) lengths(strsplit(html, "</")) - 1

# for working with tags in self$contents
has_style <- function(html) {
  open_tag <- gsub("<(.*)>.*</.*>", "\\1", html)
  grepl("style", open_tag)
}

tag_add_style <- function(html, style) { # assumes all html does not have style attribute already
  tag_name <- gsub("<(.*)>.*</.*>", "\\1", html)
  content <- gsub("<.*>(.*)</.*>", "\\1", html)
  sprintf("<%s style='%s'>%s</%s>", tag_name, style, content, tag_name)
}

tag_insert_style <- function(html, style) { # assumes all html have style attribute already
  tag_name <- gsub("<(.*) style='.*'>.*</.*>", "\\1", html)
  curr_style <- gsub("<.* style='(.*)'>.*</.*>", "\\1", html)
  content <- gsub("<.* style='.*'>(.*)</.*>", "\\1", html)
  sprintf("<%s style='%s'>%s</%s>", tag_name, add_style(curr_style, style), content, tag_name)
}

tag_edit_style <- function(html, style) {
  new_html <- html
  have_style <- has_style(html)
  new_html[!have_style] <- tag_add_style(html[!have_style], style[!have_style])
  new_html[have_style] <- tag_insert_style(html[have_style], style[have_style])
  new_html
}

tag_replace_content <- function(html, content) {
  if (any(nested_depth(html) != 1)) stop("HTML is nested. Something weird happened.")
  open_tag <- gsub("(<.*>).*</.*>", "\\1", html)
  close_tag <- gsub("<.*>.*(</.*>)", "\\1", html)
  sprintf("%s%s%s", open_tag, content, close_tag)
}

pct_width <- function(x) {
  mx <- max(abs(x), na.rm = TRUE)
  f <- is.na(x) | x == 0 # problems for finding the width of
  width <- x / mx * 100
  width[f] <- 0
  width
}

#' Make a single string of HTML a vector with nice spacing
#'
#' @param x A single string of HTML
#' @param indent_char Character to use to indent the HTML tags.
#' @export
prettify_html <- function(x, indent_char = "  ") {
  split_html <- paste0("<", strsplit(x, "<")[[1]])[-1]
  
  # find lines that are "incomplete" and move the next line to that incomplete line
  incomp_i <- which(!grepl(">$", split_html))
  nexts_i <- incomp_i + 1
  split_html[incomp_i] <- paste0(split_html[incomp_i], split_html[nexts_i])
  html <- split_html[-nexts_i]
  
  # figure out how many spaces there need to be
  count_opens <- 0L
  count_closes <- 0L
  indents <- integer(length(html))
  
  for (i in seq_along(html)) {
    line <- html[i]
    has_open <- grepl("<[^/]", line)
    has_close <- grepl("</", line)
    
    if (has_open & has_close) {
      indents[i] <- count_opens - count_closes
    } else if (has_open & !has_close) {
      indents[i] <- count_opens - count_closes
    } else if (!has_open & has_close) {
      indents[i] <- count_opens - (count_closes + 1)
    }
    
    count_opens <- count_opens + has_open
    count_closes <- count_closes + has_close
  }
  
  tabs <- sapply(indents, function(n) {
    if (n == 0L) return("")
    paste0(rep(indent_char, times = n), collapse = "")
  })
  
  paste0(tabs, html)
}

try_numeric <- function(x) {
  tryCatch(as.numeric(as.character(x)), warning = function(w) x, error = function(e) x)
}
