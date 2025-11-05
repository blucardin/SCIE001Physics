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
#image("Screenshot 2025-11-03 at 12.11.27 PM.png"),


== Diagnosis Phase
I got confused. I thought in the first system the velocity of the ball when it bounced back was in the same direction as the velocity of box. This made me think that if the momentums had to be equal, they must have the same velocity. 

For system 1: 
$ p_"initial" = p_"final" \ 
m v_0 = m v_f + M V_1 
$

For system 2: 
$ p_"initial" = p_"final" \ 
m v_0 = (m + M)V_2 
$

$
  m v_f + M V_1 = (m + M)V_2 
$

I got stuck here - because I thought $v_f$ was positive, I didn't have enough information. Since $v_f$ was in the same direction as $V_1$, out of all 3 possibilities $>,<,=$, I assumed $v_f = V_1$ and factored. 

$
  (m + M) V_1 = (m + M)V_2 
$

So I said $V_1 = V_2$. 


== Correction Phase

In both elastic and inelastic collisions, momentum is conserved.

// Thinking about it more rationally, if you have two systems total mass, one where the masses are moving in the same direction, and other where they are moving apart, for momentum to be equal, when they are moving apart, the one moving in the direction of the momentum must have more velocity. 

 So we can write out the equations for both sides and solve (explicitly showing negative vectors). 

For the first side: 
$ p_"initial" = p_"final" \ 
m v_0 = m( -v_f) + M V_1  \ 
// V_1  = (m v_0 - m( -v_f)) / M  \ 
// V_1  = m / M (v_0 + v_f) \ 
$

For the second side: 
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
#image("Screenshot 2025-11-03 at 12.04.26 PM.png"),

== Diagnosis Phase
The issue was that I simply did not know what a turning point was. It seems I had zoned our in the lecture covering it, and not reviewed it in my notes. 

I assumed a turning point was the point at which the force changed direction. Using the fact force is equal to derivative of work with respect to distance (the slope of the graph), the second particle is attracted to the first up until about 5cm where it is then repulsed. 

So I answered 5 cm. 

== Correction Phase
A turning point is when the potential energy of system equals its kinetic energy. In this system the turing point represents the separation of the particles where 

Therefore the turing point of the molecule is at 

as the energy