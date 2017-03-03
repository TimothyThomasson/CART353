import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(1500, 1500, P3D);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw()
{
  background(#FAE928);
  stroke(#393939);
  strokeWeight(2);

  // draw weirdly shaped sphere 
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    noFill();
    pushMatrix();
    translate(width/2, height/2);
    rotateY(radians(frameCount));
    sphereDetail(6);
    sphere(300 + in.right.get(i+1)*50 );
    popMatrix();
    
    //fill(#2F3134);
    //pushMatrix();
    //translate(width/2, height/2);
    //rotateY(radians(frameCount));
    //sphereDetail(3,4);
    //sphere(250 + in.right.get(i+1)*200 );
    //popMatrix();
  }

  
}
