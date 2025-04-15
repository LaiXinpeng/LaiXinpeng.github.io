@echo off

rem Git 操作
git pull origin master

rem 备份 CNAME 文件（如果存在）
if exist public\CNAME (
    copy public\CNAME CNAME.bak
)

git add .
git commit -m "backup"
git push origin master

rem Hexo 生成和部署
hexo g

rem 恢复 CNAME 文件
if exist CNAME.bak (
    copy CNAME.bak public\CNAME
    del CNAME.bak
)

hexo d

rem 完成提示
echo Finish

rem 等待用户按任意键继续
echo 按任意键继续
pause >nul
