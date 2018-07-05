#! /usr/bin/env bats

# Variable SUT_IP should be set outside this script and should contain the IP
# address of the System Under Test.

# Tests

@test 'Prometheus listens 9090' {
  run bash -c "curl http://${SUT_IP}:9090/metrics"
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]
  [[ "${output}" =~ 'go_goroutines' ]]
}
