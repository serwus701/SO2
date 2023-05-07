#access_log

# 10 unikalnych adresow ip
cat access_log | grep -o "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" | sort -u | head -10

#zapytania z "denied" w linku
cat access_log | grep "/denied"

#zapytania z podanego ip
cat access_log | grep -o "^64\.242\.88\.10s"

#unikalne z DELETE
cat access_log | grep "DELETE" | sort -u

#yolo.csv

#wszyscy, ktorych id jest liczba nieparzysta
cat yolo.csv | grep -E "^[0-9]*[13579]," | cut -f 1,2,3 -d "," --output-delimiter=" " >&2

#wszyscy warci dokladnie 2.99/5.99/9.99
cat yolo.csv | grep "\$[259]\.99[MB]$" | cut -f 2,3 -d ","

#groovies

#zamien $HEADERS$ na /temat/
sed -i 's/\$HEADER\$/\/temat\//g' groovies/*.groovy

