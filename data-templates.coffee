do (window) ->
  class Template
    # We will store the template in this variable
    tpl: undefined

    constructor: (template_object) ->
      @tpl = template_object.cloneNode(true)

      # Remove the template from the dom.
      template_object.parentNode.removeChild(template_object)

      # Remove the id to make sure we don't create duplicates
      @tpl.removeAttribute('id')

      # Reset the display
      @tpl.style.display = 'initial'


    render: (data) ->
      # Clone the template
      object = @tpl.cloneNode(true)

      # Get all the [date-tpl] items
      items = object.querySelectorAll('[data-tpl]')

      # Map data-suffixes to Element's properties
      mappings =
        'Html': 'innerHTML'
        'Text': 'innerText'
        'Href': 'href'
        'Src': 'src'
        'Alt': 'alt'
        'Title': 'title'

      # Loop through the [data-tpl] items
      for item in items
        # Loop through the mappings
        for dataSuffix, property of mappings
          # Check if there is something set to be used in the property
          if val = item.dataset['tpl' + dataSuffix]
            item[property] = Template.process(val, data)

      return object

    @process: (body, data) ->
      (new Function('data', 'return ' + body))(data)

  # Make it available globally
  window.Template = Template
