// DecaDuinoSender
// Ce croquis est un exemple d'utilisation de la librairie DecaDuino
// Il permet d'envoyer des messages avec l'interface UWB
// by Adrien van den Bossche <vandenbo@univ-tlse2.fr>
// Ce croquis fait partir du projet DecaDuino (cf. fichier DecaDuino LICENCE)

#include <SPI.h>
#include <DecaDuino.h>

#define MAX_FRAME_LEN 120
#//define MY_ADDR 34

DecaDuino decaduino;  //Interface radio UWB
uint8_t txData[MAX_FRAME_LEN]; // buffer des données émises (tableau d'octets) 
uint16_t txLen; //nombre d'octets émis <= MAC_FRAME_LEN
uint8_t txFrames; // nb de trames émises module 255

long W;
long k;
long T = 100;

void setup()
{
  //Sélection de la LED interne connectée au pin 13 de la carte
  pinMode(13, OUTPUT); 
  Serial.begin(115200); // Init Serial port speed
  SPI.setSCK(14); // Set SPI clock pin (pin 14 on DecaWiNo board)
  
  // Initialisation de DecaDuino
  if ( !decaduino.init() ) {
    // LED 13 clignotte si init échoue
    Serial.println("decaduino init failed");
    while(1) { digitalWrite(13, HIGH); delay(50); digitalWrite(13, LOW); delay(50); }
  }

  txFrames = 1;

  W = pow(2,10);

  //On attend 10s avant d'emettre
  delay(10000);
}


void loop()
{
  // On allume la LED interne sur le port 13
  digitalWrite(13, HIGH);

  //Taille des données
  txLen = 10;
  // Ecriture de l'identifiant de canal virtuel
  txData[0] = 19;
  txData[1] = 39;
  // Creation de donnees fictives dans txData
  for (int i=2; i<txLen-1; i++) {
    txData[i] = i;
  }
  txData[txLen-1] = txFrames;
  
  // Envoi de la trame
  decaduino.pdDataRequest(txData, txLen);
  // On attend que la trame soit émise
  while ( !decaduino.hasTxSucceeded() );
  // Log du nb de trames émises
  digitalWrite(13, LOW);
  
  
  //affichage
  Serial.print(txFrames);
  Serial.println(',');
  //bool test = decaduino.setChannel(1);
  uint8_t channel = decaduino.getChannel();
  //Serial.print(channel);
  //Serial.println();
  
  // Incremente le nb de trames emises
  ++txFrames;
  // Attente de 3 secondes
  //delay(3000);


  
  
  // Attente très courtes puis longues après 8 envoie
  delayMicroseconds(5);
  if (txFrames == 9){
    delay(3000);
    txFrames = 1;
  }

  // Attente backoff
  //k = random(0,W);
  //delayMicroseconds(k*T);
  //if (txFrames == 0){
  //  delay(30000);
  //}
  
}

