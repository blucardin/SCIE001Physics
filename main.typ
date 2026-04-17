// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count

#set heading(numbering: "1.")

#align(center + horizon)[

  _#text(30pt)[
    #title(titlecase("Quiz 9 Reflection"))
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


= A Potential Landscape

== Specify Question
#image("images/question 6.png")

== Diagnosis Phase
#word-count(total => [

  I knew that electric field is equal to the gradient of the electric potential.

  However, I incorrectly thought that this results in the greatest magnitude of electric field being where the equipotential lines were closest, and the least magnitude of electric field being where they were furthest apart.

  I forgot to consider the change in potential of the equipotential lines, causing me to overlook the saddle point when reading the graph (seeing the equipotential lines so close together), and instead chose the next best option with far equipotential lines (B).

  // This logic fails for saddle points, where the gradient is 0, but the equipotential lines are close.

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  Looking at the graph correctly we see:

  Point D has the greatest slope, and therefore the greatest electric field.

  Point C is not a saddle point, because it is between two charges of opposite signs (one positive, one negative), and therefore has some electric field.

  Point B, while having a small magnitude, has some electric field.

  And finally point A is a saddle point between two charges, having 0 electric field.

  Therefore Point A has zero electric field, and point D has the largest magnitude of electric field.

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#pagebreak()


= A Conductor with a Cavity

== Specify Question
#image("images/question 9.png")

== Diagnosis Phase
#word-count(total => [

  I knew that because the object was a conductor, the charge it held was free to redistribute itself within the object. However I did not make the connection between this property and gauss's law, causing me to become confused when the object was charged.

  I knew that if $q_1$ was 10 nC and the object was neutral, the inner surface would have -10nC of charge, and the outer surface would carry 10 nC of charge. $-10 "nC" + 10 "nC" = 0 "nC"$

  I guessed 0 nC because I similarly pictured all the -20 nC of charge rushing towards the positive $q_1$, leaving no charge on the outer surface. $-20 "nC" + 0 "nC" = -20 "nC"$

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  To solve this, we can be smarter about the properties of conductors. Since we know they are free charge carriers, in an electric field, their charges must rearrange, generating an equal and opposite opposing field.

  Therefore conductors (at equilibrium) must have no internal electric field, and hence constant electric potential.

  Imagine a gaussian surface within the object around its centre, since $E = 0$, flux is zero, therefore all charge enclosed must add to 0. Therefore its inner surface must have:

  $
    q_"Particle" + q_"Inner Surface" = 0 \
    q_"Inner Surface" = - q_"Particle" \
    q_"Inner Surface" = - 10 "nC"
  $

  But, the charge of the object must be -20 nC, therefore its inner and out surface must sum to this value.

  $
    q_"Inner Surface" + q_"Outer Surface" = - 20 "nC" \
    q_"Outer Surface" = - 20 "nC" - q_"Inner Surface" \
    q_"Outer Surface" = - 20 "nC" - (- 10 "nC") \
  $
  $
    \
    therefore q_"Outer Surface" = -10 "nC"
  $

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

#pagebreak()

= Comparing Surface Charges

== Specify Question
#image("images/question 10.png")

== Diagnosis Phase
#word-count(total => [

  For this question I made a mistake in reading the question. I thought that it was asking me to rank the surface charge densities, not the magnitude of the surface charge densities.

  I also forgot to notice that the question was referring to plates and not lines of charge.

  These mistakes caused me to see the line of positive charge causing the charges within the conducting plate to rearrange, where the charge density $sigma_B$ is equal to $sigma$ but negative, and $sigma_A$ equal but positive.

  If the lines of charge were up against each other (no dissipation of electric field) and using signs:

  $
    sigma_B = - sigma wide sigma_A = sigma\
    \
    "So " sigma_B < sigma = sigma_A \
    \
    therefore sigma = sigma_A > sigma_B
  $

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])


#let eps = $epsilon_0$;
== Correction Phase
#word-count(total => [

  // The question was asking for the "magnitude" of surface charge density.

  // Let $sigma_A, sigma_B,$ and $ sigma$ represent the magnitude of surface charge density.// (and not their sign).

  // At static equilibrium in a conductor, all charge is distributed on the surfaces of the conductor.

  In electrostatic equilibrium, charge sits on the conductor's surface.

  Negative charges will be attracted to the positive charges on the bottom plate, making the bottom of the conductor negatively charged and the top positively charged. The conductor is neutral: 

  $
    sigma_A - sigma_B  = 0\
    sigma_A = sigma_B
  $

  The formula for electric field from an infinite plate of charge is:
  $
    arrow(E) = sigma / (2 eps)
  $

  Consider the electric field at some point $P$ inside the conductor. Let "up" be positive.

  The bottom plate of positive charges contributes $sigma / (2 eps)$. The top of the conductor contributes $-sigma_A / (2 eps)$, while the bottom of the conductor gives $-sigma_B / (2 eps)$

  Summing these at P:
  $
    E_P = sigma / (2 eps)-sigma_A / (2 eps)-sigma_B / (2 eps) \
    E_P = (sigma - sigma_A - sigma_B ) / (2 eps)
  $

  The electric field in a conductor in equilibrium is zero:

  $
    E_P = (sigma - sigma_A - sigma_B ) / (2 eps) & = 0 \
                                  sigma - sigma_A - sigma_B & = 0 \
                                                      sigma & = sigma_A + sigma_B \
                                                      sigma & = 2 sigma_A wide "since" sigma_A = sigma_B \
  $


  Hence:
  $
    sigma & = 2 sigma_A wide sigma_A = sigma_B \
    $$
    sigma > sigma_A wide sigma_A = sigma_B \
  $
  $
    therefore sigma > sigma_A = sigma_B
  $


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])


