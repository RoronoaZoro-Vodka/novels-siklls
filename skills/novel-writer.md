# novel-writer: 正文写作

正文写作技能，包含章节模板、四维自查流程、AI味去除规则、番茄小说格式规范和角色一致性要求。

> 完整内容见 Hermes Agent 技能目录
> `~/.hermes/skills/novel-writing/novel-writer/SKILL.md`

## 核心能力

- 章节模板（开头100-200字钩子 → 主体 → 结尾钩子）
- 字数控制：wc -m ≥ 2000
- 四维自查（设定冲突 → 前后矛盾 → 错别字 → 啰嗦篇幅）
- AI味去除（替换表 + 句式规范）
- 番茄小说纯文本格式
- 角色一致性检查表
- 主线进度报告

## 使用方式

在 Hermes Agent 中加载：
```bash
skill_view(name='novel-writer')
```
