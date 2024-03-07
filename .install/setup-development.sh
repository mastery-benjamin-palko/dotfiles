#!/bin/bash

dev=~/Development
if [ ! -d "${dev}" ]; then
  echo "Creating development directory: $dev"
  mkdir $dev
fi

git clone https://github.com/masterysystems/record-management-db-migrations.git ${dev}/record-management-db-migrations
git clone https://github.com/masterysystems/carrier.git ${dev}/carrier
git clone https://github.com/masterysystems/customer.git ${dev}/customer
git clone https://github.com/masterysystems/employee.git ${dev}/employee
git clone https://github.com/masterysystems/facility.git ${dev}/facility
git clone https://github.com/masterysystems/mastery-frontend.git ${dev}/mastery-frontend
git clone https://github.com/mastery-benjamin-palko/ornn.git ${dev}/ornn

