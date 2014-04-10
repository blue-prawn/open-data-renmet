CAT = cat
CURL = curl -s
ODATA =  http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/arts_vivants/Export_RIC_Opendata_-_Arts_vivants.csv

.PHONY: dl
dl: annuaire_culturel.csv

.PHONY: annuaire_culturel.csv
annuaire_culturel.csv:
	$(CURL) '$(ODATA)' > $@

clean:
	$(RM) annuaire_culturel.csv

