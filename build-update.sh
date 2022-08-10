#!/usr/bin/env bash

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

gitbook_root=$(dirname -- "${BASH_SOURCE-$0}")
gitbook_root=$(cd -- "$dir"; pwd)

versions=( 0.2 )
languages=( "ko" "en" )

for lang in "${languages[@]}"
do
  rm -rf $gitbook_root/docs/$lang
  gitbook build $gitbook_root/$lang $gitbook_root/docs/$lang

  for ver in "${versions[@]}"
  do
    gitbook build $gitbook_root/archive/$lang/$ver $gitbook_root/docs/$lang/$ver
  done
done
