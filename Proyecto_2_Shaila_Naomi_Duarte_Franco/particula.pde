
class Particle {

  Body body;

  PVector[] trail;

  // Constructor
  Particle(float x_, float y_) {
    float x = x_;
    float y = y_;
    trail = new PVector[6];
    for (int i = 0; i < trail.length; i++) {
      trail[i] = new PVector(x,y);
    }


    makeBody(new Vec2(x,y),0.2f);
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  
  boolean done() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+40) {
      killBody();
      return true;
    }
    return false;
  }

  
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);

    
    for (int i = 0; i < trail.length-1; i++) {
      trail[i] = trail[i+1];
    }
    trail[trail.length-1] = new PVector(pos.x,pos.y);

   fill( 114, 175,234);
    beginShape();
    strokeWeight(2);
    fill( 114, 175,234);
    stroke(0,50);
    for (int i = 0; i < trail.length; i++) {
      vertex(trail[i].x,trail[i].y);
    }
    endShape();
  }

  
  void makeBody(Vec2 center, float r) {
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    
    body.setLinearVelocity(new Vec2(random(-1,1),random(-1,1)));

   
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
  
    fd.density = 1;
    fd.friction = 8;  
    fd.restitution = 0.5;

    body.createFixture(fd);

  }

}
