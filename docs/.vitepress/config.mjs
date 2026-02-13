import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "CSAPP",
  description: "CSAPP 全量内容：原书阅读 + Labs 实验",
  base: '/',
  
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: '/logo.svg',
    
    nav: [
      { text: '首页', link: '/' },
      { text: '原书', link: '/book/' },
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
        link: 'https://github.com/Exely/CSAPP-Labs'
      }
    ],

    sidebar: {
      '/book/': [
        {
          text: 'CSAPP 原书内容',
          items: [
            { text: '阅读入口', link: '/book/' },
            { text: '完整目录', link: '/book/SUMMARY' },
            { text: '本电子书信息', link: '/book/README' },
            { text: '出版信息', link: '/book/publish-info/publisher-words' },
            { text: '第 1 章', link: '/book/ch01-a-tour-of-computer-systems/' },
            { text: '第一部分（2-6 章）', link: '/book/part1/ch02-representing-and-manipulating-information/' },
            { text: '第二部分（7-9 章）', link: '/book/part2/ch07-linking/' },
            { text: '第三部分（10-12 章）', link: '/book/part3/ch10-system-level-io/' },
            { text: '原书实验文档', link: '/book/labs/labs-overview/' },
            { text: '附录 A', link: '/book/appendix-error-handling' },
            { text: '参考文献', link: '/book/references' }
          ]
        }
      ],
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
      { icon: 'github', link: 'https://github.com/Exely/CSAPP-Labs' }
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
      pattern: 'https://github.com/Exely/CSAPP-Labs/edit/master/docs/:path',
      text: '在 GitHub 上编辑此页面'
    }
  },

  // 启用深色模式
  appearance: true,

  ignoreDeadLinks: false,

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
