# Introduction

Pour se connecter au container, s'il est sur leur PC:
```
ssh -t intro@127.0.0.1 -p 1717
```

Sinon, trouver l'IP du serveur, et faire un `ssh -t intro@serveur -p 1717`

Le mot de passe est `formation`.

# Niveaux suivants

Il y a une succession de niveaux. Chaque niveau est un utilisateur unix différent: level0, level1, ...

Pour se connecter au suivant, on peut faire `su level[x]`.

Pour le niveau d'intro, il faudra leur donner une commande: `cat`. Elle permet d'afficher un fichier, ici le Readme qui est dans le home.

## Common issues

If you see a warning like "Remote host identification has changed", you can bypass this warning using:
```
ssh-keygen -R "[127.0.0.1]:1717"

