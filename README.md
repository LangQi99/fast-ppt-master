# Fast PPT Master

> Less is more. Fast is better. Every token counts.

A brutally simplified fork of [ppt-master](https://github.com/hugohe3/ppt-master).

**13,490 files → 55 files. 710MB → 1MB. 745-line SKILL.md → 95 lines.**

## Philosophy

- **Less is more** — fewer files, fewer steps, fewer decisions
- **Fast is better** — skip the ceremony, ship the deck
- **Every token saved is a token earned** — no bloat, no redundancy, no fluff
- **One path, not twenty** — the happy path is the only path
- **If you can delete it, delete it** — and we did

## What Was Cut

| Removed | Why |
|---------|-----|
| 23 example decks (581MB) | You don't learn by reading examples, you learn by doing |
| 47MB icon library | Use your own icons |
| 50MB template assets | Design fresh, don't copy |
| 17 workflow variants | One pipeline is enough |
| 12 docs pages | Read the code |
| Confirm UI server | Just confirm in chat |
| Live preview server | Open the SVG yourself |
| Audio/narration pipeline | That's a different tool |
| PPTX beautify/enhance | That's a different tool |
| Template creation system | That's a different tool |
| Image comparison references (43MB) | Trust your eyes |

## What Remains

```
skills/ppt-master/
├── SKILL.md                          ← THE workflow (95 lines)
├── references/
│   ├── strategist.md                 ← design strategy rules
│   ├── executor-base.md              ← SVG generation rules  
│   ├── shared-standards.md           ← technical constraints
│   └── canvas-formats.md            ← dimension specs
├── templates/
│   ├── design_spec_reference.md      ← spec template
│   └── spec_lock_reference.md        ← lock template
└── scripts/
    ├── project_manager.py            ← project init
    ├── svg_quality_checker.py        ← quality gate
    ├── finalize_svg.py               ← post-processing
    ├── svg_to_pptx.py + svg_to_pptx/ ← export engine
    ├── image_gen.py                  ← AI image generation
    ├── analyze_images.py             ← image analysis
    └── config.py                     ← shared config
```

## Usage

```bash
pip install -r requirements.txt
```

Then tell your AI agent: "make a PPT about X" and let SKILL.md drive.

## The 7-Step Pipeline

1. **Source** → Convert to Markdown
2. **Init** → Create project structure  
3. **Template** → Skip (free design by default)
4. **Strategist** → Design decisions (user confirms)
5. **Images** → Generate if needed
6. **Executor** → Write SVG pages one by one
7. **Export** → Finalize + PPTX

That's it. No routing matrices. No three-stage confirmation UIs. No seventeen workflow variants. Just make the damn deck.

## License

MIT
