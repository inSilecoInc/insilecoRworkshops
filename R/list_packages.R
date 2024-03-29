#' Create a list of packages
#'
#' In the first slides of a workshop the set of packages should be specified.
#' This function create a bullet points list with CRAN URL for packages as
#' well as a code chunk to install all packages.
#'
#' @param pkgs vector of packages.
#' @param add_cls a logical. Should the command lines to install packages be added.
#' @param clip a logical. Should the package list be copied to the clipboard.
#' @param show a logical. Should the badges be displayed?
#' @export
#' @examples
#' list_packages(c("cli", "glue"), clip = FALSE)

list_packages <- function(pkgs, add_cls = TRUE, clip = TRUE, show = FALSE) {

  out <- unlist(lapply(pkgs,
    function(x) glue("* [{x}](https://cran.r-project.org/package={x})")))

  if (add_cls) {
    tmp <- paste(paste("'", pkgs, "'", sep = ""), collapse = ", ")
    cls <- c("```R",
      paste0("install.packages(c(", tmp, "))"),
     "```")
    out <- append(out, c("\n<br>\n", cls))
  }
  out <- paste(out, collapse="\n")
  if (show) {
    cat(out, "\n")
  }
  if (clip) {
    write_clip(out)
    cli::cli_alert_info("package list copied to the clipboard!")
  }
  invisible(out)
}

