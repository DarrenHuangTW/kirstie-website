# 系統模式與架構 (System Patterns & Architecture)

## 1. 網站整體架構 (Overall Website Architecture)

本網站採用靜態網站生成器 (Hugo) 生成靜態 HTML、CSS 和 JavaScript 檔案。這些檔案將部署到 Cloudflare Pages，透過其全球 CDN 提供服務。內容更新透過 Git 推送到遠端倉庫，觸發 Cloudflare Pages 自動建置和部署。

```mermaid
graph TD
    A[技術人員] -- Markdown & 圖片 --> B(Hugo 專案本地端)
    B -- git commit & push --> C{Git 遠端倉庫 (例如 GitHub)}
    C -- Webhook觸發 --> D[Cloudflare Pages]
    D -- 自動建置 (hugo build) --> E[靜態網站檔案]
    E -- 自動部署 --> F(Cloudflare CDN 全球節點)
    G[訪客瀏覽器] -- HTTPS --> F
```

## 2. 頁面結構 (Sitemap - 初步規劃)

*   **首頁 (Homepage)** (`/`)
    *   公司Logo與標語
    *   主視覺
    *   核心業務/產品簡介
    *   精選案例快速預覽
    *   行動呼籲 (CTA)
    *   (可選) 公司優勢/客戶承諾
*   **關於我們 (About Us)** (`/about/`)
    *   公司簡介與歷史
    *   經營理念與核心價值
    *   服務範圍與專業優勢
    *   (可選) 團隊/組織架構
    *   (可選) 合作夥伴/里程碑
*   **產品/服務介紹 (Products/Services)** (`/products/` 或 `/services/`)
    *   **列表頁 (可選，若產品線多):** (`/products/`) - 各類組合屋概覽
    *   **詳細頁 (每種類型一個頁面):** (例如 `/products/standard-office/`, `/products/dormitory/`)
        *   特色、規格 (尺寸、材質)
        *   適用場景
        *   高品質照片/3D示意圖
    *   (可選) 服務流程簡介
*   **工程實績/案例分享 (Case Studies/Portfolio)** (`/case-studies/` 或 `/portfolio/`)
    *   **案例列表頁:** (`/case-studies/`)
        *   縮圖、項目名稱、簡述
        *   篩選/分類功能 (依用途、年份等)
    *   **案例詳細頁 (每個案例獨立頁面):** (例如 `/case-studies/project-alpha/`)
        *   項目名稱、地點 (可模糊化)
        *   客戶需求
        *   提供的解決方案與組合屋類型/規格
        *   多張高品質照片
        *   (可選) 完工日期、工期、客戶評價
*   **最新消息/行業資訊 (News/Industry Info)** (`/news/`)
    *   **文章列表頁:** (`/news/`) - 依時間排序，顯示標題、日期、摘要
    *   **文章內頁 (每篇文章獨立頁面):** (例如 `/news/company-event-q1/`) - 完整文章內容
*   **聯絡我們 (Contact Us)** (`/contact/`)
    *   公司全名、統一編號
    *   聯絡電話 (手機可點擊撥號)
    *   傳真號碼
    *   電子郵件地址 (可點擊開啟郵件客戶端)
    *   公司地址 (嵌入Google地圖)
    *   (可選) 線上聯絡表單
    *   (可選) 服務時間
*   **(可選) 隱私權政策 (Privacy Policy)** (`/privacy-policy/`)
*   **(可選) 網站地圖 (Sitemap Page)** (`/sitemap/`) - HTML 格式的網站地圖頁面

## 3. 通用元素 (Common Elements)

*   **頁首 (Header):**
    *   公司Logo (點擊返回首頁)
    *   主導覽列 (Navigation Menu)
    *   (可選) 聯絡電話
*   **頁尾 (Footer):**
    *   公司名稱、版權資訊
    *   次要連結 (例如：隱私權政策、網站地圖)
    *   聯絡資訊簡述
*   **導覽列 (Navigation):**
    *   清晰易懂，層級建議單層或最多兩層。
    *   目前所在頁面應有高亮或其他視覺提示。
    *   行動裝置上可能轉換為漢堡選單 (Hamburger Menu)。

## 4. 設計與使用者體驗 (UX) 原則 - 系統層面考量

*   **專業穩重:**
    *   色彩選擇：考慮藍色、灰色、綠色等沉穩色系。
    *   字型選擇：選擇易讀的繁體中文字型 (例如：思源黑體 Noto Sans TC, Taipei Sans TC)，內文不小於16px。
*   **簡潔明瞭:**
    *   佈局：留白充足，避免資訊過載。
    *   視覺層次：透過大小、粗細、顏色等區分資訊重要性。
*   **易用性優先 (針對目標客群):**
    *   導覽：主導覽列項目明確，易於尋找。
    *   CTA：按鈕文字清晰，例如「了解更多」、「立即洽詢」。
    *   避免干擾：減少不必要的彈窗、動畫。
*   **行動裝置優先考量:**
    *   RWD 設計，確保小螢幕操作便捷。
    *   按鈕大小適中，易於點擊。
*   **無障礙考量 (基礎):**
    *   圖片提供 `alt` 文字。
    *   鍵盤可操作性。
    *   語義化 HTML。

## 5. 內容組織模式 (Content Organization Patterns - Hugo)

*   **內容類型 (Content Types):**
    *   `case-studies` (案例分享)
    *   `news` (最新消息)
    *   `products` (產品介紹 - 若有多個獨立產品頁)
    *   `pages` (一般頁面，如關於我們、聯絡我們)
*   **分類法 (Taxonomies):**
    *   案例分享可使用 `categories` (例如：用途 - 辦公室、宿舍) 和 `tags` (例如：年份 - 2024, 2023)。
    *   最新消息可使用 `categories` (例如：公司動態、行業資訊)。
*   **Markdown 檔案結構:**
    *   內容檔案存放於 `content/` 目錄下對應的子目錄。
    *   每個 Markdown 檔案包含 Front Matter (YAML, TOML 或 JSON 格式) 來定義元數據 (標題、日期、分類等)。
    *   圖片資源建議與 Markdown 檔案放在一起 (Page Bundles) 或統一存放在 `static/images/` 目錄下。

## 6. Hugo 模板覆蓋機制 (Hugo Template Override Mechanism)

Hugo 允許在專案的 `layouts/` 目錄中創建與主題相同路徑的模板文件，以覆蓋主題的預設模板。這對於客製化主題行為而無需直接修改主題文件非常有用。

*   **覆蓋優先級：** 專案 `layouts/` 目錄下的文件優先於主題 `layouts/` 目錄下的文件。
*   **應用場景：** 當需要修改主題的特定部分（例如，隱藏某些元素、調整佈局或添加自定義邏輯）時，應使用此機制。
*   **範例：**
    *   若要修改主題的 `themes/your-theme/layouts/partials/views/card.html`，則在專案中創建 `layouts/partials/views/card.html` 並放入修改後的內容。
    *   若要修改主題的 `themes/your-theme/layouts/partials/components/last-edited.html`，則在專案中創建 `layouts/partials/components/last-edited.html` 並放入修改後的內容。

## 7. 未來擴展性考量 (初步)

*   **多語言支援:** Hugo 本身支援多語言，但需要在初期規劃好內容結構。
*   **進階功能:** 若未來要加入線上估價等，可能需要外部服務或 API 整合。

*此文件將隨著專案進展和設計細化而持續更新。*
