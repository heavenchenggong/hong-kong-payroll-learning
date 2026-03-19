# 部署指南

## 🚀 如何部署到GitHub Pages

### 步骤1: 创建GitHub仓库

1. 访问 https://github.com/new
2. 仓库名称填写：`hong-kong-payroll-learning`
3. 设置为 Public（公开）以便分享给他人学习
4. 点击 "Create repository"

### 步骤2: 推送代码到GitHub

在本地项目目录执行以下命令：

```bash
# 进入项目目录
cd /workspace/projects/hong-kong-payroll-learning

# 添加远程仓库（替换 YOUR_USERNAME 为您的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/hong-kong-payroll-learning.git

# 推送代码
git push -u origin master
```

### 步骤3: 启用GitHub Pages

1. 进入仓库页面
2. 点击 Settings（设置）
3. 在左侧菜单找到 "Pages"
4. 在 "Source" 下选择 "GitHub Actions"
5. 保存后，GitHub Actions会自动部署网站

### 步骤4: 访问网站

部署完成后（约2-3分钟），您的网站将可通过以下地址访问：

```
https://YOUR_USERNAME.github.io/hong-kong-payroll-learning/
```

---

## 📝 本地预览

在推送代码之前，您可以在本地预览网站：

### 方法1: 使用Python

```bash
cd /workspace/projects/hong-kong-payroll-learning
python -m http.server 8000
```

然后访问：http://localhost:8000

### 方法2: 使用Node.js

```bash
cd /workspace/projects/hong-kong-payroll-learning
npx serve
```

---

## 🔄 更新网站

当您添加新的学习内容时：

1. 修改或添加文件
2. 提交更改：
   ```bash
   git add .
   git commit -m "描述您的更改"
   ```
3. 推送到GitHub：
   ```bash
   git push origin master
   ```
4. GitHub Actions会自动重新部署

---

## 📊 项目结构

```
hong-kong-payroll-learning/
├── index.html              # 首页
├── 404.html                # 错误页面
├── README.md               # 项目说明
├── DEPLOYMENT.md           # 本文档
├── .github/
│   └── workflows/
│       └── deploy.yml      # GitHub Actions配置
├── assets/
│   └── css/
│       └── style.css       # 样式文件
└── day01/                  # Day 1学习页面
    └── index.html
```

---

## 🎨 自定义域名（可选）

如果您想使用自定义域名：

1. 在仓库根目录创建 `CNAME` 文件，内容为您的域名，例如：
   ```
   www.yourdomain.com
   ```

2. 在您的域名DNS设置中添加：
   - CNAME: `YOUR_USERNAME.github.io`

3. 在GitHub Pages设置中启用自定义域名

---

## 🤝 协作开发

如果您想与他人协作：

1. 在GitHub仓库设置中添加协作者（Settings > Collaborators）
2. 或使用Pull Request流程

---

## 📚 学习资料

- [GitHub Pages官方文档](https://docs.github.com/en/pages)
- [GitHub Actions文档](https://docs.github.com/en/actions)
- [SAP官方文档](https://help.sap.com)

---

**最后更新**: 2026年3月19日
