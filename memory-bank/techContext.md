# 技術情境 (Technical Context)

## 1. 核心技術架構 (Core Technology Stack)

*   **靜態網站生成器 (SSG):** Hugo
    *   *理由：* 產生靜態 HTML 檔案，加載速度快，安全性高，易於部署和維護，符合專案對輕量化與高可靠性的要求。
*   **網站託管與部署 (Hosting & Deployment):** Cloudflare Pages
    *   *理由：* 與 Git 整合良好，提供自動建置與部署流程，全球 CDN 加速，免費方案功能強大，包含 HTTPS。
*   **域名管理與 CDN (Domain & CDN):** Cloudflare (自購域名)
    *   *理由：* Cloudflare Pages 本身即整合 Cloudflare 的 CDN 和 DNS 服務。
*   **版本控制 (Version Control):** Git (例如使用 GitHub 或 GitLab)
    *   *理由：* 有效管理程式碼和內容變更，便於協作和版本回溯。
*   **主要語言 (Primary Language):** 繁體中文

## 2. 一般網站需求 (General Website Requirements)

*   **響應式網頁設計 (RWD):** 確保在桌機、筆電、平板、手機等不同裝置上的最佳瀏覽體驗。
*   **繁體中文介面與內容:** 所有網站內容和操作介面均使用繁體中文，並考慮台灣使用者習慣。
*   **輕量化與快速載入:**
    *   優化圖片大小 (例如使用 WebP 格式，適當壓縮)。
    *   精簡 CSS 和 JavaScript (Hugo 本身有助於此)。
    *   考慮圖片懶加載 (Lazy Loading)。
*   **高可靠性與低維護:** 選擇 SSG 以降低因框架更新導致錯誤的風險，追求系統穩定性。
*   **跨瀏覽器兼容性:** 支援主流現代瀏覽器 (Chrome, Edge, Firefox, Safari 最新版本)。

## 3. 內容管理與更新流程 (Content Management & Update Process)

*   **內容格式:** 主要使用 Markdown (`.md`) 撰寫新文章 (如最新消息、案例分享)。
*   **更新流程:**
    1.  技術人員使用 Markdown 撰寫新內容，準備相關圖片。
    2.  將 Markdown 檔案及圖片檔案放置於 Hugo 專案指定的內容資料夾內 (例如 `content/news/`, `content/case-studies/`)。
    3.  (建議) 技術人員在本地端運行 `hugo server` 預覽變更。
    4.  確認無誤後，使用 Git 將變更提交 (`git commit`) 並推送 (`git push`) 到遠端 Git 倉庫。
    5.  Cloudflare Pages 自動偵測到 Git 倉庫的更新，觸發自動建置 (build) 與部署 (deploy) 流程。
    6.  數分鐘後，更新內容即會顯示於線上網站。
*   **負責人員:** 公司內部基礎技術人員。

## 4. 技術需求 (Technical Requirements)

### 4.1 效能 (Performance)

*   目標 Google PageSpeed Insights 分數在良好水平 (行動裝置與桌機)。
*   首次內容繪製 (FCP) 和最大內容繪製 (LCP) 時間盡可能短。
*   實施圖片懶加載 (Lazy Loading)。

### 4.2 安全性 (Security)

*   全站 HTTPS 加密 (由 Cloudflare Pages 自動提供)。
*   利用 Cloudflare 提供的基礎安全防護 (如 DDoS 緩解、WAF 基礎規則)。
*   避免使用有已知安全漏洞的第三方函式庫 (若有使用，需謹慎評估)。

### 4.3 搜尋引擎優化 (SEO) 基礎 (SEO Basics)

*   每個頁面應有獨立且具描述性的 `<title>` 標籤和 `meta description`。
*   語義化的 HTML 結構 (H1, H2, H3 等標題標籤的正確使用)。
*   產生 `sitemap.xml` 並提交給搜尋引擎 (Hugo 可自動產生)。
*   產生 `robots.txt` 檔案 (Hugo 可配置)。
*   URL 結構清晰且具可讀性 (Hugo 預設支持)。
*   內部連結策略，將相關頁面串聯起來。

### 4.4 備份與維護 (Backup & Maintenance)

*   **備份策略:**
    *   主要備份為遠端 Git 倉庫。
    *   技術人員應定期將本地 Git 倉庫副本備份至公司內部儲存或其他安全位置。
*   **維護:**
    *   Hugo 版本更新：視情況由技術人員評估是否需要更新到最新穩定版。
    *   內容更新：依據「2.5 內容管理與更新流程」執行。

## 5. 開發環境與工具 (Development Environment & Tools - 建議)

*   **程式碼編輯器:** VS Code 或其他支援 Markdown 和 Hugo 開發的編輯器。
*   **Hugo 安裝:** 根據作業系統安裝 Hugo。
*   **Git 客戶端:** 用於版本控制。
*   **瀏覽器開發者工具:** 用於調試和效能分析。

## 6. Hugo 模板除錯與網站評估工作流程 (Hugo Template Debugging & Website Evaluation Workflow)

當遇到 Hugo 模板渲染問題或需要評估網站呈現效果時，可遵循以下步驟進行除錯與評估：

1.  **啟動本地開發伺服器：**
    *   進入 Hugo 專案根目錄 (例如 `kirstie-website/`)。
    *   執行命令：`hugo server -D -F` (在 PowerShell 中使用 `;` 連接，例如 `cd kirstie-website; hugo server -D -F`)。
    *   注意伺服器啟動後顯示的 URL (通常是 `http://localhost:1313/` 或其他可用端口)。

2.  **使用瀏覽器工具評估：**
    *   使用 `browser_action` 工具啟動瀏覽器並導航到本地伺服器提供的 URL (例如 `http://localhost:1313/` 或 `http://localhost:64316/`)。
    *   **視覺檢查：** 仔細檢查每個頁面的佈局、文字內容、圖片顯示、導覽列和頁尾是否符合預期。特別注意圖片是否正確載入，佔位符圖片是否按預期顯示。
    *   **功能測試：** 點擊導覽列連結、行動呼籲按鈕等，確認頁面跳轉是否正確。
    *   **響應式設計檢查：** 透過 `browser_action` 觀察不同螢幕尺寸下的顯示效果 (雖然 `browser_action` 預設是 900x600，但可以模擬不同尺寸)。
    *   **控制台日誌：** 檢查 `browser_action` 返回的控制台日誌，尋找潛在的 JavaScript 錯誤或資源載入失敗警告。
    *   **截圖分析：** 仔細分析 `browser_action` 返回的截圖，確認視覺呈現。

3.  **識別問題模板或內容：**
    *   根據瀏覽器評估結果，初步判斷可能涉及的模板文件或 Markdown 內容。
    *   利用 `search_files` 工具在 `layouts/` 或 `themes/your-theme/layouts/` 目錄下搜尋相關的 HTML 結構、CSS 類名或 Hugo 函數 (例如 `time.Format`, `partial`)。

4.  **添加除錯訊息 (若有必要)：**
    *   在懷疑的模板文件（例如 `layouts/partials/views/card.html` 或 `layouts/partials/components/last-edited.html`）中，添加顯眼的 HTML 註釋或 `<p>` 標籤來輸出變數值或確認模板是否被渲染。
    *   範例：`<p style="background-color: yellow; color: black;">DEBUG: Section: {{ .Section }}, Type: {{ .Type }}</p>`
    *   確保除錯訊息放置在變數被定義之後，以避免「undefined variable」錯誤。

5.  **迭代與修正：**
    *   根據除錯訊息和觀察結果，調整模板邏輯或 Markdown 內容。
    *   每次修改後，Hugo 會自動重建網站，然後再次使用 `browser_action` 刷新頁面進行驗證。
    *   重複此過程直到問題解決。

6.  **清理除錯訊息：**
    *   問題解決後，務必移除所有添加的除錯訊息，以保持代碼的整潔。

*此文件將隨著專案進展和設計細化而持續更新。*
