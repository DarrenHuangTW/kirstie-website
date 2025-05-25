---
title: '首頁'
date: 2023-10-24
type: landing

design:
  # Default section spacing
  spacing: "6rem"

sections:
  - block: hero
    content:
      title: 您的工地組合屋專家
      text: 快速部署。堅固耐用。環保高效。
      primary_action:
        text: 了解更多服務
        url: /products/
        icon: rocket-launch
      secondary_action:
        text: 聯絡我們
        url: /contact/
      announcement:
        text: "最新案例分享！"
        link:
          text: "立即查看"
          url: "/case-studies/"
    design:
      spacing:
        padding: [0, 0, 0, 0]
        margin: [0, 0, 0, 0]
      # For full-screen, add `min-h-screen` below
      css_class: "dark"
      background:
        color: "navy"
        image:
          # Add your image background to `assets/media/`.
          filename: placeholder-icon.jpg
          filters:
            brightness: 0.5
  - block: stats
    content:
      items:
        - statistic: "100+"
          description: |
            成功案例  
            遍佈全台
        - statistic: "10年+"
          description: |
            產業經驗  
            值得信賴
        - statistic: "5種+"
          description: |
            組合屋類型  
            滿足多元需求
    design:
      # Section background color (CSS class)
      css_class: "bg-gray-100 dark:bg-gray-900"
      # Reduce spacing
      spacing:
        padding: ["1rem", 0, "1rem", 0]
  - block: features
    id: features
    content:
      title: 我們的優勢
      text: 為您的工程提供最佳解決方案
      items:
        - name: 快速部署
          icon: bolt
          description: 模組化設計，大幅縮短施工時間，快速投入使用。
        - name: 堅固耐用
          icon: shield-halved
          description: 採用高品質材料，結構穩固，適應各種嚴苛環境。
        - name: 環保高效
          icon: leaf
          description: 可重複利用，減少建築廢棄物，符合綠色環保理念。
        - name: 客製化設計
          icon: wrench-screwdriver
          description: 根據客戶需求，提供彈性設計與功能配置。
        - name: 專業團隊
          icon: users
          description: 經驗豐富的設計與施工團隊，提供一站式服務。
        - name: 成本效益
          icon: hand-holding-dollar
          description: 相較傳統建築，有效降低前期投入與維護成本。
  - block: cta-image-paragraph
    content:
      title: "為何選擇我們的組合屋？"
      text: "我們致力於提供高品質、高效率的工地組合屋解決方案，滿足您在各種工程專案中的臨時空間需求。從設計、製造到安裝，我們提供一站式服務，確保您的專案順利進行。"
      image:
        filename: placeholder-icon.jpg
        alt: "工地組合屋"
    design:
      # Section background color (CSS class)
      css_class: "bg-gray-100 dark:bg-gray-900"
  - block: testimonials
    content:
      title: "客戶評價"
      text: "聽聽我們的客戶怎麼說"
      items:
        - name: "王先生"
          role: "營造公司專案經理"
          # Upload image to `assets/media/` and reference the filename here
          image: "placeholder-icon.jpg"
          text: "貴公司的組合屋品質非常好，安裝速度也很快，大大提升了我們工地的效率，非常推薦！"
        - name: "陳小姐"
          role: "科技園區採購主管"
          image: "placeholder-icon.jpg"
          text: "我們需要快速擴充辦公空間，貴公司的模組化辦公室解決方案完美符合需求，服務也很專業。"
    design:
      spacing:
        # Reduce bottom spacing so the testimonial appears vertically centered between sections
        padding: ["6rem", 0, 0, 0]
  - block: cta-card
    content:
      title: 立即洽詢，打造您的理想空間
      text: 專業團隊，為您量身打造最佳解決方案！
      button:
        text: 聯絡我們
        url: /contact/
    design:
      card:
        # Card background color (CSS class)
        css_class: "bg-primary-700"
        css_style: ""
---
