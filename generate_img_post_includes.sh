#!/bin/bash
for arg in "$@";
do
  echo "{% include image name=\"$arg\" alt=\"TODO\" %}" 
done
