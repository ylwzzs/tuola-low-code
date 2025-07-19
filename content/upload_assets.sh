#!/bin/bash
ASSETS_DIR="/Users/zhangduo/Documents/拖拉低代码帮助手册/T-builder应用搭建中心.assets"
find "$ASSETS_DIR" -type f -print0 | while IFS= read -r -d $'\0' file
do
  picgo upload "$file"
done