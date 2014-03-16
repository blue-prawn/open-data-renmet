CAT = cat
WGET = curl -s
O_DATA = http://data.infolocale.fr/explore/dataset/agenda_culturel/download?format=csv

all: agenda_culturel.csv

.PHONY: agenda_culturel.csv
agenda_culturel.csv:
	$(WGET) '$(O_DATA)' > $@

clean:
	$(RM) agenda_culturel.csv

