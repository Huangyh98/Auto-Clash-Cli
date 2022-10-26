#!/bin/bash
rm clash/configs/config.yaml
wget $(cat ./clash_link.txt) -O clash/configs/config.yaml