tsc <- function(tag, style, content) { # tsc = tag, style, content
  mapply(function(t, s, c) {
    if (s == "") sprintf("<%s>%s</%s>", t, c, t)
    else sprintf("<%s style='%s'>%s</%s>", t, s, c, t)
  }, tag, style, content, USE.NAMES = FALSE)
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
