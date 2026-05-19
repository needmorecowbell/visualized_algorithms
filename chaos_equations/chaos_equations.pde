// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for this video: https://youtu.be/f0lkz2gSsIk

import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float a = 2;
float b = 2;
float c = 8.0/3.0;
int tailSize=100;
ArrayList<Particle> particles = new ArrayList<Particle>();

PeasyCam cam;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  lights();
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
   x = x + dx+4;
   y = y + dy+4;
   z = z + dz+4;

  particles.add(new Particle(x, y, z, 10,false,false));

  // translate(0, 0, -80);
  //translate(width/2, height/2);
  //scale(5);
  //stroke(255);
  //noFill();

  float hu = 0;
  
  for (Particle p : particles) {
    pushMatrix();
    color c = color(hu, 255, 255);
    p.setColor(c);
    p.display();
    PVector v = p.getPos();
    //PVector offset = PVector.random3D();
    //offset.mult(0.1);
    //v.add(offset);

    hu += 0.1;
    if (hu > 255) {
      hu = 0;
    }
    popMatrix();

  }

  if (particles.size() >=tailSize){
    println("removing particle");
    particles.remove(0);
  }

  //println(x,y,z);
}
