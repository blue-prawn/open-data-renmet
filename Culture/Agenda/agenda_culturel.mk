CAT = cat
CURL = curl -s
O_DATA = http://data.infolocale.fr/explore/dataset/agenda_culturel/download?format=csv

.PHONY: dl
dl: agenda_culturel.csv

.PHONY: agenda_culturel.csv
agenda_culturel.csv:
	$(CURL) '$(O_DATA)' > $@

clean:
	$(RM) agenda_culturel.csv

