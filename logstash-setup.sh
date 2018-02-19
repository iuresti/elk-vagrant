LOGSTASH_URL="https://artifacts.elastic.co/downloads/logstash"
LOGSTASH_FILE="logstash-6.2.1.deb"

sudo mkdir -p /opt/installers

if [[ ! -e /opt/installers/$LOGSTASH_FILE ]]; then
	echo "Downloading ${LOGSTASH_FILE}..."
	sudo wget -nv --directory-prefix=/opt/installers $LOGSTASH_URL/$LOGSTASH_FILE
fi

sudo dpkg -i /opt/installers/$LOGSTASH_FILE

sudo cp /vagrant/config/logback-listener.conf /etc/logstash/conf.d/.

sudo initctl start logstash