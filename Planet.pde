class Planet {
  
  private final color MERCURY = color(190);
  private final color VENUS = color(251,208,103);
  private final color EARTH = color(0,128,255);
  private final color MARS = color(200,127,100);
  private final color JUPITER = color(240,200,130);
  private final color SATURN = color(255,200,75);
  private final color URANUS = color(195,205,240);
  private final color NEPTUNE = color(30,70,255);
  private final color CERES = color(175,185,200);
  private final color PLUTO = color(215);
  private final color MAKEMAKE = color(0,0,200);
  //private final color ERIS = color(202);
  
  private float perihelion;
  private float aphelion;
  private float eccentricity;
  private float period;
  
  private float directrix;
  
  private String name;
  
  private float radius;
  private boolean rings;
  private color c;
  
  Planet (String name, float perihelion , float aphelion, float eccentricity, float radius, float period) {
    this.perihelion  = perihelion;
    this.aphelion = aphelion;
    this.eccentricity = eccentricity;
    this.period = period;
    
    this.name = name;
    
    this.directrix = (1/eccentricity-1)*aphelion;
    
    this.radius = radius;
    this.rings = name.equals("SATURN") || name.equals("URANUS");
    this.c = getColor(name);
  }
  
  void drawPlanet(float t, boolean label, boolean orbit, float sc) {
    if (orbit) {
      stroke(255);
      strokeWeight(1/sc);
      noFill();
      float c = (aphelion-perihelion)/2;
      float w = (aphelion+perihelion)/2;
      float h = w*sqrt(1-sq(eccentricity));
      
      ellipse(c,0,w,h);
    } 
    
    fill(c);
    stroke(c);
    
    float angle = theta(t);
    float rd = r(angle);
    
    ellipseMode(RADIUS);
    float x1 = rd*cos(angle);
    float y1 = rd*sin(angle);
    ellipse(x1,y1,radius,radius);
    
    stroke(255);
    if (label) {
      textSize(16/sc);
      text(name,x1+radius,y1);
    }
    
  }
  
  float theta (float t1) {
    return t1/period;
  }
  
  float r (float theta1) {
    return eccentricity*directrix/(1-eccentricity*cos(theta1));
  }

  color getColor(String s) {
    if (s.equals("MERCURY")) return MERCURY;
    else if (s.equals("VENUS")) return VENUS;
    else if (s.equals("EARTH")) return EARTH;
    else if (s.equals("MARS")) return MARS;
    else if (s.equals("JUPITER")) return JUPITER;
    else if (s.equals("SATURN")) return SATURN;
    else if (s.equals("URANUS")) return URANUS;
    else if (s.equals("NEPTUNE")) return NEPTUNE;
    else if (s.equals("CERES")) return CERES;
    else if (s.equals("PLUTO")) return PLUTO;
    else if (s.equals("MAKEMAKE")) return MAKEMAKE;
    //else if (s.equals("ERIS")) return ERIS;
    
    return 0;
  }
  
}
