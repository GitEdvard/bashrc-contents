#! /bin/bash

kill -9 $(ps -aux | grep edvard_mock | grep -v grep | awk '{print $2}')
