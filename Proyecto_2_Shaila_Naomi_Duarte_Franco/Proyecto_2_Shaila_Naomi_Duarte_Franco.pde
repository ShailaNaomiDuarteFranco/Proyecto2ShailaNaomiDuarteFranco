
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
PFont tip1;
PImage pareja;
Box2DProcessing box2d;
ArrayList<ParticleSystem> systems;
ArrayList<Boundary> boundaries;

void setup() {
 
  size(800,535);
   background (253,266,178);
  smooth();
  pareja = loadImage ("p1.png");

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  box2d.setGravity(0, -20);

  systems = new ArrayList<ParticleSystem>();
  boundaries = new ArrayList<Boundary>();

  //limites
 boundaries.add(new Boundary(500 ,250, 300, 10, -0.8));
 boundaries.add(new Boundary(550 ,250, 300, 30, -0.8));
 boundaries.add(new Boundary(560 ,250, 300, 20, -0.8));
 boundaries.add(new Boundary(570 ,250, 300, 10, -0.8));
 boundaries.add(new Boundary(250,230,300,5,0.8));
 boundaries.add(new Boundary(250,230,300,5,0.8));
 boundaries.add(new Boundary(250,230,300,5,0.8));
 
  
}

void draw() {
    background (253,266,178);

  box2d.step();

  for (ParticleSystem system: systems) {
    system.run();

    int n = (int) random(0,2);
    system.addParticles(n);
    
    image(pareja, 140,130, 500,400);
    fill(0);
    rect(0,527, 900, 23);
    tip1 = createFont ("Serenity Script.otf", 48);
    textFont (tip1);
    textSize(35);
    fill(255,121,121);
    text("Da click en la pantalla y haz que llueva",10, 25);
  }


}

void mousePressed() {
  systems.add(new ParticleSystem(0, new PVector(mouseX,mouseY)));
}
