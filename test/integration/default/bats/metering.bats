# vim: ft=sh:

@test "metering registered with etcd" {
  curl http://127.0.0.1:4001/v1/keys/services/metering-api/members
}

@test "metering-api is running" {
  netstat -tan | grep 8777
}
