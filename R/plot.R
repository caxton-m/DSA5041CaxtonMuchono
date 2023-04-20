
#' An informative plot with the "Rttest" class
#'
#' @param x named list of myconstr function
#' @param ... from ggplot function
#' @importFrom ggplot2 'aes' 'geom_boxplot' 'ggplot'
#'
#' @return plot of the data frame
#' @export plot.Rttest
#'
#' @export
#'
#' @examples
plot.Rttest = function(x, ...){

  data_var = NULL    # the letter of the the data (X or Y)
  value    = NULL    # value of data

  x_data = data.frame(value = x$data$x, data_var = rep(LETTERS[24]))
  y_data = data.frame(value = x$data$y, data_var = rep(LETTERS[25]))

  merge_data = merge(x = x_data, y = y_data, all = TRUE)

  ggplot(merge_data, aes(x = data_var , y= value , fill=data_var )) +
    geom_boxplot()
}
