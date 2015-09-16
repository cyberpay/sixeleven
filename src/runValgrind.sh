#!/bin/bash

valgrind --leak-check=full ./611d 2>&1 | tee valgrind.log
