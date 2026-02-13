# CSAPP-Labs - Vercel 部署指南

## 部署到 Vercel

本项目已配置为可直接部署到 Vercel。按以下步骤操作：

### 一键部署

1. 访问 [Vercel](https://vercel.com)
2. 点击 "New Project"
3. 导入此 GitHub 仓库
4. Vercel 会自动检测到 VitePress 配置
5. 点击 "Deploy" 开始部署

### 手动配置（如需要）

如果自动检测失败，请使用以下配置：

- **Framework Preset**: VitePress
- **Build Command**: `npm run docs:build`
- **Output Directory**: `docs/.vitepress/dist`
- **Install Command**: `npm install`

## 本地开发

### 安装依赖

```bash
npm install
```

### 启动开发服务器

```bash
npm run docs:dev
```

访问 http://localhost:5173 查看网站

### 构建生产版本

```bash
npm run docs:build
```

### 预览生产构建

```bash
npm run docs:preview
```

## 功能特性

### ✅ 已实现

- ✅ VitePress 静态站点生成
- ✅ 响应式导航栏，包含所有实验笔记
- ✅ 深色模式支持（可通过主题切换按钮切换）
- ✅ 侧边栏导航
- ✅ 本地搜索功能
- ✅ 移动端优化
- ✅ SEO 优化
- ✅ GitHub 链接集成
- ✅ 代码高亮（支持深色/浅色主题）
- ✅ 中文界面本地化

### 导航配置

网站包含以下导航结构：

#### 顶部导航
- 首页
- Labs（实验文件）
- 笔记（下拉菜单）
  - Data Lab
  - Bomb Lab
  - Attack Lab
  - Architecture Lab
  - Performance Lab
  - Cache Lab
- GitHub

#### 侧边栏导航
- `/notes/` 路径下显示所有实验笔记
- `/labs/` 路径下显示所有实验文件目录

### 深色模式

- 自动支持深色/浅色主题切换
- 主题切换按钮位于导航栏右上角
- 代码块根据主题自动切换配色方案

## 项目结构

```
.
├── docs/                    # VitePress 文档目录
│   ├── .vitepress/         # VitePress 配置
│   │   └── config.mjs      # 站点配置文件
│   ├── public/             # 静态资源
│   │   └── logo.svg        # 网站 Logo
│   ├── notes/              # 实验笔记
│   ├── labs/               # 实验文件索引
│   └── index.md            # 首页
├── labs/                   # 原始实验文件
├── notes/                  # 原始笔记文件
├── package.json            # Node.js 配置
├── vercel.json             # Vercel 部署配置
└── README.md               # 本文件
```

## 技术栈

- **VitePress**: 基于 Vite 和 Vue 的静态站点生成器
- **Vue 3**: 现代化的 JavaScript 框架
- **Vercel**: 部署平台

## 配置文件说明

### vercel.json
包含 Vercel 部署配置，指定构建命令和输出目录。

### docs/.vitepress/config.mjs
VitePress 主配置文件，包含：
- 站点元数据
- 导航栏配置
- 侧边栏配置
- 主题配置
- 搜索配置
- 深色模式配置

## 注意事项

1. 笔记中的某些链接指向 `labs/` 目录中的实际文件，这些文件不会包含在构建输出中
2. 已配置 `ignoreDeadLinks: true` 来处理这些引用
3. 如需访问实际的实验文件，请访问 GitHub 仓库

## 维护

### 添加新笔记

1. 在 `docs/notes/` 目录添加新的 `.md` 文件
2. 在 `docs/.vitepress/config.mjs` 中更新导航配置
3. 运行 `npm run docs:build` 测试构建

### 更新配置

修改 `docs/.vitepress/config.mjs` 后，需要重启开发服务器或重新构建。

## 许可证

ISC
