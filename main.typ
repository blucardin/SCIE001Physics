// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo
#import "@preview/wordometer:0.1.5": total-words, word-count

#show: word-count

#import "@preview/inknertia:0.1.0": newtonian
#import newtonian: *

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

= Introduction
#p[
  If you blow across the opening of an empty bottle, you can hear a distinctly loud and low pitch sound. This is an example of a Helmholtz resonance, which is due to air in and near the neck of the bottle vibrating. You can model this vibration as a chunk of air in the neck of the bottle being pushed and pulled by the rest of the air below it (which is compressing and expanding like a spring). This phenomenon can therefore be simply understood in terms of simple harmonic motion.

  #figure(
    image("images/HelmholtzResonanceImage.png"),
  )

  *Figure 1: (left)* Blowing across the opening of an empty bottle makes the air in and near the neck of the bottle oscillate, which you can hear as a loud low pitch sound. (middle and right) You can model this effect by treating the air in the neck of the bottle as a cylindrical mass $m$ of cross-sectional area $A$ and length $L$ that is oscillating above an ideal spring with spring constant $k$. *Adapted from:* https://newt.phys.unsw.edu.au/jw/Helmholtz.html (check it out).

  *This assignment has two parts: in the first, you will derive a simple theoretical model for how a bottle's Helmholtz resonance changes with the volume of air in the bottle. In the second part, you will collect your own data and plot your theoretical model with your data to assess its validity.*
]

= Part 1 - The Model
+ #p[[1 pt] Imagine the air in the neck of the bottle is a small cylindrical mass $m$ oscillating due to an ideal spring with spring constant $k$ (as shown in Figure 1). When the mass is pushed down and then released, it starts oscillating (and creates the sound that we hear). What is the frequency $f$ of this oscillation in terms of the air density $rho_("air")$, $A$, $L$ and $k$?]

  In an ideal spring system with spring constant $k$ and mass $m$, we know:
  $
    omega = sqrt(k / m) = 2 pi f
  $

  Thinking about the bottle as an ideal spring system, we can form a relationship between the air in the neck and the mass on the spring :
  $
    m = L A rho_"air"
  $
  So:
  $
    sqrt(k / ( L A rho_"air")) = 2 pi f
  $

  $
    f = sqrt(k / ( L A rho_"air")) / (2 pi )
  $



+ #p[[2 pt] We know the spring models the volume of air below the neck of the bottle compressing and expanding. The goal is now to relate $k$ to the parameters of this volume of air (as shown in Figure 1). We can do this by using Hooke's law, which states:
    $
      k = abs(F/(Delta x))
    $
  ]
  + #p[When the mass $m$ is pushed down by some small $Delta x$, the air pressure in the bottle below it increases by some small amount $Delta P$. Draw a FBD clearly indicating the vertical forces acting on this mass of air in the neck of the bottle. (Hint: Your forces should only depend on atmospheric pressure, $Delta P$ and $A$.) What is the net force $F$ on this air mass? Be clear on the direction of this net force.]

    Assuming the internal pressure of the bottle is initially at equilibrium with atmospheric pressure.

    Where up is positive:

    #align(center)[
      #cetz.canvas(length: 1cm, {
        import cetz.draw: *
        rect((-1, -1), (1, 1))
        circle((0, 0), radius: (0.1, 0.1), fill: black)
        vector((0, 0), (0, 3), label: $F_"spring" = A (Delta P + P_"atmosphere")$, anchor: "west")
        vector((0, 0), (0, -3), label: $F_"atmosphere" = - A P_"atmosphere"$, anchor: "west")
      })
    ]


    $
      F_"net" & = F_"spring" + F_"atmosphere" \
              & = A (Delta P + P_"atmosphere") - A P_"atmosphere" \
      F_"net" & = A Delta P + A P_"atmosphere" - A P_"atmosphere" \
    $
    $
      #rect($ therefore F_"net" & = A Delta P $)
    $

  + #p[When the mass is pushed down by some small $Delta x$, the volume of air in the bottle below it decreases by some small amount $Delta V$. Express this small volume change in terms of $Delta x$ and $A$.]

    $
      #rect($ Delta V = A Delta x $)
    $

  + #p[Show that in the limit of infinitesimal changes in pressure and volume, the spring constant is given by $k = (dif P) / (dif V) A^2$.  Show that the units make sense.]

    $
      Delta V = A Delta x \
      Delta x = (Delta V)/ A
    $

    $
      k = abs(F/(Delta x)) \
      k = abs((A Delta P) / ((Delta V)/ A)) \
      k = abs((A^2 Delta P ) / (Delta V))
    $
    Noting:
    $
      Delta P = P(V) + P(V + Delta V)
    $
    Where $P(V)$ is the pressure of the air bottle at volume $V$.

    Taking the limit of our expression for $k$ as $Delta V$ approaches $0$:
    $
      lim_(Delta V -> 0) k & = lim_(Delta V-> 0) abs((A^2 ( P(V) - P(V + Delta V)) ) / (Delta V)) \
                         k & = A^2 abs(lim_(Delta V-> 0) ( ( P(V) - P(V + Delta V)) ) / (Delta V)) wide A^2 >= 0
    $

    Rewriting in derivative notation:

    $
      #rect($ therefore k = A^2 abs((dif P) /(dif V)) $)
    $




+ #p[[2 pts] We now need to determine how pressure changes with volume in this system to solve the derivative in the expression for $k$. Luckily this is something that we investigated thoroughly last semester. ]

  + #p[In 2-3 sentences, explain in your own words why an isothermal relationship (i.e. $P V$ constant) is not appropriate for this system while an adiabatic relationship is. ]

    An isothermal relationship assumes that the temperature of the air on the inside of the bottle stays constant. This is not true for our system - since as we are compressing the air in the bottle relatively quickly, its temperature rises and does not have enough time to return to thermal equilibrium with the environment (dissipate its heat). A better approximation would be that the air loses no heat to the environment in the time that we compress it - an adiabatic process.

  + #p[For adiabatic processes,  $P V^gamma$ constant.  Differentiate this equation to find an equation for $(dif P) / (dif V)$ .]

  Differentiating:
  $
    P V^gamma = "constant" \
    (dif) / (dif V) ( P V^gamma ) = 0 \
    ((dif ) / (dif V) P ) V^gamma + P ((dif) / (dif V) V^gamma) = 0 \
    ((dif P) / (dif V) ) V^gamma + P gamma V^(gamma - 1) = 0 \
    (dif P) / (dif V) = (- P gamma V^(gamma - 1))/V^gamma = - P gamma V^(- 1)\
    #rect($ therefore (dif P) / (dif V) = (- P gamma) / V $)
  $


+ #p[[0.5 pts] Using your answers for the previous questions, write an equation for the frequency $f$ of our Helmholtz oscillator in terms of $gamma$, $rho$, $A$, $L$, $P$ and $V$.]

  $
    k = A^2 abs((dif P) /(dif V)) wide (dif P) / (dif V) = (- P gamma) / V \
  $
  $
    k & = A^2 abs((- P gamma) / V) \
    k & = (A^2 P gamma) / V wide (P gamma) / V > 0
  $

  $
    f = sqrt(k / ( L A rho_"air")) / (2 pi ) \
    f = sqrt((((A^2 P gamma) / V )) / ( L A rho_"air")) / (2 pi ) \
    #rect($ f = sqrt((A P gamma) / (V L rho_"air")) / (2 pi ) $)
  $

+ #p[[0.5 pts] You can simplify your result by recognizing that the speed of sound in air $v$ is given by:

    $
      v = sqrt(gamma P/rho_"air")
    $

    Rewrite your equation in terms of $v$, $A$, $L$, and $V$. Show that the units make sense.]

  $
    f = sqrt((A P gamma) / (V L rho_"air")) / (2 pi ) = sqrt((A/ (V L)) (gamma (P) / ( rho_"air"))) / (2 pi ) wide v^2 = gamma P/rho_"air" \
    f = sqrt((A/ (V L)) (v^2)) / (2 pi ) \
    #rect($ therefore f = sqrt((A v^2) / (V L)) / (2 pi ) $)
  $

  Showing that the units make sense:

  $
    f = ["Hz"] = ["s"^(-1)]
  $

  $
    sqrt((A v^2) / (V L)) / (2 pi ) = sqrt((["m"^2] ["m/s"]^2) / (["m"^3] ["m"])) = sqrt((["m"^4/"s"^2]) / ([m^4])) = sqrt(1/["s"^2]) = 1/ ["s"] = ["s"^(-1)]
  $

  The units of both sides are the same.





+ #p[[4 pts] In preparation for the second part of this assignment, explain at least two modeling approximations or assumptions (besides the adiabatic condition) that you made above and why they may or may not be reasonable for your experiment.  Take up to 100 words max and provide citations if needed.]

  #word-count(total => [

    We assume that air acting as a fixed mass fills the entire neck cavity, and that the air acting as a spring fills the entire body cavity. It may be that the division between oscillating and springing lies somewhere other than the neckline, or is less well defined altogether. 

    We also assume that this division does not change with the resonance frequency or the volume remaining - once the air in the bottle reaches the neck, our model breaks down.

    Finally, we assume that temperature and pressure is static, while blowing hot air into the bottle could easily change these parameters. 

    // #todo("Finish this question")

    Words: #(total.words - 2)
    // subtract 2 to account for the word counter itself
    // does not account for equations by default!
  ])

= Part 2 - The Experiment
#p[[10 pts - see rubric for further details]]

+ #p[[2 pt] Find a glass bottle with a well-defined neck such as the wine or ginger beer bottles, illustrated in the image below. You need to measure the volume below the neck, the cross-sectional area $A$ of the neck and its length $L$.

  Fill out this table of important parameters for your bottle and include a picture of your bottle below with clear annotations of relevant dimensions.
]

  #grid(columns: 2, column-gutter: 1em)[
    #figure(
      table(
        columns: 2,
        align: left,
        stroke: black,
        [Nominal volume of bottle ], [],
        [Estimated volume of air below the neck of bottle (when empty)], [],
        [Length of neck~], [8.52 cm],
        [Diameter of neck~], [1.85 cm],
        [Local speed of sound used in model], [343.21 m/s],
      ),
      caption: [Bottle measurements and parameters],
    )
  ][
    #figure(
      image(
        "images/image_of_bottle.jpeg"
      ), 
      caption : [
        An image of the bottle.
      ]
    )
  ]

  #todo("Annotate the bottle with relevant dimensions")

// https://www.engineersedge.com/physics/speed_of_sound_13241.htm

+ #p[[2 pts] Blow over the top of your bottle and obtain the frequency spectrum of the sound emitted using the Audio Spectrum function of the PhyPhox app.]

  + #p[Include a screenshot of your measurement in the “Spectrum” tab below. At what frequency $f$ is the Helmholtz resonance for your empty bottle? Explain in 2-3 sentences how you can tell.]

  #grid(columns: 2, column-gutter: 1em)[
    #figure(
      image(
        "images/phyphox_image_empty_bottle.PNG", width: 50%
      )
    )
  ][
    The Helmholtz resonance frequency for my empty bottle is $109.89$ Hz. When you blow over the top of the bottle it emits sound waves at its Helmholtz resonance frequency. You can tell that it is $109.89$ Hz because the fourier transform of that sound for my bottle shows a distinct peak at that frequency. 
    
    // Therefore $109.89$ Hz must be its Helmholtz resonance frequency.
    
  ]


  + #p[In 2-3 sentences, explain the trade-off between the frequency resolution of the obtained spectrum and the number of samples taken. Hint: you can change the number of samples in the “Settings” tab.  What settings did you use for your experiment?]

  The more samples that you take for each fourier transform, the more frequency resolution you have. This makes intuitive sense, as with more samples you give more information to the fourier transform, allowing it to distinguish better between similar frequencies. 

  A lower sampling rate provides less frequency resolution than a higher sampling rate. 

+ #p[[4 pts] Now add some water to your bottle and measure the frequency again for various amounts of water in the bottle. ]

  + #p[Make a plot of the resonant frequency $f$ against the remaining volume of air $f$ in the bottle.  Briefly explain how you measured and calculated $V$ below.]

  + #p[Add a model curve to your plot based on the equation you found in Q5 of Part I and the parameters for your bottle stated in Q1 of Part II. #underline[Note: this is *not* a fit, if the model does not line up perfectly with the data - that's ok; move to Q4.] Include your plot in the space below. ]

+ #p[[3 pts] Discuss the agreement between your data and model. Pay particular attention to anywhere the model starts to deviate from the data. Take up to 100 words max to explain why. Be concise and precise in your choice of words.]

  #word-count(total => [


    Words: #(total.words - 2)
    // subtract 2 to account for the word counter itself
    // does not account for equations by default!
  ])
