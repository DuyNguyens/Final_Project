import xyscope.*;
import ddf.minim.*; 
import processing.sound.*;

XYscope xy;

void setupXYscope() {
  
  xy = new XYscope(this);
}


void updateXYscope() {
  xy.buildWaves();

 
}
