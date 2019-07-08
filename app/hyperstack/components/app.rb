class App < HyperComponent
  include Hyperstack::Router
  render(SECTION, class: 'roll365-app') do #add class: todo-app
    Header()
    Route('/', exact: true) {Redirect('/all') }
    Route('/:scope', mounts: Index)
    Footer() unless Shipment.count.zero?
  end
end