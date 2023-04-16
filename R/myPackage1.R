#' Constructor for the function
#'
#' @param x
#' @param y
#' @param alpha
#'
#' @return list of the data frame
#' @export
#'
#' @examples
myconstr = function(x, y, alpha){

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


# plot function
#' Title
#'
#' @param x
#' @param pch
#' @param bg
#' @param cex
#'
#' @return
#' @export
#'
#' @examples
plot.Rttest = function(x, pch=21,bg="Blue", cex =3){
  plot(x[["data"]][["x"]],x[["data"]][["y"]],
       pch = pch,
       bg = bg,
       xlab = "x",
       ylab = "y"
  )
}



# print function
#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
print.Rttest = function(x) {

  kable(x$data,                               # access the dataframe from obj
        booktabs   = TRUE,                    # give default formatting of table
        table.attr = "style='width:50%;'",    # change table width
        align      = "c") %>%                 # center alignment

    # change column header style
    row_spec(row = 0, color = "white", background = "#FF5733") %>%

    # styling of the font
    kable_styling(latex_options = "scale_down")
}
