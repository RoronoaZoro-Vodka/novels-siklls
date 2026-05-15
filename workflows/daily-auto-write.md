# 每日自动创作流程

配置 Hermes Agent cron 任务，每日凌晨自动产出 6 章。

## Cron 配置

```bash
hermes cron create \
  --name novel-auto-write \
  --schedule "0 0 * * *" \
  --script novel-context.sh \
  --skills novel-writer,novel-style-guide,novel-characters,novel-pacing \
  --workdir /root/hermes-agent-novel \
  --prompt "你的任务是自动创作小说《XXXX》的6个新章节..."
```

## 上下文收集

脚本 `novel-context.sh` 每轮输出：

1. **最新章节号**（LATEST_CHAPTER / NEXT_CHAPTER）
2. **大纲**（outline.md）
3. **人物设定**（characters.md）
4. **世界观**（worldbuilding.md）
5. **情节追踪汇总**（plot-tracking.md）
   - 主线状态
   - 进行中的暗线
   - 进行中的伏笔
6. **最近 2 章原文**（风格连贯性参考）
7. **字数指标**

## 每章写作流程

```
读上下文 → 写正文 → 保存文件
  → 四维自查（设定冲突/前后矛盾/错别字/啰嗦篇幅）
  → 字数达标检查（wc -m ≥ 2000）
  → 去AI味处理
  → 更新 plot-tracking.md（新增伏笔/推进状态）
  → 上传到 API
  → 重复 × 6
```

## 上传 API

```bash
cp chapter-XXX.md /path/to/txt/第X章\ 章节名.txt
sed -i '1d' /path/to/txt/第X章\ 章节名.txt
curl -X POST http://API_HOST:PORT/api/upload/by-name \
  -F "name=小说名" \
  -F "files=@/path/to/txt/第X章 章节名.txt"
```
