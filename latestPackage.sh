# To get the latest Jar file from nexus
# URL used to extract the nexus repository details
# http://13.235.92.191:8081/nexus/service/local/repositories/releases/content/com/squad/ForexPay/maven-metadata.xml
#To pull group id
#!/bin/sh
#GROUPID=$(curl -s "http://35.154.227.184:8081/nexus/service/local/repositories/snapshots/content/com/squad/ForexPay/maven-metadata.xml" | grep "<groupId>.*</groupId>" | sed 's/  <groupId>//g'| sed 's/<\/groupId>//g' | sed 's/\./\//g')
GROUP=$(curl -s "http://13.235.92.191:8081/nexus/service/local/repositories/snapshots/content/com/squad/ForexPay/maven-metadata.xml" | grep "<groupId>.*</groupId>" | sed 's/  <groupId>//g'| sed 's/<\/groupId>//g')

#To pull artifactID

ARTICATID=$(curl -s "http://13.235.92.191:8081/nexus/service/local/repositories/snapshots/content/com/squad/ForexPay/maven-metadata.xml" | grep "<artifactId>.*</artifactId>" | sed 's/  <artifactId>//g'| sed 's/<\/artifactId>//g')
#To pull latest VersionID
VERSION=$(curl -s "http://13.235.92.191:8081/nexus/service/local/repositories/snapshots/content/com/squad/ForexPay/maven-metadata.xml" | grep "<version>.*</version>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<version>\)\(.*\)\(</version>\)\(.*\)#\3#g")

VERSIONID=$(curl -s "http://13.235.92.191:8081/nexus/service/local/repositories/snapshots/content/com/squad/ForexPay/maven-metadata.xml" | grep "<version>.*</version>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<version>\)\(.*\)\(</version>\)\(.*\)#\3#g"| sed 's/-SNAPSHOT//g')
# URL
URL=http://13.235.92.191:8081/nexus/service/local/repositories/snapshots/content/

# pull latest
#wget $URL$GROUPID/$ARTICATID/$VERSION/$ARTICATID-$VERSIONID-*.jar
wget -O $VERSION.jar "http://13.235.92.191:8081/nexus/service/local/artifact/maven/redirect?r=snapshots&g=$GROUP&a=$ARTICATID&v=$VERSION&p=jar"
