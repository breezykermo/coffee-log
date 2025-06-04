#import "lib.typ"
#lib.style("./style.css")

#lib.div("c-desc", [
  My coffee log below. Hover over an image to see the tasting notes.

  The most recent beans that I've tried appear first.
])

#lib.div("c-grid", [
  // No directory walking yet.
  // See https://github.com/typst/typst/issues/2123
  #lib.img_hov("./img/25-01-20-standout-colombia.jpg", [
    *TODO*
  ])
  #lib.img_hov("./img/25-01-20-standout-ethiopia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-02-11-stow-colombia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-03-17-standout-colombia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-03-18-standout-colombia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-03-19-standout-colombia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-04-07-stow-ethiopia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-04-25-brisa-ethiopia.jpg", [
    TODO
  ])
  #lib.img_hov("./img/25-05-12-mok-peru.jpg", [ 
    TODO
  ]) 
])
