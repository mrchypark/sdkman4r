sdk <- function(args = ""){
  root <- "source $HOME/.sdkman/bin/sdkman-init.sh && sdk"
  args <- paste(root, args)
  tem <- sys::exec_wait("bash", args = c("-c", args))
  invisible(tem)
}

#' Get os info
#' 
#' @export
get_os <- function(){
  os <- "os_class"
  bits <- Sys.info()["machine"]
  if (grepl("x86", bits) & grepl("64", bits)) {
    bits <- "x64"
  }
  class(os) <- paste0(Sys.info()["sysname"], as.character(bits))
  return(os)
}

dependency <- function(os){
  UseMethod("dependency")
}

dependency.default <- function(os){
  stop("no method for ", class(os)[1L])
}

dependency.Darwinx64 <- function(os){
  invisible(os)
}

dependency.Linuxx64 <- function(os){
  sys::exec_wait("apt-get", args = "update")
  sys::exec_wait("apt-get", args = c("install","-y","curl","zip","unzip"))
}
