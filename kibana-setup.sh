KIBANA_URL="https://artifacts.elastic.co/downloads/kibana"
KIBANA_FILE="kibana-6.2.1-amd64.deb"

sudo mkdir -p /opt/installers

if [[ ! -e /opt/installers/$KIBANA_FILE ]]; then
	echo "Downloading ${KIBANA_FILE}..."
	sudo wget -nv --directory-prefix=/opt/installers $KIBANA_URL/$KIBANA_FILE
fi

sudo dpkg -i /opt/installers/$KIBANA_FILE

sudo rm /etc/kibana/kibana.yml
sudo cp /vagrant/config/kibana.yml /etc/kibana/kibana.yml

sudo update-rc.d kibana defaults 95 10

sudo service kibana restart