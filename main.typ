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


= Collision Ball and Box 1

== Specify Question
#image("images/question4.png")


== Diagnosis Phase
#word-count(total => [
  I treated speed as the linear speed of the puck (not the angular speed), and I incorrectly thought the energy imparted by the player would be the same in both cases. 

  After the pull, the first puck has rotational and linear kinetic energy, while the second puck only has linear energy. 
 
  If the energy was the same, puck 2 would move faster linearly, while puck one would be spinning while moving slower.

  If work is force $times$ distance, and force is constant, puck two would travel farther since it was moving faster, and therefore had more work done on it. 
  
  // I thought that after the hockey player pulls on the first puck, its total energy would be equal to both the energy in moving it towards the string, and the energy stored in spinning it. 
  
  // some of the energy would go into the puck, and some of it would 

  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])

== Correction Phase
#word-count(total => [

  Energy is not the same among cases, but the force, mass, and radius is, so we can start to represent the systems.

  Considering from a momentum perspective: 
  $
    F = (dif p) / (dif t) \ 
    p = integral F dif t = F t
  $
  Force is the same, so momentum is the same. 
  $
    p_1 &= p_2 \ 
    p_(1x) &= p_(2x)\
    p &= m v_x \
    m v_(1x) &= m v_(2x)\
    v_(1x) &= v_(2x) \ 
  $
  So speed is the same. 

  For the work, we must consider the amount of rope pulled: 

  For the second puck: 
  $
    F = m a \
    a = F / m \ 

    a = (d v) / (d t) \

    v_2 = integral a dif t = integral F / m dif t = (F t) / m \

    // v = (d x) / (d t) \

    // x = integral v dif t = integral (F / m)t dif t = (F / (2m))t^2
  $

  Work is equal to force times distance, so after 2 seconds: 
  $
    v = (dif x) /(dif t) \
    x_2 = integral v_2 dif t = integral (F t)/ m dif t = (F t^2)/ (2 m) \ 
    x_2(2) = (F 2^2)/ (2 m) = (2F)/(m) = x_"pulled"\
    \
    W_2 = abs(arr(F) times arr(x)) = F(x_"pulled") = (2F^2)/(m)

  $

    For the first puck, it is the same as the second, but we must account for the puck un-spooling. 
  
  Considering torque:
  $
    tau &= abs( arr(r) times arr(F) ) = r F\ 

    tau  &= I alpha  \
    alpha &= tau / I = (r F) / I \ 
  $

  Treating the puck as a disk: 
  $
    I &= 1/2 m r^2 \
    \
    alpha &= (r F) / (1/2 m r^2) = 2 F m^(-1) r^(-1) \
    alpha &= (dif omega) / (dif t) \ 
    omega &= integral alpha dif t = integral 2 F m^(-1) r^(-1) dif t = 2 F m^(-1) r^(-1) t \

    v_"un-spooling" &= omega r = 2 F m^(-1) r^(-1) t r = 2 F m^(-1) t

    // theta &= (dif omega) / (dif t) \ 

    // theta &= integral omega dif t = integral 2 tau m^(-1) r^(-2) t dif t = tau m^(-1) r^(-2) t^2 \ 

    // arr(s) &= theta times arr(r) \
    // s &= tau m^(-1) r^(-2) t^2 r
  $
  So the rope velocity is: 
  $
    v_"un-spooling" &= 2 ((F t)/ m)  \ 

    v_"pulling" &= v_"linear" + v_"un-spooling" \
    v_"pulling" &= (F t)/ m + 2 ((F t)/ m) = (3 F t)/ m wide "with " v_"linear" = (F t)/ m "from 2" \

    \
  // $

  // $
    // x_"un-spooling" &= integral v_("un-spooling") dif t = integral (2 F t) /  m dif t = ( F t^2) /  m  \ 
    // x_"un-spooling" (2) &= ( F 2^2) /  m  = ( 4F ) /  m \
    // \
    x_"pulled" &= integral v_"pulling" dif t = integral (3 F t)/ m dif t = (3 F t^2)/ (2m)\
    x_"pulled" (2) &=  (3 F 2^2)/ (2m) = (6 F)/ (m)\
    W_1 &= abs(arr(F) times arr(x)) = F(x_"pulled") = (6F^2)/(m)
  $
  $
    (6F^2)/(m) &> (2F^2)/(m) \
    therefore W_1 &> W_2
    
  $



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
  #let m = 10


  $
      arr(tau) & = arr(F) times arr(R) \
          \
    tau_1 & = F_1 R sin(90 degree) = (#F_1 "N") (#R "m")(#(r(calc.sin(90deg))))= #(F_1 * R * r(calc.sin(90deg))) N \

    tau_2 &= F_2 R sin(180 degree) = (#F_2 "N") (#R "m")(#(r(calc.sin(180deg)))) = #r(F_3 * R * calc.sin(180deg)) "N/m"\

  $
  I incorrectly thought the $arr(F_3)$ was pointing up, so I calculated its torque using $sin(180 degree -30 degree)$
  $
    tau_3 &= F_3 R sin(180-30 degree) = (#F_3 "N") (#R "m")(#(r(calc.sin(30deg))))= #(F_3 * R * r(calc.sin(180deg - 30deg))) "N/m"\
    \
    tau_"total" &= tau_1 + tau_2 + tau_3 = #r(R * (F_3 * calc.sin(180deg) + F_1 * calc.sin(90deg) + F_3 * calc.sin(180deg - 30deg))) "Nm" 
  $

  #let tauc = r(R * (F_3 * calc.sin(180deg) + F_1 * calc.sin(90deg) + F_3 * calc.sin(180deg - 30deg)))
  
  $
    tau = I alpha \ 
  $
  As a disk: 
  $
    I &= 1/2m r^2 \ 
    \
    alpha &= tau / I = (2 tau) /( m  r ^ 2) \
    alpha &= (dif omega) / (dif t) \ 
    omega &= integral alpha dif t = integral (2 tau) /( m  r ^ 2) dif t = (2 tau t) /( m  r ^ 2) \
    omega(2) &= (2 (tauc) (2)) /(  (#m) (#R) ^ 2) = #r((2 * tauc * 2) /(  m * R * R)) "rad / s"
  $
  I got: 
  $
    omega(2) = #r((2 * tauc * 2) /(  m * R * R))
  $


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])



== Correction Phase
#word-count(total => [
  Reading the graph correctly: 

  #let F_1 = 16
  #let F_2 = 20
  #let F_3 = 32
  #let R = 0.30
  #let m = 10

  $
      arr(tau) & = arr(F) times arr(R) \
          \
    tau_1 & = F_1 R sin(90 degree) = (#F_1 "N") (#R "m")(#(r(calc.sin(90deg))))= #(F_1 * R * r(calc.sin(90deg))) N \

    tau_2 &= F_2 R sin(180 degree) = (#F_2 "N") (#R "m")(#(r(calc.sin(180deg)))) = #r(F_3 * R * calc.sin(180deg)) "N/m"\

  $
  Interpreting the direction of $arr(F_3)$ correctly, it should be $sin(180 degree + 30 degree)$
  $
    tau_3 &= F_3 R sin(180-30 degree) = (#F_3 "N") (#R "m")(#(r(calc.sin(30deg))))= #(F_3 * R * r(calc.sin(180deg + 30deg))) "N/m"\
    \
    tau_"total" &= tau_1 + tau_2 + tau_3 = #r(R * (F_3 * calc.sin(180deg) + F_1 * calc.sin(90deg) + F_3 * calc.sin(180deg + 30deg))) "Nm" 
  $

  #let tauc = r(R * (F_3 * calc.sin(180deg) + F_1 * calc.sin(90deg) + F_3 * calc.sin(180deg + 30deg)))
  
  $
    tau = I alpha \ 
  $
  As a disk: 
  $
    I &= 1/2m r^2 \ 
    \
    alpha &= tau / I = (2 tau) /( m  r ^ 2) \
    alpha &= (dif omega) / (dif t) \ 
    omega &= integral alpha dif t = integral (2 tau) /( m  r ^ 2) dif t = (2 tau t) /( m  r ^ 2) \
    omega(2) &= (2 (tauc) (2)) /(  (#m) (#R) ^ 2) = #r((2 * tauc * 2) /(  m * R * R)) "rad / s"
  $
  // In this document, there are  words all up.
  // this
  
  Therefore at 2 seconds the angular velocity is zero. 


  Words: #(total.words - 2)
  // subtract 2 to account for the word counter itself
  // does not account for equations by default!
])
