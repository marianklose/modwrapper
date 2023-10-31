
###############################################################################
############################ read_mod #########################################
###############################################################################

#' Read in NONMEM model file for pharmpy
#'
#' @param dir Character string with the path to the NONMEM model file
#' @param modfile Character string with name of the model file
#'
#' @return Returns the pharmr model object
#' @export
#'
#' @import pharmr
#'
#' @examples
#' \dontrun{
#' read_mod(dir = './01_NONMEM/01_BaseModel/', modfile = "run026.mod")
#' }
read_mod <- function(dir, modfile) {
  tryCatch(
    expr = {
      modpath <- paste0(dir, modfile)
      model <- pharmr::read_model(modpath)
      return(model)
    },
    error = function(e) {
      print(paste("Caught an error:", e$message))
    },
    warning = function(w) {
      print(paste("Caught a warning:", w$message))
    },
    message = function(m) {
      print(paste("Caught a message:", m$message))
    }
  )
}



###############################################################################
############################ run_nonmem #######################################
###############################################################################

#' Fit defined NONMMEM model according to the current pharmpy functions.
#'
#' @param model pharmpy model object
#' @param dir Character string providing the output directory (folder) where
#' the modelfit content will be saved.
#'
#' @return Returns the results from pharmpr::fit()
#' @export
#'
#' @import pharmr
#'
#' @examples
#' \dontrun{
#' run_nonmem(model = model)
#' }
run_nonmem <- function(model, dir) {
  tryCatch(
    expr = {
      # fit the model
      res <- pharmr::run_modelfit(model, path=dir)
      # return
      return(res)
    },
    error = function(e) {
      print(paste("Caught an error:", e$message))
    },
    warning = function(w) {
      print(paste("Caught a warning:", w$message))
    },
    message = function(m) {
      print(paste("Caught a message:", m$message))
    }
  )
}
