#!ruby -Ks
=begin
最小二乗法による二次曲線の係数計算
=end
class QuadraticCurve
  
  def initialize
    init()
  end
  
  def init()
    @a = 0
    @b = 0
    @c = 0
    @list = Array.new
  end

  #データ列の追加[x,y]
  def add(val)
    @list << val
  end

  def compute()
    x1 = x2 = x3 = x4 = 0
    yx2 = yx = y = 0
    @list.each { |e|
      x4  += e[0]*e[0]*e[0]*e[0]
      x3  += e[0]*e[0]*e[0]
      x2  += e[0]*e[0]
      x1  += e[0]
      yx2 += e[1]*e[0]*e[0]
      yx  += e[1]*e[0]
      y   += e[1]
    }
    
    
    a11 = x4; a12 = x3; a13 = x2;
    a21 = x3; a22 = x2; a23 = x1;
    a31 = x2; a32 = x1; a33 = @list.size;

    detA=a11*a22*a33 + a21*a32*a13 + a31*a12*a23 - a11*a32*a23 - a31*a22*a13 - a21*a12*a33
    return if(detA == 0) 
    
    @a = (a22*a33-a23*a32)*yx2 + (a13*a32-a12*a33)*yx + (a12*a23-a13*a22)*y
    @b = (a23*a31-a21*a33)*yx2 + (a11*a33-a13*a31)*yx + (a13*a21-a11*a23)*y
    @c = (a21*a23-a22*a31)*yx2 + (a12*a31-a11*a32)*yx + (a11*a22-a12*a21)*y
    @a /= detA
    @b /= detA
    @c /= detA
  end
  
  def getY(x)
    return @a*x*x+@b*x+@c
  end
  
  def setCoefficient(a,b,c)
    @a = a
    @b = b
    @c = c
  end
  
  def printCoefficient()
    printf "%f,%f,%f\n", @a, @b, @c
  end
end



qc = QuadraticCurve.new

qc.setCoefficient(12.5,0.3,2.1)
list = Array.new
for i in 0..10
  list << [i,qc.getY(i)]
end
p list

qc.init()
list.each {|e|
  qc.add(e)
}

qc.compute()

qc.printCoefficient()
