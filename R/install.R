#' @export
install <- function(){
  dependency(get_os())
  sys::exec_wait("curl", args = c("-o","install.sh", "https://get.sdkman.io"))
  sys::exec_wait("bash", args = c("install.sh"))
  fs::file_delete("install.sh")
}

#' @export
sdk_version <- function(){
  sys::exec_wait("bash", args = c("-c","source $HOME/.sdkman/bin/sdkman-init.sh && sdk version"))
}
