float cf = 0.667484301325; // lbf/V
float potRatio = 4.0; // mm/V

const int numReadings = 10;          // Number of samples for the moving average
int readings[numReadings];           // Array to store the readings
int readIndex = 0;                   // Index of the current reading
int total = 0;                       // Sum of the readings
float average = 0.0;

int fsrPin = A0;
int potPin = A1;

void setup() {
  Serial.begin(9600);

  // Initialize all readings to 0
  for (int i = 0; i < numReadings; i++) {
    readings[i] = 0;
  }
}

void loop() {
  int ffsdata = analogRead(fsrPin);  // Read analog data from pin A0
  int potData = analogRead(potPin);

  // Subtract the oldest reading
  total = total - readings[readIndex];
  // Add the new reading
  readings[readIndex] = ffsdata;
  total = total + readings[readIndex];
  // Advance to the next index
  readIndex = (readIndex + 1) % numReadings;

  // Calculate average and convert to voltage
  average = total / (float)numReadings;
  float vout = (average * 5.0) / 1023.0;
  vout = (vout - 0.5)*cf;

  // Potentiometer calculations
  float dist = potRatio*(5 - (potData * 5.0)) / 1023.0;

  // Print the smoothed voltage
  Serial.print(vout); 
  Serial.print(", ");
  Serial.println(dist);


  delay(100);  // Adjust delay based on your needs
}