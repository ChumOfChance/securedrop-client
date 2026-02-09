#!/bin/bash
scan=0
mkdir ~/gd-scans
while read -r line; do
        rm package/
        archive=$(npm pack $line | tail -n1)
        tar -xzf $archive
        guarddog --log-level debug npm scan package/ --output-format sarif >> ~/gd-scans/guarddog-$scan.sarif
        ((scan++))
done < packages.txt
