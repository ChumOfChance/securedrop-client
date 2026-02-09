#!/bin/bash
scan=0
mkdir /tmp/gd-scans
while read -r line; do
        rm package/
        archive=$(npm pack $line | tail -n1)
        tar -xzf $archive
        guarddog --log-level debug npm scan package/ --output-format sarif >> /tmp/guarddog-$scan.sarif
        ((scan++))
done < packages.txt
