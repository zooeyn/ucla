# PROBLEM 1

## pqnumber constructor
pqnumber <- function(sign, p, q, nums) {
  if(!any(sign == c(-1,1))) {
    stop("Sign must be -1 or 1.")
  }
  if(round(p) != p ||
     round(q) != q ||
     length(p) != 1 ||
     length(q) != 1 ||
     p < 0 ||
     q < 0) {
    stop("Must have single-valued positive integers p and q.")
  }
  if(!is.vector(nums) ||
     length(nums) != p + q + 1 ||
     !all(nums %in% 0:9)) {
    stop("Nums must be vector of values from 0 to 9 with length p + q + 1.")
  }
  structure(list(sign = sign, p = p, q = q, nums = nums), class = "pqnumber")
}

## pqnumber check and print
is_pqnumber <- function(x) {
  return(inherits(x, "pqnumber"))
}
print <- function(x) {
  if (!is_pqnumber(x)) {
    stop("Must input pqnumber for printing.")
  }
  pq <- seq(-x$p, x$q)
  for (i in seq(length(x$nums), 1)) {
    cat(x$nums[i])
    if(pq[i] == 0) {
      cat(".")
    }
  }
}

## pqnumber to/from numeric

as_pqnumber <- function(x) {
  UseMethod("as_pqnumber")
}

as_numeric <- function(x) {
  UseMethod("as_numeric")
}

as_pqnumber.numeric <- function(x) {
  x_str <- as.character(x)
  sign <- ifelse(substr(x_str, 1, 1) == "-", -1, 1)
  pq_strings <- unlist(strsplit(x_str, "[-.]"))
  p <- nchar(pq_strings[[2]])
  q <- nchar(pq_strings[[1]]) - 1
  nums <- c()
  for (i in seq(nchar(x_str), 1)) {
    ch <- substr(x_str, i, i)
    if(ch == "." || ch == "-") {
      next
    }
    nums <- c(nums, as.numeric(ch))
  }
  return(pqnumber(sign, p, q, nums))
}

as_numeric.pqnumber <- function(x) {
  pq <- seq(-x$p, x$q)
  sum <- 0
  for(i in seq(1, length(x$nums))) {
    place <- x$nums[i] * (10 ^ pq[i])
    sum <- sum + place
  }
  return(x$sign * sum)
}
a <- pqnumber(sign = 1, p = 3, q = 4, nums = c(0, 4, 1, 3, 0, 0, 0, 0))
b <- pqnumber(sign = 1, p = 6, q = 0, nums = 3:9)

## add, subtract, and multiply
pq_add <- function(a, b) {
  if(!is_pqnumber(a) || !is_pqnumber(b)) {
    stop("Inputs must be two valid pqnumbers.")
  }
  # if (a$sign != b$sign) {
  #   return(pq_subtract(a,b))
  # }
  sign <- a$sign
  # set up x and y arrays for easy coordination
  p <- max(a$p, b$p)
  q <- max(a$q, b$q)
  x <- c(rep(0, p - a$p), a$nums, rep(0, q - a$q))
  y <- c(rep(0, p - b$p), b$nums, rep(0, q - b$q))
  # carry function
  carry <- 0
  z <- numeric(p+q+1)
  for (i in seq(1, p+q)) {
    temp <- x[i] + y[i] + carry
    z[i] <- temp %% 10
    carry <- floor(temp/10)
  }
  z[p+q+1] <- carry
  return(pqnumber(sign, p, q, z))
}

# pq_subtract <- function(a, b) {
#   if(!is_pqnumber(a) || !is_pqnumber(b)) {
#     stop("Inputs must be two valid pqnumbers.")
#   }
#   # set up small and large arrays for easy coordination
#   p <- max(a$p, b$p)
#   q <- max(a$q, b$q)
#   x <- c(rep(0, p - a$p), a$nums, rep(0, q - a$q))
#   y <- c(rep(0, p - b$p), b$nums, rep(0, q - b$q))
#   # carry function
#   borrow <- 0
#   z <- numeric(p+q+1)
#   for (i in seq(1, p+q)) {
#     temp <- x[i] - y[i] - borrow
#     z[i] <- temp %% 10
#     borrow <- temp / 10
#   }
#   z[p+q+1] <- borrow
# }
#



### PROBLEM 2
my_sqrt <- function(a, tol=.Machine$double.eps, iter_max=10000, verbose=FALSE) {
  x <- a
  for(i in seq(1, iter_max)) {
    x_new <- 0.5 * (x + a/x)
    if(verbose) {
      cat(x_new, "\n")
    }
    if(abs(x - x_new) <= tol) {
      x <- x_new
      break
    }
    x <- x_new
  }
  x
}

my_root <- function(a, n=2, tol=.Machine$double.eps, iter_max=10000, verbose=FALSE) {
  x <- a
  for(i in seq(1, iter_max)) {
    x_new <- x - x/n + a/(n*x^(n-1))
    if(verbose) {
      cat(x_new, "\n")
    }
    if(abs(x - x_new) <= tol) {
      x <- x_new
      break
    }
    x <- x_new
  }
  x
}






