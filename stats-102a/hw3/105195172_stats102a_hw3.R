library(stringr)

regex_golf <- function(x, y, regex) {
  xmatch <- str_extract_all(x, regex) == x
  matched_x <- x[xmatch]
  unmatched_x <- x[!xmatch]
  ymatch <- str_extract_all(y, regex) == y
  matched_y <- y[ymatch]
  unmatched_y <- y[!ymatch]
  penalty <- 10 * sum(!xmatch, ymatch)
  score <- nchar(regex) + penalty
  invisible(list(score = score, matched_x = matched_x,
                  unmatched_x = unmatched_x, matched_y = matched_y,
                  unmatched_y = unmatched_y
))
}

pat_1 <- ".*foo.*"
pat_2 <- ".*ick$"
pat_3 <- "^[a-f]*"
pat_4 <- ".*(.{3,}).*\\1.*"
pat_5 <- "^(?!.*(.)(.)\\2\\1).*"
pat_6 <- "^(.)(.).*\\2\\1"
pat_7 <- "^(?!(xx+)\\1+$).*"
pat_8 <- ".*(.)(.\\1){3}.*"
pat_9 <- "^a*b*c*d*e*f*g*h*i*l*m*n*o*p*r*s*t*w*y*z*"
pat_12 <- "^(\\b(a*e*r*s*t*){2}.*\\b){7}$"