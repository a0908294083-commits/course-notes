@echo off
chcp 65001 >nul
set "SRC=D:\Documents\个人\广工\obsidan\课程"
set "DST=D:\课程分享库"

echo === 源目录检查 ===
if exist "%SRC%\课程笔记" (echo SRC OK) else (echo SRC MISSING)
if exist "%DST%\课程笔记" (echo DST OK) else (echo DST MISSING)
echo.

echo === 执行 robocopy ===
robocopy "%SRC%\课程笔记" "%DST%\课程笔记" /MIR /NFL /NDL /NJH /NJS
echo ROBO_EXIT=%errorlevel%
echo.

echo === 同步后文件时间 ===
dir "%DST%\课程笔记\统计学"
