messy_impute <- function(df, center, margin) {
  # Replace missing values in the gradebook with expected values.
  # Args:
  # df: Gradebook data table.
  # center: The function that will be used to calculate center.
  # margin: 1 or 2, indicating to calculate the center by the row or column respectively.
  # Return:
  # An imputed tibble.
  df <- as_tibble(df)
  hw_index <- is.na(df$Homework_10)
  exam_index <- is.na(df$Exam_3)
  centers <- apply(df, margin, center)
  if (margin == 1) {
    df[hw_index, "Homework_10"] <- centers[hw_index]
    df[exam_index, "Exam_3"] <- centers[exam_index]
  } else if (margin == 2) {
    df[hw_index,] <- centers$Homework_10
    df[exam_index, "Exam_3"] <- centers$Exam_3
  } else {
    stop("Please input valid margin.")
  }
  return(df)
}

tidy_impute <- function(df, center, margin) {
  return(df)
}