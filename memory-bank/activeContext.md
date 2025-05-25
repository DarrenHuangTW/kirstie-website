# 當前情境 (Active Context)

## 1. 目前任務 (Current Task)

*   **主要任務：** 建立 `kirstie-website` Hugo 專案的基礎技術架構，使用 Hugo Modules 整合佈景主題，遷移現有內容與設定，並啟動本地開發伺服器進行初步驗證。
*   **次要任務：** 持續維護 Memory Bank，記錄專案關鍵資訊、已完成工作及後續步驟。

## 2. 核心需求與目標 (Core Requirements & Goals)

*   **主要目的:** 建立一個專業的B2B官方網站，有效展示工地組合屋產品與案例，提升公司形象，促進業務洽詢。
*   **目標客群:** 營建業、工程承包商等專業人士，重視資訊實用性、直接性，對網路操作熟悉度不一。
*   **技術選型:** Hugo (靜態網站生成器), Hugo Modules (管理主題), Cloudflare Pages (託管與部署), Git (版本控制)。
*   **語言與市場:** 繁體中文，面向台灣市場，需符合台灣使用者習慣。
*   **內容呈現:** 需包含首頁、關於我們、產品/服務介紹、工程實績/案例分享、最新消息/行業資訊、聯絡我們等主要頁面。
*   **設計風格:** 專業穩重、簡潔明瞭、高品質圖片、品牌一致性。
*   **使用者體驗:** 易用性優先、導覽清晰、字體可讀性高、高對比度、明確CTA、避免干擾、行動裝置友善。

## 3. 已知限制與假設 (Known Constraints & Assumptions)

*   **品牌素材:** 目前沒有現成的公司 Logo、標準色、標準字等品牌視覺素材。
*   **網站內容:** 初期遷移的內容多為佈景主題的預設內容或基礎佔位符。
*   **Hugo 版本:** 客戶已成功安裝/升級至 Hugo **Extended** 版本。佈景主題 (尤其是 `blox-tailwind` 模組) 應能更好地運作。
*   **靜態資源:** 圖片、JSON、CSV 等非 Markdown 資源檔案尚未遷移至新專案結構中。

## 4. 當前工作階段 (Current Work Phase)

*   **階段:** 內容生成與初步客製化階段。
*   **已完成:**
    *   在 `kirstie-website` 目錄下初始化新的 Hugo 專案。
    *   設定 Hugo Modules，將位於 `themes/hugo-blox-builder` 的本地佈景主題作為模組導入。
    *   配置 `hugo.toml` (主設定檔) 和 `go.mod` (Go 模組檔) 以支援本地模組。
    *   執行 `hugo mod tidy` 解析並下載佈景主題依賴的模組 (如 `blox-bootstrap`, `blox-core`, `blox-plugin-netlify`, `blox-tailwind`)。
    *   將原專案根目錄下的 `content/` (Markdown 檔案) 遷移至 `kirstie-website/content/`。
    *   將原專案根目錄下的 `config/_default/` 設定檔遷移至 `kirstie-website/config/_default/`。
    *   調整 `kirstie-website` 中的設定檔以符合專案需求：
        *   `config/_default/languages.yaml`: 設定預設語言為繁體中文 (`zh-Hant`)。
        *   `config/_default/menus.yaml`: 更新主選單以符合規劃的網站架構及中文名稱。
        *   `config/_default/params.yaml`: 更新部分參數，如日期時間格式。
        *   `hugo.toml` 及 `config/_default/hugo.yaml`: 統一語言設定為 `zh-Hant` / `zh`，並設定 `hasCJKLanguage: true`。
    *   經過多次除錯 (處理語言設定衝突、因缺少資源導致的短代碼錯誤)，暫時修改 `content/_index.md` (移除 `cta-image-paragraph` 區塊) 和 `content/blog/data-visualization/index.md` (註解 `chart` 和 `table` 短代碼)，使網站能夠成功建置。
    *   成功啟動 `kirstie-website` 的 Hugo 本地開發伺服器 (`hugo server -D -F`)。
    *   客戶已成功安裝/升級至 Hugo Extended 版本。
    *   使用 Hugo Extended 版本重新啟動開發伺服器，確認主要相容性警告已解決。
    *   透過瀏覽器初步檢視本地伺服器運行的網站。
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
*   **進行中:**
    *   評估本地網站的初步呈現狀態 (使用 Hugo Extended)。
    *   記錄當前遇到的主要問題 (資源檔案缺失)。
    *   更新 Memory Bank。

## 5. 下一步行動 (Next Steps)

1.  **客戶端操作：**
    *   **遷移靜態資源：** 客戶需協助將所有必要的圖片 (logo, 頁面插圖, 案例照片等) 和其他資料檔案 (如 `results.csv`, `line-chart.json`) 複製到 `kirstie-website` 專案的對應位置。
        *   通用圖片 (如 logo) 建議放置於 `kirstie-website/assets/media/`。
        *   特定頁面的資源 (如部落格文章的資料檔) 應放置於該頁面的 Page Bundle 中 (例如 `kirstie-website/content/blog/data-visualization/results.csv`)。
    *   **提供缺失圖標：** 客戶需提供 `shield-halved.svg`, `leaf.svg`, `hand-holding-dollar.svg` 等圖標的 SVG 檔案，並放置在 `kirstie-website/assets/media/icons/hero/` 目錄下。
    *   **提供實際公司資訊：** 客戶需提供公司名稱、統一編號、聯絡電話、傳真號碼、電子郵件地址、公司地址等實際資訊。
    *   **提供實際部落格文章內容：** 客戶需提供實際的部落格文章內容，替換目前的佔位符。
    *   **提供作者頭像：** 客戶需提供 `content/authors/admin/_index.md` 中使用的 `avatar.jpg` 實際圖片。
2.  **Cline (AI 工程師) 操作 (待客戶完成資源遷移後)：**
    *   恢復並修正先前因資源缺失而暫時移除/註解的內容：
        *   首頁 (`_index.md`) 的 `cta-image-paragraph` 區塊 (需確認圖片路徑)。
        *   `content/blog/data-visualization/index.md` 中的 `chart` 和 `table` 短代碼 (需確認資料檔案路徑)。
    *   檢查並確認 Hugo Extended 版本已解決主要的樣式和功能問題。
    *   開始根據 `projectbrief.md` 和 `systemPatterns.md` 的規劃，逐步將預設的佈景主題內容替換為「貴公司名稱」的實際內容 (公司介紹、服務項目、案例細節等)。
    *   處理先前跳過的二進位檔案 (如 `content/authors/admin/avatar.jpg`) 的遷移與整合。
    *   **處理圖標缺失：** 若客戶無法提供缺失的圖標，我將修改 `content/_index.md` 中的 `features` 區塊，將這些圖標替換為其他可用的圖標或移除。
    *   **替換公司資訊佔位符：** 根據客戶提供的實際資訊，替換網站中的公司名稱、聯絡資訊等佔位符。
    *   **整合聯絡表單：** 若客戶決定使用第三方聯絡表單服務，協助整合。
3.  持續與客戶溝通，迭代完善網站內容與設計。

## 6. 重要決策與考量點 (Key Decisions & Considerations)

*   **Hugo 主題管理方式:** 已決定採用 Hugo Modules 配合 `replace` 指令來使用本地的 `hugo-blox-builder` 佈景主題。
*   **Hugo Extended 版本已安裝:** 客戶已升級，解決了主要的佈景主題模組 (如 `blox-tailwind`) 相容性問題。
*   **靜態資源管理:** (維持重要性) 需建立清晰的資源檔案遷移策略，確保所有圖片、資料檔案等能被 Hugo 正確找到。Page Bundles 和 `assets/media/` 是主要的存放方式。 **(客戶待處理)**
*   **內容客製化：** 目前網站顯示的是佈景主題的預設內容，下一步的重點是將其替換為符合「貴公司名稱」需求的客製化內容。
*   **聯絡表單實現:** (維持先前考量) 若選擇加入線上聯絡表單，需考慮如何處理表單提交。

*此文件將隨著專案進展和決策制定而持續更新。*
