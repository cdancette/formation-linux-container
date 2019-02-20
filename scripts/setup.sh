#!/usr/bin/env bash

################################
###### Copier les homes ########
################################
for user in $(ls /var/home/); do 
  # Generic config
    mkdir -p /home/$user
    cp -R /etc/skel/. /home/$user
    touch /home/$user/.bashrc
    ln -s /dev/null /home/$user/.history
    (shopt -s dotglob; mv /var/home/$user/* /home/$user/) 
done


################################
####### Mots de passes #########
################################
echo "intro:formation" | chpasswd
echo "level1:password123" | chpasswd
echo "level2:cheval456" | chpasswd
echo "level3:vlc123" | chpasswd
echo "level4:jesuisunmotdepassetresfort" | chpasswd
echo "level5:you_found_me" | chpasswd
echo "level6:encodage789" | chpasswd
echo "level7:Einst3in" | chpasswd
echo "level8:20000LieuesSLM" | chpasswd

#echo "tests:vghjhy7^&uhgtr%6789okiUYTr456y" | chpasswd

################################
### Niveaux spécifiques #######
################################
# Level6 : compiler le programme
gcc /home/level6/prog.c -o /home/level6/prog
rm /home/level6/prog.c


################################
######### Permissions ##########
################################
for user in $(ls /var/home/); do 
    # Permissions
#    chown -R $user:$user /home/$user
    chown -R root:root /home/$user/
    chmod -R a+r /home/$user
    #chmod 750 /home/$user
done

rm -rf /var/home
