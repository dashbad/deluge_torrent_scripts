#!/bin/bash

export id="$1"
export name="$2"
export path="$3"

/shared/scripts/scp_torrent2.sh &
