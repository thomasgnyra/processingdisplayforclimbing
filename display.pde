  
// Example by Tom Igoe 
 
import processing.serial.*; 
 
Serial myPort;    // The serial port
PFont myFont;     // The display font
String inString;  // Input string from serial port
int lf = 10;      // ASCII linefeed 
int[] dat; 


void setup() { 
  size(1000,600); 
  // You'll need to make this font with the Create Font Tool 


  // List all the available serial ports: 
  // printArray(Serial.list()); 
  // I know that the first port in the serial list on my mac 
  // is always my  Keyspan adaptor, so I open Serial.list()[0]. 
  // Open whatever port is the one you're using. 
  
  
  myPort = new Serial(this, Serial.list()[3], 9600); 
  myPort.bufferUntil(lf); 
  delay(2000);
 
} 
 
void draw() { 
  background(0);
  String[]  dat = split(inString, ',');  
  float f = float(dat[1]);
  text(nf(abs(f), 0, 1) + " lbs", 50,200);
  text(nf(abs(f/2.2), 0, 1) + " kg", 50,500);

  textSize(200);

} 
 
void serialEvent(Serial p) { 
  inString = p.readString(); 
} 
