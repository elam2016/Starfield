int screenSize = 400;
Particle [] particles;
public void setup() {
	size(screenSize, screenSize);
	particles = new Particle[100];
	for(int n = 0; n < particles.length; n++) {
		particles[n] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	particles[1] = new JumboParticle();
}
public void draw() {
	background(0);
	for(int n = 0; n < particles.length; n++) {
		particles[n].move();
		particles[n].show();
	}
}
class NormalParticle implements Particle {
	double nX, nY, nSpeed, nAngle;
	float nSize;
	color nColor = color(255, 0, 0);
	NormalParticle() {
		nX = screenSize/2;
		nY = screenSize/2;
		nSpeed = ((Math.random()*5) + 1);
		nAngle = (Math.random()*(2*Math.PI));
		nSize = 2;
	}
	public void move() {
		if(nX > (screenSize + 10) || nY > (screenSize + 10) || nX < -(screenSize + 10) || nY < -(screenSize + 10)) {
			nX = screenSize/2;
			nY = screenSize/2;
			nSize = 2;
			nSpeed = ((Math.random()*5) + 1);
			nAngle = (Math.random()*(2*Math.PI));
		}
		nX += (Math.cos(nAngle)*nSpeed);
		nY += (Math.sin(nAngle)*nSpeed);
		nSize += .05;
	}
	public void show() {
		fill(nColor);
		ellipse((float)nX, (float)nY, (int)nSize, (int)nSize);
	}
}
interface Particle {
	public void move();
	public void show();
}
class OddballParticle implements Particle {
	double oX, oY, oSpeed, oAngle;
	float oSize;
	color oColor = color(0, 0, 255);
	OddballParticle() {
		oX = screenSize/2;
		oY = screenSize/2;
		oSize = 10;
		oSpeed = ((Math.random()*3) + 1);
		oAngle = Math.random()*(2*Math.PI);
	}
	public void move() {
		if(oX > (screenSize + 10) || oY > (screenSize + 10) || oX < -(screenSize + 10) || oY < -(screenSize + 10)) {
			oX = screenSize/2;
			oY = screenSize/2;
			oSize = 10;
			oSpeed = ((Math.random()*3) + 1);
			oAngle = Math.random()*(2*Math.PI);
		}
		oX += (Math.cos(oAngle)*oSpeed);
		oY += (Math.sin(oAngle)*oSpeed);
		oSize += .05;
	}
	public void show() {
		fill(oColor);
		rect((float)oX, (float)oY, (int)oSize, (int)oSize);
	}
}
class JumboParticle extends NormalParticle
{
	color jColor = color(0, 255, 0);
	float jSize = 10;
	JumboParticle() {
		nColor = jColor;
		nSize = jSize;
	}
	public void move() {
		if(nX > (screenSize + 10) || nY > (screenSize + 10) || nX < -(screenSize + 10) || nY < -(screenSize + 10)) {
			nX = screenSize/2;
			nY = screenSize/2;
			nSize = jSize;
			nSpeed = ((Math.random()*5) + 1);
			nAngle = (Math.random()*(2*Math.PI));
		}
		nX += (Math.cos(nAngle)*nSpeed);
		nY += (Math.sin(nAngle)*nSpeed);
		nSize += .05;
	}
}

