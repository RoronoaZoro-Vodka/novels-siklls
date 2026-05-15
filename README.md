# 📚 Novels Skills — Hermes Agent 小说创作系统

一套完整的 **Hermes Agent 技能生态**，用于 AI 自动创作长篇网络小说（都市高武/武道复兴类）。包含创作技能、自动化工作流、模板、提示词和运维脚本。

## 核心能力

| 能力 | 说明 |
|------|------|
| 🧠 **10 个创作技能** | 覆盖世界观、角色、大纲、战斗、对话、节奏、伏笔、情感、文风、正文写作 |
| ⏰ **每日自动创作** | 每天凌晨 0 点自动写 6 章，含四维自查 + 去AI味 + 上传API |
| 📊 **情节追踪** | 自动维护主线/暗线/伏笔/支线/重大事件的状态和进度 |
| 📝 **番茄小说格式** | 纯文本输出，直接复制发布 |
| 🔌 **API 对接** | 自动上传到外部小说管理系统 |

## 目录结构

```
novels-siklls/
├── README.md                  # 本文件
├── skills/                    # Hermes Agent 创作技能（SKILL.md 格式）
│   ├── novel-writer.md        # 正文写作 + 四维自查 + 去AI味
│   ├── novel-style-guide.md   # 文风统一规范
│   ├── novel-characters.md    # 角色创作与管理
│   ├── novel-outliner.md      # 大纲架构
│   ├── novel-worldbuilding.md # 世界观设定
│   ├── novel-emotion-arcs.md  # 情感弧度设计
│   ├── novel-battle-scenes.md # 战斗场景写作
│   ├── novel-dialogue.md      # 对话写作
│   ├── novel-pacing.md        # 节奏把控
│   └── novel-plot-twists.md   # 伏笔与反转
├── workflows/                 # 写作流程文档
│   ├── daily-auto-write.md    # 每日自动创作流程
│   ├── chapter-workflow.md    # 单章写作流程
│   └── self-check.md          # 四维自查规范
├── templates/                 # 可复用的模板
│   ├── chapter-template.md    # 章节模板
│   ├── outline-template.md    # 大纲模板
│   ├── character-template.md  # 角色卡模板
│   ├── worldbuilding-template.md # 世界观模板
│   └── plot-tracking-template.md # 情节追踪模板
├── prompts/                   # 提示词和脚本
│   ├── cron-job-prompt.md     # 自动创作 cron 提示词
│   └── novel-context.sh       # 上下文收集脚本
├── references/                # 参考资料
│   ├── ai-flavor-patterns.md  # AI味替换表
│   ├── common-bugs.md         # 常见病句案例
│   └── tomato-format.md       # 番茄小说格式规范
└── archive/                   # 写作记录
    └── timeline.md            # 作品写作时间线
```

## 快速开始

要在 Hermes Agent 中使用这套系统：

```bash
# 1. 配置小说工作目录
mkdir -p /root/hermes-agent-novel
cp novel-context.sh ~/.hermes/scripts/

# 2. 将 skills 内容作为 Hermes 技能导入（每个技能单独注册）
# 详见 Hermes Agent 技能文档

# 3. 配置 cron 自动创作
hermes cron create \
  --name novel-auto-write \
  --schedule "0 0 * * *" \
  --script novel-context.sh \
  --skills novel-writer,novel-style-guide,novel-characters,novel-pacing \
  --workdir /root/hermes-agent-novel
```

## 使用场景

### 新开一本小说
1. 克隆本仓库
2. 使用 `templates/outline-template.md` 规划大纲
3. 使用 `templates/worldbuilding-template.md` 搭建世界观
4. 使用 `templates/character-template.md` 创建角色
5. 在 Hermes Agent 中加载技能开始创作
6. 配置 cron 任务自动产出

### 创作过程中
- 每写一章自动执行**四维自查**（设定冲突/前后矛盾/错别字/啰嗦篇幅）
- 自动更新 `plot-tracking.md` 追踪情节进展
- 自动执行**去AI味**处理
- 自动上传到发布 API

## 技术栈

- **平台**: Hermes Agent (CLI + Skills 系统)
- **脚本**: Bash (novel-context.sh)
- **API**: REST (curl + multipart/form-data 上传)
- **格式**: Markdown (技能、文档) / 纯文本 (发布章节)
- **调度**: Hermes 内置 cron 调度器

---

> 本系统在《世界树之冕》（37章连载中）的创作过程中迭代成型。
>
<img width="989" height="501" alt="局部截取_20260515_153319" src="https://github.com/user-attachments/assets/d8a0fce2-ffb8-45ef-955b-45cf239288ac" />
<img width="996" height="887" alt="局部截取_20260515_153513" src="https://github.com/user-attachments/assets/9cf063aa-a3ad-49bf-83ea-2b39b06651ef" />

