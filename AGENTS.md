# AGENTS.md

Read `skills/fast-ppt-master/SKILL.md` before any PPT task. That file is the entire workflow.

## Quick Reference

```bash
# Convert source
python3 skills/fast-ppt-master/scripts/source_to_md.py <file_or_URL>

# Init project
python3 skills/fast-ppt-master/scripts/project_manager.py init <name> --format ppt169
python3 skills/fast-ppt-master/scripts/project_manager.py import-sources <project> <sources...> --move

# Quality check
python3 skills/fast-ppt-master/scripts/svg_quality_checker.py <project>

# Export pipeline
python3 skills/fast-ppt-master/scripts/finalize_svg.py <project>
python3 skills/fast-ppt-master/scripts/svg_to_pptx.py <project>
```
