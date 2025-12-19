# Kurz teoretické fyziky

Český překlad slavné série učebnic teoretické fyziky od L.D. Landaua a E.M. Lifšice.

> *A Czech translation of the renowned Landau & Lifshitz Course of Theoretical Physics.*

## O projektu

Tento repozitář obsahuje probíhající český překlad série **Kurz teoretické fyziky** (Course of Theoretical Physics), která je považována za jednu z nejlepších a nejucelenějších sbírek učebnic teoretické fyziky. Původní dílo bylo napsáno v ruštině a následně přeloženo do mnoha jazyků.

## Postup překladu

| Svazek | Název | Stav | Poznámky |
|--------|-------|------|----------|
| I | Mechanika | ❌ Nezahájeno | |
| II | Teorie pole | ❌ Nezahájeno | |
| III | Kvantová mechanika (nerelativistická teorie) | 🔄 Probíhá | §1 rozpracován |
| IV | Kvantová elektrodynamika | ❌ Nezahájeno | |
| V | Statistická fyzika (část 1) | ❌ Nezahájeno | |
| VI | Hydrodynamika | ❌ Nezahájeno | |
| VII | Teorie pružnosti | ❌ Nezahájeno | |
| VIII | Elektrodynamika kontinua | ❌ Nezahájeno | |
| IX | Statistická fyzika (část 2) | ❌ Nezahájeno | |
| X | Fyzikální kinetika | ❌ Nezahájeno | |

**Legenda:**
- ✅ Dokončeno
- 🔄 Probíhá
- ❌ Nezahájeno

## Kompilace

Projekt vyžaduje **LuaLaTeX** pro správné zobrazení fontů. Kompilace:

```bash
latexmk -lualatex landau.tex
```

### Požadavky

- TeX Live nebo ekvivalentní distribuce
- LuaLaTeX
- Fonty obsažené v repozitáři (CenturymodernTT, NewCMMath)

## Struktura repozitáře

```
landau/
├── landau.tex          # Hlavní dokument
├── antiquebook.cls     # Vlastní třída dokumentu
├── *.otf               # Fonty
└── README.md
```

## Licence

Toto dílo je licencováno pod **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International** (CC BY-NC-SA 4.0).

Viz [LICENSE](LICENSE) pro úplný text licence.

## Přispívání

Příspěvky jsou vítány! Pokud najdete chybu v překladu nebo chcete přispět překladem další části, otevřete prosím issue nebo pull request.

## Poděkování

- L.D. Landau a E.M. Lifšic za původní dílo
- Všem, kdo přispěli k tomuto překladu
