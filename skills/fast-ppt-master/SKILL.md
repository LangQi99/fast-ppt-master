---
name: fast-ppt-master
description: >
  AI-driven SVG-to-PPTX presentation generator. Source → Strategist → Executor → Export.
  Triggers: "create PPT", "make presentation", "生成PPT", "做PPT".
---

# PPT Master — Fast Edition

> Source → Project → Strategist → [Images] → Executor → Export. That's it.

## Iron Rules

1. **Serial execution** — steps run in order, output feeds next step
2. **Strategist confirmation is BLOCKING** — wait for user approval before generating
3. **Spec lock re-read per page** — `read_file <project>/spec_lock.md` before each SVG
4. **Hand-written SVG only** — no script-generated batch SVG, no sub-agents
5. **Sequential pages** — one page at a time, no grouping

## Pipeline

### Step 1: Source Processing

Convert user material to Markdown:

```bash
python3 ${SKILL_DIR}/scripts/source_to_md.py <file_or_URL>
```

CSV/TSV/Markdown → read directly. No source? Ask user for content.

### Step 2: Project Init

```bash
python3 ${SKILL_DIR}/scripts/project_manager.py init <name> --format ppt169
python3 ${SKILL_DIR}/scripts/project_manager.py import-sources <project> <sources...> --move
```

Formats: `ppt169` (1280x720 default), `ppt43` (1024x768), `story` (1080x1920), `banner` (1920x1080).

### Step 3: Template (Optional)

Default: skip, free design. Only triggered when user provides an explicit template directory path containing `design_spec.md`.

### Step 4: Strategist Phase

```
Read references/strategist.md
Read templates/design_spec_reference.md
```

Present to user for confirmation:
1. Canvas format
2. Page count
3. Audience
4. Style / color / typography / icons / images

⛔ **BLOCKING** — wait for user confirmation.

Output:
- `<project>/design_spec.md`
- `<project>/spec_lock.md`

### Step 5: Image Acquisition (Conditional)

Skip if no `ai`/`web` rows in resource list.

```bash
python3 ${SKILL_DIR}/scripts/image_gen.py --manifest <project>/images/image_prompts.json
python3 ${SKILL_DIR}/scripts/analyze_images.py <project>/images
```

### Step 6: Executor Phase

```
Read references/executor-base.md
Read references/shared-standards.md
```

1. Output design parameters
2. Generate SVG pages sequentially → `<project>/svg_output/`
3. Re-read `spec_lock.md` before each page
4. Quality check:
```bash
python3 ${SKILL_DIR}/scripts/svg_quality_checker.py <project>
```
5. Generate speaker notes → `<project>/notes/total.md`

### Step 7: Export

Three commands, run one at a time:

```bash
# 7.1 Split notes
python3 ${SKILL_DIR}/scripts/total_md_split.py <project>

# 7.2 SVG finalization (icon embed, image crop, text flatten)
python3 ${SKILL_DIR}/scripts/finalize_svg.py <project>

# 7.3 Export PPTX
python3 ${SKILL_DIR}/scripts/svg_to_pptx.py <project>
```

Output: `exports/<name>_<timestamp>.pptx`

## Few-Shot SVG References

Before generating SVG pages, read 1–2 relevant examples from `references/few-shot/`:

| File | Page Type |
|------|-----------|
| `cover_minimalist.svg` | Clean cover (Swiss grid) |
| `cover_academic.svg` | Academic paper cover |
| `content_grid.svg` | Multi-column content layout |
| `chinese_content.svg` | Chinese text content page |
| `diagram_flow.svg` | Flow/process diagram |
| `diagram_architecture.svg` | Architecture diagram |
| `diagram_lifecycle.svg` | Lifecycle/state diagram |
| `dark_tech.svg` | Dark theme technical page |
| `tech_blueprint.svg` | Technical blueprint layout |
| `chart_bubble.svg` | Data visualization (bubble chart) |
| `table_data.svg` | Data table layout |
| `kpi_dashboard.svg` | KPI/metrics dashboard |
| `stats_memphis.svg` | Statistics with Memphis style |
| `color_palette.svg` | Color/palette showcase |
| `roadmap_timeline.svg` | Roadmap/timeline (glassmorphism) |
| `roadmap_business.svg` | Business roadmap |
| `brutalist_overview.svg` | Brutalist overview page |
| `brutalist_timeline.svg` | Brutalist timeline |
| `glassmorphism_cards.svg` | Glassmorphism card layout |
| `map_infographic.svg` | Map/geographic infographic |

Pick the closest match to the current page type. These are the structural patterns to follow.

## Reference Index

| File | Purpose |
|------|---------|
| `references/strategist.md` | Strategist role definition |
| `references/executor-base.md` | Executor guidelines |
| `references/shared-standards.md` | SVG/PPTX technical constraints |
| `references/canvas-formats.md` | Canvas dimension specs |
| `references/few-shot/` | SVG page examples for executor |
| `templates/design_spec_reference.md` | Design spec template |
| `templates/spec_lock_reference.md` | Spec lock template |
