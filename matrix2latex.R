matrix2latex = function(file, m) {

  m = round(m, digits = 3)
  d = dim(m)
  if (is.null(d)) {
    m = matrix(m, 1, length(m))
    d = dim(m)
  }
  rows = character(d[1])
  for (i in 1:d[1]) {
    rows[i] = paste(m[i,], collapse = "&")
  }
  tex = paste(rows, collapse = "\\\\\n")
  write(tex, file = file)

}
