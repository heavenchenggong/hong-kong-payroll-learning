#!/bin/bash

# 香港Payroll学习网站 - GitHub推送脚本
# 使用方法: ./push-to-github.sh

echo "=========================================="
echo "香港Payroll学习网站 - GitHub推送脚本"
echo "=========================================="

# 进入项目目录
cd /workspace/projects/hong-kong-payroll-learning

# 检查Git仓库
if [ ! -d ".git" ]; then
    echo "错误：这不是一个Git仓库"
    exit 1
fi

# 显示当前状态
echo ""
echo "📊 当前Git状态："
git status

echo ""
echo "=========================================="
echo "准备推送到GitHub"
echo "=========================================="
echo ""
echo "仓库地址: https://github.com/heavenchenggong/hong-kong-payroll-learning.git"
echo ""
echo "请选择推送方式："
echo "1) HTTPS（需要GitHub用户名和密码/Personal Access Token）"
echo "2) SSH（需要配置SSH密钥）"
echo ""
read -p "请输入选择 (1/2): " choice

if [ "$choice" = "1" ]; then
    echo ""
    echo "使用HTTPS方式推送..."
    echo ""

    # 如果remote不存在，添加它
    if ! git remote get-url origin &> /dev/null; then
        git remote add origin https://github.com/heavenchenggong/hong-kong-payroll-learning.git
    fi

    # 推送到master分支
    echo "正在推送到GitHub..."
    git push -u origin master

    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ 推送成功！"
        echo ""
        echo "网站访问地址: https://heavenchenggong.github.io/hong-kong-payroll-learning/"
        echo ""
        echo "注意：首次部署可能需要2-3分钟，GitHub Actions会自动构建网站"
    else
        echo ""
        echo "❌ 推送失败"
        echo ""
        echo "可能的原因："
        echo "1. GitHub仓库不存在（需要先在GitHub上创建）"
        echo "2. 认证失败（需要Personal Access Token）"
        echo ""
        echo "获取Personal Access Token："
        echo "1. 访问 https://github.com/settings/tokens"
        echo "2. 点击 'Generate new token (classic)'"
        echo "3. 勾选 'repo' 权限"
        echo "4. 生成并复制token"
        echo ""
        echo "使用token推送："
        echo "git push -u origin master"
        echo "用户名：输入GitHub用户名"
        echo "密码：输入Personal Access Token"
    fi

elif [ "$choice" = "2" ]; then
    echo ""
    echo "使用SSH方式推送..."
    echo ""

    # 如果remote不存在，添加它（使用SSH）
    if ! git remote get-url origin &> /dev/null; then
        git remote add origin git@github.com:heavenchenggong/hong-kong-payroll-learning.git
    else
        # 切换为SSH URL
        git remote set-url origin git@github.com:heavenchenggong/hong-kong-payroll-learning.git
    fi

    # 检查SSH密钥
    if [ ! -f ~/.ssh/id_rsa.pub ]; then
        echo "未找到SSH密钥，正在生成..."
        ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
        echo ""
        echo "SSH密钥已生成"
        echo ""
        echo "请复制以下SSH公钥："
        echo "----------------------------------------"
        cat ~/.ssh/id_rsa.pub
        echo "----------------------------------------"
        echo ""
        echo "添加到GitHub的步骤："
        echo "1. 访问 https://github.com/settings/ssh/new"
        echo "2. 粘贴上面的公钥"
        echo "3. 点击 'Add SSH key'"
        echo ""
        read -p "添加完成后按回车继续..."
    fi

    # 推送到master分支
    echo "正在推送到GitHub..."
    git push -u origin master

    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ 推送成功！"
        echo ""
        echo "网站访问地址: https://heavenchenggong.github.io/hong-kong-payroll-learning/"
    else
        echo ""
        echo "❌ 推送失败"
        echo ""
        echo "可能的原因："
        echo "1. SSH密钥未添加到GitHub"
        echo "2. GitHub仓库不存在"
    fi

else
    echo ""
    echo "无效的选择"
    exit 1
fi
