#!/bin/bash
#
# Ops-Pipeline - Templates for automating the production and consumption of images
# and containers.
#
# Copyright 2016 Capital One Services, LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

org=tompscanlan
export 'PACKER_LOG=1'
#./packer/build-iso-to-vm.sh

#packer build -force -var "version=$version" packer/headless-stage-2.json

#packer build -only ubuntu-virtualbox -var "version=$version" packer/headless.json


if test ! -f "${org}-alpine-headless-${version}.tar"; then
  packer build -only alpine-docker -var "org=${org}" -var "version=$version" packer/headless.json
fi
if test ! -f "${org}-ubuntu-headless-${version}.tar"; then
  packer build -only ubuntu-docker -var "org=${org}" -var "version=$version" packer/headless.json
fi
if  test ! -f "${org}-headless-ubuntu-virtualbox-${version}.box"; then
  packer build -force -only ubuntu-virtualbox -var "org=${org}" -var "version=$version" packer/headless.json
fi
if  test ! -f "${org}-headless-ubuntu-vmware-${version}.box"; then
  packer build -force -only ubuntu-vmware -var "org=${org}" -var "version=$version" packer/headless.json
fi
if  test ! -f "${org}-headless-centos-vmware-${version}.box"; then
  packer build -force -only centos-vmware -var "org=${org}" -var "version=$version" packer/headless.json
fi
if  test ! -f "${org}-headless-ubuntu-virtualbox-${version}.box"; then
  packer build -force -only ubuntu-virtualbox -var "org=${org}" -var "version=$version" packer/headless.json
fi
if  test ! -f "${org}-headless-centos-virtualbox-${version}.box"; then
  packer build -force -only centos-virtualbox -var "org=${org}" -var "version=$version" packer/headless.json
fi