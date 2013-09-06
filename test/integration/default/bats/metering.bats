# vim: ft=sh:

@test "metering-api is running" {
  netstat -tan | grep 8777
}
