#!/bin/bash
  
# turn on bash's job control
set -m
  
# Start the primary process and put it in the background
dockerd &
  
# Start the helper process
docker run --name mongodb -v ~/data:/data/db -d -p 27017:27017 mongo

# now we bring the primary process back into the foreground
# and leave it there
fg %1
