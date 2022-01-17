## JULIA

JULIA is a french program developped on 2021.
JULIA translates any texts to a textile of your choice.
First, your text will be convert binary and then refer to a textile.
Then, this sequence of 0 and 1 will de refered to a punch card. 
This punch card can be used for knittinig machine which can read Jacquard system.
Jacquard loom was built in 1801 by Joseph Marie Jacquard. It is the first mecanic & programmable system with punch cards.

![JULIA](https://user-images.githubusercontent.com/91726252/142708592-618731c0-8aa0-4c95-9ff3-d95e7632cc8a.png)

# Installation

- Install processing : www.processing.org/download
- Clone the repository

# How it works

- Put a .txt file in the data folder
- Launch the program JULIA.app

**Software**

First Julia reads all the .txt files in the data folder. Then, Julia converts a text from a .txt file from the data folder to a binary String. This function generates a .txt "textB.txt" and print the binary Strings in this file. After that, the last function call matrix() or matrix2() draws in Pgraphics a matrix of ellipse. They are colls of ellipses on the side and top of the card. Those will be allways  at the same place for every text. Between those colls there is ellipse corresping to your text in binary. 

**Main menu**
<img width="992" alt="acceuil" src="https://user-images.githubusercontent.com/91726252/142731916-9c9df6ec-875e-4811-898a-442d901ef60d.png">

**Select your punch card**
<img width="993" alt="type_carte" src="https://user-images.githubusercontent.com/91726252/142731918-51e40623-8c89-4f23-83e2-d0d170630731.png">
Choose your type of punch card. There is a 24 dots punch card from Brother Singer or a 40 dots PASSAP punch card. 

**Select your text**
<img width="995" alt="choose_text" src="https://user-images.githubusercontent.com/91726252/142731920-75d764dd-f5fb-4e18-a9e3-c2a1ea9a83e7.png">

## Print your punch card
Punch card 24 colls and 40 colls are based on the modele on the following picture. The card on the left is for Brother Singer Knitting Machine. The one the right is a PASSAP card for knitting machine. The shapes of those cards are the same that punch cards generated by Julia. The difference is that with Julia you can generate punch card with an unlimited height !

![scan_card](https://user-images.githubusercontent.com/91726252/143076701-a881bcaf-dbc6-40c5-8eb8-e662f2c70953.png)

Install Inkscape or illustrator : https://inkscape.org/release/inkscape-1.1.1/.

Julia.svg is in the folder SVG of JULIA folder.
Open Julia.svg file in Inkscape or adobe Illustrator. Check if the stroke weight is 0.01 mm.
Check if strokes are red : RVB(255,0,0)
Adjust the width of your form to :
- **133 mm for the 24 colls punch card.**
- **241 mm for the 40 colls punch card.**
<img width="239" alt="change_width_133" src="https://user-images.githubusercontent.com/91726252/142735256-52d0aec4-1586-4163-950d-7048eb91763a.png">
<img width="245" alt="changewidth_241" src="https://user-images.githubusercontent.com/91726252/143034538-d35934b8-ce34-4711-9fe8-f11b780fc35e.png">

Trottec Settings : 
- Use paper default settings 
- power : 65-70 adujustable
- speed : 20


Please make sure width and height are linked in your software.
Then, bring the svg file to a trottec laser printing to print your punched card.
**Use this material : Film polyester 75µ**

These are pictures next to trottec printing for a 40 colls PASSAP card. 
![decoupe2](https://user-images.githubusercontent.com/91726252/143052891-2eed9bdd-45ef-44b7-9484-b329c2f5dce8.png)
![dclassic 2022-01-11 183953 838](https://user-images.githubusercontent.com/91726252/149783546-4710dcdf-2eb5-4e4f-b9d4-b59fe2e556d6.JPG)

Now that the punch card is printed we can use it in a knittinig machine. It will read mechanicaly the binary on the punch card. 
We have the binary scarf with the initial text translated in jacquard on it. 

![expo_rotonde](https://user-images.githubusercontent.com/91726252/149787133-4a23acc0-5cef-463e-bf72-aa29922a1bf7.png)

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg
