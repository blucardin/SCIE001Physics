// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count

#import "@preview/frame-it:1.2.0": *

#let (p, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  p: ("Problem", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.thmbox)

#import "@preview/numbly:0.1.0": numbly

#set enum(
  full: true,
  numbering: numbly("{1:1.}", "{2:a)}", "{3:i.}"),
)
// #set heading(numbering: "1.")

#let document_name = "Noah Virjee A3: Helmholtz Resonances"

#show link: underline

#set page(header: context {
  // Handle the case when page.numbering is not set by
  // falling back to the default "1" numbering pattern.
  let page-numbering = page.numbering
  if page-numbering == none { page-numbering = "1" }
  let x = numbering(
    page-numbering,
    ..counter(page).get(),
  )
  if x != "1" {
    document_name
    h(1fr)
    x
  }
})

#align(center + horizon)[

  _#text(30pt)[
    #title(titlecase("Assignment A3"))
  ] 
  #text(20pt)[
    Analyzing Helmholtz Resonances
  ]_
  \ \
  

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
// #set page(height: auto)

// uncomment to make a selector <nonumber> that generates non-numbered headings
// #show selector(<nonumber>): set heading(numbering: none)

= Intro  
#p[
    If you blow across the opening of an empty bottle, you can hear a distinctly loud and low pitch sound. This is an example of a Helmholtz resonance, which is due to air in and near the neck of the bottle vibrating. You can model this vibration as a chunk of air in the neck of the bottle being pushed and pulled by the rest of the air below it (which is compressing and expanding like a spring). This phenomenon can therefore be simply understood in terms of simple harmonic motion.

    #figure(
      image("images/HelmholtzResonanceImage.png"), 
    )

    *Figure 1: (left)* Blowing across the opening of an empty bottle makes the air in and near the neck of the bottle oscillate, which you can hear as a loud low pitch sound. (middle and right) You can model this effect by treating the air in the neck of the bottle as a cylindrical mass $m$ of cross-sectional area $A$ and length $L$ that is oscillating above an ideal spring with spring constant $k$. *Adapted from:* https://newt.phys.unsw.edu.au/jw/Helmholtz.html (check it out).

    *This assignment has two parts: in the first, you will derive a simple theoretical model for how a bottle's Helmholtz resonance changes with the volume of air in the bottle. In the second part, you will collect your own data and plot your theoretical model with your data to assess its validity.*
  ]

= Part 1 - The model
+ #p[[1 pt] Imagine the air in the neck of the bottle is a small cylindrical mass $m$ oscillating due to an ideal spring with spring constant $k$ (as shown in Figure 1). When the mass is pushed down and then released, it starts oscillating (and creates the sound that we hear). What is the frequency $f$ of this oscillation in terms of the air density $rho_("air")$, $A$, $L$ and $k$?]

+ [2 pt] We know the spring models the volume of air below the neck of the bottle compressing and expanding. The goal is now to relate $k$ to the parameters of this volume of air (as shown in Figure 1). We can do this by using Hooke's law, which states:
  $
    k = abs(F/(Delta x))
  $
  + When the mass $m$ is pushed down by some small $Delta x$, the air pressure in the bottle below it increases by some small amount $Delta P$. Draw a FBD clearly indicating the vertical forces acting on this mass of air in the neck of the bottle. (Hint: Your forces should only depend on atmospheric pressure, $Delta P$ and $A$.) What is the net force $F$ on this air mass? Be clear on the direction of this net force.


= Part 2 - The experiment
#p[[10 pts - see rubric for further details]]
