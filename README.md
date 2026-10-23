# 新界喇沙中學 · 公共交通到站 Dashboard

給同學即時查看學校附近巴士／小巴／港鐵到站時間的單一頁面 web app，
資料全部來自政府開放數據 API（無需 API key、無需登入）。

## 使用方法

1. 按兩下 `start.bat`（電腦需已安裝 Python 3）
2. 瀏覽器自動開啟 `http://localhost:8765`
3. 每 60 秒自動更新，亦可按「立即刷新」

> 進階：`index.html` 本身已可直接雙擊用瀏覽器開啟（三個 API 均允許跨域），
> 用 `start.bat` 只是方便固定網址。

## 收錄車站（已用官方座標核對距離）

| 車站 | 距校 | 路線 |
|---|---|---|
| 金錢路 · 近金錢村（校門外） | 約 93 米 | 專線小巴 **50A**（上水站 ⇄ 古洞南） |
| 金錢 (ND581) | 約 190 米 | 九巴 **76K** → 上水（清河） |
| 金錢 (ND192) | 約 286 米 | 九巴 **76K** → 朗屏邨 |
| 青山公路古洞段 · 近沙爾德聖保祿女修會 | 約 419 米 | 小巴 **50A / 50K / 51K / 51B** |
| 古洞路 · 近天巒 | 約 556 米 | 小巴 **50A / 50K** |
| 港鐵上水站 | — | 東鐵綫列車到站時間（轉乘參考） |

頂部「最快前往上水站」橫幅：自動比較各站班次 + 步行時間，顯示最快到上水的選擇。

## 資料來源

- 九巴／龍運：`data.etabus.gov.hk`（KMB ETA API v1.05）
- 專線小巴：`data.etagmb.gov.hk`（GMB ETA API v1.1）
- 港鐵：`rt.data.gov.hk`（MTR Next Train API，上水站代碼 `SHS`）

## 修改車站

用文字編輯器開啟 `index.html`，改 `<script>` 內 `STOPS` 陣列即可：
- `kind:"kmb"` — `sid` 用 16 位站號（可於 `data.etabus.gov.hk/v1/transport/kmb/stop/` 搜尋）
- `kind:"gmb"` — `sid` 用 GMB stop_id（`data.etagmb.gov.hk/route-stop/{route_id}/{route_seq}` 可查）
- 新 GMB 路線要同時在 `GMB_ROUTES` 加入 route_id 對照（含方向起訖點）

## 備註

- 「原定班次／未開出」= 按時間表推算，車輛尚未離開總站
- 到站時間受路況影響，只供參考
- 273A／79K（彩石邨，約 1.1 公里）暫未收錄，如需可照上法加入
