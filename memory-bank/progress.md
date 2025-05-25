# 專案進度 (Project Progress)

## 1. 目前專案狀態 (Current Project Status)

*   **整體階段:** 內容生成與初步客製化階段。
*   **進度概述:** 已成功在 `kirstie-website` 目錄下建立新的 Hugo 專案，並使用 Hugo Modules 方式整合本地的 `hugo-blox-builder` 佈景主題。完成了初步的內容及設定檔遷移，並經過多次除錯後，本地開發伺服器已可成功運行。目前網站主要頁面已填充佔位符內容，並進行了初步的瀏覽器評估。

## 2. 已完成的工作 (Completed Work)

*   **日期:** 2025-05-24 (持續更新)
    *   接收並詳細閱讀客戶提供的 PRD。
    *   與客戶溝通，確認目前無現成的公司 Logo、標準色、標準字等品牌素材。
    *   與客戶溝通，確認所有網站文案和圖片在初期均使用預留位置 (dummy content)。
    *   確認網站需使用繁體中文，並針對台灣使用者習慣進行設計。
    *   規劃 Memory Bank 核心檔案結構。
    *   已創建 Memory Bank 核心檔案 (`projectbrief.md`, `productContext.md`, `techContext.md`, `systemPatterns.md`, `activeContext.md` (舊版)) 的初始版本。
    *   **`kirstie-website` 專案技術建置與設定：**
        *   於 `kirstie-website` 目錄初始化新 Hugo 站點。
        *   安裝 Go 語言環境 (由客戶完成)。
        *   初始化 Hugo Modules (`hugo mod init`)。
        *   配置 `hugo.toml` 及 `go.mod`，透過 `replace` 指令將本地 `themes/hugo-blox-builder` 作為模組導入。
        *   執行 `hugo mod tidy` 解析並下載模組依賴 (如 `blox-bootstrap`, `blox-core`, `blox-plugin-netlify`, `blox-tailwind`)。
        *   將原專案根目錄的 `content/` (Markdown 檔案) 遷移至 `kirstie-website/content/`。
        *   將原專案根目錄的 `config/_default/` 設定檔遷移至 `kirstie-website/config/_default/`。
        *   調整 `kirstie-website` 的核心設定檔：
            *   `config/_default/languages.yaml`: 設定預設語言為 `zh-Hant`。
            *   `config/_default/menus.yaml`: 更新主選單以符合規劃的網站架構 (中文)。
            *   `config/_default/params.yaml`: 更新部分參數，如日期時間格式。
            *   `hugo.toml` 及 `config/_default/hugo.yaml`: 統一語言設定為 `zh-Hant` / `zh`，設定 `hasCJKLanguage: true`。
        *   針對建置錯誤進行除錯：
            *   修正語言設定衝突。
            *   暫時移除/修改 `content/_index.md` 中的 `cta-image-paragraph` 區塊及其他圖片引用。
            *   暫時移除/修改 `content/blog/data-visualization/index.md` 中的 `chart` 和 `table` 短代碼。
        *   成功啟動 `kirstie-website` 的 Hugo 本地開發伺服器。
        *   客戶已成功安裝/升級至 Hugo Extended 版本。
        *   使用 Hugo Extended 版本重新啟動開發伺服器，主要佈景主題相容性警告已解決。
        *   透過瀏覽器初步檢視本地運行的網站。
    *   更新 `memory-bank/activeContext.md` 至最新狀態。
    *   更新 `memory-bank/progress.md` (本檔案) 至最新狀態。
    *   **日期顯示問題修復：**
        *   **列表頁日期移除：** 發現 `hugo-blox-builder` 主題的 `layouts/partials/views/card.html` 模板直接渲染日期。已在專案的 `layouts/partials/views/` 目錄下創建 `card.html` 的覆蓋文件，並添加條件邏輯，確保只有當頁面的 `Section` 或 `Type` 為 "blog" 時才顯示日期。
        *   **單頁「最近更新」移除：** 發現 `hugo-blox-builder` 主題的 `layouts/partials/components/last-edited.html` 模板渲染「最近更新」文字。已在專案的 `layouts/partials/components/` 目錄下創建 `last-edited.html` 的覆蓋文件，並添加條件邏輯，確保只有當頁面的 `Section` 或 `Type` 為 "blog" 時才顯示此文字。
    *   **單頁「下一頁、上一頁」模組移除：**
        *   在 `kirstie-website/layouts/partials/` 目錄下創建了 `custom_page_footer.html`。
        *   在 `custom_page_footer.html` 中添加條件邏輯，判斷當前頁面的 `Type` 為 "page" 且 `File.BaseFileName` 為 "about", "contact", "privacy", 或 "terms" 時，不渲染原始的 `page_footer` 模組。
        *   修改 `kirstie-website/layouts/_default/single.html`，將原先調用 `page_footer` 的地方替換為調用 `custom_page_footer.html`。
    *   **頁面內容生成：**
        *   將 `kirstie-website\resources\_gen\images\media\placeholder-icon-design-free-vector.jpg` 複製到 `kirstie-website/assets/media/placeholder-icon.jpg`。
        *   修改 `kirstie-website/content/_index.md` (首頁) 的內容，使其符合公司業務，並使用佔位符圖片。
        *   修改 `kirstie-website/content/about.md` (關於我們) 的內容，填寫公司簡介、經營理念等。
        *   修改 `kirstie-website/content/products/_index.md` (產品與服務列表頁) 的內容，介紹主要產品類型和服務，並使用佔位符圖片。
        *   修改 `kirstie-website/content/products/standard-office/index.md` (標準辦公室組合屋詳細頁) 的內容，填寫產品詳情、應用場景、特色和規格，並使用佔位符圖片。
        *   修改 `kirstie-website/content/case-studies/_index.md` (工程實績與案例分享列表頁) 的內容，列出精選案例，並使用佔位符圖片。
        *   修改 `kirstie-website/content/case-studies/project-tech-park/index.md` (科技園區臨時辦公與住宿解決方案詳細頁) 的內容，填寫案例詳情、解決方案和成果，並使用佔位符圖片。
        *   修改 `kirstie-website/content/news/_index.md` (最新消息與行業資訊列表頁) 的內容，創建佔位符文章，並使用佔位符圖片。
        *   修改 `kirstie-website/content/contact.md` (聯絡我們) 的內容，填寫公司聯絡資訊和佔位符地圖。
        *   修改 `kirstie-website/content/privacy.md` (隱私權政策) 的內容，填寫通用隱私權政策範本。
        *   修改 `kirstie-website/content/terms.md` (服務條款) 的內容，填寫通用服務條款範本。
    *   **網站初步評估：**
        *   使用 `browser_action` 啟動本地伺服器並瀏覽網站。
        *   確認所有主要頁面內容已更新，佔位符圖片正確顯示。
        *   確認導覽列連結和行動呼籲按鈕功能正常。
        *   發現 `features` 區塊中使用的 `shield-halved.svg`, `leaf.svg`, `hand-holding-dollar.svg` 圖標缺失。
        *   確認網站中仍存在公司名稱、聯絡資訊等佔位符。
        *   將評估結果和建議記錄在 `techContext.md` 中。

## 3. 正在進行的工作 (Work in Progress)

*   本地開發伺服器 (`kirstie-website`) 已使用 Hugo Extended 版本成功運行，目前處於初步驗證階段。
*   與客戶溝通目前網站狀態、已知問題 (主要為資源檔案缺失) 及後續建議步驟。
*   等待客戶端完成靜態資源遷移。

## 4. 下一步計劃 (Next Steps & Upcoming Milestones)

*   **客戶端優先處理事項:**
    1.  **遷移靜態資源檔案：** 將所有必要的圖片 (logo, 產品圖, 案例照片等) 和其他資料檔案 (如 `results.csv`, `line-chart.json` 等用於短代碼的檔案) 複製到 `kirstie-website` 專案的正確位置 (通常是 `assets/media/` 或對應的 Page Bundles)。
    2.  **提供缺失圖標：** 客戶需提供 `shield-halved.svg`, `leaf.svg`, `hand-holding-dollar.svg` 等圖標的 SVG 檔案，並放置在 `kirstie-website/assets/media/icons/hero/` 目錄下。
    3.  **提供實際公司資訊：** 客戶需提供公司名稱、統一編號、聯絡電話、傳真號碼、電子郵件地址、公司地址等實際資訊。
    4.  **提供實際部落格文章內容：** 客戶需提供實際的部落格文章內容，替換目前的佔位符。
    5.  **提供作者頭像：** 客戶需提供 `content/authors/admin/_index.md` 中使用的 `avatar.jpg` 實際圖片。
*   **Cline (AI 工程師) 後續工作 (待客戶完成資源遷移後)：**
    1.  **驗證資源整合效果：** 確認靜態資源遷移後，網站圖片顯示正常，相關短代碼功能恢復。
    2.  **恢復並整合內容：**
        *   恢復並正確設定先前因資源缺失而暫時移除/註解的內容 (如首頁的 `cta-image-paragraph` 區塊、部落格中的 `chart` 和 `table` 短代碼)，確保圖片和資料能正確載入。
        *   整合先前跳過的二進位檔案 (如 `content/authors/admin/avatar.jpg`)。
    3.  **內容客製化：** 根據 `projectbrief.md` 和 `systemPatterns.md` 的規劃，逐步將預設的佈景主題內容替換為「貴公司名稱」的實際內容 (公司介紹、服務項目、案例細節等)。
    4.  **解決潛在樣式問題：** 配合 Hugo Extended 版本，調校樣式，確保符合預期視覺效果。
    5.  **處理圖標缺失：** 若客戶無法提供缺失的圖標，我將修改 `content/_index.md` 中的 `features` 區塊，將這些圖標替換為其他可用的圖標或移除。
    6.  **替換公司資訊佔位符：** 根據客戶提供的實際資訊，替換網站中的公司名稱、聯絡資訊等佔位符。
    7.  **整合聯絡表單：** 若客戶決定使用第三方聯絡表單服務，協助整合。
*   **中期目標：**
    *   完成所有核心頁面的內容填充與初步樣式調整。
    *   確保網站基礎 SEO 設定正確。
    *   準備進行初步的跨裝置瀏覽測試。

## 5. 已知問題與挑戰 (Known Issues & Challenges)

*   **Hugo Extended 版本已安裝：** 客戶已升級至 Hugo Extended 版本，解決了先前 `blox-tailwind` 模組的主要相容性問題。
*   **靜態資源檔案缺失：** 大部分的圖片及資料檔案 (如 CSV, JSON) 尚未從原專案遷移至 `kirstie-website`，導致目前網站圖片無法顯示，部分短代碼功能異常。 **(客戶需協助遷移)**
*   **佈景主題相容性警告 (殘餘)：** Hugo 伺服器日誌中關於 `sitemap.xml` 的 render hook 警告仍然存在，可能需要後續檢視。主要的 "extended" 版本相容性警告已因升級 Hugo Extended 而解決。
*   **內容待客製化：** 目前網站顯示的仍是佈景主題的預設或佔位內容，需要大量工作將其替換為客戶的實際商業資訊。
*   **品牌識別缺乏：** (同先前) 缺乏 Logo 和品牌指南，影響視覺設計的最終呈現。
*   **內容依賴：** (同先前) 網站效果依賴高質量的正式內容。

## 6. 專案決策記錄 (Key Decisions Log)

*   **2025-05-24：**
    *   確認專案初期使用預留位置圖片 (dummy images) 和預留位置文字 (dummy text)。
    *   確認網站主要語言為繁體中文，並需考慮台灣使用者習慣。
    *   確認核心技術棧為 Hugo + Cloudflare Pages + Git。
    *   決定採用 Hugo Modules 方式，並配合 `replace` 指令整合本地的 `themes/hugo-blox-builder` 佈景主題至新的 `kirstie-website` 專案。

*   **2025-05-24：**
        *   由於 Hugo Modules 無法正確解析 `hugo-blox-builder` 的版本，決定將 `hugo-blox-builder` 佈景主題從 GitHub 克隆到 `kirstie-website/themes/hugo-blox-builder`。
        *   修改 `kirstie-website/hugo.toml`，移除 `module` 相關配置並添加 `theme = "hugo-blox-builder"`。
        *   修改 `kirstie-website/go.mod`，移除所有與 `HugoBlox` 相關的 `require` 和 `replace` 指令，以避免 Go Modules 錯誤。
*此文件將隨著專案的推進而定期更新，以反映最新的進度、決策和挑戰。*
