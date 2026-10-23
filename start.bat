@echo off
rem 啟動「新界喇沙中學交通 Dashboard」
cd /d "%~dp0"
echo 正在啟動伺服器... 請在瀏覽器開啟 http://localhost:8765
start "" http://localhost:8765
python -m http.server 8765
