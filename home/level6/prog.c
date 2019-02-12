#include <stdio.h>
#include <stdlib.h> // For exit() function
#include <unistd.h> 


void rot13 (char *s) {
    if (s == NULL)
        return;

    int i;
    for (i = 0; s[i]; i++) {
        if (s[i] >= 'a' && s[i] <= 'm') { s[i] += 13; continue; }
        if (s[i] >= 'A' && s[i] <= 'M') { s[i] += 13; continue; }
        if (s[i] >= 'n' && s[i] <= 'z') { s[i] -= 13; continue; }
        if (s[i] >= 'N' && s[i] <= 'Z') { s[i] -= 13; continue; }
    }
}

/*
void rotate(char *str) 
// str must be a zero-terminated string
{
    printf("%s", str);
    int i =0;
    // loop until str itself is not NULL and str[i] is not zero 
    for(i=0;str && str[i]; ++i) // ++i is a pre-increment
    {
        if(str[i] >= 'a' && (str[i]+13) <='z')
    {
        str[i] = str[i]+13;       // modifying str in place
    }
  }
}
*/

int main()
{
    // Get environment variable LEVEL6_FILENAME.
    // Then checks if the file exists. If it doesn't, print the password.
    // Else, ask to remove the file first.
    char *fname;
    fname = getenv("LEVEL6_FILENAME");

    if( access( fname, F_OK ) != -1 ) {
        printf("Il faut d'abord supprimer le fichier %s\n", fname);
    } else {
        char answer[] = "Gur cnffjbeq vf Rvafg3va";
        rot13(answer);
        printf("%s\n", answer);
    }

    return 0;
}


