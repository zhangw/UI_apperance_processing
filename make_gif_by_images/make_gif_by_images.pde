import gifAnimation.*; //<>//
import java.awt.image.*;

GifMaker gifExport = null;
void setup() {
  size(550, 550);
  gifExport = new GifMaker(this, "export.gif", 100); //create a new gif file with quality = 100
  gifExport.setRepeat(0);             // make it an "endless" animation
  gifExport.setTransparent(0, 0, 0);    // black is transparent
  for (int i=1; i<13; i++) {
    String imagePath = "shangdiao1220/shangdiao" + String.format("%02d", i) + ".png";
    println(imagePath);
    gifExport.addFrame(loadImage(imagePath));
    gifExport.setDelay(100);
  }
  gifExport.finish();//save frames to gif file
  println("finish to add frames and save it to file.");
}