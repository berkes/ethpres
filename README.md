# ethpres
Material for the Workshop "Write Smart Contracts on Blockchains"

## Build

pandoc --highlight-style=espresso -H make-code-footnotesized.tex --slide-level=2 --from markdown --to beamer -o pres.pdf pres.md
