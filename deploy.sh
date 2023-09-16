echo "Start"
git add .
git commit -m backup
git push main
hexo g
hexo d
echo "Finish"
echo 按任意键继续
read -n 1