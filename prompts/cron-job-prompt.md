# Cron Job 提示词

用于 Hermes Agent 每日自动创作任务的完整提示词。

## 任务模板

你的任务是自动创作小说《XXXX》的6个新章节并上传到API，同时维护情节追踪文件。

脚本 `novel-context.sh` 会输出当前小说状态（最新章节号、大纲、角色、世界观、最近2章原文、情节追踪汇总）。

## 步骤

**1. 读取上下文**

先运行脚本获取当前状态：
```bash
bash ~/.hermes/scripts/novel-context.sh
```
记下：
- LATEST_CHAPTER（最新的章节号）
- NEXT_CHAPTER（下一章章节号）
- 阅读 MAIN PLOT STATUS、ACTIVE HIDDEN PLOTS、ACTIVE FORESHADOWING
- 阅读 LAST CHAPTER 和 SECOND LAST CHAPTER

**2. 写作规范**

- 段落不超过3-5句
- 每3-5句描述穿插内心活动
- 每章 wc -m ≥ 2000
- 番茄纯文本格式
- 对话用双引号
- 章尾标注（第X章 完）

**3. 每章步骤**

a) 阅读上一章结尾
b) 阅读 plot-tracking.md 中当前进行中的暗线和伏笔
c) 写出正文
d) 保存 chapter-XXX.md
e) 四维自查（设定冲突/前后矛盾/错别字/啰嗦篇幅）
f) 字数不足2000时补充
g) 去AI味处理
h) 更新 plot-tracking.md
i) 上传到 API

**4. 输出总结**

- 完成的章节范围和字数
- 故事进度一句话
- 本次新增/更新的伏笔和暗线状态
