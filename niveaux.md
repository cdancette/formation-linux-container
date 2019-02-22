# Niveau: Introduction (intro:formation)

Affichage:
```
Bienvenue ! Vous êtes arrivés dans le challenge linux. Le but est d'utiliser les commandes linux, pour trouver les mots de passe, et franchir les niveaux.

Pensez à noter tous les mots de passe des différents niveaux sur votre ordinateur personnel, ils seront plus qu'utiles si vous perds ta connexion ssh pendant la séance !

Pour vous connecter au niveau suivant, entrez la commande "su level1", puis le mot de passe vous sera demandé, entrez "password123" (le mot de passe ne s'affichera pas lorsque vous tapez).
```
# Niveau 1
- ls

Afichage:
```
Pour ce premier niveau, il faudra utiliser la commande `ls`, qui permet d'afficher la liste des fichier présents dans le dossier courant.

Le mot de passe pour le niveau suivant est le nom du fichier présent dans le dossier.

Pour vous connecter au niveau suivant, entrez la commande "su level1", puis le mot de passe vous sera demandé.
```

## Réponse

```
$ ls 
cheval456
```

# Niveau 2
- cat, ls

Affichage:
```
Bravo, vous avez compris comment utiliser `ls` ! 

Maintenant, nous allons étudier la commande `cat`. Cette commande permet d'afficher le contenu d'un fichier dans le terminal.

Le mot de passe du niveau suivant est enregistré dans un fichier, situé dans le dossier courant. Affichez la liste des fichiers, puis affichez le contenu du fichier avec `cat`.

Pour les prochains niveaux, les indices ne vous seront plus donnés directement à la connexion. Pensez à utiliser `ls` et `cat` pour fouiller dans votre dossier !
```

## Réponse

```
$ ls 
mot_de_passe

$ cat mot_de_passe
vlc123

```

# Niveau 3
- cd, cat, ls

Pas d'affichage

le mot de passe est dans un dossier => faire cd, puis ls, puis cat

## Réponse

```
$ ls
lisez_moi
mon_dossier/

$ cat Lisez-moi
Vous avez trouvé les instructions pour ce niveau, bravo !
Pour ce prochain niveau, nous allons voir comment nous
déplacer dans les dossiers. On utilise pour cela la 
commande`cd` (qui veut dire "Change Directory" == changer 
de dossier).

la commande est `cd [nom_du_dossier]`. Essayez avec le dossier `mon_dossier`, puis utilisez les commandes précédentes pour afficher son contenu

$ cd mon_dossier
$ ls
mot_de_passe
$ cat mot_de_passe
labe543
$ su level3

```

# Niveau 4

Beaucoup de dossiers. Il faut trouver quel dossier contient le mot de passe

=> Faire `ls *`

### Solution
```
$ ls *
lisez_moi
dossier1: 
dossier2:
...
dossier33:
    mot_de_passe
dossier34:
...
dossier50:

$ cat dossier33/mot_de_passe
le mot de passe
```

# Niveau 5
* Lancer un script
Affichage:
```
Dans ce niveau, nous allons voir comment executer un programme.
Un programme peut prendre de nombreuses formes dans linux, 
mais il est en général sous la forme d'un fichier executable. 
C'est un fichier comme ceux que nous avons vu avant, mais qui contient 
des instructions à éxecuter par l'ordinateur.

Nous allons executer un "script bash". C'est à dire que les instructions
seront écrites en langage "bash". C'est le langage que vous êtes en train 
d'apprendre, qui sert à entrer des commandes dans le terminal linux.

Le script que nous souhaiton executer est enregistré dans le fichier 'script.sh'

Pour lancer un script, il suffit d'appeler son nom, précédé de "./".

Ici, il faudra entrer dans le terminal "./script.sh"

Vous pouvez afficher le contenu du script également, pour essayer 
de voir si le mot de passe est contenu dedans, et comment il fonctionne.
```

## Solution
Il faudra juste faire `./mot_de_passe.sh`, qui va donner le mot de passe (encoder le mot de passe en base64 pour ne pas l'écrire dans le script).

# Niveau 6

* rm

À la connexion, création d'un fichier temporaire. Il y a un petit programme compilé qui vérifie si ce fichier existe encore. S'il n'existe pas, le programme renvoie le mot de passe.

Affichage:
```
Commande utile dans ce niveau:

"rm <fichier>": Supprime un fichier du disque. 

Exemple (ne pas le faire): "rm /tmp/test/1/fichier_a_supprimer"
```

---

# Niveau 7

* head, grep

Ce fichier contient la totalité du livre "20000 lieues sous les mer". Le mot de passe est caché dans une ligne (contenant "password").
Il faut afficher le début du fichier pour obtenir un indice.

Solution: 
```
$ head jules-vernes.txt
Jules Verne
VINGT MILLE LIEUES
SOUS LES MERS
(1871)

Indice: Le mot de passe se situe à la ligne comprenant le mot "password".

Table des matières

PREMIÈRE PARTIE	4

$ grep password jules-verne.txt          
Indice: Le mot de passe se situe à la ligne comprenant le mot "password".
The password is : 20000LieuesSLM
```

# Niveau 8: Fichier caché

Le fichier est caché, il commence par un "."

Il faut faire `ls -a` pour afficher la liste de tous les fichiers (y compris les fichiers cachés).

# Niveau 9
 * mv

Apprendre `mv`

a la connexion, crée un fichier temporaire. Le but est de le supprimer. Le fichier temporaire est stocké dans une variable d'environnement, 

Il faut lancer le programe `./prog.py` pour avoir les instructions, puis déplacer les fichiers demandés, puis relancer ./prog.py.

# Niveau 10

Il y a un fichier caché, qui contient des infos pour trouver la bonne ligne dans le CSV. Le CSV explique que le mot de passe est stocké dans une variable d'environnement, et explique comment l'afficher.

Solution:
```
$ echo $LEVEL10_PASSWORD
```

# Niveau 11

Ecriture dans un fichier avec `nano`

# Futurs niveaux ?


## Niveau variables d'environnement
Variables d'environnement
Un programme python donne le mot de passe, mais pour ça il faut d'abord set une variable d'environnement (dans le script python, il faudra encoder le mot de passe en base64 pour éviter qu'ils lisent juste le mdp directement du script)

```
USER=root ./script.py
```

## Niveau édition de fichier
apprendre `nano`
A la connexion, un fichier temporaire est créé. Il faut modifier le contenu pour changer quelque caractères.

## Niveau pipe

## Mot de passe: PID
Trouver le PID d'un process, et l'utiliser comme mot de passe.


## Niveau : Curl
Faire un curl sur une URL pour obtenir le mot de passe.

Expliquer que c'est une requête HTTP.

## Niveau créer serveur http ? 
http-server, peut-etre trop compliqué

## Niveau : find
Pour trouver un fichier avec un nom particulier / des caractéristiques précises.

## Niveau : chmod

Créer un fichier temporaire appartenant a l'user qui n'est pas lisible (non autorisé). 
Il faut le chmod pour le rendre lisible et obtenir le mot de passe.

## Niveau: écrire un programme (genre python / javascript)

=> Ecrire un petit programme qui donne le 100ieme terme de fibonacci

## Niveau 18 de root-me


# Commandes à apprendre:

- ls
- cat
- cd
- less
- rm
- mv
- cp
- cut
- head
- tail
- grep
- pipe
- nano ?
- lancer un script
- variables d'environnement
- ps aux
- run script
- permissions (chmod / chown)
