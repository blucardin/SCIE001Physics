// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count

#set heading(numbering: "1.")

#align(center + horizon)[

  _#text(30pt)[
    #title(titlecase("Quiz 6 Reflection"))
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


= Three Oscillators

== Specify Question
#image("images/Question 1: Three Oscillators.png")


== Diagnosis Phase
#word-count(total => [
  Maximum velocity is directly proportional to maximum amplitude.
  $
    v_"max" = A omega
  $

  I misread the diagram and incorrectly thought that the 3rd mass-spring system was stretched further than the second spring in the snapshot.

  If correct, the third mass would reach a greater amplitude than the second mass. I thought this because, when the second mass was traveling back outwards, it would be at the same position with opposite velocity, and since I mistook that the third was further outstretched with same velocity, the third would go farther - therefore, having a greater amplitude and greater maximum velocity.  

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  I was incorrect in reading that the blocks were at different distances when the snapshot was taken. 

  Reading the diagram properly, at some stretch $x$ and some velocity $v$: 
  $
    E_"total" &= E_"kinetic" + E_"spring"  \
    E_"max amplitude" &= E_"spring max amplitude" + E_"kinetic max amplitude" 
  $
  $
    E_"max amplitude" & = E_"total" wide "energy is conserved"\
    E_"spring max amplitude" + E_"kinetic max amplitude" & = E_"kinetic" + E_"spring" \
  
    1/2 k A^2 + 1/2 m (0)^2  & = 1/2 m v^2 + 1/2 k x^2 \
    k A^2 & = m v^2 +  k x^2 \
            A & = sqrt((m v^2)/k + x^2) \
      v_"max" & = omega sqrt((m v^2)/k + x^2) wide "since " v_"max" = omega A \
      v_"max" & = sqrt(k/m) sqrt((m v^2)/k + x^2) wide "since " omega = sqrt(k/m) \
      v_"max" & = sqrt(v^2 + (k x^2)/m)
  $

  Now we can plug in what we know about the blocks to get expressions for their maximum velocities. Defining right as positive:
  $
    v_"max 1" & = sqrt(v^2 + (k (0)^2)/m) = abs(v) wide "since the first spring is at the equilibrium" \
    v_"max 2" & = sqrt((-v)^2 + (k (x)^2)/m) = sqrt(v^2 + (k (x)^2)/m) wide "where" x "is the distance stretched" \
    v_"max 3" & = sqrt(v^2 + (k (x)^2)/m)
  $

  $
    abs(v) < sqrt(v^2 + (k (x)^2)/m) = sqrt(v^2 + (k (x)^2)/m) \
    therefore v_"max 1" < v_"max 2" = v_"max 3" \
    therefore v_"2" = v_"3" > v_"1"
  $


  // The second way is via the velocity function. The velocity over time periodic and is $90 degree$ offset from the position over time. $omega$ is the same. Therefore, if two masses share position, but one with positive velocity and the other negative, they can have the same velocity curves but with different


  // Therefore it is possible to have two masses oscillating with the same amplitude but offset in phase at the 

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

