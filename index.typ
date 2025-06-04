#import "lib.typ"
#lib.style("./style.css")

#lib.div("c-desc", [
  My coffee log below. Hover over an image to see the tasting notes.

  The most recent beans that I've tried appear first.
])

#lib.div("c-grid", [
  // No directory walking yet.
  // See https://github.com/typst/typst/issues/2123
  //
  #lib.img_hov("./img/25-05-12-mok-peru.jpg", [ 
    Silky is right; there is something very delicate and memorable about this roast. Tried first as a chemex (300ml/20g), I dialled the grind in to almost perfectly 3 minutes 30 seconds on the first go.
  ]) 
  #lib.img_hov("./img/25-04-25-brisa-ethiopia.jpg", [
    A bakery and roastery in Bologna. The bread is very good, and this coffee is decent-- which is more than one can say about many cafes in Italy.
  ])
  #lib.img_hov("./img/25-04-07-stow-ethiopia.jpg", [
    The memory is not super fresh in my mind, but I remember the black tea / honey notes being pronounced. 
  ])
  #lib.img_hov("./img/25-03-19-standout-colombia.jpg", [
    I don't recall!
  ])
  #lib.img_hov("./img/25-03-18-standout-colombia.jpg", [
    I don't recall!
  ])
  #lib.img_hov("./img/25-03-17-standout-colombia.jpg", [
    I don't recall!
  ])
  #lib.img_hov("./img/25-02-11-stow-colombia.jpg", [
    I had a very good decaf about a year ago from Stow, and so decided to try this one. It wasn't quite as good, but still very enjoyable. 
  ])
  #lib.img_hov("./img/25-01-20-standout-ethiopia.jpg", [
    I don't recall!
  ])
  #lib.img_hov("./img/25-01-20-standout-colombia.jpg", [
    I don't recall!
  ])
])

This site was made by #lib.href([Lachlan Kermode], "https://lachlankermode.com").
The same person was responsible for all sampling of coffee.
