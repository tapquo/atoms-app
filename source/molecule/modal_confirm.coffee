###
Base class for Organism

@namespace Atoms.Organism
@class Confirm

@author Javier Jimenez Villar <javi@tapquo.com> || @soyjavi
###
"use strict"

class Atoms.Molecule.Confirm extends Atoms.Molecule.Modal

  @template : """
    <div data-component="modal" class="confirm {{#if.style}}{{style}}{{/if.style}}">
      <article>
        <header>
          {{#if.icon}}<span class="icon {{icon}}"></span>{{/if.icon}}
          {{#if.title}}<h1>{{title}}</h1>{{/if.title}}
        </header>
        <section>{{text}}</section>
        <footer></footer>
      </article>
    </div>"""

  constructor: ->
    super
    navigation = new Atoms.Molecule.Navigation
      parent    : @
      container : @el.find("footer")
      children  : [
        "Atom.Button": text: @attributes.accept, action: "accept"
      ,
        "Atom.Button": text: @attributes.cancel, action: "cancel"
      ]

  onButtonTouch: (event, atom) ->
    @trigger atom.attributes.action
    @hide()
    false
