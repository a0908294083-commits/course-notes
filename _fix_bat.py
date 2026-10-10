# -*- coding: utf-8 -*-
# 把同步笔记.bat 用 GBK + CRLF 重新生成，解决 cmd 下中文乱码 + 首字符吞噬问题

content = r'''@echo off
setlocal

set "SRC=D:\Documents\个人\广工\obsidan\课程"
set "DST=D:\课程分享库"

echo.
echo [1/4] 同步【课程笔记】...
robocopy "%SRC%\课程笔记" "%DST%\课程笔记" /MIR /NFL /NDL /NJH /NJS
if errorlevel 8 ( echo    !! 同步失败，请检查路径 ^& pause ^& exit /b 1 )
echo     完成

echo [2/4] 同步【复习提纲】...
robocopy "%SRC%\复习提纲" "%DST%\复习提纲" /MIR /NFL /NDL /NJH /NJS
if errorlevel 8 ( echo    !! 同步失败，请检查路径 ^& pause ^& exit /b 1 )
echo     完成

echo [3/4] 同步【assets】附件图片...
robocopy "%SRC%\assets" "%DST%\assets" /MIR /NFL /NDL /NJH /NJS
echo     完成

echo [4/4] 提交并推送到 GitHub...
cd /d "%DST%"
git add -A
git commit -m "更新课程笔记"
git push

echo.
echo ============================================
echo  同步完成！同学 git pull 即可看到最新内容。
echo ============================================
pause
'''

data = content.replace('\n', '\r\n').encode('gbk')
with open('同步笔记.bat', 'wb') as f:
    f.write(data)
print('OK 已写入 GBK，字节数:', len(data))
print('前16字节(hex):', data[:16].hex())
