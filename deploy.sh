#!/bin/bash

# Git 操作
git pull origin master
git add .
git commit -m "backup"
git push origin master

# Hexo 生成和部署
hexo g
hexo d

# 完成提示
echo "Finish"

# 等待用户输入，兼容 Linux、macOS 和 Windows
if [ "$(uname)" == "Darwin" ] || [ "$(uname)" == "Linux" ]; then
  # Linux 和 macOS 使用 read 命令
  echo "按任意键继续"
  read -n 1
else
  # Windows 使用 pause 命令
  echo "按任意键继续"
  pause
fi
