#' @export
install <- function(){
  dependency(get_os())
  sys::exec_wait("curl", args = c('-s','"https://get.sdkman.io"','|',"bash"))
}

