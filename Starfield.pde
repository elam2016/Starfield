int screenSize = 400;
Particle [] particles;
public void setup()
{
	size(screenSize, screenSize);
	background(0);
	particles = new Particle[20];
	for(int n = 0; n < particles.length; n++)
	{
		particles[n] = new NormalParticle();
	}
}
void draw()
{
	for(int n = 0; n < particles.length; n++)
	{
		particles[n].move();
		particles[n].show();
	}
	particles[0] = new OddballParticle();
}
class NormalParticle implements Particle
{
	double nX, nY, nSpeed, nAngle;
	int nSize;
	color nColor = color(255, 0, 0);
	NormalParticle()
	{
		nX = screenSize/2;
		nY = screenSize/2;
		nSize = 10;
		nSpeed = (int)(Math.random()*10) + 1;
		nAngle = (int)(Math.random()*(2*Math.PI));
	}
	public void move()
	{
		nX += (Math.cos(nAngle)*nSpeed);
		nY += (Math.sin(nAngle)*nSpeed);
	}
	public void show()
	{
		fill(nColor);
		ellipse((float)nX, (float)nY, nSize, nSize);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double oX, oY, oSpeed, oAngle;
	int oSize;
	color oColor = color(0, 0, 255);
	OddballParticle()
	{
		oX = screenSize/2;
		oY = screenSize/2;
		oSize = 10;
		oSpeed = (int)(Math.random()*10) + 1;
		oAngle = Math.random()*(2*Math.PI);
	}
	public void move()
	{
		oX -= Math.cos(oAngle)*oSpeed;
		oY += Math.sin(oAngle)*oSpeed;
	}
	public void show()
	{
		fill(oColor);
		ellipse((float)oX, (float)oY, oSize, oSize);
	}
}
class JumboParticle //uses inheritance
{
	//your code here
}

