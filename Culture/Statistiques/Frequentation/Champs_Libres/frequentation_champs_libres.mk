CAT = cat
WGET = curl -s
O_DATA1 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/2014/frequentation_parheure.csv
O_DATA2 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2011_parjour.csv

all: \
  frequentation_champs_libres_by_hour.csv \
  frequentation_champs_libres_by_day.csv \
  #End

.PHONY: frequentation_champs_libres_by_hour.csv
frequentation_champs_libres_by_hour.csv:
	$(WGET) '$(O_DATA1)' > $@

.PHONY: frequentation_champs_libres_by_day.csv
frequentation_champs_libres_by_day.csv:
	$(WGET) '$(O_DATA2)' > $@

clean:
	$(RM) frequentation_champs_libres_by_hour.csv
	$(RM) frequentation_champs_libres_by_day.csv

