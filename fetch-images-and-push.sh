#!/usr/bin/env bash
set -e

echo "➡️ Lade realistisch wirkende, frei nutzbare Fotos (picsum.photos) …"
mkdir -p img

# Produkte
curl -L "https://picsum.photos/seed/produkt1/1200/900" -o img/produkt1.jpg
curl -L "https://picsum.photos/seed/produkt2/1200/900" -o img/produkt2.jpg

# Restaurant
curl -L "https://picsum.photos/seed/restaurant1/1600/1200" -o img/restaurant1.jpg
curl -L "https://picsum.photos/seed/restaurant2/1600/1200" -o img/restaurant2.jpg

# Personen (Avatare/Porträts)
curl -L "https://picsum.photos/seed/person1/600/600" -o img/person1.jpg
curl -L "https://picsum.photos/seed/person2/600/600" -o img/person2.jpg
curl -L "https://picsum.photos/seed/person3/600/600" -o img/person3.jpg
curl -L "https://picsum.photos/seed/person4/600/600" -o img/person4.jpg

# Filme (Poster-ähnlich)
for i in {1..12}; do
  curl -L "https://picsum.photos/seed/film$i/1200/800" -o "img/film$i.jpg"
done

echo "➡️ Aktualisiere HTML: .svg → .jpg"
# macOS-sed braucht leeres '' nach -i
sed -i '' 's/\.svg/\.jpg/g' produkt1.html produkt2.html restaurant.html beliebt.html filme.html

echo "➡️ Commit & Push"
git add img/ *.html
git commit -m "Replace SVG placeholders with real photos (picsum)"
git push
echo "✅ Fertig! Seite ggf. mit Cmd+Shift+R neu laden."
