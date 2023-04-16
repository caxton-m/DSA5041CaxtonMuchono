
#' An informative plot with the "Rttest" class
#'
#' @param x named list of myconstr function
#' @param ... from print function
#' @param pch single character to be used as the default in plotting points
#' @param bg The color to be used for the background of the device region
#' @param cex A numerical value giving the amount by which plotting text
#'             and symbols should be magnified relative to the default.
#'
#' @return plot of the data frame
#' @export plot.Rttest
#'
#' @export
#'
#' @examples
plot.Rttest = function(x, pch=21,bg="Blue", cex =3, ...){
  plot(x[["data"]][["x"]],x[["data"]][["y"]],
       pch = pch,
       bg = bg,
       xlab = "x",
       ylab = "y"
  )
}
