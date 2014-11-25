
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;
Shape3D tube; 

Bezier2D bn;
BezShape bezierShape;

float angleX, angleY, angleZ;

public void setup(){
  size(400, 400, P3D);
  makeBezierForShape();
  bezierShape = new BezShape(this, bn, 40, 20);
  bezierShape.setTexture("rouge.jpg");
  bezierShape.drawMode(S3D.TEXTURE);
  tube = bezierShape;


}



public void draw() {
  background(150);
  // 3D draw first
  pushMatrix();
  camera(0, 0, 300, 0, 0, 0, 0, 1, 0);
  angleX += radians(0.913f);
  angleY += radians(0.799f);
  angleZ += radians(1.213f);
  rotateX(angleX);
  rotateY(angleY);
  rotateZ(angleZ);

  // Draw selected shape
  tube.draw();
  popMatrix();
  // draw HUD


} 


public void makeBezierForShape() {
  int degree = 4;
  PVector[] v;
  float[][] d = new float[degree][2];    
  d[0][0] = 60;    
  d[0][1] = -80;
  d[1][0] = -10;    
  d[1][1] = -20;
  d[2][0] = -20;    
  d[2][1] = 20;
  d[3][0] = 80;    
  d[3][1] = 80;

  v = new PVector[degree];
  for (int i = 0; i < degree; i++) {
    v[i] = new PVector(d[i][0], d[i][1]);
  }
  bn = new Bezier2D(v, v.length);
}
