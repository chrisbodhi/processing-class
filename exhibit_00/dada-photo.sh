#!/bin/sh

go run webcam_facedetect.go && processing-java --sketch=`pwd` --output=`pwd`/output --force --run && gifsicle --delay=3 -O3 --loop artifacts/f*.gif > glitch.gif && ruby post-to-tumblr.rb

