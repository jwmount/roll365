class Dispatcher < HyperComponent

  param dispatcher_name: "Ol' Keep'em Rolling", type: String

  render (DIV) do
    H2 { 'Dispatchers (show/hide)' }
    H2 { "#{dispatcher_name} Dispatcher, (to be set by param)" }
    H3 { '(currently the early standalong version below here)' }
    H3 { '.... etc. '}
  end

end
