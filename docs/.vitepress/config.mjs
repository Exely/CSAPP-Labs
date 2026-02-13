import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "CSAPP Labs",
  description: "深入理解计算机系统实验笔记",
  base: '/',
  
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: '/logo.svg',
    
    nav: [
      { text: '首页', link: '/' },
      { text: 'Labs', link: '/labs/' },
      { 
        text: '笔记', 
        items: [
          { text: 'Data Lab', link: '/notes/datalab' },
          { text: 'Bomb Lab', link: '/notes/bomb' },
          { text: 'Attack Lab', link: '/notes/attack' },
          { text: 'Architecture Lab', link: '/notes/archlab' },
          { text: 'Performance Lab', link: '/notes/perflab' },
          { text: 'Cache Lab', link: '/notes/cachelab' }
        ]
      },
      {
        text: '参考资源',
        items: [
          { text: 'CMU 15-213 课程', link: 'http://www.cs.cmu.edu/~213/' },
          { text: 'CSAPP 官方网站', link: 'http://csapp.cs.cmu.edu/' },
          { text: 'CSAPP 学习笔记 (Hansimov)', link: 'https://hansimov.gitbook.io/csapp/' }
        ]
      },
      { 
        text: 'GitHub',
        link: 'https://github.com/rwangrwang31/CSAPP-Labs'
      }
    ],

    sidebar: {
      '/notes/': [
        {
          text: '实验笔记',
          items: [
            { text: 'Data Lab', link: '/notes/datalab' },
            { text: 'Bomb Lab', link: '/notes/bomb' },
            { text: 'Attack Lab', link: '/notes/attack' },
            { text: 'Architecture Lab', link: '/notes/archlab' },
            { text: 'Performance Lab', link: '/notes/perflab' },
            { text: 'Cache Lab', link: '/notes/cachelab' }
          ]
        }
      ],
      '/labs/': [
        {
          text: 'Lab 文件',
          items: [
            { text: '概览', link: '/labs/' },
            { text: 'Data Lab', link: '/labs/data/' },
            { text: 'Bomb Lab', link: '/labs/bomb/' },
            { text: 'Attack Lab', link: '/labs/attack/' },
            { text: 'Architecture Lab', link: '/labs/archlab/' },
            { text: 'Performance Lab', link: '/labs/perflab/' },
            { text: 'Cache Lab', link: '/labs/cachelab/' },
            { text: 'Shell Lab', link: '/labs/shlab/' },
            { text: 'Malloc Lab', link: '/labs/malloclab/' },
            { text: 'Proxy Lab', link: '/labs/proxylab/' }
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/rwangrwang31/CSAPP-Labs' }
    ],

    footer: {
      message: '基于《深入理解计算机系统》第三版',
      copyright: 'Copyright © 2026'
    },

    // 搜索配置
    search: {
      provider: 'local',
      options: {
        locales: {
          root: {
            translations: {
              button: {
                buttonText: '搜索文档',
                buttonAriaLabel: '搜索文档'
              },
              modal: {
                noResultsText: '无法找到相关结果',
                resetButtonTitle: '清除查询条件',
                footer: {
                  selectText: '选择',
                  navigateText: '切换',
                  closeText: '关闭'
                }
              }
            }
          }
        }
      }
    },

    // 页面配置
    outline: {
      level: [2, 3],
      label: '页面导航'
    },

    docFooter: {
      prev: '上一页',
      next: '下一页'
    },

    lastUpdated: {
      text: '最后更新于',
      formatOptions: {
        dateStyle: 'short',
        timeStyle: 'medium'
      }
    },

    darkModeSwitchLabel: '主题',
    sidebarMenuLabel: '菜单',
    returnToTopLabel: '返回顶部',
    langMenuLabel: '多语言',

    // 编辑链接
    editLink: {
      pattern: 'https://github.com/rwangrwang31/CSAPP-Labs/edit/main/docs/:path',
      text: '在 GitHub 上编辑此页面'
    }
  },

  // 启用深色模式
  appearance: true,

  // 忽略死链接检查 - 因为笔记中引用了labs目录中的实际文件
  ignoreDeadLinks: true,

  // Markdown 配置
  markdown: {
    lineNumbers: true,
    theme: {
      light: 'github-light',
      dark: 'github-dark'
    }
  },

  // Head 配置
  head: [
    ['link', { rel: 'icon', href: '/favicon.ico' }],
    ['meta', { name: 'theme-color', content: '#3eaf7c' }],
    ['meta', { name: 'apple-mobile-web-app-capable', content: 'yes' }],
    ['meta', { name: 'apple-mobile-web-app-status-bar-style', content: 'black' }],
    ['meta', { name: 'viewport', content: 'width=device-width, initial-scale=1.0' }]
  ]
})
