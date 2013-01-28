-- require 'class'

CPoint = class(function(pt,x,y,z)
   pt:set(x,y,z)
 end)


local function eq(x,y)
  return x == y
end

function CPoint.__eq(p1,p2)
  return eq(p1.x,p2.x) and eq(p1.y,p2.y) and eq(p1.z,p2.z)
end

function CPoint.get(p)
  return p.x,p.y,p.z
end

-- vector addition is '+','-'
function CPoint.__add(p1,p2)
  return CPoint(p1.x+p2.x, p1.y+p2.y, p1.z+p2.z)
end

function CPoint.__sub(p1,p2)
  return CPoint(p1.x-p2.x, p1.y-p2.y, p1.z-p2.z)
end

-- unitary minus  (e.g in the expression f(-p))
function CPoint.__unm(p)
  return CPoint(-p.x, -p.y, -p.z)
end

-- scalar multiplication and division is '*' and '/' respectively
function CPoint.__mul(s,p)
  return CPoint( s*p.x, s*p.y, s*p.z )
end

function CPoint.__div(p,s)
  return CPoint( p.x/s, p.y/s, p.z/s )
end

-- dot product is '..'
function CPoint.__concat(p1,p2)
  return p1.x*p2.x + p1.y*p2.y + p1.z*p2.z
end

-- cross product is '^'
function CPoint.__pow(p1,p2)
   return CPoint(
     p1.y*p2.z - p1.z*p2.y,
     p1.z*p2.y - p1.x*p2.z,
     p1.x*p2.y - p1.y*p2.x
   )
end

function CPoint.normalize(p)
  local l = p:len()
  p.x = p.x/l
  p.y = p.y/l
  p.z = p.z/l
end

function CPoint.set(pt,x,y,z)
  if type(x) == 'table' and getmetatable(x) == CPoint then
     local po = x
     x = po.x
     y = po.y
     z = po.z
  end
  pt.x = x
  pt.y = y
  pt.z = z 
end

function CPoint.translate(pt,x,y,z)
   pt.x = pt.x + x
   pt.y = pt.y + y
   pt.z = pt.z + z 
end

function CPoint.__tostring(p)
  return string.format('(%f,%f,%f)',p.x,p.y,p.z)
end

local function sqr(x) return x*x end

function CPoint.len(p)
  return math.sqrt(sqr(p.x) + sqr(p.y) + sqr(p.z))
end
