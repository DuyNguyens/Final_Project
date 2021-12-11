ArrayList<Stroke> strokes;
int marktime = 0;
int timeout = 1000;
SinOsc[] sineWaves; // Array of sines
float[] sineFreq; // Array of frequencies
int numSines = 5;
Sound s;
PImage animeback;
public void settings(){
  size(800,600);
}

void setup() {
  
  setupXYscope();
  sineWaves = new SinOsc[numSines]; // Initialize the oscillators
  sineFreq = new float[numSines]; // Initialize array for Frequencies
 
  SinOsc sin = new SinOsc(this);
  sin.play(200, 0.2);
  sin = new SinOsc(this);
  sin.play(205, 0.2);

  // Create a Sound object for globally controlling the output volume.
  s = new Sound(this);

  for (int i = 0; i < numSines; i++) {
    float sineVolume = (1.0 / numSines) / (i + 1);
      
    sineWaves[i] = new SinOsc(this);
    sineWaves[i].play();
    sineWaves[i].amp(sineVolume);
  }
  strokes = new ArrayList<Stroke>();
}

void draw() {
  animeback = loadImage("animeback.jpg");
  background(animeback);

  updateXYscope();
  float yoffset = map(mouseY, 0, height, 0, 1);
  float frequency = pow(1000, yoffset) + 150;
  float detune = map(mouseX, 0, width, -0.5, 0.5);
if (mousePressed && (mouseButton == LEFT)) {
  for (int i = 0; i < numSines; i++) {
    sineFreq[i] = frequency * (i + 1 * detune);
    sineWaves[i].freq(sineFreq[i]);
  }
}
if (mousePressed && (mouseButton == RIGHT)){
  for (int i = 0; i < numSines; i++) {
    sineFreq[i] = frequency * (i - 4 * detune);
    sineWaves[i].freq(sineFreq[i]);
  }
}
  for (int i=strokes.size()-1; i >= 0; i--) {
    Stroke stroke = strokes.get(i);
    stroke.run();
    if (!stroke.alive) strokes.remove(i);
  }
  
  if (millis() > marktime + timeout) {
    xy.clearWaves();
  }
  float amplitude = map(mouseY, 0, height, 0.4, 0.0);

  // Instead of setting the volume for every oscillator individually, we can just
  // control the overall output volume of the whole Sound library.
  s.volume(amplitude);

  surface.setTitle("" + frameRate);
}
