#' The constructor function will takes two vectors and alpha.
#' Assume that the variances in the population are the same
#' (this will mean a simple no conditional function)
#'
#' @param x first vector
#' @param y second vector
#' @param alpha confidence interval
#' @importFrom dplyr '%>%' filter
#' @importFrom stats 't.test'
#'
#' @return list of the data frame
#' @export
#'
#' @examples
myconstr = function(x, y, alpha){
  t.test = NULL

  # make t-test assuming that the variances in the population are the same
  tests = t.test(x = x, y = y, var.equal = TRUE, conf.level = 1 - alpha)

  # summary of t-test and its probabilities
  sum = summary(tests)

  # create a data frame
  df = data.frame(x = x, y = y)

  # find the confidence intervals and p-value
  conf_inter = tests$conf.int
  p_value = tests$p.value

  # make a named list of function
  fcn_list = list(data = df, alpha = alpha, conf_inter = conf_inter, p_value = p_value)

  # make list to be of class "Rttest"
  class(fcn_list) = "Rttest"

  return(fcn_list)
}

