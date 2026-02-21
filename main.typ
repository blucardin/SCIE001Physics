// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count

#set heading(numbering: "1.")

#align(center + horizon)[

  _#text(30pt)[
    #title(titlecase("Quiz 7 Reflection"))
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


= Neutron Beam Double-Slit

== Specify Question
#image("images/Question 8: Neutron Beam Double-Slit.png")


== Diagnosis Phase
#word-count(total => [
  During the test I forgot the conversion factor from $mu m$ to $m$ and didn't realize that the result was in micro-electron volts, allowing you to cancel the meters and carry the micrometers through.

  This caused me to panic, as with both ways of analyzing the question, you had to deal with micrometers. 

  Initially, I guessed $340 e V$ as was the result of the initial calculation of the wavelength of the particle, but I changed that to $40 e V$, as $340$ looked like too much energy.

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  I was incorrect in the units, carrying all the units forward and using momentum-energy equivalence we get:  

  $
   E = p^2 / (2 m)
  $

  So we just need the momentum. 

  Using our small-angle approximation, we can reach an expression for fringe spacing in the double slit experiment (given to us on the slides): 
  $
    Delta y = y_(n+1) - y_n = (lambda L)/ d
  $
  Where $d$ is the distance between the slits, and $L$ is the length from the slits to the screen. 

  Solving for $lambda$: 
  $
    (d Delta y) / L = lambda
  $

  Using our equation for momentum, we can combine: 
  $
    p = h / lambda
  $
  \
  $
    p = h / ((d Delta y) / L) \
    p = (h L) / (d Delta y) \
    // 
    // f = E / h \
    // E = h f \
    // E = h/ lambda\
    // E = h/ ((d Delta y) / L)\
    // E = (h L)/ (d Delta y)\



    E = ( (h L) / (d Delta y))^2 / (2 m) \
    E = h^2 / (2 m d^2 Delta y^2)
  $

  To make the math easier, we can multiply both sides of the fraction by $c^2$. 
  $
    E = (h^2 c^2) / (2 m d^2 Delta y^2 c^2)
  $
  $
    E = ((h c)^2) / (2 m (c^2) d^2 Delta y^2 )
  $



  

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

