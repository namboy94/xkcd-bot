#!/bin/bash
# Copyright 2019 Hermann Krumrey <hermann@krumreyh.com>
#
# This file is part of xkcd-bot.
#
# xkcd-bot is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# xkcd-bot is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with xkcd-bot.  If not, see <http://www.gnu.org/licenses/>.

set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: backup.sh <backup-file>"
    exit 1
fi

DATA_VOLUME="xkcd-bot_data"
TARGET=$1

rm -rf backup
mkdir backup

docker-compose up --no-start
docker run --rm -v "$DATA_VOLUME":/data -v "$(pwd)"/backup:/target \
    ubuntu tar -zcvpf /target/data.tar.gz /data

tar -zcvpf "$TARGET" backup
rm -rf backup
