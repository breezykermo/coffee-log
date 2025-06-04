#let div(class, content) = html.elem("div", attrs: (class: class), content)
#let style(fname) = html.elem("style", read(fname).replace("\n", ""))
#let img(src) = html.elem("img", attrs: (src: src))

#let img_hov(src, caption) = div("c-img", [
  #img(src)
  #div("caption", caption)
]) 


