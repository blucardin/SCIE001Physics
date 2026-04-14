// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count

#set heading(numbering: "1.")

#align(center + horizon)[

  _#text(30pt)[
    #title(titlecase("Quiz 10 Reflection"))
  ] \ \
  _

  SCIE 001 Physics \


  Noah Virjee \
  45515863


  #let today = datetime.today()

  #today.display("[month repr:long]")
  #today.day(), #today.year()// or another custom format

]


#outline()

#let arr(body) = {
  $accent(body, arrow)$
}

#let r(x) = {
  calc.round(x, digits: 2)
}

#pagebreak()

// uncomment this for infinite page height except the first page.
#set page(height: auto)

#pagebreak()

= Magnetic induction

== Specify Question
#image("images/Question 5: Magnetic induction.png")


== Diagnosis Phase
#word-count(total => [

  I didn't know what Electromotive Force was or how to calculate it so I just took the magnitude of the slope of the line and added Newtons because it said "Force" 


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  Electromotive force is defined as the negative change in the magnetic flux per unit time. 
  $
    epsilon = - (dif Phi _ m ) / (dif t)
  $

  In this case, our flux is
  $
    Phi_m = integral_s arrow(B) dot hat(n) dif A
  $
  Since the field is uniform and perpendicular to the loop of wire, and our area is just the area of the loop: 
  $
    Phi_m = pi r ^ 2 B
  $

  Looking at our emf: 
  $
    abs(epsilon) = abs(- (dif) / (dif t) (pi r ^ 2 B)) = pi r ^ 2 abs((dif B) / (dif t))
  $
  We know that at 2 $mu$s, $(dif B) / (dif t)  = -2 (mu"T")/(mu"s") = -2 ("T")/("s")$ :

  $
    abs(epsilon) =  pi (0.16 m ) ^ 2 abs(-2 ("T")/("s")) = 0.16  ("m"^2"T") / "s" \ 
    abs("emf") = 0.16 V
  $

  




  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#pagebreak()

= Energy transfer in LC circut

== Specify Question
#image("images/Question 7: Energy transfer in LC circut.png")


== Diagnosis Phase
#word-count(total => [

  For part a, I mistook that voltage refers to energy itself, and not potential energy. Under this assumption, when we know that the inductor has peak energy when there is the least energy in the wires. 

  I forgot the equation to relating $L$, $C$, and the period of current in the LC circuit just put down something random. 

  $
    (150 "mH") / (20 "pF") ( 1 / 2) = 3.75
  $


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  The equation I forgot was: 
  $
    
  $

  But the relationship I needed was, in an oscillating LC circuit: 
  $
    omega = sqrt(1 / ( L C))
  $

  Then using the relationship between $omega$ and the period:

  $
    omega = (2 pi) / T \ 
    1 / sqrt(L C) =  (2 pi) / T  \ 
    T  = 2 pi sqrt(L C) 
  $

  Therefore: 
  $
    T  = 2 pi sqrt(L C) 
  $

  But this is the period of the oscillations in charge, and we want the oscillations in energy. Comparing this to a ball on spring system with the energy being transferred from spring potential to kinetic, the period of energy oscillation is half the period of position oscillation. Making this analogy: 

  $
    T_"energy"  = T_"charge"/2 = pi sqrt(L C)  = pi sqrt((150 times 10 ^ (-3) "H")(20 times 10 ^ (-12) "F")) = 0.000005441398093 "s"  \ 
    
    therefore T_"energy" = 5.44 times 10 ^ (-6) "s"
  $


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#pagebreak()

= Measuring current with a voltmeter

== Specify Question
#image("images/Qustion 8: Measuing current with a voltmeter.png")


== Diagnosis Phase
#word-count(total => [
  Clerical Error, I forgot to round the result to the nearest 0.1 mA


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  The voltmeter has such a high internal resistance compared to the load resistance that we can treat it as negligible to simplify the calculations. So we can just treat the voltmeter as being a perfect voltmeter with infinite internal resistance. 

  $
    V = I R \ 
    V = I R_"load" \ 
    I = V  / R_"load" = (0.34 V) / (160 Omega) = 0.002125 A = 2.125 "mA" approx 2.1 "mA"
  $




  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

// #pagebreak()

= Find the current through the resistor

== Specify Question
#image("images/Quesition 1: Find the current through the resistor.png")


== Diagnosis Phase
#word-count(total => [

  I was going too fast and made a mistake in my calculations and solving of the linear system which somehow made the current come out to 1 Amp.

  I also remember forgetting the direction that the batteries were facing, thinking that both batteries were facing in the opposite direction.  

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  Using both Kirchhoff's Circuit Laws the junction and loop rules:

  #image("images/IMG_5082.jpeg") 

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])