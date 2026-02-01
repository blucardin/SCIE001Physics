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
  I misread the diagram and incorrectly thought that the 3rd mass-spring system was stretched further than the second spring at the time of the snapshot. 

  Maximum velocity is directly proportional to maximum amplitude. 
  $
    v_"max" = A omega
  $
  
  In such a scenario, the third spring would reach a greater amplitude than the first spring as, since the velocity 

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  I was incorrect in reading that the 

  
  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

