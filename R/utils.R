tag_styles <- function(tag, style, content) {
  mapply(function(t, s, c) {
    if (s == "") sprintf("<%s>%s</%s>", t, c, t)
    else sprintf("<%s style='%s'>%s</%s>", t, s, c, t)
  }, tag, style, content, USE.NAMES = FALSE)
}
