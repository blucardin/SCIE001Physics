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
  During the test I forgot the conversion factor from $mu$m to m and I didn't have enough time to find it in the textbook.

  This caused me to panic, as, with both ways of analyzing the question, you had to convert to, or from, micrometers.

  Initially, I guessed $340 "eV"$, as was the result of the calculation of the wavelength of the particle if you replaced micrometers with electron volts. However, I changed my answer to $40 "eV"$, as $340 "eV"$ looked like too much energy.

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  Using our small-angle approximation, we can reach an expression for fringe spacing in the double slit experiment (given to us on the slides):
  $
    Delta y = y_(n+1) - y_n = (lambda L)/ d
  $
  Where $d$ is the distance between the slits, $L$ is the length from the slits to the screen, and $Delta y$ is the distance between the fringes.

  Solving for $lambda$:
  $
    (d Delta y) / L = lambda
  $

  We can combine this with our equation for momentum:
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
    
  $
  Using momentum-energy equivalence we get:

  $
    E = p^2 / (2 m)
  $
  Where $E$ is kinetic energy, $p$ is momentum, and $m$ is mass.

  Combining: 
  $
    E = ( (h L) / (d Delta y))^2 / (2 m) \
    E = (h^2 L^2) / (2 m d^2 Delta y^2)
  $

  To make the math easier, we can multiply both sides of the fraction by $c^2$.
  $
    E = (h^2 c^2) / (2 m d^2 Delta y^2 c^2)
  $
  $
    E = ((h c)^2 L^2 ) / (2 m (c^2) d^2 Delta y^2 )
  $

  Now we can substitute, being careful about our units:

  // As given in the question:
  $
        h c & = 1240 "eV" dot "nm" \
    1 "MeV" & = 1 times 10^6 "eV" \
          m & = 939.6 "MeV" / "c"^2 = 939.6 times 10^6 "eV" / "c"^2 \
          L & = 5 "m" \
    Delta y & = 70 mu"m" \
          d & = 112 mu"m"
  $
  Therefore:
  $
    E = ((1240 "eV" dot "nm" )^2 ( 5 "m")^2 ) / (2 (( 939.6 times 10^6 "eV") / cancel("c"^2)) cancel(c^2) (112 mu"m")^2 (70 mu"m")^2 ) \
    E = ((1,537,600 " eV"^2 dot "nm"^2 ) ( 25 " m"^2) ) / (2 (939.6 times 10^6 "eV") (61,465,600 mu"m"^4))
  $

  With conversions:
  $
    1 "nm" = 1 times 10^(-9) "m"\
    1 "nm"^2 = 1 times 10^(-18) " m"^2\
    \
    1 mu"m" = 1 times 10^(-6) "m" \
    1 mu"m"^4 = 1 times 10^(-24) " m"^4 \
    \
  $

  $
    E = ((1,537,600 " eV"^2) (1 times 10^(-18) "m"^2) ( 25 " m"^2) ) / (2 (939.6 times 10^6 "eV") (61,465,600 times 10^(-24) " m"^4 )) \
    E = 0.0003327961166 "eV" \
    1 "eV" = 1 times 10^6 mu"eV" \
    E = 332.7961166 mu"eV" \
    therefore E = 333 mu"eV"
  $






  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

