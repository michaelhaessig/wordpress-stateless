#!/bin/bash


##############################################################################################
# WORDPRESS PLUGINS
##############################################################################################

# Chown Contnet Folder
sudo chown -R www-data:www-data /var/www/html/wp-content

if [ "$1" ]; then
  printf "=> Checking plugins...\n"

  while read line; do
    # ignore commented and empty lines
       case $line in
          ''|\#*) continue ;;         # skip blank lines and lines starting with #
      esac

     plugin=$(echo $line | awk '{print $1}')
     version=$(echo $line | awk '{print $2}')

     printf "=> Downloading $plugin"

     download="$plugin"

     # Download from URL
     if [[ $download =~ .*https.* ]]; then
        # get the filename to extract ( handles github download where the filename is master.zip )
        plugindirname="${download##*/}"
        # download and unzip
        wget $download && unzip -o $plugindirname -d /var/www/html/wp-content/plugins/

        # delete zip file
        rm $plugindirname

     # Download from Wordpress
     else

       if [ ! "$version" ]; then
         printf " [latest] ...\n"
         download="$download.zip"
       else
         printf " $version ...\n"
         download="$download.$version.zip"
       fi
       # download and unzip
       wget https://downloads.wordpress.org/plugin/$download && unzip -o $download -d /var/www/html/wp-content/plugins/

       # delete zip file
       rm $download
     fi



    printf "=> Extracted Plugin to /var/www/html/wp-content/plugins/$plugin \n"

  done <$1

else
  printf "=> No plugin dependencies listed. SKIPPING...\n"
fi

# Chown Contnet Folder Again
sudo chown -R www-data:www-data /var/www/html/wp-content
