#!/bin/bash
  
# turn on bash's job control
set -m
  
# Start the primary process and put it in the background
dockerd &
  
# Start the helper process
echo Done!

# now we bring the primary process back into the foreground
# and leave it there
fg %1
