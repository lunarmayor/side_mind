


$(document).ready ->
  stage = new Kinetic.Stage(
    container: 'canvas'
    width: 200
    height: 150)

  layer = new Kinetic.Layer
  
  group1 = new Kinetic.Group(
  	offsetX: 95
  	offsetY: 70
  	X: 95
  	Y: 70)

  group2 = new Kinetic.Group(
  	offsetX: 95
  	offsetY: 70
  	X: 95
  	Y: 70)
  
  circle1 = new Kinetic.Circle(
    x: 95,
    y: 70,
    radius: 60,
    fill: '#1D3A41',
    stroke: 'black',
    strokeWidth: 1
      )
  
  nums = [0,1,2,3,4,5,6,7]
  nums2 = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

  for i in nums
  	wedge = new Kinetic.Wedge(
        x: 95,
        y: 70,
        radius: 53,
        angleDeg: 45,
        fill: '#567B7D',
        stroke: '#231F20',
        strokeWidth: 1,
        rotationDeg: i * 45 + 22.5
      )
  	group1.add wedge

  for i in nums2
  	wedge = new Kinetic.Wedge(
        x: 95,
        y: 70,
        radius: 40,
        angleDeg: 22.5,
        fill: if i % 2 == 0 then '#567B7D' else "#8BACA1" ,
        stroke: '#231F20',
        strokeWidth: 1,
        rotationDeg: i * 22.5
      )
  	group2.add wedge

  
  circle2 = new Kinetic.Circle(
    x: 95,
    y: 70,
    radius: 29,
    fill: 'hsl(163, 41%, 71%)',
    stroke: '#1D3A41',
    strokeWidth: 1
      )

  layer.add circle1
  layer.add group1
  layer.add group2
  layer.add circle2


  stage.add layer

  angularSpeed = Math.PI / 8 ;
  angularSpeed2 = Math.PI/ 7;
  direction1 = 1
  direction2 = -1
  pass = 0
  anim = new Kinetic.Animation(((frame) ->
    angleDiff = frame.timeDiff * angularSpeed / 1000
    angleDiff2 = frame.timeDiff * angularSpeed2 / 1000
    group1.rotate(angleDiff * direction1)
    group2.rotate(angleDiff2 * direction2)
    if pass % 800 == 0
      direction1 = -1 * direction1
      direction2 = -1 * direction2
    circle2.setFill("hsl(163, #{41 + 13 * Math.sin(Date.now()* 0.001)}%, 71%)")
    pass++),
    layer)

  anim.start();
      

     