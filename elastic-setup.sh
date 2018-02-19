ELASTIC_URL="https://artifacts.elastic.co/downloads/elasticsearch"
ELASTIC_FILE="elasticsearch-6.2.1.deb"

sudo mkdir -p /opt/installers

if [[ ! -e /opt/installers/$ELASTIC_FILE ]]; then
	echo "Downloading ${ELASTIC_FILE}..."

	sudo wget -nv --directory-prefix=/opt/installers $ELASTIC_URL/$ELASTIC_FILE
fi

sudo dpkg -i /opt/installers/$ELASTIC_FILE

sudo update-rc.d elasticsearch defaults 95 10

sudo service elasticsearch restart