void mouseDragged() {
  // add point based on width/height
  xy.line(mouseX, mouseY, pmouseX, pmouseY);
  
  if (strokes.size() > 0) {
    Stroke stroke = strokes.get(strokes.size()-1);
    stroke.points.add(new PVector(mouseX, mouseY));
    stroke.timestamp = millis();
  }

  marktime = millis();
}

void keyPressed() {
  if (keyCode == 8) { // DELETE
    xy.clearWaves();
  }
}

void mousePressed() {
  Stroke stroke = new Stroke();
  for (int i = 0; i < 255; i++) {
  float r = random(255);
  float g = random(255);
  float b = random(255);
  stroke(r, g, b);
}
  strokes.add(stroke);
}

void mouseReleased() {
  //
}
