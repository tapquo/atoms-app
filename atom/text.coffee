"use strict"

class Atoms.Atom.Text extends Atoms.Class.Atom

  @template : """<p {{#if.style}}class="{{style}}"{{/if.style}}>{{value}}</p>"""

  @base     : "Text"
