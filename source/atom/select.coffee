class Atoms.Atom.Select extends Atoms.Class.Atom
  @template = """
    <select name="{{name}}">
      {{#options}}
        <option value="{{value}}" {{#selected}}selected{{/selected}}>{{label}}</option>
      {{/options}}
    </select>
  """

  value: (value) ->
    if value? then @el.val value else @el.val()
