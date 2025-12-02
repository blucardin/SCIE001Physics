// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count


#set heading(numbering: "1.")

#align(center + horizon)[

  _#text(30pt)[
    #title(titlecase("Quiz 5 Reflection"))
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

#let arr(body) = {
  $accent(body, arrow)$
}

#let r(x) = {
  calc.round(x, digits: 2)
}

#pagebreak()

// uncomment this for infinite page height except the first page.
#set page(height: auto)


= Collision Ball and Box 1

== Specify Question
#image("images/question4.png")


== Diagnosis Phase
#word-count(total => [
  I mistakenly thought about it from an energy perspective.
  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])




#pagebreak()

= Angular Velocity of Disk

== Specify Question
#image("images/question5.png")

== Diagnosis Phase

#word-count(total => [
  I misread the diagram and mistakenly thought that the $arr(F_3)$ was pointing up instead of down so when I went to calculate velocity I got:


  #let F_1 = 16
  #let F_2 = 20
  #let F_3 = 32
  #let R = 0.30


  $
      tau & = arr(F) times R \
          \
    tau_1 & = arr(F_1) R sin(90 degree) = (#F_1 "N") (#R "m")(#(r(calc.sin(90deg))))= #(F_1 * R * r(calc.sin(90deg))) N \

    tau_2 &= arr(F_3) R sin(180 degree) = (#F_2 "N") (#R "m")(#(r(calc.sin(180deg)))) = #r(F_3 * R * calc.sin(180deg)) "N/m"\

  $
  I incorrectly thought the $arr(F_3)$ was pointing up, so I calculated its torque on the axis 
  $
    tau_3 &= arr(F_2) R sin(60 degree) = (#F_3 "N") (#R "m")(#(r(calc.sin(30deg))))= #(F_3 * R * r(calc.sin(60deg))) "N/m"\
    \
    tau_"total" &= tau_1 + tau_2 + tau_3 = #()
  $
  // In this document, there are  words all up.
  // this

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])



== Correction Phase
#word-count(total => [
  Interpreting the direction of $arr(F_3)$ correctly.


  #let F_1 = 16
  #let F_2 = 20
  #let F_3 = 32
  #let R = 32


  $
      tau & = arr(F) times R \
          \
    tau_1 & = arr(F_1) R sin(90 degree) = (#F_1 "N") (#R "cm") (1) = 0 \
  $
  $90 degree + theta = 120$& " is the angle between radius and force
  $
          tau_2 & = arr(F_2) R sin(120 degree) = (#F_2 "N") (#R "cm") \
          tau_3 & = arr(F_1) R sin(90 degree) \
                \
    tau_"total" & = tau_1 + tau_2 + tau_3 = #()
  $
  // In this document, there are  words all up.
  // this

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])
