D = Steep::Diagnostic

target :lib do
  signature "sig"

  check "lib"

  library "uri"
  library "net-http"

  configure_code_diagnostics(D::Ruby.default)
end

target :test do
  signature "sig", "sig-test"

  check "test"

  library "minitest"
  configure_code_diagnostics(D::Ruby.default)
end
