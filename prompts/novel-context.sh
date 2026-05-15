#!/bin/bash
# Novel context collector for cron job
# Outputs current state to inform chapter generation

NOVEL_DIR="/root/hermes-agent-novel"

echo "=== NOVEL CONTEXT ==="
echo ""

# Find the latest chapter number
last_file=$(ls "$NOVEL_DIR"/chapter-[0-9][0-9][0-9].md 2>/dev/null | sort | tail -1)
last_chapter=$(echo "$last_file" | sed 's/.*chapter-0*//; s/\.md//')
echo "LATEST_FILE=$last_file"
echo "LATEST_CHAPTER=$last_chapter"
echo "NEXT_CHAPTER=$((last_chapter + 1))"
echo ""

# Output key metrics from plot tracking
if [ -f "$NOVEL_DIR/plot-tracking.md" ]; then
    echo "=== PLOT TRACKING SUMMARY ==="
    # Extract the summary table
    sed -n '/^## 📊 汇总/,/^---/p' "$NOVEL_DIR/plot-tracking.md" | head -20
    echo ""
    
    # Extract current status of main plot
    echo "=== MAIN PLOT STATUS ==="
    sed -n '/^## 📖 主线/,/^## /p' "$NOVEL_DIR/plot-tracking.md" | head -40
    echo ""
    
    # Extract current status of active hidden plots (进行中)
    echo "=== ACTIVE HIDDEN PLOTS (进行中) ==="
    grep -B1 "🔄 进行中" "$NOVEL_DIR/plot-tracking.md" | grep -E "^\| [0-9]" | head -10
    echo ""
    
    # Extract current status of active foreshadowing (进行中 or 等待揭示)
    echo "=== ACTIVE FORESHADOWING ==="
    grep -B1 "🔄 进行中\|🔄 等待揭示" "$NOVEL_DIR/plot-tracking.md" | grep -E "^\| [0-9]" | head -10
    echo ""
fi

echo "=== OUTLINE ==="
head -80 "$NOVEL_DIR/outline.md" 2>/dev/null
echo ""
echo "=== OUTLINE (continued) ==="
tail -n +81 "$NOVEL_DIR/outline.md" 2>/dev/null
echo ""

echo "=== CHARACTERS (first 80 lines) ==="
head -80 "$NOVEL_DIR/characters.md" 2>/dev/null
echo ""

echo "=== WORLDBUILDING (first 80 lines) ==="
head -80 "$NOVEL_DIR/worldbuilding.md" 2>/dev/null
echo ""

# Read the last 2 chapters for style continuity
echo "=== LAST CHAPTER ==="
cat "$NOVEL_DIR/chapter-$(printf '%03d' $last_chapter).md" 2>/dev/null
echo ""

if [ $((last_chapter - 1)) -ge 1 ]; then
    echo "=== SECOND LAST CHAPTER ==="
    cat "$NOVEL_DIR/chapter-$(printf '%03d' $((last_chapter - 1))).md" 2>/dev/null
fi
echo ""

# Word count of last chapter
echo "=== METRICS ==="
wc -m "$NOVEL_DIR/chapter-$(printf '%03d' $last_chapter).md" 2>/dev/null
echo ""

echo "=== END CONTEXT ==="
