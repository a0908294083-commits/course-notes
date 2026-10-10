@echo off
chcp 65001 >nul
setlocal

REM ============================================================
REM  课程分享库 - 一键同步脚本
REM  作用：把你原始 Obsidian 库里的「课程笔记」和「复习提纲」
REM        同步到 D:\课程分享库，然后提交到 Git 仓库。
REM  用法：双击本文件即可。
REM ============================================================

set "SRC=D:\Documents\个人\广工\obsidan\课程"
set "DST=D:\课程分享库"

echo.
echo [1/4] 同步「课程笔记」...
robocopy "%SRC%\课程笔记" "%DST%\课程笔记" /MIR /NFL /NDL /NJH /NJS >nul
if errorlevel 8 ( echo    !! 同步失败，请检查路径 & pause & exit /b 1 )
echo     完成

echo [2/4] 同步「复习提纲」...
robocopy "%SRC%\复习提纲" "%DST%\复习提纲" /MIR /NFL /NDL /NJH /NJS >nul
if errorlevel 8 ( echo    !! 同步失败，请检查路径 & pause & exit /b 1 )
echo     完成

echo [3/4] 同步「assets」（附件图片）...
robocopy "%SRC%\assets" "%DST%\assets" /MIR /NFL /NDL /NJH /NJS >nul
echo     完成

echo [4/4] 提交并推送到 GitHub...
cd /d "%DST%"
git add -A
git commit -m "更新课程笔记  %date% %time%"
git push

echo.
echo ============================================
echo  同步完成！同学现在拉取就能看到最新内容。
echo ============================================
pause
