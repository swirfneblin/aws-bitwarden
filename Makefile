# Convenience makefile to build the dev env and run common commands
.PHONY: install configure

configure: install
	@echo "-------------------------"
	@echo "Change permission..."
	@chmod +x ./awsprofile.sh
	@echo "Copy file to bin..."
	@cp awsprofile.sh /usr/local/bin

install:
	@echo "-------------------------"
	@TEMP_AWS=$(mktemp -d)
	@echo "Installing aws cli"
	@curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o ${TEMP_AWS}/awscliv2.zip
	@unzip ${TEMP_AWS}/awscliv2.zip -d ${TEMP_AWS}/
	@${TEMP_AWS}/aws/install
	@echo "Installing bw cli"
	@TEMP_BW=$(mktemp -d)
	@curl -L "https://vault.bitwarden.com/download/?app=cli&platform=linux" -o ${TEMP_BW}/bw-linux.zip
	@unzip ${TEMP_BW}/bw-linux.zip -d ${TEMP_BW}/
	@chmod +x ${TEMP_BW}/bw
	@mv ${TEMP_BW}/bw /usr/local/bin

all: install