CAT = cat
CURL = curl -s

UNZIP = unzip
MD5SUM = md5sum

OD_WEB = http://www.data.rennes-metropole.fr/fileadmin/user_upload/data/data_sig
OD_PAT = /deplacement/bornes_recharge_vehicule_electrique/
OD_DIR = bornes_recharge_vehicule_electrique_csv
OD_ZIP = $(OD_DIR).zip

.PHONY: dl
dl: $(OD_ZIP)

.PHONY: open
open: $(OD_DIR)

$(OD_ZIP):
	$(CURL) $(OD_WEB)$(OD_PAT)$(OD_ZIP) > $@

$(OD_DIR): $(OD_ZIP)
	$(UNZIP) $<

.PHONY: verif
verif:
	@$(CAT) recharge_vehicule_elec.md5
	@echo
	@$(MD5SUM) $(OD_ZIP)
	@$(MD5SUM) $(OD_DIR)/licence_rennesmetropole_janvier_2011.pdf
	@$(MD5SUM) $(OD_DIR)/donnees/borne_vehicule_electrique.csv
	@$(MD5SUM) $(OD_DIR)/metadonnees/'borne_vehicule_electrique (csv).txt'

clean:
	$(RM) $(OD_ZIP)

