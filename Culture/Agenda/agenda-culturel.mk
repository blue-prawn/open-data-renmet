CAT = cat
WGET = curl -s
O_DATA = http://data.infolocale.fr/explore/dataset/agenda_culturel/download?format=csv

all: agenda-culturel.csv

.PHONY: agenda-culturel.csv
agenda-culturel.csv:
	$(WGET) '$(O_DATA)' > $@

clean:
	$(RM) agenda-culturel.csv

