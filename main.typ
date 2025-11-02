// Template for Physics assignments
#import "@preview/titleize:0.1.1": titlecase
#import "@preview/dashy-todo:0.1.2": todo

#set heading(numbering: "1.")

#align(center)[

    _#text(30pt)[
    #titlecase("physics assignment template")
    ] \ \
    *Subtitle*
    _

    SCIE 001 Physics

    Noah Virjee

    #let today = datetime.today()

    #today.display("[month repr:long]") 
    #today.day(), #today.year()// or another custom format

]

#outline()

#pagebreak()


= This
== That
= The next thing
