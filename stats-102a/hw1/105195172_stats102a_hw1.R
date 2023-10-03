gcd <- function(x, y) {
  #Return greatest common divisor.
  #Args:
  #x: single integer
  #y: single integer
  #Return:
  #single integer
  if (x == 0) {
    return(y)
  } else if (y == 0) {
    return(x)
  } else if (x %% 1 != 0 || y %% 1 != 0) {
    stop("Decimals are not valid input.")
  }
  a <- max(abs(x), abs(y))
  b <- min(abs(x), abs(y))
  c <- a %% b
  return(gcd(b, c))
}

lcm <- function(nums) {
  #Return least common multiple of all vector elements.
  #Args:
  #nums: vector of integers
  #Return:
  #single integer

  while (length(nums) >= 2) {
    a <- nums[1]
    b <- nums[2]
    least <- (a * b) / gcd(a, b)
    nums <- c(least, nums[-c(1,2)])
  }
  return(nums[1])
}

get_factors <- function(x) {
  #Return unique prime factors of x.
  #Args:
  #x: single positive integer over 2
  #Return:
  #vector of prime integers

  v <- numeric()
  if (x <= 1 || x %% 1 != 0) {
    stop("No prime factors. Please input positive integer over 2.")
  }
  for (i in 2:x) {
    if ((x %% i == 0) && (is_prime(i))) {
      v <- c(v, i)
    }
  }
  return(v)
}

is_prime <- function(x) {
  #Returns TRUE if prime and FALSE if not prime.
  #Args:
  #x: numeric or numeric vector
  #Return:
  #boolean or boolean vector

  sapply(x, function(a) {
    if (a == 0 || a == 1 || a < 0) {
      return(FALSE)
    }
    for (i in 2:sqrt(a)) {
      if ((a %% i == 0) && (a != i)) {
        return(FALSE)
      }
    }
    return(TRUE)
  }
  )
}
