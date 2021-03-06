#' Install MLflow
#'
#' Installs MLflow for individual use.
#'
#' MLflow requires Python and Conda to be installed.
#' See \url{https://www.python.org/getit/} and \url{https://conda.io/docs/installation.html}.
#'
#' @examples
#' \dontrun{
#' library(mlflow)
#' mlflow_install()
#' }
#'
#' @importFrom reticulate conda_install conda_create conda_list
#' @export
mlflow_install <- function() {
  packages <- c(
    "pandas",
    "mlflow"
  )

  if (!"r-mlflow" %in% conda_list()$name) {
    conda_create("r-mlflow")
    conda_install(packages, envname = "r-mlflow", pip = TRUE)
  }
}

#' Uninstall MLflow
#'
#' Uninstalls MLflow by removing the Conda environment.
#'
#' @examples
#' \dontrun{
#' library(mlflow)
#' mlflow_install()
#' mlflow_uninstall()
#' }
#'
#' @importFrom reticulate conda_install conda_create conda_list
#' @export
mlflow_uninstall <- function() {
  reticulate::conda_remove(envname = "r-mlflow")
}
