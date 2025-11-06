// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo

#set heading(numbering: "1.")

#align(center)[

    _#text(30pt)[
    #title(titlecase("Quiz 3 Reflection"))
    ] \ \
    _

    SCIE 001 Physics

    Noah Virjee \
    45515863
    

    #let today = datetime.today()

    #today.display("[month repr:long]") 
    #today.day(), #today.year()// or another custom format

]

#outline()

#pagebreak()

// uncomment this for infinite page height except the first page.
#set page(height: auto)


= Collision Ball and Box 1 
== Specify Question
#image("Screenshot 2025-11-03 at 12.11.27 PM.png")


== Diagnosis Phase
I was going too fast. I misinterpreted the image and thought that in case 1 the velocity of the ball when it bounced back was in the same direction as the velocity of box. This made me think that if the momentums were equal, they must have the same velocity. 

For case 1: 
$ p_"initial" = p_"final" \ 
m v_0 = m v_f + M V_1 
$

For case 2: 
$ p_"initial" = p_"final" \ 
m v_0 = (m + M)V_2 
$
Combining these: 
$
  m v_f + M V_1 = (m + M)V_2 
$

I got stuck here - because I thought $v_f$ was positive, I didn't have enough information. Since $v_f$ was in the same direction as $V_1$, out of all 3 possibilities $(>,<,=)$, I assumed $v_f = V_1$ and factored. 

$
  m V_1 + M V_1 = (m + M)V_2 \
  (m + M) V_1 = (m + M)V_2 
$

So I said $V_1 = V_2$. 


== Correction Phase

In both elastic and inelastic collisions, momentum is conserved. So we can write out the equations for both sides (with proper signs) to show the relationship between $V_1$ and $V_2$ (explicitly showing negative vectors). 


// Thinking about it more rationally, if you have two systems total mass, one where the masses are moving in the same direction, and other where they are moving apart, for momentum to be equal, when they are moving apart, the one moving in the direction of the momentum must have more velocity. 

For the first case: 
$ p_"initial" = p_"final" \ 
m v_0 = m( -v_f) + M V_1  \ 
// V_1  = (m v_0 - m( -v_f)) / M  \ 
// V_1  = m / M (v_0 + v_f) \ 
$

For the second case: 
$ p_"initial" = p_"final" \ 
m v_0 = (m + M) V_2  \ 
// V_2 = (m v_0) / (m + M)
$

So: 
$
   (m + M)V_2 = m(- v_f) + M V_1  \ 
$
   
$
   V_2 = (- v_f m)/(m + M) + (M)/(m + M) V_1 \ 
$

We know that $V_2$, $V_1$, $m$, and $M$ are positive, and we have expressed $V_2$ as some negative number plus some fraction $0 < (M)/(m + M) < 1$ of $V_1$. 


$
  (- v_f m)/(m + M) + (M)/(m + M) V_1 < V_1 \ 
  V_2 < V_1
$

Therefore $V_1$ must be greater than $V_2$.


#pagebreak()

= Interpreting an energy diagram 
== Specify Question
#image("Screenshot 2025-11-03 at 12.04.26 PM.png")

== Diagnosis Phase
The issue was that I simply did not know what a turning point was. It seems I had zoned out in the lecture covering it, and not reviewed it before the test. 

I incorrectly assumed a turning point was the point at which the force changed direction. Using the fact that force is equal to derivative of potential energy with respect to distance, the slope of the graph indicates that the second particle is attracted to the first from $13 "cm"$ to about $5 "cm"$ where it is then repulsed up to $0 "cm"$. 

So I answered $5 "cm"$. 

== Correction Phase
A turning point is when the kinetic energy (and hence velocity) of an object is zero. In this system the turning point represents a separation of the particles where the moving particle stops and reverses direction as it oscillates about the equilibrium point. 

Expressing potential and kinetic energy as functions of distance and keeping total mechanical energy constant: 
$
  E_"mechanical" &= "constant"  \
  &= U(x) + K(x) \ 
  &= U(D_x) + K(D_x) wide D_x = 8 "cm"\
  &= U(8 "cm" ) + K(8 "cm" ) \

  E_"mechanical"  &= -40 J + 10 J= -30 J\
$
  #v(10pt)

To find where $K(x) = 0:$
$
  E_"mechanical" &= U(x) + K(x)  wide K(x) = 0 \
  -30 J &= U(x)
$

Hence, there is a turning point where $U(x) = -30$. 

Therefore there is a turning point between $9 "cm"$ and $10 "cm" $. (Note: $0.9 "cm"$ was not an option)