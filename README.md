# QuestPlates

**Quest objective indicators on nameplates for WoW Vanilla 1.12.1**

QuestPlates adds a golden **"!"** icon to the nameplates of mobs related to your active quests — just like modern WoW, but for Vanilla 1.12.1.

Works with **pfUI** nameplates and uses the **pfQuest** database to accurately resolve which mobs you need, even for item drop quests.

![WoW 1.12.1](https://img.shields.io/badge/WoW-1.12.1_Vanilla-yellow)
![pfUI](https://img.shields.io/badge/requires-pfUI-blue)
![pfQuest](https://img.shields.io/badge/requires-pfQuest-blue)
![Auto-Update](https://img.shields.io/badge/auto--update-via%20launcher-green)

![QuestPlates Preview](img/preview.png)

## Features

- Golden **"!"** icon on nameplates for quest objective mobs
- **Kill quests**: directly marks mobs you need to slay
- **Item drop quests**: uses pfQuest's database to find which mobs drop your quest items
- **Reference loot support**: resolves shared loot tables for accurate mob marking
- **Fallback parser**: also reads quest log objective text for compatibility
- **Lightweight**: minimal CPU usage with throttled updates (~5 FPS check cycle)
- **Auto-updates**: re-scans objectives on quest accept, turn-in, and progress
- **Version display**: shows version on login
- **Auto-updater**: compatible with SoloCraft Launcher auto-update system

## Requirements

| Addon | Required | Link |
|-------|----------|------|
| **pfUI** | Yes | [github.com/shagu/pfUI](https://github.com/shagu/pfUI) |
| **pfQuest** | Yes | [github.com/shagu/pfQuest](https://github.com/shagu/pfQuest) |

## Installation

1. Download the latest release ZIP
2. Extract `QuestPlates` folder into `WoW/Interface/AddOns/`
3. Restart WoW or `/reload`

## Auto-Update (SoloCraft Launcher)

If using the SoloCraft Launcher, QuestPlates auto-updates on every game launch via GitHub Releases API.

## How it works

1. On quest log updates, scans all active incomplete quests
2. For each quest, queries `pfDB` (pfQuest's database) to resolve:
   - **Unit objectives** — mobs to kill
   - **Item objectives** — items to collect, then finds mobs that drop them
3. Every 0.2 seconds, checks all visible pfUI nameplates and shows/hides the "!" icon

## License

MIT
