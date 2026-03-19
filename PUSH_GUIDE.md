# GitHub推送指南

由于当前环境没有配置GitHub凭证，您需要在本地环境中执行推送。

## 方法1：使用推送脚本（推荐）

```bash
cd /workspace/projects/hong-kong-payroll-learning
chmod +x push-to-github.sh
./push-to-github.sh
```

脚本会引导您完成推送过程。

## 方法2：手动推送

### 步骤1：进入项目目录
```bash
cd /workspace/projects/hong-kong-payroll-learning
```

### 步骤2：添加远程仓库
```bash
git remote add origin https://github.com/heavenchenggong/hong-kong-payroll-learning.git
```

### 步骤3：推送到GitHub
```bash
git push -u origin master
```

当提示输入用户名和密码时：
- **用户名**: heavenchenggong
- **密码**: 使用Personal Access Token（不是GitHub登录密码）

## 获取Personal Access Token

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token (classic)"
3. 设置token描述（如：hong-kong-payroll-learning）
4. 勾选以下权限：
   - ✅ repo（完整的仓库访问权限）
5. 点击 "Generate token"
6. 复制生成的token（只显示一次）

## 首次需要在GitHub创建仓库

如果仓库不存在，需要先创建：

1. 访问 https://github.com/new
2. 仓库名称：`hong-kong-payroll-learning`
3. 设置为 Public（公开）
4. 不要初始化 README、.gitignore 或 license
5. 点击 "Create repository"

创建完成后，按照上面的方法2进行推送。

## 启用GitHub Pages

推送成功后，启用自动部署：

1. 进入仓库页面
2. 点击 Settings（设置）
3. 在左侧菜单找到 "Pages"
4. 在 "Source" 下选择 "GitHub Actions"
5. 保存

GitHub Actions会自动构建并部署网站，约2-3分钟后可以通过以下地址访问：

```
https://heavenchenggong.github.io/hong-kong-payroll-learning/
```

## 验证部署

部署成功后，您可以：
1. 访问网站地址查看在线版本
2. 在仓库的 "Actions" 标签页查看部署日志
3. 在 "Settings" -> "Pages" 查看部署状态

---

**注意**：每次更新网站内容后，只需执行 `git push origin master` 即可自动触发重新部署。
