#!/bin/bash

# github login
if ! gh auth status >/dev/null 2>&1; then
  gh auth login
fi

dev=~/Development
repos=(
  "record-management-db-migrations"
  "carrier"
  "customer"
  "employee"
  "facility"
  "mastery-frontend"
)
if [ ! -d ${dev} ]; then
  echo "Creating development directory: $dev"
  mkdir $dev
fi

for repo in "${repos[@]}"; do
  dir=${dev}/${repo}
  if [ ! -d "${dir}" ]; then
    echo "Pulling ${repo}"
    git clone "https://github.com/masterysystems/${repo}.git" "${dir}"
  fi
done
