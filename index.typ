#import "lib.typ"
#lib.style("./style.css")

#lib.div("c-desc", [
  My coffee log below. Hover over an image to see the tasting notes.

  The most recent beans that I've tried appear first.

  To follow along when new beans are tasted, subscribe to the #link("./feed.xml")[RSS feed].
])

#lib.div("c-grid", [
  // No directory walking yet.
  // See https://github.com/typst/typst/issues/2123
  //
  //
  #lib.img_hov("./img/25-05-05-alchemiste-ethiopia.jpeg", [ 
    A round and very gentle feeling on the nose, but with a bite lurking a few seconds later. I over-extracted the first pourover, I think, as there is a bit of a bitter fizz after the inital burst of fruitiness. (The beans were roasted a little over a month ago, but they may need to sit a bit before getting really good.) It's certainly best to let the coffee cool.
  ]) 
  #lib.img_hov("./img/25-05-08-hard-lines.jpg", [ 
    Wholesome, not acidic, this roast tastes like a basic foundation from which to build. Two external opinions were: "woody" and "Umm... grapefruit"; which together summarize the basic feeling at stake that this coffee is something of the earth. My take would be that a cup of this is like a painting of a landscape, a sensuous rendering of a backdrop against which specific memories can find their way to the surface. If the sips start as snowfall on the teeth (sweet with a nutty inner), by the end they have become a beachy plain with scattered driftwood.
  ]) 
  #lib.img_hov("./img/25-05-12-mok-peru.jpg", [ 
    Silky is right; there is something very delicate and memorable about this roast. Best in a pourover via chemex (300ml/20g), with a 3 min 40 sec extraction. The bright wash of green apple is what greets (true to the tasting note), and the caramel and walnut is the bidding goodbye as is slithers down the throat.
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
