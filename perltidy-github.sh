#!/bin/sh

result=0
for file in $(find . -name '*.pl' -o -name '*.pm' | sort); do
  check="$(perltidy -st "$file" | git diff --no-index -- "$file" - )"
  if [ -n "$check" ]; then
    echo -e "\033[1;31mError:\033[0m [perltidy] $file:"
    echo "$check"
    result=1
  fi
done
exit $result
