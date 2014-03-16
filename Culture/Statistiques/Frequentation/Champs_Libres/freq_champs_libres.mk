CAT = cat
WGET = curl -s

O_DATA_D11 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2011_parjour.csv
O_DATA_D12 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2012_parjour.csv
O_DATA_D13 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2013_parjour.csv

O_DATA_H11 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2012_parheure.csv
O_DATA_H12 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2012_parheure.csv
O_DATA_H13 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/frequentation2012_parheure.csv
O_DATA_H14 = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/bibliotheques-de-rennes/2014/frequentation_parheure.csv

all: \
  freq_champs_libres_by_hour_2011.csv \
  freq_champs_libres_by_hour_2012.csv \
  freq_champs_libres_by_hour_2013.csv \
  freq_champs_libres_by_hour_2014.csv \
  freq_champs_libres_by_day_2011.csv \
  freq_champs_libres_by_day_2012.csv \
  freq_champs_libres_by_day_2013.csv \
  #End

# current one

freq_champs_libres_by_hour_2014.csv:
	$(WGET) '$(O_DATA_H14)' > $@

# by hour

freq_champs_libres_by_hour_2011.csv:
	$(WGET) '$(O_DATA_H11)' > $@

freq_champs_libres_by_hour_2012.csv:
	$(WGET) '$(O_DATA_H12)' > $@

freq_champs_libres_by_hour_2013.csv:
	$(WGET) '$(O_DATA_H13)' > $@

# by day

freq_champs_libres_by_day_2011.csv:
	$(WGET) '$(O_DATA_D11)' > $@

freq_champs_libres_by_day_2012.csv:
	$(WGET) '$(O_DATA_D12)' > $@

freq_champs_libres_by_day_2013.csv:
	$(WGET) '$(O_DATA_D13)' > $@

# Hygiene

clean:
	$(RM) freq_champs_libres_by_hour_2011.csv
	$(RM) freq_champs_libres_by_hour_2012.csv
	$(RM) freq_champs_libres_by_hour_2013.csv
	$(RM) freq_champs_libres_by_hour_2014.csv
	$(RM) freq_champs_libres_by_day_2011.csv
	$(RM) freq_champs_libres_by_day_2012.csv
	$(RM) freq_champs_libres_by_day_2013.csv
