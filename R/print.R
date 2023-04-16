
#' Print the data frame using kableExtra::kable()
#'
#' @param x named list of myconstr function
#' @param ... from print function
#' @importFrom kableExtra 'kable' 'row_spec' 'kable_styling'
#'
#' @return a data frame in the kableExtra format
#' @export print.Rttest
#'
#' @export
#'
#' @examples
print.Rttest = function(x, ...) {

  kable(x$data,                               # access the dataframe from obj
        booktabs   = TRUE,                    # give default formatting of table
        table.attr = "style='width:50%;'",    # change table width
        align      = "c") %>%                 # center alignment

    # change column header style
    row_spec(row = 0, color = "white", background = "#FF5733") %>%

    # styling of the font
    kable_styling(latex_options = "scale_down")
}
