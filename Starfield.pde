int screenSize = 700;
Particle [] particles;
boolean catchJP = false;
public void setup() {
	size(screenSize, screenSize);
	noStroke();
	particles = new Particle[screenSize/5];
	for(int n = 0; n < particles.length; n++) {
		particles[n] = new NormalParticle();
	}
	particles[1] = new JumboParticle();
	particles[0] = new OddballParticle();
}
public void draw() {
	background(0);
	for(int n = 0; n < particles.length; n++) {
		particles[n].show();
		particles[n].move();
	}
	fill(255);
	int targetSizeX = 25;
	int targetSizeY = 2;
	rect(mouseX - targetSizeX/2, mouseY - targetSizeY/2, targetSizeX, targetSizeY);
	rect(mouseX - targetSizeY/2, mouseY - targetSizeX/2, targetSizeY, targetSizeX);
}
void mousePressed() {
	catchJP = true;
}
void mouseReleased() {
	catchJP = false;
}
class NormalParticle implements Particle {
	double nX, nY, nSpeed, nAngle;
	float nSize;
	color nColor = color(((int)(Math.random()*40 + 200)), ((int)(Math.random()*45 + 207)), ((int)(Math.random()*45 + 170)));
	NormalParticle() {
		nX = screenSize/2;
		nY = screenSize/2;
		nSpeed = ((Math.random()*5) + 1);
		nAngle = (Math.random()*(2*Math.PI));
		nSize = 2;
	}
	public void move() {
		if(nX > (screenSize + 10) || nY > (screenSize + 10) || nX < -10 || nY < -10) {
			nX = screenSize/2;
			nY = screenSize/2;
			nSize = 2;
			nSpeed = ((Math.random()*5) + 1);
			nAngle = (Math.random()*(2*Math.PI));
			nColor = color(((int)(Math.random()*40 + 200)), ((int)(Math.random()*45 + 180)), ((int)(Math.random()*45 + 170)));
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
	color oColor = color(((int)(Math.random()*50 + 200)), ((int)(Math.random()*45 + 140)), ((int)(Math.random()*45 + 80)));
	OddballParticle() {
		oX = screenSize/2;
		oY = screenSize/2;
		oSize = 5;
		oSpeed = ((Math.random()*2) + 1);
		oAngle = Math.random()*(2*Math.PI);
		oColor = color(((int)(Math.random()*50 + 190)), ((int)(Math.random()*45 + 140)), ((int)(Math.random()*45 + 80)));
	}
	public void move() {
		if(oX > (screenSize + 10) || oY > (screenSize + 10) || oX < -10 || oY < -10) {
			oX = screenSize/2;
			oY = screenSize/2;
			oSize = 5;
			oSpeed = ((Math.random()*3) + 1);
			oAngle = Math.random()*(2*Math.PI);
		}
		oX += (Math.cos(oAngle)*oSpeed);
		oY += (Math.sin(oAngle)*oSpeed);
		oSize += .1;
	}
	public void show() {
		fill(oColor);
		rect((float)oX, (float)oY, (int)oSize, (int)oSize);
	}
}
class JumboParticle extends NormalParticle
{
	color jColor = color(255, 82, 0);
	float jSize = 1;
	double jSpeed = ((Math.random()*2) + 1);
	JumboParticle() {
		nColor = jColor;
		nSize = jSize;
		nSpeed = jSpeed;
	}
	public void move() {
		if(nX > (screenSize + 200) || nY > (screenSize + 200) || nX < -200 || nY < -200) {
			nX = screenSize/2;
			nY = screenSize/2;
			nSize = jSize;
			nSpeed = ((Math.random()*2) + 1);
			nAngle = (Math.random()*(2*Math.PI));
			catchJP = false;
			nColor = jColor;
		}
		nX += (Math.cos(nAngle)*nSpeed/2);
		nY += (Math.sin(nAngle)*nSpeed/2);
		nSize += .4;		
		if(catchJP && mouseX < (nX + nSize/2) && mouseX > (nX - nSize/2) && mouseY < (nY + nSize/2) && mouseY > (nY - nSize/2)) {
			nColor = 0;
		}
	}
}
