
class ParticleSystem  {

  ArrayList<Particle> particles;
  PVector origin;         

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();            
    origin = v.get();                       

      for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin.x,origin.y));    
    }
  }

  void run() {
    
    for (Particle p: particles) {
      p.display();
    }

    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      if (p.done()) {
        particles.remove(i);
      }
    }
  }

  void addParticles(int n) {
    for (int i = 0; i < n; i++) {
      particles.add(new Particle(origin.x,origin.y));
    }
  }

  
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }

}
