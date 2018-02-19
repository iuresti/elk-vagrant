JAVA_URL="http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808"
JAVA_FILE="jdk-8u161-linux-i586.tar.gz"
JAVA_UNPACK="jdk1.8.0_161"

version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
echo version "$version"
if [[ "$version" < "1.8" ]];  then

  echo "Installing Java version $JAVA_UNPACK"

  sudo mkdir -p /opt/jdk
  sudo mkdir -p /opt/installers

  if [[ ! -e /opt/installers/$JAVA_FILE ]]; then
    echo "Downloading ${JAVA_FILE}..."
    sudo wget -nv --header "Cookie: oraclelicense=accept-securebackup-cookie" --directory-prefix=/opt/installers $JAVA_URL/$JAVA_FILE
  fi
  
  sudo tar zxvf /opt/installers/$JAVA_FILE -C /opt/jdk

  sudo update-alternatives --install /usr/bin/java java /opt/jdk/$JAVA_UNPACK/bin/java 1900
  sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/$JAVA_UNPACK/bin/javac 1900

fi