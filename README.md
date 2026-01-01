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
| III | Kvantová mechanika (nerelativistická teorie) | 🔄 Probíhá | §1-§2 hotovo |
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


## Zdrojové materiály

K překladu jsou využívány následující anglické verze učebnic:

| Svazek | Titul | Vydání (Rok) |
|---|---|---|
| I | Mechanics | 3. vydání (1976) |
| II | The Classical Theory of Fields | 4. vydání (1994) |
| III | Quantum Mechanics - Non-relativistic Theory | 3. vydání (1991) |
| IV | Quantum Electrodynamics | 2. vydání (1982) |
| V | Statistical Physics, Part 1 | 3. vydání (1980) |
| VI | Fluid Mechanics | 2. vydání (1987) |
| VII | Theory of Elasticity | 2. vydání (1970) |
| VIII | Electrodynamics of Continuous Media | 2. vydání (1984) |
| IX | Statistical Physics, Part 2 | 2. vydání (1981) |
| X | Physical Kinetics | 1. vydání (1981) |


## Kompilace

### Doporučený způsob (`latexmk`)
Nejsnazší způsob kompilace který využívá nastavení v `.latexmkrc` (vynucuje LuaLaTeX a ukládá dočasné soubory do `build/`):

```bash
latexmk
```

### Manuální kompilace (`lualatex`)
Pokud preferujete manuální spouštění (dočasné soubory zůstanou v kořenovém adresáři):

```bash
lualatex landau.tex
```

### Poznámka k `pdflatex`
Projekt je sice možné zkompilovat i pomocí `pdflatex`:
```bash
pdflatex landau.tex
```
Mějte však na paměti, že **nebudou použity správné fonty** defimované v `antiquebook.cls` a vzhled dokumentu nebude odpovídat zamýšlené podobě. Použití `pdflatex` slouží pouze jako "fallback" pro kontrolu textu.

### Požadavky

- TeX Live nebo ekvivalentní distribuce
- LuaLaTeX
- Fonty obsažené v repozitáři (CenturymodernTT, NewCMMath)

## Struktura repozitáře

```
landau/
├── landau.tex          # Hlavní dokument
├── antiquebook.cls     # Vlastní třída dokumentu
├── books/              # Zdrojové soubory jednotlivých svazků
├── fonts/              # Fonty (*.otf, *.ttf)
├── build/              # Dočasné soubory a PDF sazba
└── README.md
```

## Licence

Toto dílo je licencováno pod **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International** (CC BY-NC-SA 4.0).

Viz [LICENSE](LICENSE) (anglicky) nebo [LICENSE_CS](LICENSE_CS) (česky) pro text licence.

## Přispívání

Příspěvky jsou vítány! Pokud najdete chybu v překladu nebo chcete přispět překladem další části, otevřete prosím issue nebo pull request.

## Poděkování

- L.D. Landau a E.M. Lifšic za původní dílo
- Všem, kdo přispěli k tomuto překladu
