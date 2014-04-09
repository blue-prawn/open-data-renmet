CAT = cat
CURL = curl -s

UNZIP = unzip
MD5SUM = md5sum

OD_WEB = http://www.data.rennes-metropole.fr
OD_PAT = /fileadmin/user_upload/data/data_sig/mobilier_urbain/mobilier_urbain_information/
OD_DIR = mobilier_urbain_information_csv
OD_ZIP = $(OD_DIR).zip

OD_URI = $(OD_WEB)$(OD_PAT)$(OD_ZIP)

.PHONY: dl
dl: $(OD_ZIP)

.PHONY: open
open: $(OD_DIR)

$(OD_DIR): $(OD_ZIP)
	$(UNZIP) $<

$(OD_ZIP):
	$(CURL) $(OD_URI) > $@

.PHONY: verif
verif:
	$(CAT) loc_panneaux_info.md5
	$(MD5SUM) $(OD_ZIP)
	$(MD5SUM) $(OD_DIR)/licence_rennesmetropole_janvier_2011.pdf
	$(MD5SUM) $(OD_DIR)/donnees/mobilier_urbain_information.csv
	$(MD5SUM) $(OD_DIR)/metadonnees/'mobilier_urbain_information (csv).txt'

clean:
	$(RM) $(OD_ZIP)
	$(RM) -r $(OD_DIR)

