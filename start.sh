#!/bin/bash
  
# turn on bash's job control
set -m
  
# Start the primary process and put it in the background
mongod &
  
# Start the helper process
python3 index.py

# now we bring the primary process back into the foreground
# and leave it there
fg %1