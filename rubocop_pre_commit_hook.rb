#!/bin/bash

# Запуск RuboCop перед каждым коммитом
bundle exec rubocop
if [ $? -ne 0 ]; then
  echo "RuboCop found issues. Commit aborted."
  exit 1
fi
