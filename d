#!/bin/bash
# Usage:
#   ./d build   # build the image
#   ./d test    # run wkhtmltopdf on test.html
#   ./d test2   # run wkhtmltopdf on test2.html

docker_run() {
  local bin=${2:-/wkhtmltox/bin/wkhtmltopdf}
  docker run --rm \
    -v $PWD/input:/tmp/input \
    -v $PWD/output:/tmp/output \
    wkhtmltopdf-test \
    $bin /tmp/input/$1.html /tmp/output/$1.pdf
  open output/$1.pdf
}

case "$1" in
build)
  docker build -t wkhtmltopdf-test .
  ;;
test)
  docker_run test
  ;;
test2)
  docker_run test2
  ;;
test2-v9)
  docker_run test2 /usr/local/bin/wkhtmltopdf.9
  ;;
*)
  echo "Usage: ./d [build|test|test2]"
esac
