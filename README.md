<p align="center">
  <h1 align="center">QuestPlates</h1>
  <p align="center">
    <strong>Quest objective indicators on nameplates for WoW Vanilla 1.12.1</strong>
  </p>
  <p align="center">
    <a href="https://github.com/GabHST/QuestPlates/releases/tag/v1.3.0"><img src="https://img.shields.io/badge/version-1.3.0-brightgreen" alt="Version"></a>
    <img src="https://img.shields.io/badge/WoW-1.12.1_Vanilla-yellow" alt="WoW">
    <img src="https://img.shields.io/badge/requires-pfUI_+_pfQuest-blue" alt="Requires">
    <img src="https://img.shields.io/github/downloads/GabHST/QuestPlates/total?color=purple&label=downloads" alt="Downloads">
  </p>
</p>

---

<p align="center">
  <a href="https://github.com/GabHST/QuestPlates/releases/download/v1.3.0/QuestPlates-v1.3.0.zip">
    <img src="https://img.shields.io/badge/%E2%AC%87%20Download-QuestPlates_v1.3.0-2ea44f?style=for-the-badge" alt="Download">
  </a>
</p>

---

<p align="center">
  <img src="img/preview.png" alt="QuestPlates Preview" width="600">
</p>

---

## What is this?

QuestPlates adds a golden **"!"** to the nameplates of mobs related to your active quests — just like modern WoW, but for Vanilla 1.12.1.

Uses **pfQuest's database** to find which mobs you need, even for item drop quests.

---

## Features

| Feature | Description |
|---------|-------------|
| **Golden "!"** | Shows on nameplates of quest objective mobs |
| **Kill quests** | Marks mobs you need to slay |
| **Item drop quests** | Finds which mobs drop your quest items via pfDB |
| **Reference loot** | Resolves shared loot tables for accurate marking |
| **Auto-update** | Re-scans on quest accept, turn-in, progress |
| **Lightweight** | ~5 FPS check cycle, minimal CPU |
| **Update notification** | Chat message when auto-updated |

---

## Installation

```
1. Download the ZIP (button above)
2. Extract "QuestPlates" folder into: WoW/Interface/AddOns/
3. Restart WoW or /reload
```

### Requirements

| Addon | Link |
|-------|------|
| **pfUI** | [github.com/shagu/pfUI](https://github.com/shagu/pfUI) |
| **pfQuest** | [github.com/shagu/pfQuest](https://github.com/shagu/pfQuest) |

---

## How it works

1. Scans all active incomplete quests on quest log updates
2. Queries `pfDB` to resolve unit objectives and item drop mobs
3. Every 0.2s, checks visible pfUI nameplates and shows/hides the "!" icon

---

## PT-BR

QuestPlates adiciona um **"!"** dourado nas nameplates de mobs relacionados as suas quests ativas. Usa o banco de dados do pfQuest pra achar quais mobs dropam seus itens de quest.

---

## License

MIT
