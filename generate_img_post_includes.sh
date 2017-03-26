#!/bin/bash
for i in $(ls $1);
do
  echo "{% include image name=\"$i\" alt=\"TODO\" %}" 
done
